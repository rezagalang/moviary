import 'package:flutter/material.dart';

/// Shown when the local database cannot be opened. Deliberately minimal and
/// not localized because localization delegates may not be usable at this point.
class BootstrapFailureApp extends StatelessWidget {
  const BootstrapFailureApp({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Moviary could not open its local database.\n\n$error',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
