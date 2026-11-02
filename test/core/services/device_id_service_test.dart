import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/database/app_database.dart';
import 'package:moviary/core/database/settings_store.dart';
import 'package:moviary/core/services/device_id_service.dart';

import '../../helpers/fixed_clock.dart';

void main() {
  late AppDatabase db;
  late SettingsStore store;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    store = SettingsStore(db, FixedClock(DateTime.utc(2026, 1, 1)));
  });

  tearDown(() => db.close());

  test('creates a UUID once and keeps returning it', () async {
    final service = DeviceIdService(store);
    final first = await service.getOrCreate();
    final second = await service.getOrCreate();

    expect(first, second);
    expect(first, matches(RegExp(r'^[0-9a-f-]{36}$')));
  });

  test('concurrent first calls resolve to the same id', () async {
    final service = DeviceIdService(store);
    final ids = await Future.wait([
      service.getOrCreate(),
      service.getOrCreate(),
      service.getOrCreate(),
    ]);

    expect(ids.toSet(), hasLength(1));
  });

  test('a new service instance reads the persisted id', () async {
    final first = await DeviceIdService(store).getOrCreate();
    final second = await DeviceIdService(store).getOrCreate();

    expect(second, first);
  });
}
