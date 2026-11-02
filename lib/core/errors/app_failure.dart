/// Typed failures shared across layers.
///
/// Data-layer code catches low-level exceptions (Drift, Dio, Firebase) and
/// rethrows one of these, so presentation never depends on SDK exceptions.
sealed class AppFailure implements Exception {
  const AppFailure({required this.message, this.cause, this.stackTrace});

  /// Developer-facing description. UI shows localized text instead.
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() =>
      '$runtimeType: $message${cause == null ? '' : ' (cause: $cause)'}';
}

final class NetworkFailure extends AppFailure {
  const NetworkFailure({
    super.message = 'Network unavailable',
    super.cause,
    super.stackTrace,
  });
}

final class RateLimitedFailure extends AppFailure {
  const RateLimitedFailure({
    super.message = 'Rate limit reached',
    this.retryAfter,
    super.cause,
    super.stackTrace,
  });

  final Duration? retryAfter;
}

/// Missing or rejected API credentials (for example no TMDB key configured).
final class ConfigFailure extends AppFailure {
  const ConfigFailure({
    super.message = 'API is not configured',
    super.cause,
    super.stackTrace,
  });
}

final class AuthFailure extends AppFailure {
  const AuthFailure({
    super.message = 'Authentication failed',
    super.cause,
    super.stackTrace,
  });
}

/// Local database / file-system failure.
final class StorageFailure extends AppFailure {
  const StorageFailure({
    super.message = 'Local storage error',
    super.cause,
    super.stackTrace,
  });
}

final class ValidationFailure extends AppFailure {
  const ValidationFailure({
    super.message = 'Invalid data',
    super.cause,
    super.stackTrace,
  });
}

final class ConflictFailure extends AppFailure {
  const ConflictFailure({
    super.message = 'Conflicting changes',
    super.cause,
    super.stackTrace,
  });
}

final class UnknownFailure extends AppFailure {
  const UnknownFailure({
    super.message = 'Unexpected error',
    super.cause,
    super.stackTrace,
  });
}

/// The user closed the Google account picker. Not an error to display.
final class SignInCancelledFailure extends AppFailure {
  const SignInCancelledFailure({
    super.message = 'Sign-in cancelled',
    super.cause,
    super.stackTrace,
  });
}