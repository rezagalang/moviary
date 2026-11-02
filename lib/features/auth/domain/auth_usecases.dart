import 'auth_repository.dart';
import 'auth_user.dart';

class SignInWithGoogle {
  const SignInWithGoogle(this._repository);
  final AuthRepository _repository;

  Future<AuthUser> call() => _repository.signInWithGoogle();
}

class SignOut {
  const SignOut(this._repository);
  final AuthRepository _repository;

  Future<void> call() => _repository.signOut();
}
