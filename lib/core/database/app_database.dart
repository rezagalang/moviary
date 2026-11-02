import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/app_settings_table.dart';
import 'tables/catalog_tables.dart';
import 'tables/personal_tables.dart';
import 'tables/system_tables.dart';

part 'app_database.g.dart';

/// Primary local source of truth (SQLite via Drift).
///
/// Schema history:
/// - v1: app_settings
/// - v2: full catalog, personal and system schema
@DriftDatabase(tables: [
  AppSettings,
  Media,
  AlternativeTitles,
  Genres,
  MediaGenres,
  People,
  MediaCredits,
  Seasons,
  Episodes,
  UserLibrary,
  WatchHistory,
  UserRatings,
  UserNotes,
  WatchlistItems,
  Favorites,
  CustomCollections,
  CollectionItems,
  Reminders,
  CalendarEvents,
  SyncQueue,
  SyncMetadata,
  BackupHistory,
  CachedMediaMetadata,
])
class AppDatabase extends _$AppDatabase {
  /// For tests: pass `NativeDatabase.memory()`.
  AppDatabase(super.executor);

  /// Opens the on-device database file.
  AppDatabase.open() : super(driftDatabase(name: 'moviary'));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _createIndexes();
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            final addedInV2 = <TableInfo<Table, dynamic>>[
              media,
              alternativeTitles,
              genres,
              mediaGenres,
              people,
              mediaCredits,
              seasons,
              episodes,
              userLibrary,
              watchHistory,
              userRatings,
              userNotes,
              watchlistItems,
              favorites,
              customCollections,
              collectionItems,
              reminders,
              calendarEvents,
              syncQueue,
              syncMetadata,
              backupHistory,
              cachedMediaMetadata,
            ];
            for (final table in addedInV2) {
              await m.createTable(table);
            }
            await _createIndexes();
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  /// Indexes Drift cannot express (partial indexes) plus query indexes.
  /// Every statement is idempotent.
  Future<void> _createIndexes() async {
    const statements = <String>[
      // One ACTIVE row per user+media. Tombstones do not count.
      'CREATE UNIQUE INDEX IF NOT EXISTS uq_user_library_active '
          'ON user_library(user_id, media_id) WHERE deleted_at IS NULL',
      'CREATE UNIQUE INDEX IF NOT EXISTS uq_user_ratings_active '
          'ON user_ratings(user_id, media_id) WHERE deleted_at IS NULL',
      'CREATE UNIQUE INDEX IF NOT EXISTS uq_watchlist_items_active '
          'ON watchlist_items(user_id, media_id) WHERE deleted_at IS NULL',
      'CREATE UNIQUE INDEX IF NOT EXISTS uq_favorites_active '
          'ON favorites(user_id, media_id) WHERE deleted_at IS NULL',
      'CREATE INDEX IF NOT EXISTS ix_user_library_status '
          'ON user_library(user_id, status, updated_at)',
      'CREATE INDEX IF NOT EXISTS ix_user_library_added '
          'ON user_library(user_id, added_at)',
      'CREATE INDEX IF NOT EXISTS ix_watch_history_user_date '
          'ON watch_history(user_id, watched_at)',
      'CREATE INDEX IF NOT EXISTS ix_watch_history_media '
          'ON watch_history(media_id, cycle)',
      'CREATE INDEX IF NOT EXISTS ix_watch_history_episode '
          'ON watch_history(episode_id)',
      'CREATE INDEX IF NOT EXISTS ix_user_notes_media '
          'ON user_notes(user_id, media_id)',
      'CREATE INDEX IF NOT EXISTS ix_collection_items_order '
          'ON collection_items(collection_id, position_key)',
      'CREATE INDEX IF NOT EXISTS ix_reminders_due '
          'ON reminders(enabled, scheduled_at)',
      'CREATE INDEX IF NOT EXISTS ix_sync_queue_due '
          'ON sync_queue(status, next_attempt_at)',
      'CREATE INDEX IF NOT EXISTS ix_media_type_release '
          'ON media(media_type, release_date)',
      'CREATE INDEX IF NOT EXISTS ix_media_genres_genre '
          'ON media_genres(genre_id)',
      'CREATE INDEX IF NOT EXISTS ix_media_credits_media '
          'ON media_credits(media_id, credit_type, order_index)',
    ];
    for (final statement in statements) {
      await customStatement(statement);
    }
  }
}