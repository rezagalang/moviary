import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/database/app_database.dart' show MediaCompanion;
import 'package:moviary/core/database/synced_writer.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/core/utils/entity_ids.dart';
import 'package:moviary/features/library/data/library_repository_impl.dart';
import 'package:moviary/features/library/domain/library_entities.dart';
import 'package:moviary/features/media_detail/data/personal_state_repository_impl.dart';
import 'package:moviary/features/media_detail/domain/media_summary.dart';

import '../../helpers/db_fixture.dart';

void main() {
  late DbFixture fx;
  late LibraryRepositoryImpl repo;
  late PersonalStateRepositoryImpl personal;

  const alice = 'alice';
  const bob = 'bob';

  setUp(() async {
    fx = DbFixture.create();
    repo = LibraryRepositoryImpl(fx.db, fx.writer, fx.rows);
    personal = PersonalStateRepositoryImpl(fx.db, fx.writer, fx.rows);
    await fx.seedMedia('m1', title: 'Alien', releaseDate: DateTime.utc(1979));
    await fx.seedMedia('m2', title: 'Breaking Bad', type: 'tv');
    await fx.seedMedia('m3', title: 'Cowboy Bebop', type: 'anime');
  });

  tearDown(() => fx.close());

  Future<List<LibraryEntry>> entries(
    String user, [
    LibraryQuery query = const LibraryQuery(),
  ]) =>
      repo.watchEntries(user, query).first;

  group('setStatus', () {
    test('adds a media item to the library and queues it for sync', () async {
      await repo.setStatus(alice, 'm1', WatchStatus.watching);

      final list = await entries(alice);
      expect(list, hasLength(1));
      expect(list.single.media.title, 'Alien');
      expect(list.single.status, WatchStatus.watching);
      expect(list.single.startedAt, isNotNull);

      final id = EntityIds.libraryItem(alice, 'm1');
      final queued = await fx.queueEntry(SyncEntityType.library, id);
      expect(queued, isNotNull);
      expect(queued!.operation, 'upsert');
      expect(queued.localRevision, 1);
    });

    test('changing status bumps the revision and the queue entry', () async {
      await repo.setStatus(alice, 'm1', WatchStatus.watching);
      fx.advance();
      await repo.setStatus(alice, 'm1', WatchStatus.completed);

      final list = await entries(alice);
      expect(list.single.status, WatchStatus.completed);
      expect(list.single.completedAt, isNotNull);

      final queued = await fx.queueEntry(
        SyncEntityType.library,
        EntityIds.libraryItem(alice, 'm1'),
      );
      expect(queued!.localRevision, 2);
      expect(await fx.queue(), hasLength(1));
    });

    test('setting the same status again changes nothing', () async {
      await repo.setStatus(alice, 'm1', WatchStatus.watching);
      await repo.setStatus(alice, 'm1', WatchStatus.watching);

      final row = await fx.db.select(fx.db.userLibrary).getSingle();
      expect(row.revision, 1);
    });

    test('plan to watch also adds the media to the watchlist', () async {
      await repo.setStatus(alice, 'm1', WatchStatus.planToWatch);

      expect(await fx.db.select(fx.db.watchlistItems).get(), hasLength(1));
      final queuedWatchlist = await fx.queueEntry(
        SyncEntityType.watchlists,
        EntityIds.watchlistItem(alice, 'm1'),
      );
      expect(queuedWatchlist, isNotNull);

      final list = await entries(alice);
      expect(list.single.isInWatchlist, isTrue);
    });

    test('rejects media that does not exist', () async {
      await expectLater(
        repo.setStatus(alice, 'nope', WatchStatus.watching),
        throwsA(isA<ValidationFailure>()),
      );
      expect(await fx.queue(), isEmpty);
    });
  });

  group('removeFromLibrary', () {
    test('soft-deletes the entry and queues a delete', () async {
      await repo.setStatus(alice, 'm1', WatchStatus.watching);
      fx.advance();
      await repo.removeFromLibrary(alice, 'm1');

      expect(await entries(alice), isEmpty);
      final row = await fx.db.select(fx.db.userLibrary).getSingle();
      expect(row.deletedAt, isNotNull);
      expect(row.revision, 2);

      final queued = await fx.queueEntry(
        SyncEntityType.library,
        EntityIds.libraryItem(alice, 'm1'),
      );
      expect(queued!.operation, 'delete');
    });

    test('keeps rating, favorite and notes data', () async {
      await repo.setStatus(alice, 'm1', WatchStatus.completed);
      await personal.setRating(alice, 'm1', 8.5);
      await personal.setFavorite(alice, 'm1', true);
      await repo.removeFromLibrary(alice, 'm1');

      final detail = await personal.watchDetail(alice, 'm1').first;
      expect(detail!.personal.isInLibrary, isFalse);
      expect(detail.personal.rating, 8.5);
      expect(detail.personal.isFavorite, isTrue);
    });

    test('re-adding after removal reuses the same row as a fresh addition',
        () async {
      await repo.setStatus(alice, 'm1', WatchStatus.completed);
      fx.advance();
      await repo.removeFromLibrary(alice, 'm1');
      fx.advance();
      await repo.setStatus(alice, 'm1', WatchStatus.planToWatch);

      final rows = await fx.db.select(fx.db.userLibrary).get();
      expect(rows, hasLength(1));
      expect(rows.single.deletedAt, isNull);
      expect(rows.single.revision, 3);
      expect(rows.single.completedAt, isNull);
      expect((await entries(alice)).single.status, WatchStatus.planToWatch);
    });

    test('removing something that is not in the library does nothing', () async {
      await repo.removeFromLibrary(alice, 'm1');
      expect(await fx.queue(), isEmpty);
    });
  });

  group('bulk operations', () {
    test('bulkSetStatus changes every item', () async {
      await repo.bulkSetStatus(alice, {'m1', 'm2', 'm3'}, WatchStatus.onHold);

      final list = await entries(alice);
      expect(list, hasLength(3));
      expect(list.every((e) => e.status == WatchStatus.onHold), isTrue);
    });

    test('bulkSetStatus is all-or-nothing', () async {
      await expectLater(
        repo.bulkSetStatus(alice, {'m1', 'missing'}, WatchStatus.watching),
        throwsA(isA<ValidationFailure>()),
      );

      expect(await fx.db.select(fx.db.userLibrary).get(), isEmpty);
      expect(await fx.queue(), isEmpty);
    });

    test('bulkRemove removes every selected item', () async {
      await repo.bulkSetStatus(alice, {'m1', 'm2', 'm3'}, WatchStatus.watching);
      await repo.bulkRemove(alice, {'m1', 'm3'});

      final list = await entries(alice);
      expect(list.map((e) => e.media.id), ['m2']);
    });
  });

  group('user isolation', () {
    test('one user never sees another user\'s library', () async {
      await repo.setStatus(alice, 'm1', WatchStatus.completed);
      await repo.setStatus(bob, 'm2', WatchStatus.watching);

      expect((await entries(alice)).map((e) => e.media.id), ['m1']);
      expect((await entries(bob)).map((e) => e.media.id), ['m2']);
    });

    test('both users can hold the same media independently', () async {
      await repo.setStatus(alice, 'm1', WatchStatus.completed);
      await repo.setStatus(bob, 'm1', WatchStatus.dropped);

      expect((await entries(alice)).single.status, WatchStatus.completed);
      expect((await entries(bob)).single.status, WatchStatus.dropped);
    });
  });

  group('queries', () {
    setUp(() async {
      await repo.setStatus(alice, 'm1', WatchStatus.completed);
      fx.advance();
      await repo.setStatus(alice, 'm2', WatchStatus.watching);
      fx.advance();
      await repo.setStatus(alice, 'm3', WatchStatus.planToWatch);
    });

    test('default order is most recently added first', () async {
      expect((await entries(alice)).map((e) => e.media.id), ['m3', 'm2', 'm1']);
    });

    test('filters by status', () async {
      final list = await entries(
        alice,
        const LibraryQuery(statuses: {WatchStatus.completed, WatchStatus.watching}),
      );
      expect(list.map((e) => e.media.id).toSet(), {'m1', 'm2'});
    });

    test('filters by media type', () async {
      final list = await entries(
        alice,
        const LibraryQuery(mediaTypes: {MediaType.anime}),
      );
      expect(list.single.media.id, 'm3');
    });

    test('search is case-insensitive', () async {
      final list = await entries(alice, const LibraryQuery(search: 'bAD'));
      expect(list.single.media.title, 'Breaking Bad');
    });

    test('sorts by title', () async {
      final list = await entries(
        alice,
        const LibraryQuery(sort: LibrarySort.title),
      );
      expect(list.map((e) => e.media.title), ['Alien', 'Breaking Bad', 'Cowboy Bebop']);
    });

    test('sorts by rating with unrated items last', () async {
      await personal.setRating(alice, 'm2', 9);
      await personal.setRating(alice, 'm1', 7);

      final list = await entries(
        alice,
        const LibraryQuery(sort: LibrarySort.rating),
      );
      expect(list.map((e) => e.media.id), ['m2', 'm1', 'm3']);
    });

    test('filters favorites and watchlist', () async {
      await personal.setFavorite(alice, 'm1', true);

      final favorites = await entries(
        alice,
        const LibraryQuery(onlyFavorites: true),
      );
      expect(favorites.single.media.id, 'm1');

      final watchlist = await entries(
        alice,
        const LibraryQuery(onlyWatchlist: true),
      );
      expect(watchlist.single.media.id, 'm3'); // plan to watch added it
    });

    test('counts per status', () async {
      final counts = await repo.watchCounts(alice).first;
      expect(counts.total, 3);
      expect(counts.of(WatchStatus.completed), 1);
      expect(counts.of(WatchStatus.watching), 1);
      expect(counts.of(WatchStatus.planToWatch), 1);
      expect(counts.of(WatchStatus.dropped), 0);

      expect((await repo.watchCounts(bob).first).total, 0);
    });

    test('counts ignore removed library items and deleted media', () async {
      await repo.removeFromLibrary(alice, 'm1');
      await (fx.db.update(fx.db.media)..where((t) => t.id.equals('m2')))
          .write(MediaCompanion(deletedAt: Value(fx.clock.now)));

      final counts = await repo.watchCounts(alice).first;
      final listed = await entries(alice);

      expect(counts.total, 1);
      expect(counts.total, listed.length);
      expect(counts.of(WatchStatus.planToWatch), 1);
    });
  });
}