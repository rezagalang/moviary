import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/storage_guard.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/services/app_clock.dart';
import '../../media_detail/domain/media_summary.dart';
import '../domain/catalog_repository.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl(this._db, this._clock);

  final AppDatabase _db;
  final AppClock _clock;

  @override
  Future<void> ensureLocal(MediaSummary media) {
    return guardStorage('ensureLocal', () async {
      if (media.isManual || media.provider == 'manual') {
        throw const ValidationFailure(
          message: 'Manual media is stored by the manual media repository',
        );
      }
      final now = _clock.nowUtc();

      // A list result carries less detail than a full fetch, so a refresh
      // never replaces a stored value with null.
      await _db.into(_db.media).insert(
            MediaCompanion.insert(
              id: media.id,
              provider: media.provider,
              providerId: media.providerId,
              mediaType: media.mediaType.storageValue,
              title: media.title,
              createdAt: now,
              updatedAt: now,
              originalTitle: Value(media.originalTitle),
              overview: Value(media.overview),
              releaseDate: Value(media.releaseDate),
              runtimeMinutes: Value(media.runtimeMinutes),
              posterPath: Value(media.posterPath),
              backdropPath: Value(media.backdropPath),
              externalRating: Value(media.externalRating),
              metadataFetchedAt: Value(now),
            ),
            onConflict: DoUpdate(
              (old) => MediaCompanion(
                title: Value(media.title),
                originalTitle: Value.absentIfNull(media.originalTitle),
                overview: Value.absentIfNull(media.overview),
                releaseDate: Value.absentIfNull(media.releaseDate),
                runtimeMinutes: Value.absentIfNull(media.runtimeMinutes),
                posterPath: Value.absentIfNull(media.posterPath),
                backdropPath: Value.absentIfNull(media.backdropPath),
                externalRating: Value.absentIfNull(media.externalRating),
                metadataFetchedAt: Value(now),
                updatedAt: Value(now),
              ),
              target: [_db.media.id],
            ),
          );
    });
  }
}
