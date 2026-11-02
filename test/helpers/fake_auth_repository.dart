import 'dart:async';

import 'package:moviary/core/network/connectivity_service.dart';
import 'package:moviary/features/auth/domain/auth_repository.dart';
import 'package:moviary/features/auth/domain/auth_user.dart';
import 'package:moviary/features/auth/domain/onboarding_repository.dart';

const AuthUser testUser = AuthUser(
  uid: 'u1',
  displayName: 'Alice Tester',
  email: 'alice@example.com',
);

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({AuthUser? initialUser, this.signInError})
      : _user = initialUser;

  final StreamController<AuthUser?> _controller =
      StreamController<AuthUser?>.broadcast();
  AuthUser? _user;

  /// When set, [signInWithGoogle] throws it.
  Object? signInError;
  int signInCalls = 0;
  int signOutCalls = 0;

  @override
  AuthUser? get currentUser => _user;

  @override
  Stream<AuthUser?> authStateChanges() => _controller.stream;

  @override
  Future<AuthUser> signInWithGoogle() async {
    signInCalls++;
    final error = signInError;
    if (error != null) throw error;
    _user = testUser;
    _controller.add(testUser);
    return testUser;
  }

  @override
  Future<void> signOut() async {
    signOutCalls++;
    _user = null;
    _controller.add(null);
  }

  void dispose() => _controller.close();
}

class InMemoryOnboardingRepository implements OnboardingRepository {
  InMemoryOnboardingRepository({this.completed = false});

  bool completed;

  @override
  Future<bool> isCompleted() async => completed;

  @override
  Future<void> markCompleted() async => completed = true;
}

class FakeConnectivityService extends ConnectivityService {
  FakeConnectivityService({required this.online});

  final bool online;

  @override
  Future<bool> hasNetworkInterface() async => online;

  @override
  Stream<bool> watch() => Stream.value(online);
}
