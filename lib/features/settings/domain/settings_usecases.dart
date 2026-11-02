import 'app_preferences.dart';
import 'settings_repository.dart';

class LoadPreferences {
  const LoadPreferences(this._repository);
  final SettingsRepository _repository;

  Future<AppPreferences> call() => _repository.load();
}

class SetThemeChoice {
  const SetThemeChoice(this._repository);
  final SettingsRepository _repository;

  Future<void> call(AppThemeChoice choice) =>
      _repository.saveThemeChoice(choice);
}

class SetLanguage {
  const SetLanguage(this._repository);
  final SettingsRepository _repository;

  Future<void> call(AppLanguage language) => _repository.saveLanguage(language);
}
