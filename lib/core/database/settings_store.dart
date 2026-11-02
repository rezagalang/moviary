
import '../services/app_clock.dart';
import 'app_database.dart';

/// Thin accessor over the `app_settings` table.
class SettingsStore {
  SettingsStore(this._db, this._clock);

  final AppDatabase _db;
  final AppClock _clock;

  Future<String?> read(String key) async {
    final row = await (_db.select(_db.appSettings)
          ..where((t) => t.settingKey.equals(key)))
        .getSingleOrNull();
    return row?.settingValue;
  }

  Future<void> write(String key, String value) {
    return _db.into(_db.appSettings).insertOnConflictUpdate(
          AppSettingsCompanion.insert(
            settingKey: key,
            settingValue: value,
            updatedAt: _clock.nowUtc(),
          ),
        );
  }
}
