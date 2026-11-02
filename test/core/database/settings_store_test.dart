import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/database/app_database.dart';
import 'package:moviary/core/database/settings_store.dart';

import '../../helpers/fixed_clock.dart';

void main() {
  late AppDatabase db;
  late SettingsStore store;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    store = SettingsStore(db, FixedClock(DateTime.utc(2026, 1, 1)));
  });

  tearDown(() => db.close());

  test('returns null for a missing key', () async {
    expect(await store.read('missing'), isNull);
  });

  test('writes and reads a value', () async {
    await store.write('k', 'v');
    expect(await store.read('k'), 'v');
  });

  test('overwriting keeps a single row', () async {
    await store.write('k', 'one');
    await store.write('k', 'two');

    expect(await store.read('k'), 'two');
    expect(await db.select(db.appSettings).get(), hasLength(1));
  });
}
