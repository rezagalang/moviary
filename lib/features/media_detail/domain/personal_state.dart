import '../../library/domain/library_entities.dart';
import 'media_summary.dart';

/// What the signed-in user has recorded about one media item.
final class PersonalState {
  const PersonalState({
    this.status,
    this.rating,
    this.isFavorite = false,
    this.isInWatchlist = false,
  });

  static const PersonalState none = PersonalState();

  /// Null when the item is not in the user's library.
  final WatchStatus? status;
  final double? rating;
  final bool isFavorite;
  final bool isInWatchlist;

  bool get isInLibrary => status != null;
}

final class MediaDetail {
  const MediaDetail({required this.media, required this.personal});

  final MediaSummary media;
  final PersonalState personal;
}

final class NoteEntry {
  const NoteEntry({
    required this.id,
    required this.mediaId,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String mediaId;
  final String body;
  final DateTime createdAt;
  final DateTime updatedAt;
}
