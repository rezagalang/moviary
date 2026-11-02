import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../app/theme/design_tokens.dart';
import '../../../core/errors/app_failure.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/guarded_action.dart';
import '../../../shared/widgets/poster_image.dart';
import '../../../shared/widgets/state_views.dart';
import '../../library/presentation/status_labels.dart';
import '../../media_detail/domain/media_summary.dart';
import '../domain/discovery_repository.dart';
import 'explore_providers.dart';

/// Find new movies, series and anime online (TMDB and Jikan).
///
/// Tapping a result saves it to the local catalog first, so the detail screen,
/// rating and library actions all work from local data (and offline later).
class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      ref.read(exploreQueryProvider.notifier).set(value);
    });
  }

  void _clear() {
    _debounce?.cancel();
    _controller.clear();
    ref.read(exploreQueryProvider.notifier).set('');
  }

  Future<void> _open(MediaSummary item) async {
    final failureText = AppLocalizations.of(context).errorGeneric;
    final ok = await runGuarded(
      context,
      () => ref.read(catalogRepositoryProvider).ensureLocal(item),
      failureText: failureText,
      label: 'Open discovered title',
    );
    if (ok && mounted) unawaited(context.push(AppPaths.media(item.id)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final query = ref.watch(exploreQueryProvider).trim();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navExplore)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.sm,
              AppSpacing.lg,
              AppSpacing.sm,
            ),
            child: TextField(
              controller: _controller,
              onChanged: _onChanged,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: l10n.exploreSearchHint,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clear,
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.card),
                ),
                isDense: true,
              ),
            ),
          ),
          Expanded(
            child: query.isEmpty
                ? _DiscoverySections(onOpen: _open)
                : _SearchResults(onOpen: _open),
          ),
        ],
      ),
    );
  }
}

String discoveryFailureMessage(AppLocalizations l10n, AppFailure? failure) {
  return switch (failure) {
    NetworkFailure() => l10n.exploreOffline,
    RateLimitedFailure() => l10n.exploreRateLimited,
    ConfigFailure() => l10n.exploreNotConfigured,
    _ => l10n.errorGeneric,
  };
}

String _sectionTitle(AppLocalizations l10n, DiscoverySection section) {
  return switch (section) {
    DiscoverySection.trending => l10n.exploreTrending,
    DiscoverySection.popularMovies => l10n.explorePopularMovies,
    DiscoverySection.popularTv => l10n.explorePopularTv,
    DiscoverySection.topAnime => l10n.exploreTopAnime,
  };
}

class _DiscoverySections extends ConsumerWidget {
  const _DiscoverySections({required this.onOpen});

  final ValueChanged<MediaSummary> onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final results = {
      for (final section in DiscoverySection.values)
        section: ref.watch(discoverySectionProvider(section)),
    };

    final failures = [
      for (final result in results.values)
        if (result.value?.failure != null) result.value!.failure!,
    ];
    if (failures.length == results.length) {
      return ErrorStateView(
        message: discoveryFailureMessage(l10n, failures.first),
        onRetry: () {
          for (final section in DiscoverySection.values) {
            ref.invalidate(discoverySectionProvider(section));
          }
        },
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      children: [
        for (final section in DiscoverySection.values)
          _SectionRail(
            title: _sectionTitle(l10n, section),
            result: results[section]!,
            onOpen: onOpen,
            onRetry: () => ref.invalidate(discoverySectionProvider(section)),
          ),
      ],
    );
  }
}

class _SectionRail extends StatelessWidget {
  const _SectionRail({
    required this.title,
    required this.result,
    required this.onOpen,
    required this.onRetry,
  });

  final String title;
  final AsyncValue<DiscoveryResult> result;
  final ValueChanged<MediaSummary> onOpen;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final data = result.value;

    final Widget body;
    if (data == null) {
      body = result.hasError
          ? Text(l10n.errorGeneric)
          : const SizedBox(height: 210, child: LoadingStateView());
    } else if (data.failed) {
      body = Row(
        children: [
          Icon(Icons.cloud_off_outlined, color: theme.colorScheme.error),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: Text(discoveryFailureMessage(l10n, data.failure))),
          TextButton(onPressed: onRetry, child: Text(l10n.retry)),
        ],
      );
    } else if (data.items.isEmpty) {
      return const SizedBox.shrink();
    } else {
      body = SizedBox(
        height: 210,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: data.items.length,
          separatorBuilder: (context, index) =>
              const SizedBox(width: AppSpacing.md),
          itemBuilder: (context, index) {
            final item = data.items[index];
            return SizedBox(
              width: 120,
              child: _PosterTile(item: item, onTap: () => onOpen(item)),
            );
          },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          body,
        ],
      ),
    );
  }
}

class _SearchResults extends ConsumerWidget {
  const _SearchResults({required this.onOpen});

  final ValueChanged<MediaSummary> onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final result = ref.watch(exploreSearchProvider);
    final filter = ref.watch(exploreTypeFilterProvider);

    return Column(
      children: [
        _TypeFilterBar(selected: filter),
        Expanded(
          child: result.when(
            loading: () => const LoadingStateView(),
            error: (error, stack) => ErrorStateView(
              onRetry: () => ref.invalidate(exploreSearchProvider),
            ),
            data: (data) {
              if (data.failed && data.items.isEmpty) {
                return ErrorStateView(
                  message: discoveryFailureMessage(l10n, data.failure),
                  onRetry: () => ref.invalidate(exploreSearchProvider),
                );
              }
              final items = filter == null
                  ? data.items
                  : [
                      for (final item in data.items)
                        if (item.mediaType == filter) item,
                    ];
              if (items.isEmpty) {
                return EmptyStateView(
                  icon: Icons.search_off,
                  title: l10n.libraryNoResultsTitle,
                  message: l10n.exploreNoResultsBody,
                );
              }
              return GridView.builder(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.sm,
                  AppSpacing.lg,
                  AppSpacing.lg,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.md,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final year = item.releaseDate?.year;
                  final type = item.mediaType.label(l10n);
                  return _PosterTile(
                    item: item,
                    meta: year == null ? type : '$type  ·  $year',
                    onTap: () => onOpen(item),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TypeFilterBar extends ConsumerWidget {
  const _TypeFilterBar({required this.selected});

  final MediaType? selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final notifier = ref.read(exploreTypeFilterProvider.notifier);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Row(
        children: [
          ChoiceChip(
            label: Text(l10n.exploreFilterAll),
            selected: selected == null,
            onSelected: (_) => notifier.set(null),
          ),
          for (final type in MediaType.values) ...[
            const SizedBox(width: AppSpacing.sm),
            ChoiceChip(
              label: Text(type.label(l10n)),
              selected: selected == type,
              onSelected: (_) => notifier.set(type),
            ),
          ],
        ],
      ),
    );
  }
}

class _PosterTile extends StatelessWidget {
  const _PosterTile({required this.item, required this.onTap, this.meta});

  final MediaSummary item;
  final VoidCallback onTap;

  /// Optional second line, for example "Movie  ·  2021".
  final String? meta;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.card),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.card),
              child: SizedBox.expand(
                child: PosterImage(path: item.posterPath, title: item.title),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            item.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall,
          ),
          if (meta != null)
            Text(
              meta!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }
}