import '../../media_detail/domain/media_summary.dart';

enum WatchStatus {
  planToWatch('plan_to_watch'),
  watching('watching'),
  completed('completed'),
  onHold('on_hold'),
  dropped('dropped'),
  rewatching('rewatching');

  const WatchStatus(this.storageValue);

  /// Stable value stored in SQLite and Firestore. Never change these.
  final String storageValue;

  static WatchStatus fromStorage(String value) => values.firstWhere(
        (status) => status.storageValue == value,
        orElse: () => throw StateError('Unknown watch status "$value"'),
      );
}

enum LibrarySort { recentlyAdded, title, rating, releaseDate, recentlyUpdated }

/// One row of the user's library, joined with its media and personal flags.
final class LibraryEntry {
  const LibraryEntry({
    required this.id,
    required this.media,
    required this.status,
    required this.addedAt,
    required this.updatedAt,
    this.startedAt,
    this.completedAt,
    this.rewatchCount = 0,
    this.rating,
    this.isFavorite = false,
    this.isInWatchlist = false,
  });

  final String id;
  final MediaSummary media;
  final WatchStatus status;
  final DateTime addedAt;
  final DateTime updatedAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final int rewatchCount;
  final double? rating;
  final bool isFavorite;
  final bool isInWatchlist;
}

final class LibraryQuery {
  const LibraryQuery({
    this.search = '',
    this.statuses = const {},
    this.mediaTypes = const {},
    this.onlyFavorites = false,
    this.onlyWatchlist = false,
    this.sort = LibrarySort.recentlyAdded,
  });

  final String search;
  final Set<WatchStatus> statuses;
  final Set<MediaType> mediaTypes;
  final bool onlyFavorites;
  final bool onlyWatchlist;
  final LibrarySort sort;

  LibraryQuery copyWith({
    String? search,
    Set<WatchStatus>? statuses,
    Set<MediaType>? mediaTypes,
    bool? onlyFavorites,
    bool? onlyWatchlist,
    LibrarySort? sort,
  }) {
    return LibraryQuery(
      search: search ?? this.search,
      statuses: statuses ?? this.statuses,
      mediaTypes: mediaTypes ?? this.mediaTypes,
      onlyFavorites: onlyFavorites ?? this.onlyFavorites,
      onlyWatchlist: onlyWatchlist ?? this.onlyWatchlist,
      sort: sort ?? this.sort,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is LibraryQuery &&
      other.search == search &&
      other.onlyFavorites == onlyFavorites &&
      other.onlyWatchlist == onlyWatchlist &&
      other.sort == sort &&
      other.statuses.length == statuses.length &&
      other.statuses.containsAll(statuses) &&
      other.mediaTypes.length == mediaTypes.length &&
      other.mediaTypes.containsAll(mediaTypes);

  @override
  int get hashCode => Object.hash(
        search,
        onlyFavorites,
        onlyWatchlist,
        sort,
        Object.hashAllUnordered(statuses),
        Object.hashAllUnordered(mediaTypes),
      );
}

final class LibraryCounts {
  const LibraryCounts(this._byStatus);

  static const LibraryCounts empty = LibraryCounts({});

  final Map<WatchStatus, int> _byStatus;

  int of(WatchStatus status) => _byStatus[status] ?? 0;

  int get total => _byStatus.values.fold(0, (sum, count) => sum + count);
}
