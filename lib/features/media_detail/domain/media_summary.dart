enum MediaType {
  movie,
  tv,
  anime;

  /// Stored in SQLite and Firestore as the enum name.
  String get storageValue => name;

  static MediaType fromStorage(String value) => values.firstWhere(
        (type) => type.name == value,
        orElse: () => throw StateError('Unknown media type "$value"'),
      );
}

/// Catalog data needed to show a media item. Pure Dart.
final class MediaSummary {
  const MediaSummary({
    required this.id,
    required this.provider,
    required this.providerId,
    required this.mediaType,
    required this.title,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.runtimeMinutes,
    this.posterPath,
    this.backdropPath,
    this.externalRating,
    this.isManual = false,
  });

  final String id;

  /// 'tmdb' | 'jikan' | 'manual'
  final String provider;
  final String providerId;
  final MediaType mediaType;
  final String title;
  final String? originalTitle;
  final String? overview;
  final DateTime? releaseDate;
  final int? runtimeMinutes;
  final String? posterPath;
  final String? backdropPath;
  final double? externalRating;
  final bool isManual;
}

/// Input for adding media that no external API returned.
final class ManualMediaInput {
  const ManualMediaInput({
    required this.title,
    required this.mediaType,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.runtimeMinutes,
    this.posterPath,
  });

  final String title;
  final MediaType mediaType;
  final String? originalTitle;
  final String? overview;
  final DateTime? releaseDate;
  final int? runtimeMinutes;
  final String? posterPath;
}
