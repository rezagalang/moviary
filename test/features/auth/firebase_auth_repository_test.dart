import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/features/auth/data/firebase_auth_repository.dart';
import 'package:moviary/features/auth/data/google_credential_source.dart';
import 'package:moviary/features/auth/domain/auth_user.dart';

class _FakeGoogleSource implements GoogleCredentialSource {
  _FakeGoogleSource({this.error, this.signOutError});

  final Object? error;
  final Object? signOutError;
  int signOutCalls = 0;

  @override
  Future<String> requestIdToken() async {
    final e = error;
    if (e != null) throw e;
    return 'fake-id-token';
  }

  @override
  Future<void> signOut() async {
    signOutCalls++;
    final e = signOutError;
    if (e != null) throw e;
  }
}

MockUser _mockUser() => MockUser(
      uid: 'u1',
      email: 'alice@example.com',
      displayName: 'Alice Tester',
    );

class _NetworkFailingAuth extends MockFirebaseAuth {
  _NetworkFailingAuth() : super(mockUser: _mockUser());

  @override
  Future<UserCredential> signInWithCredential(AuthCredential? credential) {
    return Future.error(FirebaseAuthException(code: 'network-request-failed'));
  }
}

void main() {
  test('signInWithGoogle signs in to Firebase and maps the user', () async {
    final auth = MockFirebaseAuth(mockUser: _mockUser());
    final repo = FirebaseAuthRepository(auth, _FakeGoogleSource());

    final user = await repo.signInWithGoogle();

    expect(user.uid, 'u1');
    expect(user.email, 'alice@example.com');
    expect(auth.currentUser?.uid, 'u1');
    expect(repo.currentUser?.uid, 'u1');
  });

  test('authStateChanges reports the signed-in user after sign-in', () async {
    final auth = MockFirebaseAuth(mockUser: _mockUser());
    final repo = FirebaseAuthRepository(auth, _FakeGoogleSource());

    final states = <AuthUser?>[];
    final subscription = repo.authStateChanges().listen(states.add);
    await pumpEventQueue();

    await repo.signInWithGoogle();
    await pumpEventQueue();
    await subscription.cancel();

    expect(states.last?.uid, 'u1');
  });

  test('a restored session is visible without any network call', () {
    final auth = MockFirebaseAuth(signedIn: true, mockUser: _mockUser());
    final repo = FirebaseAuthRepository(auth, _FakeGoogleSource());

    expect(repo.currentUser?.uid, 'u1');
  });

  test('cancelled Google sign-in propagates and leaves the user signed out',
      () async {
    final auth = MockFirebaseAuth(mockUser: _mockUser());
    final repo = FirebaseAuthRepository(
      auth,
      _FakeGoogleSource(error: const SignInCancelledFailure()),
    );

    await expectLater(
      repo.signInWithGoogle(),
      throwsA(isA<SignInCancelledFailure>()),
    );
    expect(auth.currentUser, isNull);
  });

  test('Google failures propagate as AuthFailure', () async {
    final repo = FirebaseAuthRepository(
      MockFirebaseAuth(mockUser: _mockUser()),
      _FakeGoogleSource(error: const AuthFailure(message: 'no token')),
    );

    await expectLater(repo.signInWithGoogle(), throwsA(isA<AuthFailure>()));
  });

  test('network errors from Firebase map to NetworkFailure', () async {
    final repo = FirebaseAuthRepository(
      _NetworkFailingAuth(),
      _FakeGoogleSource(),
    );

    await expectLater(repo.signInWithGoogle(), throwsA(isA<NetworkFailure>()));
  });

  test('signOut clears the Firebase and Google sessions', () async {
    final auth = MockFirebaseAuth(signedIn: true, mockUser: _mockUser());
    final google = _FakeGoogleSource();
    final repo = FirebaseAuthRepository(auth, google);

    await repo.signOut();

    expect(auth.currentUser, isNull);
    expect(google.signOutCalls, 1);
  });

  test('a Google sign-out failure does not fail the sign-out', () async {
    final auth = MockFirebaseAuth(signedIn: true, mockUser: _mockUser());
    final repo = FirebaseAuthRepository(
      auth,
      _FakeGoogleSource(signOutError: Exception('boom')),
    );

    await repo.signOut();

    expect(auth.currentUser, isNull);
  });
}
