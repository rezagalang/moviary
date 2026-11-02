import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/app_failure.dart';
import '../../../core/services/app_logger.dart';
import '../domain/auth_repository.dart';
import '../domain/auth_user.dart';
import 'google_credential_source.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository(this._auth, this._google);

  final FirebaseAuth _auth;
  final GoogleCredentialSource _google;

  @override
  AuthUser? get currentUser => _toAuthUser(_auth.currentUser);

  @override
  Stream<AuthUser?> authStateChanges() =>
      _auth.authStateChanges().map(_toAuthUser);

  @override
  Future<AuthUser> signInWithGoogle() async {
    final idToken = await _google.requestIdToken();
    try {
      final credential = GoogleAuthProvider.credential(idToken: idToken);
      final result = await _auth.signInWithCredential(credential);
      final user = _toAuthUser(result.user);
      if (user == null) {
        throw const AuthFailure(
          message: 'Firebase returned no user after sign-in',
        );
      }
      return user;
    } on FirebaseAuthException catch (e, s) {
      throw _mapException(e, s);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e, s) {
      throw _mapException(e, s);
    }
    // The Firebase session is already gone. A failure here is logged but must
    // not be reported as a failed sign-out.
    try {
      await _google.signOut();
    } catch (e, s) {
      AppLogger.error('Google sign-out failed after Firebase sign-out', e, s);
    }
  }

  AppFailure _mapException(FirebaseAuthException e, StackTrace s) {
    return switch (e.code) {
      'network-request-failed' => NetworkFailure(cause: e, stackTrace: s),
      _ => AuthFailure(
          message: 'Firebase auth failed (${e.code})',
          cause: e,
          stackTrace: s,
        ),
    };
  }

  AuthUser? _toAuthUser(User? user) {
    if (user == null) return null;
    return AuthUser(
      uid: user.uid,
      displayName: user.displayName,
      email: user.email,
      photoUrl: user.photoURL,
    );
  }
}
