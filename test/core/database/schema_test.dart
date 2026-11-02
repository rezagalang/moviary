import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/database/app_database.dart';
import 'package:moviary/features/library/domain/library_entities.dart';
import 'package:moviary/features/media_detail/domain/media_summary.dart';

import '../../helpers/db_fixture.dart';

const _expectedTables = {
  'app_settings',
  'media',
  'alternative_titles',
  'genres',
  'media_genres',
  'people',
  'media_credits',
  'seasons',
  'episodes',
  'user_library',
  'watch_history',
  'user_ratings',
  'user_notes',
  'watchlist_items',
  'favorites',
  'custom_collections',
  'collection_items',
  'reminders',
  'calendar_events',
  'sync_queue',
  'sync_metadata',
  'backup_history',
  'cached_media_metadata',
};

UserLibraryCompanion _library(String id, String mediaId, {String status = 'watching'}) {
  final now = DateTime.utc(2026, 1, 1);
  return UserLibraryCompanion.insert(
    id: id,
    userId: 'u1',
    createdAt: now,
    updatedAt: now,
    deviceId: 'd1',
    mediaId: mediaId,
    status: status,
    addedAt: now,
  );
}

void main() {
  late DbFixture fx;

  setUp(() => fx = DbFixture.create());
  tearDown(() => fx.close());

  test('a fresh database contains every table and the partial indexes', () async {
    final tables = await fx.db
        .customSelect("SELECT name FROM sqlite_master WHERE type = 'table'")
        .get();
    final names = tables.map((r) => r.read<String>('name')).toSet();
    expect(names, containsAll(_expectedTables));

    final indexes = await fx.db
        .customSelect("SELECT name FROM sqlite_master WHERE type = 'index'")
        .get();
    final indexNames = indexes.map((r) => r.read<String>('name')).toSet();
    expect(
      indexNames,
      containsAll([
        'uq_user_library_active',
        'uq_user_ratings_active',
        'uq_watchlist_items_active',
        'uq_favorites_active',
        'ix_sync_queue_due',
      ]),
    );
  });

  test('foreign keys are enforced', () async {
    await expectLater(
      fx.db.into(fx.db.userLibrary).insert(_library('l1', 'missing-media')),
      throwsA(anything),
    );
  });

  test('only one ACTIVE library row per user and media', () async {
    await fx.seedMedia('m1');
    await fx.db.into(fx.db.userLibrary).insert(_library('l1', 'm1'));

    await expectLater(
      fx.db.into(fx.db.userLibrary).insert(_library('l2', 'm1')),
      throwsA(anything),
    );
  });

  test('a tombstone does not block a new active row', () async {
    await fx.seedMedia('m1');
    await fx.db.into(fx.db.userLibrary).insert(_library('l1', 'm1'));
    await (fx.db.update(fx.db.userLibrary)..where((t) => t.id.equals('l1')))
        .write(UserLibraryCompanion(deletedAt: Value(DateTime.utc(2026, 1, 2))));

    await fx.db.into(fx.db.userLibrary).insert(_library('l2', 'm1'));

    expect(await fx.db.select(fx.db.userLibrary).get(), hasLength(2));
  });

  test('rejects unknown status and media type values', () async {
    await fx.seedMedia('m1');
    await expectLater(
      fx.db.into(fx.db.userLibrary).insert(_library('l1', 'm1', status: 'banana')),
      throwsA(anything),
    );
    await expectLater(fx.seedMedia('m2', type: 'podcast'), throwsA(anything));
  });

  test('every domain status and media type satisfies the table constraints', () async {
    for (final type in MediaType.values) {
      await fx.seedMedia('media-${type.name}', type: type.storageValue);
    }
    var i = 0;
    for (final status in WatchStatus.values) {
      final mediaId = 'media-status-$i';
      await fx.seedMedia(mediaId);
      await fx.db
          .into(fx.db.userLibrary)
          .insert(_library('lib-$i', mediaId, status: status.storageValue));
      i++;
    }
    expect(await fx.db.select(fx.db.userLibrary).get(), hasLength(WatchStatus.values.length));
  });

  test('catalog media is unique per provider, provider id and type', () async {
    await fx.seedMedia('m1');
    await expectLater(
      fx.db.into(fx.db.media).insert(MediaCompanion.insert(
            id: 'other-id',
            provider: 'tmdb',
            providerId: 'm1',
            mediaType: 'movie',
            title: 'Duplicate',
            createdAt: DateTime.utc(2026),
            updatedAt: DateTime.utc(2026),
          )),
      throwsA(anything),
    );
  });
}
