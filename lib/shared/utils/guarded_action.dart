import 'package:flutter/material.dart';

import '../../core/errors/app_failure.dart';
import '../../core/services/app_logger.dart';

/// Runs [action]. On an [AppFailure] it logs the error and shows
/// [failureText] in a snackbar. Returns whether the action succeeded.
///
/// Call it while [context] is still mounted; the messenger is looked up
/// before the first await.
Future<bool> runGuarded(
  BuildContext context,
  Future<void> Function() action, {
  required String failureText,
  String label = 'Action',
}) async {
  final messenger = ScaffoldMessenger.of(context);
  try {
    await action();
    return true;
  } on AppFailure catch (failure, stack) {
    AppLogger.error('$label failed', failure, stack);
    messenger.showSnackBar(SnackBar(content: Text(failureText)));
    return false;
  }
}
