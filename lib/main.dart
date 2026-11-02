import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/bootstrap.dart';
import 'app/bootstrap_failure_app.dart';
import 'app/splash_app.dart';
import 'core/providers.dart';
import 'core/services/app_logger.dart';
import 'features/auth/presentation/auth_providers.dart';
import 'features/settings/presentation/settings_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    AppLogger.error(
      'Flutter framework error',
      details.exception,
      details.stack,
    );
    FlutterError.presentError(details);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    AppLogger.error('Uncaught platform error', error, stack);
    return true;
  };

  runApp(const SplashApp());

  try {
    final result = await bootstrap();
    runApp(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(result.database),
          initialPreferencesProvider.overrideWithValue(result.preferences),
          initialOnboardingCompletedProvider
              .overrideWithValue(result.onboardingCompleted),
          authRepositoryProvider.overrideWithValue(result.authRepository),
          initialAuthUserProvider.overrideWithValue(result.initialUser),
        ],
        child: const MoviaryApp(),
      ),
    );
  } catch (error, stack) {
    AppLogger.error('Bootstrap failed', error, stack);
    runApp(BootstrapFailureApp(error: error));
  }
}