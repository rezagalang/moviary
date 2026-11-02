import 'package:flutter/material.dart';

import '../features/settings/domain/app_preferences.dart';

extension AppThemeChoiceX on AppThemeChoice {
  ThemeMode toThemeMode() => switch (this) {
        AppThemeChoice.system => ThemeMode.system,
        AppThemeChoice.light => ThemeMode.light,
        AppThemeChoice.dark => ThemeMode.dark,
      };
}

extension AppLanguageX on AppLanguage {
  /// `null` means "follow the system locale".
  Locale? toLocale() => switch (this) {
        AppLanguage.system => null,
        AppLanguage.english => const Locale('en'),
        AppLanguage.indonesian => const Locale('id'),
      };
}
