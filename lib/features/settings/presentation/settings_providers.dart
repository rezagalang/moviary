import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../data/settings_repository_impl.dart';
import '../domain/app_preferences.dart';
import '../domain/settings_repository.dart';
import '../domain/settings_usecases.dart';

/// Overridden in `main.dart` with preferences loaded before the first frame,
/// so the first frame already uses the saved theme and language.
final initialPreferencesProvider = Provider<AppPreferences>(
  (ref) => throw UnimplementedError(
    'initialPreferencesProvider must be overridden in the root ProviderScope.',
  ),
);

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => SettingsRepositoryImpl(ref.watch(settingsStoreProvider)),
);

final setThemeChoiceUseCaseProvider = Provider<SetThemeChoice>(
  (ref) => SetThemeChoice(ref.watch(settingsRepositoryProvider)),
);

final setLanguageUseCaseProvider = Provider<SetLanguage>(
  (ref) => SetLanguage(ref.watch(settingsRepositoryProvider)),
);

/// State changes only after the value has been saved to the local database.
class PreferencesNotifier extends Notifier<AppPreferences> {
  @override
  AppPreferences build() => ref.watch(initialPreferencesProvider);

  Future<void> setThemeChoice(AppThemeChoice choice) async {
    await ref.read(setThemeChoiceUseCaseProvider)(choice);
    state = state.copyWith(themeChoice: choice);
  }

  Future<void> setLanguage(AppLanguage language) async {
    await ref.read(setLanguageUseCaseProvider)(language);
    state = state.copyWith(language: language);
  }
}

final preferencesProvider =
    NotifierProvider<PreferencesNotifier, AppPreferences>(
  PreferencesNotifier.new,
);
