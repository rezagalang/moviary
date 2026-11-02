import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../../library/presentation/library_providers.dart';
import '../data/manual_media_repository_impl.dart';
import '../data/notes_repository_impl.dart';
import '../data/personal_state_repository_impl.dart';
import '../domain/media_detail_repositories.dart';

final personalStateRepositoryProvider = Provider<PersonalStateRepository>(
  (ref) => PersonalStateRepositoryImpl(
    ref.watch(appDatabaseProvider),
    ref.watch(syncedWriterProvider),
    ref.watch(personalRowsProvider),
  ),
);

final notesRepositoryProvider = Provider<NotesRepository>(
  (ref) => NotesRepositoryImpl(
    ref.watch(appDatabaseProvider),
    ref.watch(syncedWriterProvider),
    ref.watch(personalRowsProvider),
  ),
);

final manualMediaRepositoryProvider = Provider<ManualMediaRepository>(
  (ref) => ManualMediaRepositoryImpl(
    ref.watch(appDatabaseProvider),
    ref.watch(syncedWriterProvider),
  ),
);
