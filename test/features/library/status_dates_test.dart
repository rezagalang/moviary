import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/features/library/domain/library_entities.dart';
import 'package:moviary/features/library/domain/status_dates.dart';

void main() {
  final now = DateTime.utc(2026, 5, 1);
  final earlier = DateTime.utc(2026, 4, 1);

  StatusDates resolve(
    WatchStatus status, {
    WatchStatus? previous,
    DateTime? started,
    DateTime? completed,
    int rewatches = 0,
  }) =>
      resolveStatusDates(
        newStatus: status,
        previousStatus: previous,
        startedAt: started,
        completedAt: completed,
        rewatchCount: rewatches,
        now: now,
      );

  test('plan to watch does not start anything', () {
    final dates = resolve(WatchStatus.planToWatch);
    expect(dates.startedAt, isNull);
    expect(dates.completedAt, isNull);
  });

  test('watching sets startedAt once and keeps an earlier one', () {
    expect(resolve(WatchStatus.watching).startedAt, now);
    expect(resolve(WatchStatus.watching, started: earlier).startedAt, earlier);
  });

  test('completed sets completedAt, and backfills startedAt', () {
    final dates = resolve(WatchStatus.completed, previous: WatchStatus.watching);
    expect(dates.completedAt, now);
    expect(dates.startedAt, now);
  });

  test('re-selecting completed keeps the original completion date', () {
    final dates = resolve(
      WatchStatus.completed,
      previous: WatchStatus.completed,
      started: earlier,
      completed: earlier,
    );
    expect(dates.completedAt, earlier);
  });

  test('leaving completed clears completedAt', () {
    for (final status in [
      WatchStatus.watching,
      WatchStatus.onHold,
      WatchStatus.dropped,
      WatchStatus.planToWatch,
      WatchStatus.rewatching,
    ]) {
      final dates = resolve(
        status,
        previous: WatchStatus.completed,
        started: earlier,
        completed: earlier,
      );
      expect(dates.completedAt, isNull, reason: status.name);
    }
  });

  test('entering rewatching counts one rewatch, staying does not', () {
    final entered = resolve(
      WatchStatus.rewatching,
      previous: WatchStatus.completed,
      started: earlier,
      rewatches: 1,
    );
    expect(entered.rewatchCount, 2);

    final stayed = resolve(
      WatchStatus.rewatching,
      previous: WatchStatus.rewatching,
      started: earlier,
      rewatches: 2,
    );
    expect(stayed.rewatchCount, 2);
  });
}
