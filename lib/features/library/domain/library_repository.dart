import 'library_entities.dart';

abstract interface class LibraryRepository {
  Stream<List<LibraryEntry>> watchEntries(String userId, LibraryQuery query);

  Stream<LibraryCounts> watchCounts(String userId);

  /// Adds the media to the library when missing, otherwise changes its status.
  /// Setting [WatchStatus.planToWatch] also adds it to the watchlist.
  Future<void> setStatus(String userId, String mediaId, WatchStatus status);

  /// Removes only the library entry. Ratings, notes, favorites and the
  /// watchlist entry are separate data and stay.
  Future<void> removeFromLibrary(String userId, String mediaId);

  /// All-or-nothing: if any item fails, nothing is changed.
  Future<void> bulkSetStatus(
    String userId,
    Set<String> mediaIds,
    WatchStatus status,
  );

  /// All-or-nothing.
  Future<void> bulkRemove(String userId, Set<String> mediaIds);
}
