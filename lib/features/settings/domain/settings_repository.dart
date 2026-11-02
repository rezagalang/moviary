import 'app_preferences.dart';

abstract interface class SettingsRepository {
  Future<AppPreferences> load();
  Future<void> saveThemeChoice(AppThemeChoice choice);
  Future<void> saveLanguage(AppLanguage language);
}
