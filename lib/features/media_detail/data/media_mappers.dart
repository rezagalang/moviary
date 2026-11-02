import '../../../core/database/app_database.dart';
import '../domain/media_summary.dart';

MediaSummary mediaFromRow(MediaRow row) {
  return MediaSummary(
    id: row.id,
    provider: row.provider,
    providerId: row.providerId,
    mediaType: MediaType.fromStorage(row.mediaType),
    title: row.title,
    originalTitle: row.originalTitle,
    overview: row.overview,
    releaseDate: row.releaseDate,
    runtimeMinutes: row.runtimeMinutes,
    posterPath: row.posterPath,
    backdropPath: row.backdropPath,
    externalRating: row.externalRating,
    isManual: row.isManual,
  );
}
