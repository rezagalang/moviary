import 'package:drift/drift.dart';

/// Pending cloud changes. Local-only (never synced). One row per entity:
/// repeated edits coalesce into a single entry carrying the latest revision.
@DataClassName('SyncQueueRow')
class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get operation => text()();
  IntColumn get localRevision => integer()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get attemptCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextAttemptAt => dateTime()();
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {entityType, entityId},
      ];

  @override
  List<String> get customConstraints => [
        "CHECK (operation IN ('upsert', 'delete'))",
      ];
}

@DataClassName('SyncMetadataRow')
class SyncMetadata extends Table {
  TextColumn get metaKey => text()();
  TextColumn get metaValue => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {metaKey};
}

@DataClassName('BackupHistoryRow')
class BackupHistory extends Table {
  TextColumn get id => text()();
  TextColumn get kind => text()();
  TextColumn get status => text()();
  TextColumn get storagePath => text().nullable()();
  TextColumn get fileName => text().nullable()();
  IntColumn get sizeBytes => integer().withDefault(const Constant(0))();
  TextColumn get checksumSha256 => text().nullable()();
  IntColumn get backupVersion => integer()();
  TextColumn get appVersion => text()();
  IntColumn get schemaVersion => integer()();

  /// JSON object with per-entity counts.
  TextColumn get counts => text().withDefault(const Constant('{}'))();
  TextColumn get error => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// HTTP response cache for lists and search results. Detail pages are served
/// from the normalized catalog tables instead.
@DataClassName('CachedMetadataRow')
class CachedMediaMetadata extends Table {
  TextColumn get cacheKey => text()();
  TextColumn get responseJson => text()();
  TextColumn get etag => text().nullable()();
  DateTimeColumn get fetchedAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {cacheKey};
}