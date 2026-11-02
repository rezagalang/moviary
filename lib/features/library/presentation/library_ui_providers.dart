import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/presentation/auth_providers.dart';
import '../../media_detail/domain/media_summary.dart';
import '../domain/library_entities.dart';
import 'library_providers.dart';

extension LibraryQueryX on LibraryQuery {
  bool get hasActiveFilters =>
      statuses.isNotEmpty ||
      mediaTypes.isNotEmpty ||
      onlyFavorites ||
      onlyWatchlist;
}

class LibraryQueryNotifier extends Notifier<LibraryQuery> {
  @override
  LibraryQuery build() => const LibraryQuery();

  void setSearch(String value) => state = state.copyWith(search: value);

  void setSort(LibrarySort sort) => state = state.copyWith(sort: sort);

  void toggleStatus(WatchStatus status) {
    final next = {...state.statuses};
    if (!next.remove(status)) next.add(status);
    state = state.copyWith(statuses: next);
  }

  void toggleType(MediaType type) {
    final next = {...state.mediaTypes};
    if (!next.remove(type)) next.add(type);
    state = state.copyWith(mediaTypes: next);
  }

  void setOnlyFavorites(bool value) =>
      state = state.copyWith(onlyFavorites: value);

  void setOnlyWatchlist(bool value) =>
      state = state.copyWith(onlyWatchlist: value);

  /// Keeps the search text and sort order.
  void clearFilters() =>
      state = LibraryQuery(search: state.search, sort: state.sort);
}

final libraryQueryProvider =
    NotifierProvider<LibraryQueryNotifier, LibraryQuery>(
  LibraryQueryNotifier.new,
);

class LibrarySelectionNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => const {};

  void toggle(String mediaId) {
    final next = {...state};
    if (!next.remove(mediaId)) next.add(mediaId);
    state = next;
  }

  void selectAll(Iterable<String> mediaIds) => state = {...mediaIds};

  void clear() => state = const {};
}

final librarySelectionProvider =
    NotifierProvider<LibrarySelectionNotifier, Set<String>>(
  LibrarySelectionNotifier.new,
);

class GridModeNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void toggle() => state = !state;
}

/// `true` = grid, `false` = list. Not persisted yet.
final libraryGridModeProvider =
    NotifierProvider<GridModeNotifier, bool>(GridModeNotifier.new);

final libraryEntriesProvider = StreamProvider<List<LibraryEntry>>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return Stream.value(const <LibraryEntry>[]);
  final query = ref.watch(libraryQueryProvider);
  return ref.watch(libraryRepositoryProvider).watchEntries(userId, query);
});

final libraryCountsProvider = StreamProvider<LibraryCounts>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return Stream.value(LibraryCounts.empty);
  return ref.watch(libraryRepositoryProvider).watchCounts(userId);
});

Stream<List<LibraryEntry>> _rail(
  Ref ref,
  LibraryQuery query, {
  int limit = 10,
}) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return Stream.value(const <LibraryEntry>[]);
  return ref
      .watch(libraryRepositoryProvider)
      .watchEntries(userId, query)
      .map((entries) => entries.take(limit).toList());
}

final homeContinueWatchingProvider = StreamProvider<List<LibraryEntry>>(
  (ref) => _rail(
    ref,
    const LibraryQuery(
      statuses: {WatchStatus.watching, WatchStatus.rewatching},
      sort: LibrarySort.recentlyUpdated,
    ),
  ),
);

final homeRecentlyAddedProvider = StreamProvider<List<LibraryEntry>>(
  (ref) => _rail(ref, const LibraryQuery()),
);

final homeRecentlyCompletedProvider = StreamProvider<List<LibraryEntry>>(
  (ref) => _rail(
    ref,
    const LibraryQuery(
      statuses: {WatchStatus.completed},
      sort: LibrarySort.recentlyUpdated,
    ),
  ),
);
