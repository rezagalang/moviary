import 'package:drift/drift.dart';

/// Key/value settings. Personal-data tables arrive in Phase 3.
@DataClassName('AppSettingRow')
class AppSettings extends Table {
  TextColumn get settingKey => text()();
  TextColumn get settingValue => text()();

  /// Stored as UTC.
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {settingKey};
}
