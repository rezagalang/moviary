import 'dart:async';

import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/features/explore/domain/catalog_repository.dart';
import 'package:moviary/features/explore/domain/discovery_repository.dart';
import 'package:moviary/features/library/domain/library_entities.dart';
import 'package:moviary/features/library/domain/library_repository.dart';
import 'package:moviary/features/media_detail/domain/media_detail_repositories.dart';
import 'package:moviary/features/media_detail/domain/media_summary.dart';
import 'package:moviary/features/media_detail/domain/personal_state.dart';

LibraryEntry fakeEntry(
  String id,
  String title, {
  WatchStatus status = WatchStatus.planToWatch,
  MediaType type = MediaType.movie,
  double? rating,
  bool favorite = false,
  bool watchlist = false,
}) {
  return LibraryEntry(
    id: 'lib-$id',
    media: MediaSummary(
      id: id,
      provider: 'tmdb',
      providerId: id,
      mediaType: type,
      title: title,
    ),
    status: status,
    addedAt: DateTime.utc(2026),
    updatedAt: DateTime.utc(2026),
    rating: rating,
    isFavorite: favorite,
    isInWatchlist: watchlist,
  );
}

class FakeLibraryRepository implements LibraryRepository {
  FakeLibraryRepository(List<LibraryEntry> entries) : entries = List.of(entries);

  List<LibraryEntry> entries;
  LibraryQuery? lastQuery;
  Object? setStatusError;

  final List<(String, WatchStatus)> setStatusCalls = [];
  final List<(Set<String>, WatchStatus)> bulkStatusCalls = [];
  final List<Set<String>> bulkRemoveCalls = [];
  final List<String> removeCalls = [];

  @override
  Stream<List<LibraryEntry>> watchEntries(String userId, LibraryQuery query) {
    lastQuery = query;
    final needle = query.search.trim().toLowerCase();
    final filtered = entries.where((e) {
      if (needle.isNotEmpty && !e.media.title.toLowerCase().contains(needle)) {
        return false;
      }
      if (query.statuses.isNotEmpty && !query.statuses.contains(e.status)) {
        return false;
      }
      if (query.mediaTypes.isNotEmpty &&
          !query.mediaTypes.contains(e.media.mediaType)) {
        return false;
      }
      return true;
    }).toList();
    return Stream.value(filtered);
  }

  @override
  Stream<LibraryCounts> watchCounts(String userId) {
    final byStatus = <WatchStatus, int>{};
    for (final e in entries) {
      byStatus[e.status] = (byStatus[e.status] ?? 0) + 1;
    }
    return Stream.value(LibraryCounts(byStatus));
  }

  @override
  Future<void> setStatus(String userId, String mediaId, WatchStatus status) async {
    final error = setStatusError;
    if (error != null) throw error;
    setStatusCalls.add((mediaId, status));
  }

  @override
  Future<void> removeFromLibrary(String userId, String mediaId) async {
    removeCalls.add(mediaId);
  }

  @override
  Future<void> bulkSetStatus(
    String userId,
    Set<String> mediaIds,
    WatchStatus status,
  ) async {
    bulkStatusCalls.add((mediaIds, status));
  }

  @override
  Future<void> bulkRemove(String userId, Set<String> mediaIds) async {
    bulkRemoveCalls.add(mediaIds);
  }
}

class FakePersonalStateRepository implements PersonalStateRepository {
  FakePersonalStateRepository(this.detail);

  /// Null means "media not found".
  MediaDetail? detail;

  final List<(String, double?)> ratingCalls = [];
  final List<(String, bool)> favoriteCalls = [];
  final List<(String, bool)> watchlistCalls = [];

  @override
  Stream<MediaDetail?> watchDetail(String userId, String mediaId) =>
      Stream.value(detail);

  @override
  Future<void> setRating(String userId, String mediaId, double? rating) async {
    ratingCalls.add((mediaId, rating));
  }

  @override
  Future<void> setFavorite(String userId, String mediaId, bool value) async {
    favoriteCalls.add((mediaId, value));
  }

  @override
  Future<void> setWatchlist(String userId, String mediaId, bool value) async {
    watchlistCalls.add((mediaId, value));
  }
}

class FakeNotesRepository implements NotesRepository {
  FakeNotesRepository([List<NoteEntry> notes = const []]) : notes = List.of(notes);

  List<NoteEntry> notes;
  final List<(String, String)> addCalls = [];
  final List<(String, String)> updateCalls = [];
  final List<String> deleteCalls = [];

  @override
  Stream<List<NoteEntry>> watchNotes(String userId, String mediaId) =>
      Stream.value(notes);

  @override
  Future<NoteEntry> addNote(String userId, String mediaId, String body) async {
    addCalls.add((mediaId, body));
    return NoteEntry(
      id: 'n${addCalls.length}',
      mediaId: mediaId,
      body: body,
      createdAt: DateTime.utc(2026),
      updatedAt: DateTime.utc(2026),
    );
  }

  @override
  Future<void> updateNote(String userId, String noteId, String body) async {
    updateCalls.add((noteId, body));
  }

  @override
  Future<void> deleteNote(String userId, String noteId) async {
    deleteCalls.add(noteId);
  }
}

class FakeManualMediaRepository implements ManualMediaRepository {
  final List<ManualMediaInput> created = [];

  @override
  Future<MediaSummary> create(String userId, ManualMediaInput input) async {
    created.add(input);
    return MediaSummary(
      id: 'new-1',
      provider: 'manual',
      providerId: 'new-1',
      mediaType: input.mediaType,
      title: input.title.trim(),
      isManual: true,
    );
  }
}

/// A title as returned by online discovery (not yet in the local catalog).
MediaSummary fakeRemote(
  String id,
  String title, {
  MediaType type = MediaType.movie,
  int? year,
}) {
  return MediaSummary(
    id: 'remote-$id',
    provider: type == MediaType.anime ? 'jikan' : 'tmdb',
    providerId: id,
    mediaType: type,
    title: title,
    releaseDate: year == null ? null : DateTime.utc(year),
  );
}

class FakeDiscoveryRepository implements DiscoveryRepository {
  FakeDiscoveryRepository({
    Map<DiscoverySection, List<MediaSummary>> sections = const {},
    this.searchResults = const [],
    this.failure,
  }) : sections = Map.of(sections);

  final Map<DiscoverySection, List<MediaSummary>> sections;
  List<MediaSummary> searchResults;

  /// When set, every call throws it.
  AppFailure? failure;

  final List<String> searchCalls = [];

  @override
  Future<List<MediaSummary>> section(DiscoverySection section) async {
    final error = failure;
    if (error != null) throw error;
    return sections[section] ?? const [];
  }

  @override
  Future<List<MediaSummary>> search(String query) async {
    searchCalls.add(query);
    final error = failure;
    if (error != null) throw error;
    return searchResults;
  }
}

class FakeCatalogRepository implements CatalogRepository {
  AppFailure? failure;
  final List<MediaSummary> ensured = [];

  @override
  Future<void> ensureLocal(MediaSummary media) async {
    final error = failure;
    if (error != null) throw error;
    ensured.add(media);
  }
}

/// One set of fakes for every repository the screens use.
class FakeBackend {
  FakeBackend({
    List<LibraryEntry> entries = const [],
    MediaDetail? detail,
    List<NoteEntry> notes = const [],
    Map<DiscoverySection, List<MediaSummary>> sections = const {},
    List<MediaSummary> searchResults = const [],
    AppFailure? discoveryFailure,
  })  : library = FakeLibraryRepository(entries),
        personal = FakePersonalStateRepository(detail),
        notes = FakeNotesRepository(notes),
        manual = FakeManualMediaRepository(),
        discovery = FakeDiscoveryRepository(
          sections: sections,
          searchResults: searchResults,
          failure: discoveryFailure,
        ),
        catalog = FakeCatalogRepository();

  final FakeLibraryRepository library;
  final FakePersonalStateRepository personal;
  final FakeNotesRepository notes;
  final FakeManualMediaRepository manual;
  final FakeDiscoveryRepository discovery;
  final FakeCatalogRepository catalog;
}

MediaDetail fakeDetail({
  String id = 'm1',
  String title = 'Alien',
  WatchStatus? status,
  double? rating,
  bool favorite = false,
  bool watchlist = false,
  String? overview,
  bool manual = false,
}) {
  return MediaDetail(
    media: MediaSummary(
      id: id,
      provider: manual ? 'manual' : 'tmdb',
      providerId: id,
      mediaType: MediaType.movie,
      title: title,
      overview: overview,
      releaseDate: DateTime.utc(1979, 5, 25),
      runtimeMinutes: 117,
      isManual: manual,
    ),
    personal: PersonalState(
      status: status,
      rating: rating,
      isFavorite: favorite,
      isInWatchlist: watchlist,
    ),
  );
}