import '../../media_detail/domain/media_summary.dart';

enum DiscoverySection { trending, popularMovies, popularTv, topAnime }

/// Online catalog lookups (TMDB for movies and series, Jikan for anime).
///
/// Results are plain [MediaSummary] values whose `id` is the deterministic
/// catalog id, so the same title always maps to the same local row. They are
/// not stored until [CatalogRepository.ensureLocal] is called.
///
/// Implementations throw an `AppFailure` (`NetworkFailure`,
/// `RateLimitedFailure`, `ConfigFailure`, ...) on error.
abstract interface class DiscoveryRepository {
  Future<List<MediaSummary>> section(DiscoverySection section);

  /// Movies, series and anime matching [query]. If one provider fails but
  /// another answers, the answering provider's results are returned.
  Future<List<MediaSummary>> search(String query);
}
