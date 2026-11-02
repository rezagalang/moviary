import 'package:dio/dio.dart';

import '../../../core/errors/app_failure.dart';
import '../../../core/network/api_clients.dart';
import '../../../core/utils/entity_ids.dart';
import '../../media_detail/domain/media_summary.dart';

/// Thin client for the Jikan v4 API (unofficial MyAnimeList API).
class JikanApi {
  JikanApi(this._dio);

  final Dio _dio;

  Future<List<MediaSummary>> topAnime() =>
      _list('/top/anime', const {'limit': 20, 'sfw': true});

  Future<List<MediaSummary>> search(String query) =>
      _list('/anime', {'q': query, 'limit': 20, 'sfw': true});

  Future<List<MediaSummary>> _list(
    String path,
    Map<String, Object?> query,
  ) async {
    try {
      final response = await _dio.get<Object?>(path, queryParameters: query);
      final body = response.data;
      if (body is! Map<String, dynamic>) {
        throw const UnknownFailure(message: 'Unexpected Jikan response');
      }
      final data = body['data'];
      if (data is! List) return const <MediaSummary>[];
      return [
        for (final raw in data)
          if (raw is Map<String, dynamic>) ?parse(raw),
      ];
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  /// Maps one Jikan anime. Returns null for unusable rows.
  static MediaSummary? parse(Map<String, dynamic> json) {
    final malId = json['mal_id'];
    if (malId is! int) return null;

    final english = _text(json['title_english']);
    final romaji = _text(json['title']);
    final title = english ?? romaji;
    if (title == null) return null;
    final japanese = _text(json['title_japanese']);
    final originalTitle = japanese ?? (title == romaji ? null : romaji);

    final aired = json['aired'];
    final airedFrom = aired is Map<String, dynamic> ? _text(aired['from']) : null;
    final score = json['score'];

    return MediaSummary(
      id: EntityIds.catalogMedia(
        provider: 'jikan',
        providerId: '$malId',
        mediaType: MediaType.anime.storageValue,
      ),
      provider: 'jikan',
      providerId: '$malId',
      mediaType: MediaType.anime,
      title: title,
      originalTitle: originalTitle,
      overview: _text(json['synopsis']),
      releaseDate: _date(airedFrom),
      runtimeMinutes: _minutes(_text(json['duration'])),
      posterPath: _poster(json['images']),
      externalRating: score is num ? score.toDouble() : null,
    );
  }

  static String? _text(Object? value) {
    if (value is! String) return null;
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  static DateTime? _date(String? value) {
    if (value == null) return null;
    final parsed = DateTime.tryParse(value);
    if (parsed == null) return null;
    final utc = parsed.toUtc();
    return DateTime.utc(utc.year, utc.month, utc.day);
  }

  static String? _poster(Object? images) {
    if (images is! Map<String, dynamic>) return null;
    final jpg = images['jpg'];
    if (jpg is! Map<String, dynamic>) return null;
    return _text(jpg['large_image_url']) ?? _text(jpg['image_url']);
  }

  /// "24 min per ep" -> 24, "1 hr 55 min" -> 115, "Unknown" -> null.
  static int? _minutes(String? duration) {
    if (duration == null) return null;
    final hours = RegExp(r'(\d+)\s*hr').firstMatch(duration);
    final minutes = RegExp(r'(\d+)\s*min').firstMatch(duration);
    if (hours == null && minutes == null) return null;
    final total = (int.tryParse(hours?.group(1) ?? '') ?? 0) * 60 +
        (int.tryParse(minutes?.group(1) ?? '') ?? 0);
    return total > 0 ? total : null;
  }
}
