import 'dart:developer' as developer;

/// Minimal logger. Errors are always logged, never swallowed silently.
/// A crash-reporting sink can be plugged in here later.
abstract final class AppLogger {
  static const String _name = 'moviary';

  static void info(String message) => developer.log(message, name: _name);

  static void error(String message, Object error, [StackTrace? stackTrace]) {
    developer.log(
      message,
      name: _name,
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
