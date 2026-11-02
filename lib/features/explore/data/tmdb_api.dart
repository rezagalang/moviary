import 'package:dio/dio.dart';

import '../../../core/errors/app_failure.dart';
import '../../../core/network/api_clients.dart';
import '../../../core/network/api_config.dart';
import '../../../core/utils/entity_ids.dart';
import '../../media_detail/domain/media_summary.dart';

/// Thin client for the TMDB v3 API. Returns [MediaSummary] values.
///
/// Poster and backdrop fields hold full image URLs (not TMDB's relative
/// paths), so `PosterImage` can show them like any other http(s) image.
class TmdbApi {
  TmdbApi(this._dio, this._config);

  final Dio _dio;
  final ApiConfig _config;

  static const String _imageBase = 'https://image.tmdb.org/t/p/';

  Future<List<MediaSummary>> trending({required String language}) =>
      _list('/trending/all/week', language: language);

  Future<List<MediaSummary>> popularMovies({required String language}) =>
      _list('/movie/popular', language: language, fallbackType: MediaType.movie);

  Future<List<MediaSummary>> popularTv({required String language}) =>
      _list('/tv/popular', language: language, fallbackType: MediaType.tv);

  Future<List<MediaSummary>> search(String query, {required String language}) =>
      _list(
        '/search/multi',
        language: language,
        query: {'query': query, 'include_adult': false},
      );

  Future<List<MediaSummary>> _list(
    String path, {
    required String language,
    MediaType? fallbackType,
    Map<String, Object?> query = const {},
  }) async {
    if (!_config.tmdbConfigured) {
      throw const ConfigFailure(message: 'TMDB credentials are missing');
    }
    try {
      final response = await _dio.get<Object?>(
        path,
        queryParameters: {
          if (_config.tmdbReadAccessToken.isEmpty) 'api_key': _config.tmdbApiKey,
          'language': language,
          ...query,
        },
      );
      final body = response.data;
      if (body is! Map<String, dynamic>) {
        throw const UnknownFailure(message: 'Unexpected TMDB response');
      }
      final results = body['results'];
      if (results is! List) return const <MediaSummary>[];
      return [
        for (final raw in results)
          if (raw is Map<String, dynamic>)
            ?parse(raw, fallbackType: fallbackType),
      ];
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  /// Maps one TMDB result. Returns null for people and unusable rows.
  static MediaSummary? parse(
    Map<String, dynamic> json, {
    MediaType? fallbackType,
  }) {
    final kind = json['media_type'];
    final MediaType type;
    if (kind == 'movie') {
      type = MediaType.movie;
    } else if (kind == 'tv') {
      type = MediaType.tv;
    } else if (kind == null && fallbackType != null) {
      type = fallbackType;
    } else {
      return null; // person, or an unknown media type
    }

    final id = json['id'];
    if (id is! int) return null;
    final isMovie = type == MediaType.movie;
    final title = _text(json[isMovie ? 'title' : 'name']);
    if (title == null) return null;

    final originalTitle = _text(json[isMovie ? 'original_title' : 'original_name']);
    final voteAverage = json['vote_average'];
    final voteCount = json['vote_count'];
    final hasVotes = voteCount is num && voteCount > 0;

    return MediaSummary(
      id: EntityIds.catalogMedia(
        provider: 'tmdb',
        providerId: '$id',
        mediaType: type.storageValue,
      ),
      provider: 'tmdb',
      providerId: '$id',
      mediaType: type,
      title: title,
      originalTitle: originalTitle == title ? null : originalTitle,
      overview: _text(json['overview']),
      releaseDate: _date(json[isMovie ? 'release_date' : 'first_air_date']),
      posterPath: _image('w342', json['poster_path']),
      backdropPath: _image('w780', json['backdrop_path']),
      externalRating:
          (hasVotes && voteAverage is num) ? voteAverage.toDouble() : null,
    );
  }

  static String? _text(Object? value) {
    if (value is! String) return null;
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  static DateTime? _date(Object? value) {
    final text = _text(value);
    if (text == null) return null;
    final parsed = DateTime.tryParse(text);
    return parsed == null
        ? null
        : DateTime.utc(parsed.year, parsed.month, parsed.day);
  }

  static String? _image(String size, Object? path) {
    final text = _text(path);
    return text == null ? null : '$_imageBase$size$text';
  }
}
