import 'package:drift/drift.dart';

import 'catalog_tables.dart';
import 'sync_columns.dart';

@DataClassName('LibraryRow')
class UserLibrary extends Table with SyncColumns {
  TextColumn get mediaId => text().references(Media, #id)();
  TextColumn get status => text()();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get rewatchCount => integer().withDefault(const Constant(0))();

  /// Cached progress, derived from watch_history.
  IntColumn get currentSeason => integer().nullable()();
  IntColumn get currentEpisode => integer().nullable()();
  DateTimeColumn get addedAt => dateTime()();

  @override
  List<String> get customConstraints => [
        "CHECK (status IN ('plan_to_watch', 'watching', 'completed', "
            "'on_hold', 'dropped', 'rewatching'))",
      ];
}

/// Append-only viewing events. "Is this episode watched" is derived from here.
@DataClassName('WatchHistoryRow')
class WatchHistory extends Table with SyncColumns {
  TextColumn get libraryId => text().references(UserLibrary, #id)();
  TextColumn get mediaId => text().references(Media, #id)();
  IntColumn get seasonNumber => integer().nullable()();
  TextColumn get episodeId => text().nullable().references(Episodes, #id)();
  DateTimeColumn get watchedAt => dateTime()();

  /// Rewatch cycle number, starting at 1.
  IntColumn get cycle => integer().withDefault(const Constant(1))();
  TextColumn get eventType => text()();

  @override
  List<String> get customConstraints => [
        "CHECK (event_type IN ('watched', 'started', 'completed'))",
      ];
}

@DataClassName('RatingRow')
class UserRatings extends Table with SyncColumns {
  TextColumn get mediaId => text().references(Media, #id)();

  /// 0.5 to 10 in steps of 0.5.
  RealColumn get rating => real()();
  DateTimeColumn get ratedAt => dateTime()();

  @override
  List<String> get customConstraints => [
        'CHECK (rating >= 0.5 AND rating <= 10.0)',
      ];
}

@DataClassName('NoteRow')
class UserNotes extends Table with SyncColumns {
  TextColumn get mediaId => text().references(Media, #id)();
  TextColumn get episodeId => text().nullable().references(Episodes, #id)();
  TextColumn get body => text()();
}

@DataClassName('WatchlistRow')
class WatchlistItems extends Table with SyncColumns {
  TextColumn get mediaId => text().references(Media, #id)();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  DateTimeColumn get addedAt => dateTime()();
}

@DataClassName('FavoriteRow')
class Favorites extends Table with SyncColumns {
  TextColumn get mediaId => text().references(Media, #id)();
  DateTimeColumn get favoritedAt => dateTime()();
}

@DataClassName('CollectionRow')
class CustomCollections extends Table with SyncColumns {
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get coverKind => text().withDefault(const Constant('none'))();
  TextColumn get coverMediaId => text().nullable().references(Media, #id)();
  TextColumn get coverLocalPath => text().nullable()();
  TextColumn get coverStoragePath => text().nullable()();

  /// Fractional-index key for conflict-free ordering.
  TextColumn get sortKey => text()();
}

@DataClassName('CollectionItemRow')
class CollectionItems extends Table with SyncColumns {
  TextColumn get collectionId => text().references(CustomCollections, #id)();
  TextColumn get mediaId => text().references(Media, #id)();
  TextColumn get positionKey => text()();
  DateTimeColumn get addedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {collectionId, mediaId},
      ];
}

@DataClassName('ReminderRow')
class Reminders extends Table with SyncColumns {
  TextColumn get kind => text()();
  TextColumn get mediaId => text().nullable().references(Media, #id)();
  TextColumn get title => text()();
  TextColumn get body => text().nullable()();
  DateTimeColumn get scheduledAt => dateTime()();
  TextColumn get timezone => text()();
  TextColumn get repeatRule => text().nullable()();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();

  /// Integer id used with the local notification plugin.
  IntColumn get notificationId => integer()();

  @override
  List<String> get customConstraints => [
        "CHECK (kind IN ('viewing', 'watchlist', 'continue', 'release'))",
      ];
}

/// Only non-derived events. Viewing dates come from watch_history.
@DataClassName('CalendarEventRow')
class CalendarEvents extends Table with SyncColumns {
  TextColumn get mediaId => text().nullable().references(Media, #id)();
  TextColumn get kind => text()();
  DateTimeColumn get eventDate => dateTime()();
  TextColumn get title => text().nullable()();

  @override
  List<String> get customConstraints => [
        "CHECK (kind IN ('release', 'custom'))",
      ];
}