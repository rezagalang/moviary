import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/errors/app_failure.dart';

/// Obtains a Google ID token. Abstracted so Firebase sign-in is testable
/// without the native Google UI.
abstract interface class GoogleCredentialSource {
  /// Throws [SignInCancelledFailure] when the user closes the account picker.
  Future<String> requestIdToken();

  Future<void> signOut();
}

/// google_sign_in 7.x implementation (singleton, explicit `initialize`).
class GoogleSignInCredentialSource implements GoogleCredentialSource {
  GoogleSignInCredentialSource({GoogleSignIn? googleSignIn, this.serverClientId})
      : _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final GoogleSignIn _googleSignIn;

  /// OAuth *web* client ID. Optional when google-services.json provides one.
  final String? serverClientId;

  Future<void>? _init;

  Future<void> _ensureInitialized() async {
    final pending = _init ??= _googleSignIn.initialize(
      serverClientId: serverClientId,
    );
    try {
      await pending;
    } catch (_) {
      _init = null; // allow a retry after a failed initialization
      rethrow;
    }
  }

  @override
  Future<String> requestIdToken() async {
    await _ensureInitialized();
    try {
      final account = await _googleSignIn.authenticate();
      final idToken = account.authentication.idToken;
      if (idToken == null || idToken.isEmpty) {
        throw const AuthFailure(
          message: 'Google returned no ID token. Check the Firebase '
              'configuration and GOOGLE_SERVER_CLIENT_ID.',
        );
      }
      return idToken;
    } on GoogleSignInException catch (e, s) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw SignInCancelledFailure(cause: e, stackTrace: s);
      }
      throw AuthFailure(
        message: 'Google sign-in failed (${e.code.name})',
        cause: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> signOut() async {
    await _ensureInitialized();
    await _googleSignIn.signOut();
  }
}
