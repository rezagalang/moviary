import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:moviary/core/database/app_database.dart';
import 'package:moviary/core/database/settings_store.dart';
import 'package:moviary/core/database/synced_writer.dart';
import 'package:moviary/core/services/device_id_service.dart';
import 'package:moviary/features/library/data/personal_rows.dart';

import 'fixed_clock.dart';

/// In-memory database plus the collaborators repositories need.
class DbFixture {
  DbFixture._(this.db, this.clock, this.writer, this.rows, this.deviceIds);

  factory DbFixture.create() {
    final db = AppDatabase(NativeDatabase.memory());
    final clock = FixedClock(DateTime.utc(2026, 1, 1, 12));
    final deviceIds = DeviceIdService(SettingsStore(db, clock));
    final writer = SyncedWriter(db, clock, deviceIds);
    return DbFixture._(db, clock, writer, PersonalRows(db, writer), deviceIds);
  }

  final AppDatabase db;
  final FixedClock clock;
  final SyncedWriter writer;
  final PersonalRows rows;
  final DeviceIdService deviceIds;

  Future<void> close() => db.close();

  void advance([Duration by = const Duration(minutes: 1)]) {
    clock.now = clock.now.add(by);
  }

  Future<String> seedMedia(
    String id, {
    String title = 'Title',
    String type = 'movie',
    DateTime? releaseDate,
  }) async {
    await db.into(db.media).insert(MediaCompanion.insert(
          id: id,
          provider: 'tmdb',
          providerId: id,
          mediaType: type,
          title: title,
          createdAt: clock.now,
          updatedAt: clock.now,
          releaseDate: Value(releaseDate),
        ));
    return id;
  }

  Future<List<SyncQueueRow>> queue() => db.select(db.syncQueue).get();

  Future<SyncQueueRow?> queueEntry(String entityType, String entityId) async {
    final rows = await (db.select(db.syncQueue)
          ..where(
              (t) => t.entityType.equals(entityType) & t.entityId.equals(entityId)))
        .get();
    return rows.isEmpty ? null : rows.single;
  }
}
