import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/app/app.dart';
import 'package:moviary/app/router.dart';
import 'package:moviary/core/providers.dart';
import 'package:moviary/features/auth/presentation/auth_providers.dart';
import 'package:moviary/features/explore/presentation/explore_providers.dart';
import 'package:moviary/features/library/presentation/library_providers.dart';
import 'package:moviary/features/media_detail/presentation/media_providers.dart';
import 'package:moviary/features/settings/domain/app_preferences.dart';
import 'package:moviary/features/settings/presentation/settings_providers.dart';

import 'fake_auth_repository.dart';
import 'fake_repositories.dart';

/// Full app with every external dependency replaced by a fake.
///
/// Repositories always come from a [FakeBackend] (empty by default), so no
/// test touches the real database.
Widget buildTestApp({
  required FakeAuthRepository auth,
  FakeBackend? backend,
  bool online = true,
  bool onboardingCompleted = true,
}) {
  final fakes = backend ?? FakeBackend();
  return ProviderScope(
    overrides: [
      initialPreferencesProvider.overrideWithValue(AppPreferences.defaults),
      connectivityStatusProvider.overrideWith((ref) => Stream.value(online)),
      connectivityServiceProvider
          .overrideWithValue(FakeConnectivityService(online: online)),
      initialOnboardingCompletedProvider.overrideWithValue(onboardingCompleted),
      onboardingRepositoryProvider.overrideWithValue(
        InMemoryOnboardingRepository(completed: onboardingCompleted),
      ),
      initialAuthUserProvider.overrideWithValue(auth.currentUser),
      authRepositoryProvider.overrideWithValue(auth),
      libraryRepositoryProvider.overrideWithValue(fakes.library),
      personalStateRepositoryProvider.overrideWithValue(fakes.personal),
      notesRepositoryProvider.overrideWithValue(fakes.notes),
      manualMediaRepositoryProvider.overrideWithValue(fakes.manual),
      discoveryRepositoryProvider.overrideWithValue(fakes.discovery),
      catalogRepositoryProvider.overrideWithValue(fakes.catalog),
    ],
    child: const MoviaryApp(),
  );
}

/// Navigates the running app to [location] using its real router.
Future<void> goTo(WidgetTester tester, String location) async {
  final element = tester.element(find.byType(MoviaryApp));
  final router = ProviderScope.containerOf(element).read(routerProvider);
  router.go(location);
  await tester.pumpAndSettle();
}

/// Tall surface so long screens need no scrolling in tests.
void useTallScreen(WidgetTester tester) {
  tester.view.physicalSize = const Size(800, 2400);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
}