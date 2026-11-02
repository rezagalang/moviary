import '../../media_detail/domain/media_summary.dart';

abstract interface class CatalogRepository {
  /// Stores a discovered title in the local catalog (insert or refresh) so it
  /// can be opened, rated and added to the library offline afterwards.
  /// Catalog rows are re-fetchable and are never synced.
  Future<void> ensureLocal(MediaSummary media);
}
