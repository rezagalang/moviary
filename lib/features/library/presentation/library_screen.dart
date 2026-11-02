import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../app/theme/design_tokens.dart';
import '../../../core/services/app_logger.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/guarded_action.dart';
import '../../../shared/widgets/state_views.dart';
import '../../auth/presentation/auth_providers.dart';
import '../domain/library_entities.dart';
import 'library_providers.dart';
import 'library_ui_providers.dart';
import 'widgets/library_filter_sheet.dart';
import 'widgets/media_card.dart';
import 'widgets/status_picker.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(libraryQueryProvider.notifier).setSearch(value);
    });
  }

  void _clearSearch() {
    _debounce?.cancel();
    _searchController.clear();
    ref.read(libraryQueryProvider.notifier).setSearch('');
  }

  void _onTap(LibraryEntry entry, bool selecting) {
    if (selecting) {
      ref.read(librarySelectionProvider.notifier).toggle(entry.media.id);
    } else {
      unawaited(context.push(AppPaths.media(entry.media.id)));
    }
  }

  void _onLongPress(LibraryEntry entry) {
    ref.read(librarySelectionProvider.notifier).toggle(entry.media.id);
  }

  Future<void> _bulkChangeStatus(Set<String> ids) async {
    final failureText = AppLocalizations.of(context).errorGeneric;
    final status = await showStatusPicker(context);
    final userId = ref.read(currentUserIdProvider);
    if (status == null || userId == null || !mounted) return;

    final ok = await runGuarded(
      context,
      () => ref.read(libraryRepositoryProvider).bulkSetStatus(userId, ids, status),
      failureText: failureText,
      label: 'Bulk status change',
    );
    if (ok && mounted) ref.read(librarySelectionProvider.notifier).clear();
  }

  Future<void> _bulkRemove(Set<String> ids) async {
    final l10n = AppLocalizations.of(context);
    final failureText = l10n.errorGeneric;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.removeConfirmTitle(ids.length)),
        content: Text(l10n.removeConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.remove),
          ),
        ],
      ),
    );
    final userId = ref.read(currentUserIdProvider);
    if (confirmed != true || userId == null || !mounted) return;

    final ok = await runGuarded(
      context,
      () => ref.read(libraryRepositoryProvider).bulkRemove(userId, ids),
      failureText: failureText,
      label: 'Bulk remove',
    );
    if (ok && mounted) ref.read(librarySelectionProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final query = ref.watch(libraryQueryProvider);
    final selection = ref.watch(librarySelectionProvider);
    final isGrid = ref.watch(libraryGridModeProvider);
    final entriesAsync = ref.watch(libraryEntriesProvider);
    final selecting = selection.isNotEmpty;

    ref.listen(libraryEntriesProvider, (previous, next) {
      if (next.hasError) {
        AppLogger.error(
          'Loading the library failed',
          next.error ?? 'unknown',
          next.stackTrace,
        );
      }
    });

    final entries = entriesAsync.maybeWhen(
      data: (data) => data,
      orElse: () => const <LibraryEntry>[],
    );

    final PreferredSizeWidget appBar = selecting
        ? AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              tooltip: l10n.cancel,
              onPressed: ref.read(librarySelectionProvider.notifier).clear,
            ),
            title: Text(l10n.selectedCount(selection.length)),
            actions: [
              IconButton(
                icon: const Icon(Icons.select_all),
                tooltip: l10n.selectAll,
                onPressed: () => ref
                    .read(librarySelectionProvider.notifier)
                    .selectAll(entries.map((e) => e.media.id)),
              ),
              IconButton(
                icon: const Icon(Icons.swap_horiz),
                tooltip: l10n.changeStatus,
                onPressed: () => _bulkChangeStatus(selection),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                tooltip: l10n.removeFromLibrary,
                onPressed: () => _bulkRemove(selection),
              ),
            ],
          )
        : AppBar(
            title: Text(l10n.navLibrary),
            actions: [
              IconButton(
                icon: Icon(isGrid ? Icons.view_list : Icons.grid_view),
                tooltip: isGrid ? l10n.viewList : l10n.viewGrid,
                onPressed: ref.read(libraryGridModeProvider.notifier).toggle,
              ),
              IconButton(
                icon: Badge(
                  isLabelVisible: query.hasActiveFilters,
                  smallSize: 8,
                  child: const Icon(Icons.tune),
                ),
                tooltip: l10n.filterTitle,
                onPressed: () => showLibraryFilterSheet(context),
              ),
            ],
          );

    return PopScope(
      canPop: !selecting,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) ref.read(librarySelectionProvider.notifier).clear();
      },
      child: Scaffold(
        appBar: appBar,
        floatingActionButton: selecting
            ? null
            : FloatingActionButton.extended(
                onPressed: () => context.push(AppPaths.addMedia),
                icon: const Icon(Icons.add),
                label: Text(l10n.addMedia),
              ),
        body: Column(
          children: [
            if (!selecting)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.sm,
                  AppSpacing.lg,
                  AppSpacing.sm,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: l10n.librarySearchHint,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: query.search.isEmpty
                        ? null
                        : IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: _clearSearch,
                          ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.card),
                    ),
                    isDense: true,
                  ),
                ),
              ),
            Expanded(
              child: entriesAsync.when(
                loading: () => const LoadingStateView(),
                error: (error, stack) => ErrorStateView(
                  onRetry: () => ref.invalidate(libraryEntriesProvider),
                ),
                data: (data) {
                  if (data.isEmpty) {
                    final filtering =
                        query.hasActiveFilters || query.search.trim().isNotEmpty;
                    return EmptyStateView(
                      icon: filtering
                          ? Icons.search_off
                          : Icons.video_library_outlined,
                      title: filtering
                          ? l10n.libraryNoResultsTitle
                          : l10n.libraryEmptyTitle,
                      message: filtering
                          ? l10n.libraryNoResultsBody
                          : l10n.libraryEmptyBody,
                    );
                  }
                  return isGrid
                      ? _grid(data, selection, selecting)
                      : _list(data, selection, selecting);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _grid(List<LibraryEntry> data, Set<String> selection, bool selecting) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.lg,
        96,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 170,
        childAspectRatio: 0.56,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.md,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final entry = data[index];
        return MediaGridCard(
          entry: entry,
          selected: selection.contains(entry.media.id),
          onTap: () => _onTap(entry, selecting),
          onLongPress: () => _onLongPress(entry),
        );
      },
    );
  }

  Widget _list(List<LibraryEntry> data, Set<String> selection, bool selecting) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 96),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final entry = data[index];
        return MediaListRow(
          entry: entry,
          selected: selection.contains(entry.media.id),
          onTap: () => _onTap(entry, selecting),
          onLongPress: () => _onLongPress(entry),
        );
      },
    );
  }
}