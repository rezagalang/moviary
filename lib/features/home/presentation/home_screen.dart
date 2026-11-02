import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../app/theme/design_tokens.dart';
import '../../../core/services/app_logger.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/poster_image.dart';
import '../../../shared/widgets/state_views.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../library/domain/library_entities.dart';
import '../../library/presentation/library_ui_providers.dart';

/// Personal dashboard. "Popular discoveries" and viewing statistics arrive
/// with the discovery (Phase 4) and statistics (Phase 7) features; nothing is
/// faked here.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final user = ref.watch(authSessionProvider);
    final firstName = user?.displayName?.trim().split(' ').first;
    final greeting = (firstName == null || firstName.isEmpty)
        ? l10n.homeGreetingNoName
        : l10n.homeGreeting(firstName);
    final countsAsync = ref.watch(libraryCountsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appName)),
      body: countsAsync.when(
        loading: () => const LoadingStateView(),
        error: (error, stack) {
          AppLogger.error('Loading library counts failed', error, stack);
          return ErrorStateView(
            onRetry: () => ref.invalidate(libraryCountsProvider),
          );
        },
        data: (counts) => ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text(greeting, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.lg),
            if (counts.total == 0)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    children: [
                      Icon(
                        Icons.video_library_outlined,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        l10n.homeEmptyTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(l10n.homeEmptyBody, textAlign: TextAlign.center),
                      const SizedBox(height: AppSpacing.lg),
                      FilledButton(
                        onPressed: () => context.push(AppPaths.addMedia),
                        child: Text(l10n.addMedia),
                      ),
                    ],
                  ),
                ),
              )
            else ...[
              _StatsGrid(counts: counts),
              const SizedBox(height: AppSpacing.xl),
              _Rail(
                title: l10n.homeContinueWatching,
                provider: homeContinueWatchingProvider,
              ),
              _Rail(
                title: l10n.homeRecentlyAdded,
                provider: homeRecentlyAddedProvider,
              ),
              _Rail(
                title: l10n.homeRecentlyCompleted,
                provider: homeRecentlyCompletedProvider,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.counts});

  final LibraryCounts counts;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final stats = [
      (l10n.homeInLibrary, counts.total),
      (l10n.statusCompleted, counts.of(WatchStatus.completed)),
      // Rewatching is still "watching"; matches the Continue watching rail.
      (
        l10n.statusWatching,
        counts.of(WatchStatus.watching) + counts.of(WatchStatus.rewatching),
      ),
      (l10n.statusPlanToWatch, counts.of(WatchStatus.planToWatch)),
    ];
    // Rows size themselves to their content, so larger text never overflows.
    return Column(
      children: [
        for (var i = 0; i < stats.length; i += 2)
          Padding(
            padding: EdgeInsets.only(
              bottom: i + 2 < stats.length ? AppSpacing.md : 0,
            ),
            // Stretch needs a bounded height; inside a ListView it is
            // unbounded, so IntrinsicHeight gives the row its tallest card.
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                Expanded(
                  child: _StatCard(label: stats[i].$1, value: stats[i].$2),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _StatCard(
                    label: stats[i + 1].$1,
                    value: stats[i + 1].$2,
                  ),
                ),
              ],
              ),
            ),
          ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$value', style: theme.textTheme.headlineMedium),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _Rail extends ConsumerWidget {
  const _Rail({required this.title, required this.provider});

  final String title;
  final StreamProvider<List<LibraryEntry>> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(provider).maybeWhen(
          data: (data) => data,
          orElse: () => const <LibraryEntry>[],
        );
    if (entries.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            height: 210,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: entries.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: AppSpacing.md),
              itemBuilder: (context, index) {
                final entry = entries[index];
                return SizedBox(
                  width: 120,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    onTap: () => context.push(AppPaths.media(entry.media.id)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadius.card),
                            child: SizedBox.expand(
                              child: PosterImage(
                                path: entry.media.posterPath,
                                title: entry.media.title,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          entry.media.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}