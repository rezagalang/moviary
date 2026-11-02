import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../widgets/state_views.dart';

/// Honest placeholder for tabs whose feature is not built yet.
/// It intentionally has no buttons.
class FeaturePendingScreen extends StatelessWidget {
  const FeaturePendingScreen({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: EmptyStateView(
        icon: icon,
        title: l10n.pendingFeatureTitle,
        message: l10n.pendingFeatureBody,
      ),
    );
  }
}
