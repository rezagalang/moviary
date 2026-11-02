import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/storage_guard.dart';
import '../../../core/database/synced_writer.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/utils/entity_ids.dart';
import '../domain/media_detail_repositories.dart';
import '../domain/media_summary.dart';
import 'media_mappers.dart';

class ManualMediaRepositoryImpl implements ManualMediaRepository {
  ManualMediaRepositoryImpl(this._db, this._writer);

  final AppDatabase _db;
  final SyncedWriter _writer;

  @override
  Future<MediaSummary> create(String userId, ManualMediaInput input) {
    return guardStorage('create manual media', () async {
      final title = input.title.trim();
      if (title.isEmpty) {
        throw const ValidationFailure(message: 'Title is required');
      }
      final runtime = input.runtimeMinutes;
      if (runtime != null && runtime <= 0) {
        throw const ValidationFailure(message: 'Runtime must be positive');
      }

      final stamp = await _writer.stamp(userId);
      final id = EntityIds.random();

      return _db.transaction(() async {
        await _db.into(_db.media).insert(MediaCompanion.insert(
              id: id,
              provider: 'manual',
              providerId: id,
              mediaType: input.mediaType.storageValue,
              title: title,
              createdAt: stamp.now,
              updatedAt: stamp.now,
              originalTitle: Value(_blankToNull(input.originalTitle)),
              overview: Value(_blankToNull(input.overview)),
              releaseDate: Value(input.releaseDate),
              runtimeMinutes: Value(runtime),
              posterPath: Value(_blankToNull(input.posterPath)),
              isManual: const Value(true),
              ownerUserId: Value(userId),
              deviceId: Value(stamp.deviceId),
            ));
        await _writer.enqueue(
          entityType: SyncEntityType.customMedia,
          entityId: id,
          operation: SyncOperation.upsert,
          revision: 1,
          now: stamp.now,
        );
        final row = await (_db.select(_db.media)
              ..where((t) => t.id.equals(id)))
            .getSingle();
        return mediaFromRow(row);
      });
    });
  }

  String? _blankToNull(String? value) {
    final trimmed = value?.trim();
    return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
  }
}
