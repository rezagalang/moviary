enum AppThemeChoice { system, light, dark }

enum AppLanguage { system, english, indonesian }

/// User-selected appearance and language. Pure Dart (no Flutter types).
final class AppPreferences {
  const AppPreferences({required this.themeChoice, required this.language});

  static const AppPreferences defaults = AppPreferences(
    themeChoice: AppThemeChoice.system,
    language: AppLanguage.system,
  );

  final AppThemeChoice themeChoice;
  final AppLanguage language;

  AppPreferences copyWith({AppThemeChoice? themeChoice, AppLanguage? language}) {
    return AppPreferences(
      themeChoice: themeChoice ?? this.themeChoice,
      language: language ?? this.language,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is AppPreferences &&
      other.themeChoice == themeChoice &&
      other.language == language;

  @override
  int get hashCode => Object.hash(themeChoice, language);
}
