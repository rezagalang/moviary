import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../media_detail/domain/media_summary.dart';
import '../domain/library_entities.dart';

extension WatchStatusPresentation on WatchStatus {
  String label(AppLocalizations l10n) => switch (this) {
        WatchStatus.planToWatch => l10n.statusPlanToWatch,
        WatchStatus.watching => l10n.statusWatching,
        WatchStatus.completed => l10n.statusCompleted,
        WatchStatus.onHold => l10n.statusOnHold,
        WatchStatus.dropped => l10n.statusDropped,
        WatchStatus.rewatching => l10n.statusRewatching,
      };

  IconData get icon => switch (this) {
        WatchStatus.planToWatch => Icons.bookmark_border,
        WatchStatus.watching => Icons.play_circle_outline,
        WatchStatus.completed => Icons.check_circle_outline,
        WatchStatus.onHold => Icons.pause_circle_outline,
        WatchStatus.dropped => Icons.cancel_outlined,
        WatchStatus.rewatching => Icons.replay,
      };
}

extension MediaTypePresentation on MediaType {
  String label(AppLocalizations l10n) => switch (this) {
        MediaType.movie => l10n.typeMovie,
        MediaType.tv => l10n.typeTv,
        MediaType.anime => l10n.typeAnime,
      };
}

extension LibrarySortPresentation on LibrarySort {
  String label(AppLocalizations l10n) => switch (this) {
        LibrarySort.recentlyAdded => l10n.sortRecentlyAdded,
        LibrarySort.title => l10n.sortTitle,
        LibrarySort.rating => l10n.sortRating,
        LibrarySort.releaseDate => l10n.sortReleaseDate,
        LibrarySort.recentlyUpdated => l10n.sortRecentlyUpdated,
      };
}
