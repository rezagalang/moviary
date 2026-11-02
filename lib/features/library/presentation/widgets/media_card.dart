import 'package:flutter/material.dart';

import '../../../../app/theme/design_tokens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/poster_image.dart';
import '../../domain/library_entities.dart';
import '../status_labels.dart';

class MediaGridCard extends StatelessWidget {
  const MediaGridCard({
    super.key,
    required this.entry,
    required this.selected,
    required this.onTap,
    required this.onLongPress,
  });

  final LibraryEntry entry;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final year = entry.media.releaseDate?.year;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  PosterImage(
                    path: entry.media.posterPath,
                    title: entry.media.title,
                  ),
                  Positioned(
                    left: AppSpacing.sm,
                    bottom: AppSpacing.sm,
                    child: _Badge(
                      icon: entry.status.icon,
                      text: entry.status.label(l10n),
                    ),
                  ),
                  if (entry.isFavorite)
                    const Positioned(
                      right: AppSpacing.sm,
                      top: AppSpacing.sm,
                      child: Icon(Icons.favorite, color: Colors.redAccent, size: 20),
                    ),
                  if (selected)
                    ColoredBox(
                      color: scheme.primary.withValues(alpha: 0.45),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          size: 40,
                          color: scheme.onPrimary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.media.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    [
                      if (year != null) '$year',
                      if (entry.rating != null) '★ ${_formatRating(entry.rating!)}',
                    ].join('  ·  '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MediaListRow extends StatelessWidget {
  const MediaListRow({
    super.key,
    required this.entry,
    required this.selected,
    required this.onTap,
    required this.onLongPress,
  });

  final LibraryEntry entry;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final year = entry.media.releaseDate?.year;

    return ListTile(
      selected: selected,
      onTap: onTap,
      onLongPress: onLongPress,
      leading: selected
          ? const SizedBox(
              width: 48,
              child: Center(child: Icon(Icons.check_circle)),
            )
          : SizedBox(
              width: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.chip / 2),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: PosterImage(
                    path: entry.media.posterPath,
                    title: entry.media.title,
                  ),
                ),
              ),
            ),
      title: Text(entry.media.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        [
          entry.status.label(l10n),
          if (year != null) '$year',
        ].join('  ·  '),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (entry.isFavorite)
            const Icon(Icons.favorite, color: Colors.redAccent, size: 18),
          if (entry.rating != null) ...[
            const SizedBox(width: AppSpacing.xs),
            Text('★ ${_formatRating(entry.rating!)}'),
          ],
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: Colors.white),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatRating(double rating) =>
    rating == rating.roundToDouble() ? rating.toStringAsFixed(0) : rating.toStringAsFixed(1);
