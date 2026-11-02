import '../../../core/errors/app_failure.dart';
import '../../media_detail/domain/media_summary.dart';
import '../domain/discovery_repository.dart';
import 'jikan_api.dart';
import 'tmdb_api.dart';

class DiscoveryRepositoryImpl implements DiscoveryRepository {
  DiscoveryRepositoryImpl({
    required this._tmdb,
    required this._jikan,
    required this._language,
  });

  final TmdbApi _tmdb;
  final JikanApi _jikan;

  /// TMDB language tag, for example `en-US` or `id-ID`.
  final String _language;

  @override
  Future<List<MediaSummary>> section(DiscoverySection section) {
    return switch (section) {
      DiscoverySection.trending => _tmdb.trending(language: _language),
      DiscoverySection.popularMovies => _tmdb.popularMovies(language: _language),
      DiscoverySection.popularTv => _tmdb.popularTv(language: _language),
      DiscoverySection.topAnime => _jikan.topAnime(),
    };
  }

  @override
  Future<List<MediaSummary>> search(String query) async {
    final text = query.trim();
    if (text.isEmpty) return const <MediaSummary>[];

    final attempts = await Future.wait([
      _attempt(() => _tmdb.search(text, language: _language)),
      _attempt(() => _jikan.search(text)),
    ]);

    final failures = [
      for (final attempt in attempts)
        if (attempt.failure != null) attempt.failure!,
    ];
    if (failures.length == attempts.length) throw failures.first;

    final seen = <String>{};
    return [
      for (final attempt in attempts)
        for (final item in attempt.items)
          if (seen.add(item.id)) item,
    ];
  }

  Future<({List<MediaSummary> items, AppFailure? failure})> _attempt(
    Future<List<MediaSummary>> Function() run,
  ) async {
    try {
      return (items: await run(), failure: null);
    } on AppFailure catch (failure) {
      return (items: const <MediaSummary>[], failure: failure);
    }
  }
}