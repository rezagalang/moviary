import '../errors/app_failure.dart';

/// Runs [action] and converts unexpected exceptions into [StorageFailure].
/// Typed [AppFailure]s (for example [ValidationFailure]) pass through.
Future<T> guardStorage<T>(String operation, Future<T> Function() action) async {
  try {
    return await action();
  } on AppFailure {
    rethrow;
  } catch (e, s) {
    throw StorageFailure(
      message: 'Local storage operation failed: $operation',
      cause: e,
      stackTrace: s,
    );
  }
}
