import 'package:drift/drift.dart';

/// Global catalog. Rows from TMDB/Jikan are re-fetchable and never synced.
/// Rows with `is_manual = 1` are user-owned and sync as `custom_media`.
@DataClassName('MediaRow')
class Media extends Table {
  TextColumn get id => text()();

  /// 'tmdb' | 'jikan' | 'manual'
  TextColumn get provider => text()();
  TextColumn get providerId => text()();
  TextColumn get mediaType => text()();
  TextColumn get animeFormat => text().nullable()();
  TextColumn get title => text()();
  TextColumn get originalTitle => text().nullable()();
  TextColumn get overview => text().nullable()();
  TextColumn get tagline => text().nullable()();
  DateTimeColumn get releaseDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get status => text().nullable()();
  IntColumn get runtimeMinutes => integer().nullable()();
  TextColumn get originalLanguage => text().nullable()();

  /// JSON array of country codes.
  TextColumn get originCountries => text().withDefault(const Constant('[]'))();
  TextColumn get posterPath => text().nullable()();
  TextColumn get backdropPath => text().nullable()();
  RealColumn get externalRating => real().nullable()();
  IntColumn get externalVoteCount => integer().nullable()();
  IntColumn get seasonCount => integer().nullable()();
  IntColumn get episodeCount => integer().nullable()();
  TextColumn get animeSeason => text().nullable()();
  IntColumn get animeSeasonYear => integer().nullable()();
  TextColumn get metadataLanguage => text().withDefault(const Constant('en'))();
  DateTimeColumn get metadataFetchedAt => dateTime().nullable()();
  BoolColumn get isManual => boolean().withDefault(const Constant(false))();

  // Sync-related; only meaningful when is_manual = 1.
  TextColumn get ownerUserId => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  IntColumn get baseRevision => integer().withDefault(const Constant(0))();
  TextColumn get deviceId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {provider, providerId, mediaType},
      ];

  @override
  List<String> get customConstraints => [
        "CHECK (media_type IN ('movie', 'tv', 'anime'))",
      ];
}

@DataClassName('AlternativeTitleRow')
class AlternativeTitles extends Table {
  TextColumn get id => text()();
  TextColumn get mediaId => text().references(Media, #id)();
  TextColumn get title => text()();
  TextColumn get language => text().nullable()();
  TextColumn get kind => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('GenreRow')
class Genres extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get provider => text()();
  TextColumn get providerGenreId => text()();
  TextColumn get name => text()();
  TextColumn get language => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {provider, providerGenreId, language},
      ];
}

@DataClassName('MediaGenreRow')
class MediaGenres extends Table {
  TextColumn get mediaId => text().references(Media, #id)();
  IntColumn get genreId => integer().references(Genres, #id)();

  @override
  Set<Column> get primaryKey => {mediaId, genreId};
}

@DataClassName('PersonRow')
class People extends Table {
  TextColumn get id => text()();
  TextColumn get provider => text()();
  TextColumn get providerId => text()();
  TextColumn get name => text()();
  TextColumn get profilePath => text().nullable()();
  TextColumn get knownForDepartment => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {provider, providerId},
      ];
}

@DataClassName('MediaCreditRow')
class MediaCredits extends Table {
  TextColumn get id => text()();
  TextColumn get mediaId => text().references(Media, #id)();
  TextColumn get personId => text().references(People, #id)();

  /// 'cast' | 'crew'
  TextColumn get creditType => text()();
  TextColumn get character => text().nullable()();
  TextColumn get job => text().nullable()();
  TextColumn get department => text().nullable()();
  IntColumn get orderIndex => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
        "CHECK (credit_type IN ('cast', 'crew'))",
      ];
}

@DataClassName('SeasonRow')
class Seasons extends Table {
  TextColumn get id => text()();
  TextColumn get mediaId => text().references(Media, #id)();
  IntColumn get seasonNumber => integer()();
  TextColumn get providerId => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get overview => text().nullable()();
  DateTimeColumn get airDate => dateTime().nullable()();
  IntColumn get episodeCount => integer().withDefault(const Constant(0))();
  TextColumn get posterPath => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {mediaId, seasonNumber},
      ];
}

@DataClassName('EpisodeRow')
class Episodes extends Table {
  TextColumn get id => text()();
  TextColumn get mediaId => text().references(Media, #id)();
  TextColumn get seasonId => text().nullable().references(Seasons, #id)();

  /// Anime entries without seasons use season 1.
  IntColumn get seasonNumber => integer().withDefault(const Constant(1))();
  IntColumn get episodeNumber => integer()();
  IntColumn get absoluteNumber => integer().nullable()();
  TextColumn get providerId => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get overview => text().nullable()();
  DateTimeColumn get airDate => dateTime().nullable()();
  IntColumn get runtimeMinutes => integer().nullable()();
  TextColumn get stillPath => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {mediaId, seasonNumber, episodeNumber},
      ];
}