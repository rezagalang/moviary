import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme/design_tokens.dart';
import '../../core/providers.dart';
import '../../l10n/app_localizations.dart';

/// Shown only while no network interface is available. Local data stays usable.
class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOffline = ref.watch(connectivityStatusProvider).maybeWhen(
          data: (online) => !online,
          orElse: () => false,
        );
    final scheme = Theme.of(context).colorScheme;

    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: isOffline
          ? Semantics(
              liveRegion: true,
              child: Material(
                color: scheme.tertiaryContainer,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.sm,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.cloud_off_outlined,
                        size: 18,
                        color: scheme.onTertiaryContainer,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).offlineBanner,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: scheme.onTertiaryContainer),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox(width: double.infinity),
    );
  }
}
