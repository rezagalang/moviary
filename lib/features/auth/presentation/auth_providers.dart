import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../../../core/services/app_logger.dart';
import '../data/onboarding_repository_impl.dart';
import '../domain/auth_repository.dart';
import '../domain/auth_usecases.dart';
import '../domain/auth_user.dart';
import '../domain/onboarding_repository.dart';

/// Overridden in `main.dart` (Firebase-backed) and in tests (fake).
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => throw UnimplementedError(
    'authRepositoryProvider must be overridden in the root ProviderScope.',
  ),
);

/// Persisted session restored during bootstrap (null = signed out).
final initialAuthUserProvider = Provider<AuthUser?>(
  (ref) => throw UnimplementedError(
    'initialAuthUserProvider must be overridden in the root ProviderScope.',
  ),
);

final initialOnboardingCompletedProvider = Provider<bool>(
  (ref) => throw UnimplementedError(
    'initialOnboardingCompletedProvider must be overridden.',
  ),
);

final onboardingRepositoryProvider = Provider<OnboardingRepository>(
  (ref) => OnboardingRepositoryImpl(ref.watch(settingsStoreProvider)),
);

final signInWithGoogleUseCaseProvider = Provider<SignInWithGoogle>(
  (ref) => SignInWithGoogle(ref.watch(authRepositoryProvider)),
);

final signOutUseCaseProvider = Provider<SignOut>(
  (ref) => SignOut(ref.watch(authRepositoryProvider)),
);

/// Current session. Starts from the locally restored user, so the app opens
/// signed in even when offline, then follows the auth state stream.
class AuthSessionNotifier extends Notifier<AuthUser?> {
  @override
  AuthUser? build() {
    final subscription =
        ref.watch(authRepositoryProvider).authStateChanges().listen(
      (user) => state = user,
      onError: (Object error, StackTrace stack) {
        AppLogger.error('Auth state stream failed', error, stack);
      },
    );
    ref.onDispose(subscription.cancel);
    return ref.watch(initialAuthUserProvider);
  }

  Future<void> signInWithGoogle() async {
    await ref.read(signInWithGoogleUseCaseProvider)();
  }

  Future<void> signOut() => ref.read(signOutUseCaseProvider)();
}

final authSessionProvider =
    NotifierProvider<AuthSessionNotifier, AuthUser?>(AuthSessionNotifier.new);

/// Used later to scope all personal data (`user_id`) to the signed-in account.
final currentUserIdProvider = Provider<String?>(
  (ref) => ref.watch(authSessionProvider)?.uid,
);

class OnboardingNotifier extends Notifier<bool> {
  @override
  bool build() => ref.watch(initialOnboardingCompletedProvider);

  Future<void> complete() async {
    await ref.read(onboardingRepositoryProvider).markCompleted();
    state = true;
  }
}

final onboardingCompletedProvider =
    NotifierProvider<OnboardingNotifier, bool>(OnboardingNotifier.new);
