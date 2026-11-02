import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/database/app_database.dart';
import 'package:moviary/core/database/settings_store.dart';

import '../../helpers/fixed_clock.dart';

void main() {
  test('upgrades a v1 database to v2 and keeps existing settings', () async {
    final executor = NativeDatabase.memory(setup: (raw) {
      raw.execute(
        'CREATE TABLE app_settings ('
        'setting_key TEXT NOT NULL, '
        'setting_value TEXT NOT NULL, '
        'updated_at INTEGER NOT NULL, '
        'PRIMARY KEY (setting_key))',
      );
      raw.execute(
        "INSERT INTO app_settings VALUES ('theme_choice', 'dark', 1767225600)",
      );
      raw.execute('PRAGMA user_version = 1');
    });
    final db = AppDatabase(executor);
    addTearDown(db.close);

    // The first query opens the database and runs the migration.
    final store = SettingsStore(db, FixedClock(DateTime.utc(2026)));
    expect(await store.read('theme_choice'), 'dark');

    final tables = await db
        .customSelect("SELECT name FROM sqlite_master WHERE type = 'table'")
        .get();
    final names = tables.map((r) => r.read<String>('name')).toSet();
    expect(
      names,
      containsAll([
        'media',
        'user_library',
        'watch_history',
        'user_ratings',
        'sync_queue',
        'cached_media_metadata',
      ]),
    );

    final indexes = await db
        .customSelect(
          'SELECT name FROM sqlite_master '
          "WHERE type = 'index' AND name = 'uq_user_library_active'",
        )
        .get();
    expect(indexes, hasLength(1));

    final version = await db.customSelect('PRAGMA user_version').getSingle();
    expect(version.read<int>('user_version'), 2);
  });
}