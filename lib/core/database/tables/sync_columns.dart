import 'package:drift/drift.dart';

/// Columns shared by every personal (synced) table.
///
/// - `id`: UUID. Deterministic (UUIDv5) for "one per user+media" entities so
///   two devices that create the same logical row converge on the same id.
/// - `revision` increases on every local change; `baseRevision` is the last
///   revision confirmed on the server (maintained by the sync engine).
/// - `deletedAt` is a tombstone. Rows are never hard-deleted locally.
mixin SyncColumns on Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  IntColumn get baseRevision => integer().withDefault(const Constant(0))();
  TextColumn get deviceId => text()();
  DateTimeColumn get serverUpdatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
