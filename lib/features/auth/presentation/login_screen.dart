import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/design_tokens.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/providers.dart';
import '../../../core/services/app_logger.dart';
import '../../../l10n/app_localizations.dart';
import 'auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _busy = false;

  Future<void> _signIn() async {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _busy = true);
    try {
      final online =
          await ref.read(connectivityServiceProvider).hasNetworkInterface();
      if (!online) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.loginOfflineError)),
        );
        return;
      }
      // On success the router redirects to Home when the session changes.
      await ref.read(authSessionProvider.notifier).signInWithGoogle();
    } on SignInCancelledFailure {
      AppLogger.info('Google sign-in cancelled by the user');
    } on NetworkFailure catch (failure, stack) {
      AppLogger.error('Sign-in failed: network', failure, stack);
      messenger.showSnackBar(SnackBar(content: Text(l10n.loginOfflineError)));
    } on AppFailure catch (failure, stack) {
      AppLogger.error('Sign-in failed', failure, stack);
      messenger.showSnackBar(SnackBar(content: Text(l10n.loginFailed)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.movie_filter_outlined,
                    size: 88,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(l10n.appName, style: theme.textTheme.headlineMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    l10n.appTagline,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _busy ? null : _signIn,
                      icon: _busy
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.login),
                      label: Text(l10n.loginContinueGoogle),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    l10n.loginNeedsInternet,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
