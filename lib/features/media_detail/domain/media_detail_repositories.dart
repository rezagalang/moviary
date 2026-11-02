import 'media_summary.dart';
import 'personal_state.dart';

abstract interface class PersonalStateRepository {
  /// Emits null when the media does not exist (or was deleted).
  Stream<MediaDetail?> watchDetail(String userId, String mediaId);

  /// [rating] in 0.5 steps from 0.5 to 10. Null clears the rating.
  Future<void> setRating(String userId, String mediaId, double? rating);

  Future<void> setFavorite(String userId, String mediaId, bool value);

  Future<void> setWatchlist(String userId, String mediaId, bool value);
}

abstract interface class NotesRepository {
  Stream<List<NoteEntry>> watchNotes(String userId, String mediaId);
  Future<NoteEntry> addNote(String userId, String mediaId, String body);
  Future<void> updateNote(String userId, String noteId, String body);
  Future<void> deleteNote(String userId, String noteId);
}

abstract interface class ManualMediaRepository {
  Future<MediaSummary> create(String userId, ManualMediaInput input);
}
