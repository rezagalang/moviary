import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/design_tokens.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/services/app_logger.dart';
import '../../../l10n/app_localizations.dart';
import '../../auth/domain/auth_user.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../settings/domain/app_preferences.dart';
import '../../settings/presentation/settings_providers.dart';

/// Account (Phase 2) plus appearance and language settings (Phase 1).
/// Backup, sync and account deletion arrive in later phases.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final prefs = ref.watch(preferencesProvider);
    final notifier = ref.read(preferencesProvider.notifier);
    final user = ref.watch(authSessionProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navProfile)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          if (user != null) ...[
            _AccountCard(
              user: user,
              onSignOut: () => _confirmSignOut(context, ref),
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
          _SectionTitle(l10n.settingsAppearance),
          SegmentedButton<AppThemeChoice>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(
                value: AppThemeChoice.system,
                label: Text(l10n.themeSystem),
              ),
              ButtonSegment(
                value: AppThemeChoice.light,
                label: Text(l10n.themeLight),
              ),
              ButtonSegment(
                value: AppThemeChoice.dark,
                label: Text(l10n.themeDark),
              ),
            ],
            selected: {prefs.themeChoice},
            onSelectionChanged: (selection) => _save(
              context,
              l10n.settingsSaveFailed,
              () => notifier.setThemeChoice(selection.first),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          _SectionTitle(l10n.settingsLanguage),
          SegmentedButton<AppLanguage>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(
                value: AppLanguage.system,
                label: Text(l10n.languageSystem),
              ),
              ButtonSegment(
                value: AppLanguage.english,
                label: Text(l10n.languageEnglish),
              ),
              ButtonSegment(
                value: AppLanguage.indonesian,
                label: Text(l10n.languageIndonesian),
              ),
            ],
            selected: {prefs.language},
            onSelectionChanged: (selection) => _save(
              context,
              l10n.settingsSaveFailed,
              () => notifier.setLanguage(selection.first),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _save(
    BuildContext context,
    String failureText,
    Future<void> Function() action,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await action();
    } on AppFailure catch (failure, stack) {
      AppLogger.error('Saving a setting failed', failure, stack);
      messenger.showSnackBar(SnackBar(content: Text(failureText)));
    }
  }

  Future<void> _confirmSignOut(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.signOutConfirmTitle),
        content: Text(l10n.signOutConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.signOut),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      await ref.read(authSessionProvider.notifier).signOut();
    } on AppFailure catch (failure, stack) {
      AppLogger.error('Sign-out failed', failure, stack);
      messenger.showSnackBar(SnackBar(content: Text(l10n.signOutFailed)));
    }
  }
}

class _AccountCard extends StatelessWidget {
  const _AccountCard({required this.user, required this.onSignOut});

  final AuthUser user;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final name = user.displayName ?? user.email ?? '?';
    final initial = (name.isEmpty ? '?' : name).characters.first.toUpperCase();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Text(initial)),
              title: Text(name),
              subtitle: Text(user.email ?? l10n.accountSignedInWith),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton.icon(
                onPressed: onSignOut,
                icon: const Icon(Icons.logout),
                label: Text(l10n.signOut),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}