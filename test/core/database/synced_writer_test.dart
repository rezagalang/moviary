import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/database/synced_writer.dart';

import '../../helpers/db_fixture.dart';

void main() {
  late DbFixture fx;

  setUp(() => fx = DbFixture.create());
  tearDown(() => fx.close());

  test('stamp carries the user, a stable device id and the current time', () async {
    final a = await fx.writer.stamp('u1');
    final b = await fx.writer.stamp('u1');

    expect(a.userId, 'u1');
    expect(a.deviceId, b.deviceId);
    expect(a.now, fx.clock.now);
  });

  test('repeated changes to one entity coalesce into a single queue row', () async {
    final t0 = fx.clock.now;
    await fx.writer.enqueue(
      entityType: SyncEntityType.library,
      entityId: 'e1',
      operation: SyncOperation.upsert,
      revision: 1,
      now: t0,
    );
    final t1 = t0.add(const Duration(minutes: 5));
    await fx.writer.enqueue(
      entityType: SyncEntityType.library,
      entityId: 'e1',
      operation: SyncOperation.delete,
      revision: 2,
      now: t1,
    );

    final rows = await fx.queue();
    expect(rows, hasLength(1));
    expect(rows.single.operation, 'delete');
    expect(rows.single.localRevision, 2);
    expect(rows.single.status, 'pending');
  });

  test('different entities get separate queue rows', () async {
    for (final id in ['a', 'b']) {
      await fx.writer.enqueue(
        entityType: SyncEntityType.ratings,
        entityId: id,
        operation: SyncOperation.upsert,
        revision: 1,
        now: fx.clock.now,
      );
    }
    expect(await fx.queue(), hasLength(2));
  });
}
