import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/design_tokens.dart';
import '../../../core/services/app_logger.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/guarded_action.dart';
import '../../../shared/widgets/poster_image.dart';
import '../../../shared/widgets/state_views.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../library/domain/library_entities.dart';
import '../../library/presentation/library_providers.dart';
import '../../library/presentation/status_labels.dart';
import '../domain/media_summary.dart';
import '../domain/personal_state.dart';
import 'media_detail_providers.dart';
import 'media_providers.dart';

class MediaDetailScreen extends ConsumerWidget {
  const MediaDetailScreen({super.key, required this.mediaId});

  final String mediaId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final detailAsync = ref.watch(mediaDetailProvider(mediaId));

    ref.listen(mediaDetailProvider(mediaId), (previous, next) {
      if (next.hasError) {
        AppLogger.error(
          'Loading media detail failed',
          next.error ?? 'unknown',
          next.stackTrace,
        );
      }
    });

    return detailAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const LoadingStateView(),
      ),
      error: (error, stack) => Scaffold(
        appBar: AppBar(),
        body: ErrorStateView(
          onRetry: () => ref.invalidate(mediaDetailProvider(mediaId)),
        ),
      ),
      data: (detail) {
        if (detail == null) {
          return Scaffold(
            appBar: AppBar(),
            body: EmptyStateView(
              icon: Icons.movie_outlined,
              title: l10n.detailNotFound,
              message: '',
            ),
          );
        }
        return _DetailBody(detail: detail);
      },
    );
  }
}

class _DetailBody extends ConsumerWidget {
  const _DetailBody({required this.detail});

  final MediaDetail detail;

  MediaSummary get media => detail.media;
  PersonalState get personal => detail.personal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final userId = ref.watch(currentUserIdProvider);
    final year = media.releaseDate?.year;

    final facts = [
      media.mediaType.label(l10n),
      if (year != null) '$year',
      if (media.runtimeMinutes != null) l10n.runtimeMinutes(media.runtimeMinutes!),
    ].join('  ·  ');

    Future<void> act(Future<void> Function(String userId) action) async {
      if (userId == null) return;
      await runGuarded(
        context,
        () => action(userId),
        failureText: l10n.errorGeneric,
        label: 'Media detail action',
      );
    }

    final library = ref.read(libraryRepositoryProvider);
    final state = ref.read(personalStateRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(media.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: PosterImage(path: media.posterPath, title: media.title),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(media.title, style: theme.textTheme.titleLarge),
                    if (media.originalTitle != null &&
                        media.originalTitle != media.title) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        media.originalTitle!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.sm),
                    Text(facts, style: theme.textTheme.bodyMedium),
                    if (media.isManual) ...[
                      const SizedBox(height: AppSpacing.sm),
                      Chip(
                        avatar: const Icon(Icons.edit_note, size: 18),
                        label: Text(l10n.detailManualBadge),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          _SectionTitle(l10n.detailStatus),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              for (final status in WatchStatus.values)
                ChoiceChip(
                  avatar: Icon(status.icon, size: 18),
                  label: Text(status.label(l10n)),
                  selected: personal.status == status,
                  onSelected: (_) => act(
                    (uid) => library.setStatus(uid, media.id, status),
                  ),
                ),
            ],
          ),
          if (!personal.isInLibrary)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.sm),
              child: Text(
                l10n.detailStatusHint,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            children: [
              FilterChip(
                avatar: Icon(
                  personal.isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 18,
                ),
                label: Text(l10n.detailFavorite),
                selected: personal.isFavorite,
                onSelected: (value) => act(
                  (uid) => state.setFavorite(uid, media.id, value),
                ),
              ),
              FilterChip(
                avatar: Icon(
                  personal.isInWatchlist
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  size: 18,
                ),
                label: Text(l10n.detailWatchlist),
                selected: personal.isInWatchlist,
                onSelected: (value) => act(
                  (uid) => state.setWatchlist(uid, media.id, value),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          _SectionTitle(l10n.detailRating),
          _RatingSection(
            key: ValueKey('rating-${media.id}'),
            rating: personal.rating,
            onChanged: (value) =>
                act((uid) => state.setRating(uid, media.id, value)),
          ),
          if (media.overview != null) ...[
            const SizedBox(height: AppSpacing.xl),
            _SectionTitle(l10n.detailOverview),
            Text(media.overview!, style: theme.textTheme.bodyMedium),
          ],
          const SizedBox(height: AppSpacing.xl),
          _NotesSection(mediaId: media.id),
          if (personal.isInLibrary) ...[
            const SizedBox(height: AppSpacing.xl),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                icon: const Icon(Icons.delete_outline),
                label: Text(l10n.removeFromLibrary),
                onPressed: () => _confirmRemove(context, ref),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _confirmRemove(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final userId = ref.read(currentUserIdProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.removeConfirmTitle(1)),
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
    if (confirmed != true || userId == null || !context.mounted) return;
    await runGuarded(
      context,
      () => ref.read(libraryRepositoryProvider).removeFromLibrary(userId, media.id),
      failureText: l10n.errorGeneric,
      label: 'Remove from library',
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

/// Slider in 0.5 steps. The value is saved when the drag ends.
class _RatingSection extends StatefulWidget {
  const _RatingSection({super.key, required this.rating, required this.onChanged});

  final double? rating;
  final ValueChanged<double?> onChanged;

  @override
  State<_RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<_RatingSection> {
  double? _dragValue;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final shown = _dragValue ?? widget.rating;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Slider(
                min: 0.5,
                max: 10,
                divisions: 19,
                value: shown ?? 5,
                label: shown?.toString(),
                onChanged: (value) => setState(() => _dragValue = value),
                onChangeEnd: (value) {
                  setState(() => _dragValue = null);
                  widget.onChanged(value);
                },
              ),
            ),
            SizedBox(
              width: 56,
              child: Text(
                shown == null ? '–' : '${shown.toStringAsFixed(1)} / 10',
                textAlign: TextAlign.end,
                style: theme.textTheme.titleSmall,
              ),
            ),
          ],
        ),
        if (widget.rating == null)
          Text(
            l10n.detailRatingNone,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          )
        else
          TextButton(
            onPressed: () => widget.onChanged(null),
            child: Text(l10n.detailClearRating),
          ),
      ],
    );
  }
}

class _NotesSection extends ConsumerStatefulWidget {
  const _NotesSection({required this.mediaId});

  final String mediaId;

  @override
  ConsumerState<_NotesSection> createState() => _NotesSectionState();
}

class _NotesSectionState extends ConsumerState<_NotesSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _add() async {
    final text = _controller.text.trim();
    final userId = ref.read(currentUserIdProvider);
    if (text.isEmpty || userId == null) return;
    final ok = await runGuarded(
      context,
      () => ref.read(notesRepositoryProvider).addNote(userId, widget.mediaId, text),
      failureText: AppLocalizations.of(context).errorGeneric,
      label: 'Add note',
    );
    if (ok && mounted) _controller.clear();
  }

  Future<void> _edit(NoteEntry note) async {
    final l10n = AppLocalizations.of(context);
    final userId = ref.read(currentUserIdProvider);
    final saved = await showDialog<String>(
      context: context,
      builder: (dialogContext) => _NoteEditorDialog(initialText: note.body),
    );
    if (saved == null || saved.trim().isEmpty || userId == null || !mounted) {
      return;
    }
    await runGuarded(
      context,
      () => ref.read(notesRepositoryProvider).updateNote(userId, note.id, saved),
      failureText: l10n.errorGeneric,
      label: 'Update note',
    );
  }

  Future<void> _delete(NoteEntry note) async {
    final l10n = AppLocalizations.of(context);
    final userId = ref.read(currentUserIdProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.detailDeleteNoteTitle),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed != true || userId == null || !mounted) return;
    await runGuarded(
      context,
      () => ref.read(notesRepositoryProvider).deleteNote(userId, note.id),
      failureText: l10n.errorGeneric,
      label: 'Delete note',
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final notes = ref.watch(mediaNotesProvider(widget.mediaId)).maybeWhen(
          data: (data) => data,
          orElse: () => const <NoteEntry>[],
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(l10n.detailNotes),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: l10n.detailNoteHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.card),
                  ),
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            FilledButton(onPressed: _add, child: Text(l10n.detailSave)),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        if (notes.isEmpty)
          Text(
            l10n.detailNoNotes,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          )
        else
          for (final note in notes)
            Card(
              child: ListTile(
                title: Text(note.body),
                trailing: PopupMenuButton<String>(
                  onSelected: (action) =>
                      action == 'edit' ? _edit(note) : _delete(note),
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 'edit', child: Text(l10n.detailEditNote)),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text(l10n.detailDeleteNote),
                    ),
                  ],
                ),
              ),
            ),
      ],
    );
  }
}

/// Owns its controller so it is disposed together with the dialog, after the
/// closing animation has finished.
class _NoteEditorDialog extends StatefulWidget {
  const _NoteEditorDialog({required this.initialText});

  final String initialText;

  @override
  State<_NoteEditorDialog> createState() => _NoteEditorDialogState();
}

class _NoteEditorDialogState extends State<_NoteEditorDialog> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.initialText);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(l10n.detailEditNote),
      content: TextField(controller: _controller, autofocus: true, maxLines: null),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: Text(l10n.detailSave),
        ),
      ],
    );
  }
}
