import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/components/feature_pending_screen.dart';

/// Placeholder until the feature is implemented (see roadmap).
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FeaturePendingScreen(
      title: AppLocalizations.of(context).navCalendar,
      icon: Icons.calendar_month_outlined,
    );
  }
}
