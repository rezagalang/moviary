import 'package:drift/drift.dart';

import '../services/app_clock.dart';
import '../services/device_id_service.dart';
import 'app_database.dart';

/// Collection names, identical to the Firestore sub-collection names.
abstract final class SyncEntityType {
  static const String library = 'library';
  static const String watchHistory = 'watch_history';
  static const String ratings = 'ratings';
  static const String notes = 'notes';
  static const String watchlists = 'watchlists';
  static const String favorites = 'favorites';
  static const String collections = 'collections';
  static const String collectionItems = 'collection_items';
  static const String reminders = 'reminders';
  static const String customMedia = 'custom_media';
}

enum SyncOperation { upsert, delete }

/// Identity and time for one logical write. Captured once so every row
/// touched by the same operation shares the same timestamp.
final class WriteStamp {
  const WriteStamp({
    required this.userId,
    required this.deviceId,
    required this.now,
  });

  final String userId;
  final String deviceId;
  final DateTime now;
}

/// Records a change in the sync queue.
///
/// Callers MUST invoke [enqueue] inside the same database transaction that
/// changed the row, so a change can never exist without its queue entry.
class SyncedWriter {
  SyncedWriter(this._db, this._clock, this._deviceIds);

  final AppDatabase _db;
  final AppClock _clock;
  final DeviceIdService _deviceIds;

  Future<WriteStamp> stamp(String userId) async {
    return WriteStamp(
      userId: userId,
      deviceId: await _deviceIds.getOrCreate(),
      now: _clock.nowUtc(),
    );
  }

  /// One queue row per entity. A newer change replaces the pending one.
  Future<void> enqueue({
    required String entityType,
    required String entityId,
    required SyncOperation operation,
    required int revision,
    required DateTime now,
  }) {
    return _db.into(_db.syncQueue).insert(
          SyncQueueCompanion.insert(
            entityType: entityType,
            entityId: entityId,
            operation: operation.name,
            localRevision: revision,
            nextAttemptAt: now,
            createdAt: now,
            updatedAt: now,
          ),
          onConflict: DoUpdate(
            (old) => SyncQueueCompanion(
              operation: Value(operation.name),
              localRevision: Value(revision),
              status: const Value('pending'),
              attemptCount: const Value(0),
              nextAttemptAt: Value(now),
              lastError: const Value(null),
              updatedAt: Value(now),
            ),
            target: [_db.syncQueue.entityType, _db.syncQueue.entityId],
          ),
        );
  }
}
