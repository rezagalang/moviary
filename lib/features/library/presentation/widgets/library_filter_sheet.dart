import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/design_tokens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../media_detail/domain/media_summary.dart';
import '../../domain/library_entities.dart';
import '../library_ui_providers.dart';
import '../status_labels.dart';

Future<void> showLibraryFilterSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) => const _LibraryFilterSheet(),
  );
}

class _LibraryFilterSheet extends ConsumerWidget {
  const _LibraryFilterSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final query = ref.watch(libraryQueryProvider);
    final notifier = ref.read(libraryQueryProvider.notifier);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          0,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.filterTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.lg),
            _Heading(l10n.filterSort),
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                for (final sort in LibrarySort.values)
                  ChoiceChip(
                    label: Text(sort.label(l10n)),
                    selected: query.sort == sort,
                    onSelected: (_) => notifier.setSort(sort),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            _Heading(l10n.filterStatus),
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                for (final status in WatchStatus.values)
                  FilterChip(
                    label: Text(status.label(l10n)),
                    selected: query.statuses.contains(status),
                    onSelected: (_) => notifier.toggleStatus(status),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            _Heading(l10n.filterType),
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                for (final type in MediaType.values)
                  FilterChip(
                    label: Text(type.label(l10n)),
                    selected: query.mediaTypes.contains(type),
                    onSelected: (_) => notifier.toggleType(type),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.filterFavoritesOnly),
              value: query.onlyFavorites,
              onChanged: notifier.setOnlyFavorites,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.filterWatchlistOnly),
              value: query.onlyWatchlist,
              onChanged: notifier.setOnlyWatchlist,
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                TextButton(
                  onPressed: query.hasActiveFilters ? notifier.clearFilters : null,
                  child: Text(l10n.filterClear),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(l10n.filterDone),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Text(text, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
