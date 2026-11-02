import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'theme/design_tokens.dart';

/// Shown while [bootstrap] runs (database, Firebase, session restore).
/// Intentionally not localized: it is on screen before preferences are loaded.
class SplashApp extends StatelessWidget {
  const SplashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const _SplashBody(),
    );
  }
}

class _SplashBody extends StatelessWidget {
  const _SplashBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.movie_filter_outlined,
              size: 88,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('Moviary', style: theme.textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Your Personal Entertainment Universe',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ],
        ),
      ),
    );
  }
}
