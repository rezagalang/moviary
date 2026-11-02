import 'package:flutter/material.dart';

import 'design_tokens.dart';

/// Cinematic Material 3 theme: warm amber accent, near-black dark surface.
abstract final class AppTheme {
  static const Color _seed = Color(0xFFE8A33D);
  static const Color _darkSurface = Color(0xFF0E0F14);

  static final ThemeData light = _build(Brightness.light);
  static final ThemeData dark = _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    var scheme = ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: brightness,
    );
    if (brightness == Brightness.dark) {
      scheme = scheme.copyWith(surface: _darkSurface);
    }

    final base = ThemeData(colorScheme: scheme, useMaterial3: true);
    final text = base.textTheme;

    return base.copyWith(
      textTheme: text.copyWith(
        headlineMedium: text.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.4,
        ),
        titleLarge: text.titleLarge?.copyWith(fontWeight: FontWeight.w700),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 68,
        indicatorColor: scheme.primaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.chip),
        ),
      ),
    );
  }
}
