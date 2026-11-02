import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/database/synced_writer.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/core/utils/entity_ids.dart';
import 'package:moviary/features/media_detail/data/personal_state_repository_impl.dart';

import '../../helpers/db_fixture.dart';

void main() {
  late DbFixture fx;
  late PersonalStateRepositoryImpl repo;

  const alice = 'alice';

  setUp(() async {
    fx = DbFixture.create();
    repo = PersonalStateRepositoryImpl(fx.db, fx.writer, fx.rows);
    await fx.seedMedia('m1', title: 'Alien');
  });

  tearDown(() => fx.close());

  test('a media item with no personal data reports an empty state', () async {
    final detail = await repo.watchDetail(alice, 'm1').first;
    expect(detail!.media.title, 'Alien');
    expect(detail.personal.isInLibrary, isFalse);
    expect(detail.personal.rating, isNull);
    expect(detail.personal.isFavorite, isFalse);
    expect(detail.personal.isInWatchlist, isFalse);
  });

  test('watchDetail is null for unknown media', () async {
    expect(await repo.watchDetail(alice, 'nope').first, isNull);
  });

  group('rating', () {
    test('sets, changes and clears a rating', () async {
      await repo.setRating(alice, 'm1', 7.5);
      expect((await repo.watchDetail(alice, 'm1').first)!.personal.rating, 7.5);

      fx.advance();
      await repo.setRating(alice, 'm1', 9);
      expect((await repo.watchDetail(alice, 'm1').first)!.personal.rating, 9);

      fx.advance();
      await repo.setRating(alice, 'm1', null);
      expect((await repo.watchDetail(alice, 'm1').first)!.personal.rating, isNull);

      final row = await fx.db.select(fx.db.userRatings).getSingle();
      expect(row.deletedAt, isNotNull);
      expect(row.revision, 3);
    });

    test('rating again after clearing reuses the same row', () async {
      await repo.setRating(alice, 'm1', 6);
      fx.advance();
      await repo.setRating(alice, 'm1', null);
      fx.advance();
      await repo.setRating(alice, 'm1', 8);

      final rows = await fx.db.select(fx.db.userRatings).get();
      expect(rows, hasLength(1));
      expect(rows.single.rating, 8);
      expect(rows.single.deletedAt, isNull);
      expect(rows.single.id, EntityIds.rating(alice, 'm1'));
    });

    test('rejects values outside 0.5 to 10 or off the half-step grid', () async {
      for (final bad in [0.0, 0.25, 10.5, 7.3, -1.0]) {
        await expectLater(
          repo.setRating(alice, 'm1', bad),
          throwsA(isA<ValidationFailure>()),
          reason: '$bad',
        );
      }
      expect(await fx.queue(), isEmpty);
    });

    test('setting the same rating twice does not create a new revision', () async {
      await repo.setRating(alice, 'm1', 8);
      await repo.setRating(alice, 'm1', 8);

      final row = await fx.db.select(fx.db.userRatings).getSingle();
      expect(row.revision, 1);
    });

    test('rating unknown media fails without side effects', () async {
      await expectLater(
        repo.setRating(alice, 'nope', 8),
        throwsA(isA<ValidationFailure>()),
      );
      expect(await fx.db.select(fx.db.userRatings).get(), isEmpty);
      expect(await fx.queue(), isEmpty);
    });
  });

  group('favorite and watchlist', () {
    test('toggle on and off, queueing each change', () async {
      await repo.setFavorite(alice, 'm1', true);
      expect((await repo.watchDetail(alice, 'm1').first)!.personal.isFavorite, isTrue);

      fx.advance();
      await repo.setFavorite(alice, 'm1', false);
      expect((await repo.watchDetail(alice, 'm1').first)!.personal.isFavorite, isFalse);

      final queued = await fx.queueEntry(
        SyncEntityType.favorites,
        EntityIds.favorite(alice, 'm1'),
      );
      expect(queued!.operation, 'delete');
      expect(queued.localRevision, 2);
    });

    test('toggling twice reuses one row', () async {
      for (final value in [true, false, true]) {
        await repo.setWatchlist(alice, 'm1', value);
        fx.advance();
      }
      final rows = await fx.db.select(fx.db.watchlistItems).get();
      expect(rows, hasLength(1));
      expect(rows.single.deletedAt, isNull);
      expect(rows.single.revision, 3);
    });

    test('turning off something that is already off does nothing', () async {
      await repo.setFavorite(alice, 'm1', false);
      expect(await fx.queue(), isEmpty);
    });

    test('data is per user', () async {
      await repo.setFavorite(alice, 'm1', true);
      final bobDetail = await repo.watchDetail('bob', 'm1').first;
      expect(bobDetail!.personal.isFavorite, isFalse);
    });
  });
}
