import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../data/library_repository_impl.dart';
import '../data/personal_rows.dart';
import '../domain/library_repository.dart';

final personalRowsProvider = Provider<PersonalRows>(
  (ref) => PersonalRows(
    ref.watch(appDatabaseProvider),
    ref.watch(syncedWriterProvider),
  ),
);

final libraryRepositoryProvider = Provider<LibraryRepository>(
  (ref) => LibraryRepositoryImpl(
    ref.watch(appDatabaseProvider),
    ref.watch(syncedWriterProvider),
    ref.watch(personalRowsProvider),
  ),
);
