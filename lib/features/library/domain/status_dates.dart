import 'library_entities.dart';

typedef StatusDates = ({
  DateTime? startedAt,
  DateTime? completedAt,
  int rewatchCount,
});

/// Business rules for the dates and counters that follow a status change.
///
/// - Starting (watching / completed / rewatching) sets `startedAt` once.
/// - `completedAt` exists only while the status is completed.
/// - Entering rewatching from another status counts as one more rewatch.
StatusDates resolveStatusDates({
  required WatchStatus newStatus,
  required WatchStatus? previousStatus,
  required DateTime? startedAt,
  required DateTime? completedAt,
  required int rewatchCount,
  required DateTime now,
}) {
  switch (newStatus) {
    case WatchStatus.planToWatch:
    case WatchStatus.onHold:
    case WatchStatus.dropped:
      return (
        startedAt: startedAt,
        completedAt: null,
        rewatchCount: rewatchCount,
      );
    case WatchStatus.watching:
      return (
        startedAt: startedAt ?? now,
        completedAt: null,
        rewatchCount: rewatchCount,
      );
    case WatchStatus.completed:
      return (
        startedAt: startedAt ?? now,
        completedAt: previousStatus == WatchStatus.completed
            ? (completedAt ?? now)
            : now,
        rewatchCount: rewatchCount,
      );
    case WatchStatus.rewatching:
      return (
        startedAt: startedAt ?? now,
        completedAt: null,
        rewatchCount: previousStatus == WatchStatus.rewatching
            ? rewatchCount
            : rewatchCount + 1,
      );
  }
}
