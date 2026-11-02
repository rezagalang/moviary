import '../../../core/database/settings_store.dart';
import '../../../core/errors/app_failure.dart';
import '../domain/app_preferences.dart';
import '../domain/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._store);

  static const String themeKey = 'theme_choice';
  static const String languageKey = 'language';

  final SettingsStore _store;

  @override
  Future<AppPreferences> load() async {
    try {
      final rawTheme = await _store.read(themeKey);
      final rawLanguage = await _store.read(languageKey);
      return AppPreferences(
        themeChoice: AppThemeChoice.values.asNameMap()[rawTheme] ??
            AppPreferences.defaults.themeChoice,
        language: AppLanguage.values.asNameMap()[rawLanguage] ??
            AppPreferences.defaults.language,
      );
    } catch (e, s) {
      throw StorageFailure(
        message: 'Could not load preferences',
        cause: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> saveThemeChoice(AppThemeChoice choice) =>
      _write(themeKey, choice.name);

  @override
  Future<void> saveLanguage(AppLanguage language) =>
      _write(languageKey, language.name);

  Future<void> _write(String key, String value) async {
    try {
      await _store.write(key, value);
    } catch (e, s) {
      throw StorageFailure(
        message: 'Could not save setting "$key"',
        cause: e,
        stackTrace: s,
      );
    }
  }
}
