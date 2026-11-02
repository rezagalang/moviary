import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/auth_providers.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/onboarding_screen.dart';
import '../features/calendar/presentation/calendar_screen.dart';
import '../features/explore/presentation/explore_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/library/presentation/library_screen.dart';
import '../features/media_detail/presentation/add_media_screen.dart';
import '../features/media_detail/presentation/media_detail_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../l10n/app_localizations.dart';
import '../shared/widgets/offline_banner.dart';

abstract final class AppPaths {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';
  static const String explore = '/explore';
  static const String library = '/library';
  static const String calendar = '/calendar';
  static const String profile = '/profile';
  static const String addMedia = '/media/new';

  static String media(String id) => '/media/$id';
}

/// Redirect order: onboarding (first launch) -> login (no session) -> app.
/// The session is restored locally during bootstrap, so a signed-in user
/// reaches Home even when the device is offline.
final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier<int>(0);
  ref.listen(authSessionProvider, (previous, next) => refresh.value++);
  ref.listen(onboardingCompletedProvider, (previous, next) => refresh.value++);

  final router = GoRouter(
    initialLocation: AppPaths.home,
    refreshListenable: refresh,
    redirect: (context, state) {
      final onboarded = ref.read(onboardingCompletedProvider);
      final signedIn = ref.read(authSessionProvider) != null;
      final location = state.matchedLocation;

      if (!onboarded) {
        return location == AppPaths.onboarding ? null : AppPaths.onboarding;
      }
      if (!signedIn) {
        return location == AppPaths.login ? null : AppPaths.login;
      }
      if (location == AppPaths.login || location == AppPaths.onboarding) {
        return AppPaths.home;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppPaths.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppPaths.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppPaths.addMedia,
        builder: (context, state) => const AddMediaScreen(),
      ),
      GoRoute(
        path: '/media/:id',
        builder: (context, state) =>
            MediaDetailScreen(mediaId: state.pathParameters['id']!),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppPaths.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppPaths.explore,
              builder: (context, state) => const ExploreScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppPaths.library,
              builder: (context, state) => const LibraryScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppPaths.calendar,
              builder: (context, state) => const CalendarScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppPaths.profile,
              builder: (context, state) => const ProfileScreen(),
            ),
          ]),
        ],
      ),
    ],
  );

  ref.onDispose(() {
    router.dispose();
    refresh.dispose();
  });
  return router;
});

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const OfflineBanner(),
          NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) => navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            ),
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
                label: l10n.navHome,
              ),
              NavigationDestination(
                icon: const Icon(Icons.explore_outlined),
                selectedIcon: const Icon(Icons.explore),
                label: l10n.navExplore,
              ),
              NavigationDestination(
                icon: const Icon(Icons.video_library_outlined),
                selectedIcon: const Icon(Icons.video_library),
                label: l10n.navLibrary,
              ),
              NavigationDestination(
                icon: const Icon(Icons.calendar_month_outlined),
                selectedIcon: const Icon(Icons.calendar_month),
                label: l10n.navCalendar,
              ),
              NavigationDestination(
                icon: const Icon(Icons.person_outline),
                selectedIcon: const Icon(Icons.person),
                label: l10n.navProfile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}