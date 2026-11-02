import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/library_entities.dart';
import '../status_labels.dart';

/// Bottom sheet that returns the chosen status, or null if dismissed.
Future<WatchStatus?> showStatusPicker(BuildContext context) {
  return showModalBottomSheet<WatchStatus>(
    context: context,
    // Six rows are taller than the default 9/16-screen sheet on short
    // screens, so allow full height and scroll if it still does not fit.
    isScrollControlled: true,
    showDragHandle: true,
    builder: (sheetContext) {
      final l10n = AppLocalizations.of(sheetContext);
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final status in WatchStatus.values)
                ListTile(
                  leading: Icon(status.icon),
                  title: Text(status.label(l10n)),
                  onTap: () => Navigator.of(sheetContext).pop(status),
                ),
            ],
          ),
        ),
      );
    },
  );
}