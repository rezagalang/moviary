import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/presentation/auth_providers.dart';
import '../domain/personal_state.dart';
import 'media_providers.dart';

final mediaDetailProvider =
    StreamProvider.autoDispose.family<MediaDetail?, String>((ref, mediaId) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return Stream.value(null);
  return ref
      .watch(personalStateRepositoryProvider)
      .watchDetail(userId, mediaId);
});

final mediaNotesProvider =
    StreamProvider.autoDispose.family<List<NoteEntry>, String>((ref, mediaId) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return Stream.value(const <NoteEntry>[]);
  return ref.watch(notesRepositoryProvider).watchNotes(userId, mediaId);
});
