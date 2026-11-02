import 'auth_user.dart';

abstract interface class AuthRepository {
  /// Valid after the first [authStateChanges] event.
  AuthUser? get currentUser;

  /// Emits the persisted session first, without needing network access.
  Stream<AuthUser?> authStateChanges();

  /// Needs internet. Throws [SignInCancelledFailure] if the user backs out.
  Future<AuthUser> signInWithGoogle();

  Future<void> signOut();
}
