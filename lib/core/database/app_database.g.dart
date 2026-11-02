// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSettingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _settingKeyMeta = const VerificationMeta(
    'settingKey',
  );
  @override
  late final GeneratedColumn<String> settingKey = GeneratedColumn<String>(
    'setting_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _settingValueMeta = const VerificationMeta(
    'settingValue',
  );
  @override
  late final GeneratedColumn<String> settingValue = GeneratedColumn<String>(
    'setting_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [settingKey, settingValue, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSettingRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('setting_key')) {
      context.handle(
        _settingKeyMeta,
        settingKey.isAcceptableOrUnknown(data['setting_key']!, _settingKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_settingKeyMeta);
    }
    if (data.containsKey('setting_value')) {
      context.handle(
        _settingValueMeta,
        settingValue.isAcceptableOrUnknown(
          data['setting_value']!,
          _settingValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_settingValueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {settingKey};
  @override
  AppSettingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingRow(
      settingKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}setting_key'],
      )!,
      settingValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}setting_value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSettingRow extends DataClass implements Insertable<AppSettingRow> {
  final String settingKey;
  final String settingValue;

  /// Stored as UTC.
  final DateTime updatedAt;
  const AppSettingRow({
    required this.settingKey,
    required this.settingValue,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['setting_key'] = Variable<String>(settingKey);
    map['setting_value'] = Variable<String>(settingValue);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      settingKey: Value(settingKey),
      settingValue: Value(settingValue),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSettingRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingRow(
      settingKey: serializer.fromJson<String>(json['settingKey']),
      settingValue: serializer.fromJson<String>(json['settingValue']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'settingKey': serializer.toJson<String>(settingKey),
      'settingValue': serializer.toJson<String>(settingValue),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSettingRow copyWith({
    String? settingKey,
    String? settingValue,
    DateTime? updatedAt,
  }) => AppSettingRow(
    settingKey: settingKey ?? this.settingKey,
    settingValue: settingValue ?? this.settingValue,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AppSettingRow copyWithCompanion(AppSettingsCompanion data) {
    return AppSettingRow(
      settingKey: data.settingKey.present
          ? data.settingKey.value
          : this.settingKey,
      settingValue: data.settingValue.present
          ? data.settingValue.value
          : this.settingValue,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingRow(')
          ..write('settingKey: $settingKey, ')
          ..write('settingValue: $settingValue, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(settingKey, settingValue, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingRow &&
          other.settingKey == this.settingKey &&
          other.settingValue == this.settingValue &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSettingRow> {
  final Value<String> settingKey;
  final Value<String> settingValue;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.settingKey = const Value.absent(),
    this.settingValue = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String settingKey,
    required String settingValue,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : settingKey = Value(settingKey),
       settingValue = Value(settingValue),
       updatedAt = Value(updatedAt);
  static Insertable<AppSettingRow> custom({
    Expression<String>? settingKey,
    Expression<String>? settingValue,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (settingKey != null) 'setting_key': settingKey,
      if (settingValue != null) 'setting_value': settingValue,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? settingKey,
    Value<String>? settingValue,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      settingKey: settingKey ?? this.settingKey,
      settingValue: settingValue ?? this.settingValue,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (settingKey.present) {
      map['setting_key'] = Variable<String>(settingKey.value);
    }
    if (settingValue.present) {
      map['setting_value'] = Variable<String>(settingValue.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('settingKey: $settingKey, ')
          ..write('settingValue: $settingValue, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaTable extends Media with TableInfo<$MediaTable, MediaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerMeta = const VerificationMeta(
    'provider',
  );
  @override
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
    'provider',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerIdMeta = const VerificationMeta(
    'providerId',
  );
  @override
  late final GeneratedColumn<String> providerId = GeneratedColumn<String>(
    'provider_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediaTypeMeta = const VerificationMeta(
    'mediaType',
  );
  @override
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
    'media_type',
    aliasedName,
    false,
    check: () => mediaType.isIn(const ['movie', 'tv', 'anime']),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _animeFormatMeta = const VerificationMeta(
    'animeFormat',
  );
  @override
  late final GeneratedColumn<String> animeFormat = GeneratedColumn<String>(
    'anime_format',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalTitleMeta = const VerificationMeta(
    'originalTitle',
  );
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
    'original_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _overviewMeta = const VerificationMeta(
    'overview',
  );
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
    'overview',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taglineMeta = const VerificationMeta(
    'tagline',
  );
  @override
  late final GeneratedColumn<String> tagline = GeneratedColumn<String>(
    'tagline',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _releaseDateMeta = const VerificationMeta(
    'releaseDate',
  );
  @override
  late final GeneratedColumn<DateTime> releaseDate = GeneratedColumn<DateTime>(
    'release_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _runtimeMinutesMeta = const VerificationMeta(
    'runtimeMinutes',
  );
  @override
  late final GeneratedColumn<int> runtimeMinutes = GeneratedColumn<int>(
    'runtime_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalLanguageMeta = const VerificationMeta(
    'originalLanguage',
  );
  @override
  late final GeneratedColumn<String> originalLanguage = GeneratedColumn<String>(
    'original_language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originCountriesMeta = const VerificationMeta(
    'originCountries',
  );
  @override
  late final GeneratedColumn<String> originCountries = GeneratedColumn<String>(
    'origin_countries',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _posterPathMeta = const VerificationMeta(
    'posterPath',
  );
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
    'poster_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _backdropPathMeta = const VerificationMeta(
    'backdropPath',
  );
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
    'backdrop_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _externalRatingMeta = const VerificationMeta(
    'externalRating',
  );
  @override
  late final GeneratedColumn<double> externalRating = GeneratedColumn<double>(
    'external_rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _externalVoteCountMeta = const VerificationMeta(
    'externalVoteCount',
  );
  @override
  late final GeneratedColumn<int> externalVoteCount = GeneratedColumn<int>(
    'external_vote_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seasonCountMeta = const VerificationMeta(
    'seasonCount',
  );
  @override
  late final GeneratedColumn<int> seasonCount = GeneratedColumn<int>(
    'season_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _episodeCountMeta = const VerificationMeta(
    'episodeCount',
  );
  @override
  late final GeneratedColumn<int> episodeCount = GeneratedColumn<int>(
    'episode_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _animeSeasonMeta = const VerificationMeta(
    'animeSeason',
  );
  @override
  late final GeneratedColumn<String> animeSeason = GeneratedColumn<String>(
    'anime_season',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _animeSeasonYearMeta = const VerificationMeta(
    'animeSeasonYear',
  );
  @override
  late final GeneratedColumn<int> animeSeasonYear = GeneratedColumn<int>(
    'anime_season_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metadataLanguageMeta = const VerificationMeta(
    'metadataLanguage',
  );
  @override
  late final GeneratedColumn<String> metadataLanguage = GeneratedColumn<String>(
    'metadata_language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('en'),
  );
  static const VerificationMeta _metadataFetchedAtMeta = const VerificationMeta(
    'metadataFetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> metadataFetchedAt =
      GeneratedColumn<DateTime>(
        'metadata_fetched_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isManualMeta = const VerificationMeta(
    'isManual',
  );
  @override
  late final GeneratedColumn<bool> isManual = GeneratedColumn<bool>(
    'is_manual',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_manual" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    provider,
    providerId,
    mediaType,
    animeFormat,
    title,
    originalTitle,
    overview,
    tagline,
    releaseDate,
    endDate,
    status,
    runtimeMinutes,
    originalLanguage,
    originCountries,
    posterPath,
    backdropPath,
    externalRating,
    externalVoteCount,
    seasonCount,
    episodeCount,
    animeSeason,
    animeSeasonYear,
    metadataLanguage,
    metadataFetchedAt,
    isManual,
    ownerUserId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media';
  @override
  VerificationContext validateIntegrity(
    Insertable<MediaRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('provider')) {
      context.handle(
        _providerMeta,
        provider.isAcceptableOrUnknown(data['provider']!, _providerMeta),
      );
    } else if (isInserting) {
      context.missing(_providerMeta);
    }
    if (data.containsKey('provider_id')) {
      context.handle(
        _providerIdMeta,
        providerId.isAcceptableOrUnknown(data['provider_id']!, _providerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_providerIdMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(
        _mediaTypeMeta,
        mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaTypeMeta);
    }
    if (data.containsKey('anime_format')) {
      context.handle(
        _animeFormatMeta,
        animeFormat.isAcceptableOrUnknown(
          data['anime_format']!,
          _animeFormatMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('original_title')) {
      context.handle(
        _originalTitleMeta,
        originalTitle.isAcceptableOrUnknown(
          data['original_title']!,
          _originalTitleMeta,
        ),
      );
    }
    if (data.containsKey('overview')) {
      context.handle(
        _overviewMeta,
        overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta),
      );
    }
    if (data.containsKey('tagline')) {
      context.handle(
        _taglineMeta,
        tagline.isAcceptableOrUnknown(data['tagline']!, _taglineMeta),
      );
    }
    if (data.containsKey('release_date')) {
      context.handle(
        _releaseDateMeta,
        releaseDate.isAcceptableOrUnknown(
          data['release_date']!,
          _releaseDateMeta,
        ),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('runtime_minutes')) {
      context.handle(
        _runtimeMinutesMeta,
        runtimeMinutes.isAcceptableOrUnknown(
          data['runtime_minutes']!,
          _runtimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('original_language')) {
      context.handle(
        _originalLanguageMeta,
        originalLanguage.isAcceptableOrUnknown(
          data['original_language']!,
          _originalLanguageMeta,
        ),
      );
    }
    if (data.containsKey('origin_countries')) {
      context.handle(
        _originCountriesMeta,
        originCountries.isAcceptableOrUnknown(
          data['origin_countries']!,
          _originCountriesMeta,
        ),
      );
    }
    if (data.containsKey('poster_path')) {
      context.handle(
        _posterPathMeta,
        posterPath.isAcceptableOrUnknown(data['poster_path']!, _posterPathMeta),
      );
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
        _backdropPathMeta,
        backdropPath.isAcceptableOrUnknown(
          data['backdrop_path']!,
          _backdropPathMeta,
        ),
      );
    }
    if (data.containsKey('external_rating')) {
      context.handle(
        _externalRatingMeta,
        externalRating.isAcceptableOrUnknown(
          data['external_rating']!,
          _externalRatingMeta,
        ),
      );
    }
    if (data.containsKey('external_vote_count')) {
      context.handle(
        _externalVoteCountMeta,
        externalVoteCount.isAcceptableOrUnknown(
          data['external_vote_count']!,
          _externalVoteCountMeta,
        ),
      );
    }
    if (data.containsKey('season_count')) {
      context.handle(
        _seasonCountMeta,
        seasonCount.isAcceptableOrUnknown(
          data['season_count']!,
          _seasonCountMeta,
        ),
      );
    }
    if (data.containsKey('episode_count')) {
      context.handle(
        _episodeCountMeta,
        episodeCount.isAcceptableOrUnknown(
          data['episode_count']!,
          _episodeCountMeta,
        ),
      );
    }
    if (data.containsKey('anime_season')) {
      context.handle(
        _animeSeasonMeta,
        animeSeason.isAcceptableOrUnknown(
          data['anime_season']!,
          _animeSeasonMeta,
        ),
      );
    }
    if (data.containsKey('anime_season_year')) {
      context.handle(
        _animeSeasonYearMeta,
        animeSeasonYear.isAcceptableOrUnknown(
          data['anime_season_year']!,
          _animeSeasonYearMeta,
        ),
      );
    }
    if (data.containsKey('metadata_language')) {
      context.handle(
        _metadataLanguageMeta,
        metadataLanguage.isAcceptableOrUnknown(
          data['metadata_language']!,
          _metadataLanguageMeta,
        ),
      );
    }
    if (data.containsKey('metadata_fetched_at')) {
      context.handle(
        _metadataFetchedAtMeta,
        metadataFetchedAt.isAcceptableOrUnknown(
          data['metadata_fetched_at']!,
          _metadataFetchedAtMeta,
        ),
      );
    }
    if (data.containsKey('is_manual')) {
      context.handle(
        _isManualMeta,
        isManual.isAcceptableOrUnknown(data['is_manual']!, _isManualMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {provider, providerId, mediaType},
  ];
  @override
  MediaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      provider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider'],
      )!,
      providerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_id'],
      )!,
      mediaType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_type'],
      )!,
      animeFormat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}anime_format'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      originalTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_title'],
      ),
      overview: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}overview'],
      ),
      tagline: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagline'],
      ),
      releaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}release_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      runtimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}runtime_minutes'],
      ),
      originalLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_language'],
      ),
      originCountries: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin_countries'],
      )!,
      posterPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poster_path'],
      ),
      backdropPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backdrop_path'],
      ),
      externalRating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}external_rating'],
      ),
      externalVoteCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}external_vote_count'],
      ),
      seasonCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}season_count'],
      ),
      episodeCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_count'],
      ),
      animeSeason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}anime_season'],
      ),
      animeSeasonYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}anime_season_year'],
      ),
      metadataLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata_language'],
      )!,
      metadataFetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}metadata_fetched_at'],
      ),
      isManual: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_manual'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
    );
  }

  @override
  $MediaTable createAlias(String alias) {
    return $MediaTable(attachedDatabase, alias);
  }
}

class MediaRow extends DataClass implements Insertable<MediaRow> {
  final String id;

  /// 'tmdb' | 'jikan' | 'manual'
  final String provider;
  final String providerId;
  final String mediaType;
  final String? animeFormat;
  final String title;
  final String? originalTitle;
  final String? overview;
  final String? tagline;
  final DateTime? releaseDate;
  final DateTime? endDate;
  final String? status;
  final int? runtimeMinutes;
  final String? originalLanguage;

  /// JSON array of country codes.
  final String originCountries;
  final String? posterPath;
  final String? backdropPath;
  final double? externalRating;
  final int? externalVoteCount;
  final int? seasonCount;
  final int? episodeCount;
  final String? animeSeason;
  final int? animeSeasonYear;
  final String metadataLanguage;
  final DateTime? metadataFetchedAt;
  final bool isManual;
  final String? ownerUserId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String? deviceId;
  const MediaRow({
    required this.id,
    required this.provider,
    required this.providerId,
    required this.mediaType,
    this.animeFormat,
    required this.title,
    this.originalTitle,
    this.overview,
    this.tagline,
    this.releaseDate,
    this.endDate,
    this.status,
    this.runtimeMinutes,
    this.originalLanguage,
    required this.originCountries,
    this.posterPath,
    this.backdropPath,
    this.externalRating,
    this.externalVoteCount,
    this.seasonCount,
    this.episodeCount,
    this.animeSeason,
    this.animeSeasonYear,
    required this.metadataLanguage,
    this.metadataFetchedAt,
    required this.isManual,
    this.ownerUserId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    this.deviceId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['provider'] = Variable<String>(provider);
    map['provider_id'] = Variable<String>(providerId);
    map['media_type'] = Variable<String>(mediaType);
    if (!nullToAbsent || animeFormat != null) {
      map['anime_format'] = Variable<String>(animeFormat);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || originalTitle != null) {
      map['original_title'] = Variable<String>(originalTitle);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || tagline != null) {
      map['tagline'] = Variable<String>(tagline);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<DateTime>(releaseDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || runtimeMinutes != null) {
      map['runtime_minutes'] = Variable<int>(runtimeMinutes);
    }
    if (!nullToAbsent || originalLanguage != null) {
      map['original_language'] = Variable<String>(originalLanguage);
    }
    map['origin_countries'] = Variable<String>(originCountries);
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || externalRating != null) {
      map['external_rating'] = Variable<double>(externalRating);
    }
    if (!nullToAbsent || externalVoteCount != null) {
      map['external_vote_count'] = Variable<int>(externalVoteCount);
    }
    if (!nullToAbsent || seasonCount != null) {
      map['season_count'] = Variable<int>(seasonCount);
    }
    if (!nullToAbsent || episodeCount != null) {
      map['episode_count'] = Variable<int>(episodeCount);
    }
    if (!nullToAbsent || animeSeason != null) {
      map['anime_season'] = Variable<String>(animeSeason);
    }
    if (!nullToAbsent || animeSeasonYear != null) {
      map['anime_season_year'] = Variable<int>(animeSeasonYear);
    }
    map['metadata_language'] = Variable<String>(metadataLanguage);
    if (!nullToAbsent || metadataFetchedAt != null) {
      map['metadata_fetched_at'] = Variable<DateTime>(metadataFetchedAt);
    }
    map['is_manual'] = Variable<bool>(isManual);
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    return map;
  }

  MediaCompanion toCompanion(bool nullToAbsent) {
    return MediaCompanion(
      id: Value(id),
      provider: Value(provider),
      providerId: Value(providerId),
      mediaType: Value(mediaType),
      animeFormat: animeFormat == null && nullToAbsent
          ? const Value.absent()
          : Value(animeFormat),
      title: Value(title),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      tagline: tagline == null && nullToAbsent
          ? const Value.absent()
          : Value(tagline),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      runtimeMinutes: runtimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(runtimeMinutes),
      originalLanguage: originalLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(originalLanguage),
      originCountries: Value(originCountries),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      externalRating: externalRating == null && nullToAbsent
          ? const Value.absent()
          : Value(externalRating),
      externalVoteCount: externalVoteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(externalVoteCount),
      seasonCount: seasonCount == null && nullToAbsent
          ? const Value.absent()
          : Value(seasonCount),
      episodeCount: episodeCount == null && nullToAbsent
          ? const Value.absent()
          : Value(episodeCount),
      animeSeason: animeSeason == null && nullToAbsent
          ? const Value.absent()
          : Value(animeSeason),
      animeSeasonYear: animeSeasonYear == null && nullToAbsent
          ? const Value.absent()
          : Value(animeSeasonYear),
      metadataLanguage: Value(metadataLanguage),
      metadataFetchedAt: metadataFetchedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(metadataFetchedAt),
      isManual: Value(isManual),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
    );
  }

  factory MediaRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaRow(
      id: serializer.fromJson<String>(json['id']),
      provider: serializer.fromJson<String>(json['provider']),
      providerId: serializer.fromJson<String>(json['providerId']),
      mediaType: serializer.fromJson<String>(json['mediaType']),
      animeFormat: serializer.fromJson<String?>(json['animeFormat']),
      title: serializer.fromJson<String>(json['title']),
      originalTitle: serializer.fromJson<String?>(json['originalTitle']),
      overview: serializer.fromJson<String?>(json['overview']),
      tagline: serializer.fromJson<String?>(json['tagline']),
      releaseDate: serializer.fromJson<DateTime?>(json['releaseDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      status: serializer.fromJson<String?>(json['status']),
      runtimeMinutes: serializer.fromJson<int?>(json['runtimeMinutes']),
      originalLanguage: serializer.fromJson<String?>(json['originalLanguage']),
      originCountries: serializer.fromJson<String>(json['originCountries']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      externalRating: serializer.fromJson<double?>(json['externalRating']),
      externalVoteCount: serializer.fromJson<int?>(json['externalVoteCount']),
      seasonCount: serializer.fromJson<int?>(json['seasonCount']),
      episodeCount: serializer.fromJson<int?>(json['episodeCount']),
      animeSeason: serializer.fromJson<String?>(json['animeSeason']),
      animeSeasonYear: serializer.fromJson<int?>(json['animeSeasonYear']),
      metadataLanguage: serializer.fromJson<String>(json['metadataLanguage']),
      metadataFetchedAt: serializer.fromJson<DateTime?>(
        json['metadataFetchedAt'],
      ),
      isManual: serializer.fromJson<bool>(json['isManual']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'provider': serializer.toJson<String>(provider),
      'providerId': serializer.toJson<String>(providerId),
      'mediaType': serializer.toJson<String>(mediaType),
      'animeFormat': serializer.toJson<String?>(animeFormat),
      'title': serializer.toJson<String>(title),
      'originalTitle': serializer.toJson<String?>(originalTitle),
      'overview': serializer.toJson<String?>(overview),
      'tagline': serializer.toJson<String?>(tagline),
      'releaseDate': serializer.toJson<DateTime?>(releaseDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'status': serializer.toJson<String?>(status),
      'runtimeMinutes': serializer.toJson<int?>(runtimeMinutes),
      'originalLanguage': serializer.toJson<String?>(originalLanguage),
      'originCountries': serializer.toJson<String>(originCountries),
      'posterPath': serializer.toJson<String?>(posterPath),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'externalRating': serializer.toJson<double?>(externalRating),
      'externalVoteCount': serializer.toJson<int?>(externalVoteCount),
      'seasonCount': serializer.toJson<int?>(seasonCount),
      'episodeCount': serializer.toJson<int?>(episodeCount),
      'animeSeason': serializer.toJson<String?>(animeSeason),
      'animeSeasonYear': serializer.toJson<int?>(animeSeasonYear),
      'metadataLanguage': serializer.toJson<String>(metadataLanguage),
      'metadataFetchedAt': serializer.toJson<DateTime?>(metadataFetchedAt),
      'isManual': serializer.toJson<bool>(isManual),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String?>(deviceId),
    };
  }

  MediaRow copyWith({
    String? id,
    String? provider,
    String? providerId,
    String? mediaType,
    Value<String?> animeFormat = const Value.absent(),
    String? title,
    Value<String?> originalTitle = const Value.absent(),
    Value<String?> overview = const Value.absent(),
    Value<String?> tagline = const Value.absent(),
    Value<DateTime?> releaseDate = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<int?> runtimeMinutes = const Value.absent(),
    Value<String?> originalLanguage = const Value.absent(),
    String? originCountries,
    Value<String?> posterPath = const Value.absent(),
    Value<String?> backdropPath = const Value.absent(),
    Value<double?> externalRating = const Value.absent(),
    Value<int?> externalVoteCount = const Value.absent(),
    Value<int?> seasonCount = const Value.absent(),
    Value<int?> episodeCount = const Value.absent(),
    Value<String?> animeSeason = const Value.absent(),
    Value<int?> animeSeasonYear = const Value.absent(),
    String? metadataLanguage,
    Value<DateTime?> metadataFetchedAt = const Value.absent(),
    bool? isManual,
    Value<String?> ownerUserId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    Value<String?> deviceId = const Value.absent(),
  }) => MediaRow(
    id: id ?? this.id,
    provider: provider ?? this.provider,
    providerId: providerId ?? this.providerId,
    mediaType: mediaType ?? this.mediaType,
    animeFormat: animeFormat.present ? animeFormat.value : this.animeFormat,
    title: title ?? this.title,
    originalTitle: originalTitle.present
        ? originalTitle.value
        : this.originalTitle,
    overview: overview.present ? overview.value : this.overview,
    tagline: tagline.present ? tagline.value : this.tagline,
    releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    status: status.present ? status.value : this.status,
    runtimeMinutes: runtimeMinutes.present
        ? runtimeMinutes.value
        : this.runtimeMinutes,
    originalLanguage: originalLanguage.present
        ? originalLanguage.value
        : this.originalLanguage,
    originCountries: originCountries ?? this.originCountries,
    posterPath: posterPath.present ? posterPath.value : this.posterPath,
    backdropPath: backdropPath.present ? backdropPath.value : this.backdropPath,
    externalRating: externalRating.present
        ? externalRating.value
        : this.externalRating,
    externalVoteCount: externalVoteCount.present
        ? externalVoteCount.value
        : this.externalVoteCount,
    seasonCount: seasonCount.present ? seasonCount.value : this.seasonCount,
    episodeCount: episodeCount.present ? episodeCount.value : this.episodeCount,
    animeSeason: animeSeason.present ? animeSeason.value : this.animeSeason,
    animeSeasonYear: animeSeasonYear.present
        ? animeSeasonYear.value
        : this.animeSeasonYear,
    metadataLanguage: metadataLanguage ?? this.metadataLanguage,
    metadataFetchedAt: metadataFetchedAt.present
        ? metadataFetchedAt.value
        : this.metadataFetchedAt,
    isManual: isManual ?? this.isManual,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
  );
  MediaRow copyWithCompanion(MediaCompanion data) {
    return MediaRow(
      id: data.id.present ? data.id.value : this.id,
      provider: data.provider.present ? data.provider.value : this.provider,
      providerId: data.providerId.present
          ? data.providerId.value
          : this.providerId,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      animeFormat: data.animeFormat.present
          ? data.animeFormat.value
          : this.animeFormat,
      title: data.title.present ? data.title.value : this.title,
      originalTitle: data.originalTitle.present
          ? data.originalTitle.value
          : this.originalTitle,
      overview: data.overview.present ? data.overview.value : this.overview,
      tagline: data.tagline.present ? data.tagline.value : this.tagline,
      releaseDate: data.releaseDate.present
          ? data.releaseDate.value
          : this.releaseDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      status: data.status.present ? data.status.value : this.status,
      runtimeMinutes: data.runtimeMinutes.present
          ? data.runtimeMinutes.value
          : this.runtimeMinutes,
      originalLanguage: data.originalLanguage.present
          ? data.originalLanguage.value
          : this.originalLanguage,
      originCountries: data.originCountries.present
          ? data.originCountries.value
          : this.originCountries,
      posterPath: data.posterPath.present
          ? data.posterPath.value
          : this.posterPath,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      externalRating: data.externalRating.present
          ? data.externalRating.value
          : this.externalRating,
      externalVoteCount: data.externalVoteCount.present
          ? data.externalVoteCount.value
          : this.externalVoteCount,
      seasonCount: data.seasonCount.present
          ? data.seasonCount.value
          : this.seasonCount,
      episodeCount: data.episodeCount.present
          ? data.episodeCount.value
          : this.episodeCount,
      animeSeason: data.animeSeason.present
          ? data.animeSeason.value
          : this.animeSeason,
      animeSeasonYear: data.animeSeasonYear.present
          ? data.animeSeasonYear.value
          : this.animeSeasonYear,
      metadataLanguage: data.metadataLanguage.present
          ? data.metadataLanguage.value
          : this.metadataLanguage,
      metadataFetchedAt: data.metadataFetchedAt.present
          ? data.metadataFetchedAt.value
          : this.metadataFetchedAt,
      isManual: data.isManual.present ? data.isManual.value : this.isManual,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaRow(')
          ..write('id: $id, ')
          ..write('provider: $provider, ')
          ..write('providerId: $providerId, ')
          ..write('mediaType: $mediaType, ')
          ..write('animeFormat: $animeFormat, ')
          ..write('title: $title, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('tagline: $tagline, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('runtimeMinutes: $runtimeMinutes, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originCountries: $originCountries, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('externalRating: $externalRating, ')
          ..write('externalVoteCount: $externalVoteCount, ')
          ..write('seasonCount: $seasonCount, ')
          ..write('episodeCount: $episodeCount, ')
          ..write('animeSeason: $animeSeason, ')
          ..write('animeSeasonYear: $animeSeasonYear, ')
          ..write('metadataLanguage: $metadataLanguage, ')
          ..write('metadataFetchedAt: $metadataFetchedAt, ')
          ..write('isManual: $isManual, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    provider,
    providerId,
    mediaType,
    animeFormat,
    title,
    originalTitle,
    overview,
    tagline,
    releaseDate,
    endDate,
    status,
    runtimeMinutes,
    originalLanguage,
    originCountries,
    posterPath,
    backdropPath,
    externalRating,
    externalVoteCount,
    seasonCount,
    episodeCount,
    animeSeason,
    animeSeasonYear,
    metadataLanguage,
    metadataFetchedAt,
    isManual,
    ownerUserId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaRow &&
          other.id == this.id &&
          other.provider == this.provider &&
          other.providerId == this.providerId &&
          other.mediaType == this.mediaType &&
          other.animeFormat == this.animeFormat &&
          other.title == this.title &&
          other.originalTitle == this.originalTitle &&
          other.overview == this.overview &&
          other.tagline == this.tagline &&
          other.releaseDate == this.releaseDate &&
          other.endDate == this.endDate &&
          other.status == this.status &&
          other.runtimeMinutes == this.runtimeMinutes &&
          other.originalLanguage == this.originalLanguage &&
          other.originCountries == this.originCountries &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.externalRating == this.externalRating &&
          other.externalVoteCount == this.externalVoteCount &&
          other.seasonCount == this.seasonCount &&
          other.episodeCount == this.episodeCount &&
          other.animeSeason == this.animeSeason &&
          other.animeSeasonYear == this.animeSeasonYear &&
          other.metadataLanguage == this.metadataLanguage &&
          other.metadataFetchedAt == this.metadataFetchedAt &&
          other.isManual == this.isManual &&
          other.ownerUserId == this.ownerUserId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId);
}

class MediaCompanion extends UpdateCompanion<MediaRow> {
  final Value<String> id;
  final Value<String> provider;
  final Value<String> providerId;
  final Value<String> mediaType;
  final Value<String?> animeFormat;
  final Value<String> title;
  final Value<String?> originalTitle;
  final Value<String?> overview;
  final Value<String?> tagline;
  final Value<DateTime?> releaseDate;
  final Value<DateTime?> endDate;
  final Value<String?> status;
  final Value<int?> runtimeMinutes;
  final Value<String?> originalLanguage;
  final Value<String> originCountries;
  final Value<String?> posterPath;
  final Value<String?> backdropPath;
  final Value<double?> externalRating;
  final Value<int?> externalVoteCount;
  final Value<int?> seasonCount;
  final Value<int?> episodeCount;
  final Value<String?> animeSeason;
  final Value<int?> animeSeasonYear;
  final Value<String> metadataLanguage;
  final Value<DateTime?> metadataFetchedAt;
  final Value<bool> isManual;
  final Value<String?> ownerUserId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String?> deviceId;
  final Value<int> rowid;
  const MediaCompanion({
    this.id = const Value.absent(),
    this.provider = const Value.absent(),
    this.providerId = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.animeFormat = const Value.absent(),
    this.title = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.tagline = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.runtimeMinutes = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originCountries = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.externalRating = const Value.absent(),
    this.externalVoteCount = const Value.absent(),
    this.seasonCount = const Value.absent(),
    this.episodeCount = const Value.absent(),
    this.animeSeason = const Value.absent(),
    this.animeSeasonYear = const Value.absent(),
    this.metadataLanguage = const Value.absent(),
    this.metadataFetchedAt = const Value.absent(),
    this.isManual = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaCompanion.insert({
    required String id,
    required String provider,
    required String providerId,
    required String mediaType,
    this.animeFormat = const Value.absent(),
    required String title,
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.tagline = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.runtimeMinutes = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originCountries = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.externalRating = const Value.absent(),
    this.externalVoteCount = const Value.absent(),
    this.seasonCount = const Value.absent(),
    this.episodeCount = const Value.absent(),
    this.animeSeason = const Value.absent(),
    this.animeSeasonYear = const Value.absent(),
    this.metadataLanguage = const Value.absent(),
    this.metadataFetchedAt = const Value.absent(),
    this.isManual = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       provider = Value(provider),
       providerId = Value(providerId),
       mediaType = Value(mediaType),
       title = Value(title),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MediaRow> custom({
    Expression<String>? id,
    Expression<String>? provider,
    Expression<String>? providerId,
    Expression<String>? mediaType,
    Expression<String>? animeFormat,
    Expression<String>? title,
    Expression<String>? originalTitle,
    Expression<String>? overview,
    Expression<String>? tagline,
    Expression<DateTime>? releaseDate,
    Expression<DateTime>? endDate,
    Expression<String>? status,
    Expression<int>? runtimeMinutes,
    Expression<String>? originalLanguage,
    Expression<String>? originCountries,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<double>? externalRating,
    Expression<int>? externalVoteCount,
    Expression<int>? seasonCount,
    Expression<int>? episodeCount,
    Expression<String>? animeSeason,
    Expression<int>? animeSeasonYear,
    Expression<String>? metadataLanguage,
    Expression<DateTime>? metadataFetchedAt,
    Expression<bool>? isManual,
    Expression<String>? ownerUserId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (provider != null) 'provider': provider,
      if (providerId != null) 'provider_id': providerId,
      if (mediaType != null) 'media_type': mediaType,
      if (animeFormat != null) 'anime_format': animeFormat,
      if (title != null) 'title': title,
      if (originalTitle != null) 'original_title': originalTitle,
      if (overview != null) 'overview': overview,
      if (tagline != null) 'tagline': tagline,
      if (releaseDate != null) 'release_date': releaseDate,
      if (endDate != null) 'end_date': endDate,
      if (status != null) 'status': status,
      if (runtimeMinutes != null) 'runtime_minutes': runtimeMinutes,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (originCountries != null) 'origin_countries': originCountries,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (externalRating != null) 'external_rating': externalRating,
      if (externalVoteCount != null) 'external_vote_count': externalVoteCount,
      if (seasonCount != null) 'season_count': seasonCount,
      if (episodeCount != null) 'episode_count': episodeCount,
      if (animeSeason != null) 'anime_season': animeSeason,
      if (animeSeasonYear != null) 'anime_season_year': animeSeasonYear,
      if (metadataLanguage != null) 'metadata_language': metadataLanguage,
      if (metadataFetchedAt != null) 'metadata_fetched_at': metadataFetchedAt,
      if (isManual != null) 'is_manual': isManual,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaCompanion copyWith({
    Value<String>? id,
    Value<String>? provider,
    Value<String>? providerId,
    Value<String>? mediaType,
    Value<String?>? animeFormat,
    Value<String>? title,
    Value<String?>? originalTitle,
    Value<String?>? overview,
    Value<String?>? tagline,
    Value<DateTime?>? releaseDate,
    Value<DateTime?>? endDate,
    Value<String?>? status,
    Value<int?>? runtimeMinutes,
    Value<String?>? originalLanguage,
    Value<String>? originCountries,
    Value<String?>? posterPath,
    Value<String?>? backdropPath,
    Value<double?>? externalRating,
    Value<int?>? externalVoteCount,
    Value<int?>? seasonCount,
    Value<int?>? episodeCount,
    Value<String?>? animeSeason,
    Value<int?>? animeSeasonYear,
    Value<String>? metadataLanguage,
    Value<DateTime?>? metadataFetchedAt,
    Value<bool>? isManual,
    Value<String?>? ownerUserId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String?>? deviceId,
    Value<int>? rowid,
  }) {
    return MediaCompanion(
      id: id ?? this.id,
      provider: provider ?? this.provider,
      providerId: providerId ?? this.providerId,
      mediaType: mediaType ?? this.mediaType,
      animeFormat: animeFormat ?? this.animeFormat,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      tagline: tagline ?? this.tagline,
      releaseDate: releaseDate ?? this.releaseDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      runtimeMinutes: runtimeMinutes ?? this.runtimeMinutes,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originCountries: originCountries ?? this.originCountries,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      externalRating: externalRating ?? this.externalRating,
      externalVoteCount: externalVoteCount ?? this.externalVoteCount,
      seasonCount: seasonCount ?? this.seasonCount,
      episodeCount: episodeCount ?? this.episodeCount,
      animeSeason: animeSeason ?? this.animeSeason,
      animeSeasonYear: animeSeasonYear ?? this.animeSeasonYear,
      metadataLanguage: metadataLanguage ?? this.metadataLanguage,
      metadataFetchedAt: metadataFetchedAt ?? this.metadataFetchedAt,
      isManual: isManual ?? this.isManual,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (providerId.present) {
      map['provider_id'] = Variable<String>(providerId.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(mediaType.value);
    }
    if (animeFormat.present) {
      map['anime_format'] = Variable<String>(animeFormat.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (tagline.present) {
      map['tagline'] = Variable<String>(tagline.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<DateTime>(releaseDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (runtimeMinutes.present) {
      map['runtime_minutes'] = Variable<int>(runtimeMinutes.value);
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String>(originalLanguage.value);
    }
    if (originCountries.present) {
      map['origin_countries'] = Variable<String>(originCountries.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (externalRating.present) {
      map['external_rating'] = Variable<double>(externalRating.value);
    }
    if (externalVoteCount.present) {
      map['external_vote_count'] = Variable<int>(externalVoteCount.value);
    }
    if (seasonCount.present) {
      map['season_count'] = Variable<int>(seasonCount.value);
    }
    if (episodeCount.present) {
      map['episode_count'] = Variable<int>(episodeCount.value);
    }
    if (animeSeason.present) {
      map['anime_season'] = Variable<String>(animeSeason.value);
    }
    if (animeSeasonYear.present) {
      map['anime_season_year'] = Variable<int>(animeSeasonYear.value);
    }
    if (metadataLanguage.present) {
      map['metadata_language'] = Variable<String>(metadataLanguage.value);
    }
    if (metadataFetchedAt.present) {
      map['metadata_fetched_at'] = Variable<DateTime>(metadataFetchedAt.value);
    }
    if (isManual.present) {
      map['is_manual'] = Variable<bool>(isManual.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaCompanion(')
          ..write('id: $id, ')
          ..write('provider: $provider, ')
          ..write('providerId: $providerId, ')
          ..write('mediaType: $mediaType, ')
          ..write('animeFormat: $animeFormat, ')
          ..write('title: $title, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('tagline: $tagline, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('runtimeMinutes: $runtimeMinutes, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originCountries: $originCountries, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('externalRating: $externalRating, ')
          ..write('externalVoteCount: $externalVoteCount, ')
          ..write('seasonCount: $seasonCount, ')
          ..write('episodeCount: $episodeCount, ')
          ..write('animeSeason: $animeSeason, ')
          ..write('animeSeasonYear: $animeSeasonYear, ')
          ..write('metadataLanguage: $metadataLanguage, ')
          ..write('metadataFetchedAt: $metadataFetchedAt, ')
          ..write('isManual: $isManual, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AlternativeTitlesTable extends AlternativeTitles
    with TableInfo<$AlternativeTitlesTable, AlternativeTitleRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlternativeTitlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, mediaId, title, language, kind];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alternative_titles';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlternativeTitleRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AlternativeTitleRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlternativeTitleRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      ),
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      ),
    );
  }

  @override
  $AlternativeTitlesTable createAlias(String alias) {
    return $AlternativeTitlesTable(attachedDatabase, alias);
  }
}

class AlternativeTitleRow extends DataClass
    implements Insertable<AlternativeTitleRow> {
  final String id;
  final String mediaId;
  final String title;
  final String? language;
  final String? kind;
  const AlternativeTitleRow({
    required this.id,
    required this.mediaId,
    required this.title,
    this.language,
    this.kind,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['media_id'] = Variable<String>(mediaId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || kind != null) {
      map['kind'] = Variable<String>(kind);
    }
    return map;
  }

  AlternativeTitlesCompanion toCompanion(bool nullToAbsent) {
    return AlternativeTitlesCompanion(
      id: Value(id),
      mediaId: Value(mediaId),
      title: Value(title),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      kind: kind == null && nullToAbsent ? const Value.absent() : Value(kind),
    );
  }

  factory AlternativeTitleRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlternativeTitleRow(
      id: serializer.fromJson<String>(json['id']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      title: serializer.fromJson<String>(json['title']),
      language: serializer.fromJson<String?>(json['language']),
      kind: serializer.fromJson<String?>(json['kind']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mediaId': serializer.toJson<String>(mediaId),
      'title': serializer.toJson<String>(title),
      'language': serializer.toJson<String?>(language),
      'kind': serializer.toJson<String?>(kind),
    };
  }

  AlternativeTitleRow copyWith({
    String? id,
    String? mediaId,
    String? title,
    Value<String?> language = const Value.absent(),
    Value<String?> kind = const Value.absent(),
  }) => AlternativeTitleRow(
    id: id ?? this.id,
    mediaId: mediaId ?? this.mediaId,
    title: title ?? this.title,
    language: language.present ? language.value : this.language,
    kind: kind.present ? kind.value : this.kind,
  );
  AlternativeTitleRow copyWithCompanion(AlternativeTitlesCompanion data) {
    return AlternativeTitleRow(
      id: data.id.present ? data.id.value : this.id,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      title: data.title.present ? data.title.value : this.title,
      language: data.language.present ? data.language.value : this.language,
      kind: data.kind.present ? data.kind.value : this.kind,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlternativeTitleRow(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('title: $title, ')
          ..write('language: $language, ')
          ..write('kind: $kind')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mediaId, title, language, kind);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlternativeTitleRow &&
          other.id == this.id &&
          other.mediaId == this.mediaId &&
          other.title == this.title &&
          other.language == this.language &&
          other.kind == this.kind);
}

class AlternativeTitlesCompanion extends UpdateCompanion<AlternativeTitleRow> {
  final Value<String> id;
  final Value<String> mediaId;
  final Value<String> title;
  final Value<String?> language;
  final Value<String?> kind;
  final Value<int> rowid;
  const AlternativeTitlesCompanion({
    this.id = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.title = const Value.absent(),
    this.language = const Value.absent(),
    this.kind = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlternativeTitlesCompanion.insert({
    required String id,
    required String mediaId,
    required String title,
    this.language = const Value.absent(),
    this.kind = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mediaId = Value(mediaId),
       title = Value(title);
  static Insertable<AlternativeTitleRow> custom({
    Expression<String>? id,
    Expression<String>? mediaId,
    Expression<String>? title,
    Expression<String>? language,
    Expression<String>? kind,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mediaId != null) 'media_id': mediaId,
      if (title != null) 'title': title,
      if (language != null) 'language': language,
      if (kind != null) 'kind': kind,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlternativeTitlesCompanion copyWith({
    Value<String>? id,
    Value<String>? mediaId,
    Value<String>? title,
    Value<String?>? language,
    Value<String?>? kind,
    Value<int>? rowid,
  }) {
    return AlternativeTitlesCompanion(
      id: id ?? this.id,
      mediaId: mediaId ?? this.mediaId,
      title: title ?? this.title,
      language: language ?? this.language,
      kind: kind ?? this.kind,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlternativeTitlesCompanion(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('title: $title, ')
          ..write('language: $language, ')
          ..write('kind: $kind, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GenresTable extends Genres with TableInfo<$GenresTable, GenreRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _providerMeta = const VerificationMeta(
    'provider',
  );
  @override
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
    'provider',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerGenreIdMeta = const VerificationMeta(
    'providerGenreId',
  );
  @override
  late final GeneratedColumn<String> providerGenreId = GeneratedColumn<String>(
    'provider_genre_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    provider,
    providerGenreId,
    name,
    language,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'genres';
  @override
  VerificationContext validateIntegrity(
    Insertable<GenreRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('provider')) {
      context.handle(
        _providerMeta,
        provider.isAcceptableOrUnknown(data['provider']!, _providerMeta),
      );
    } else if (isInserting) {
      context.missing(_providerMeta);
    }
    if (data.containsKey('provider_genre_id')) {
      context.handle(
        _providerGenreIdMeta,
        providerGenreId.isAcceptableOrUnknown(
          data['provider_genre_id']!,
          _providerGenreIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_providerGenreIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {provider, providerGenreId, language},
  ];
  @override
  GenreRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GenreRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      provider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider'],
      )!,
      providerGenreId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_genre_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
    );
  }

  @override
  $GenresTable createAlias(String alias) {
    return $GenresTable(attachedDatabase, alias);
  }
}

class GenreRow extends DataClass implements Insertable<GenreRow> {
  final int id;
  final String provider;
  final String providerGenreId;
  final String name;
  final String language;
  const GenreRow({
    required this.id,
    required this.provider,
    required this.providerGenreId,
    required this.name,
    required this.language,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['provider'] = Variable<String>(provider);
    map['provider_genre_id'] = Variable<String>(providerGenreId);
    map['name'] = Variable<String>(name);
    map['language'] = Variable<String>(language);
    return map;
  }

  GenresCompanion toCompanion(bool nullToAbsent) {
    return GenresCompanion(
      id: Value(id),
      provider: Value(provider),
      providerGenreId: Value(providerGenreId),
      name: Value(name),
      language: Value(language),
    );
  }

  factory GenreRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GenreRow(
      id: serializer.fromJson<int>(json['id']),
      provider: serializer.fromJson<String>(json['provider']),
      providerGenreId: serializer.fromJson<String>(json['providerGenreId']),
      name: serializer.fromJson<String>(json['name']),
      language: serializer.fromJson<String>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'provider': serializer.toJson<String>(provider),
      'providerGenreId': serializer.toJson<String>(providerGenreId),
      'name': serializer.toJson<String>(name),
      'language': serializer.toJson<String>(language),
    };
  }

  GenreRow copyWith({
    int? id,
    String? provider,
    String? providerGenreId,
    String? name,
    String? language,
  }) => GenreRow(
    id: id ?? this.id,
    provider: provider ?? this.provider,
    providerGenreId: providerGenreId ?? this.providerGenreId,
    name: name ?? this.name,
    language: language ?? this.language,
  );
  GenreRow copyWithCompanion(GenresCompanion data) {
    return GenreRow(
      id: data.id.present ? data.id.value : this.id,
      provider: data.provider.present ? data.provider.value : this.provider,
      providerGenreId: data.providerGenreId.present
          ? data.providerGenreId.value
          : this.providerGenreId,
      name: data.name.present ? data.name.value : this.name,
      language: data.language.present ? data.language.value : this.language,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GenreRow(')
          ..write('id: $id, ')
          ..write('provider: $provider, ')
          ..write('providerGenreId: $providerGenreId, ')
          ..write('name: $name, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, provider, providerGenreId, name, language);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenreRow &&
          other.id == this.id &&
          other.provider == this.provider &&
          other.providerGenreId == this.providerGenreId &&
          other.name == this.name &&
          other.language == this.language);
}

class GenresCompanion extends UpdateCompanion<GenreRow> {
  final Value<int> id;
  final Value<String> provider;
  final Value<String> providerGenreId;
  final Value<String> name;
  final Value<String> language;
  const GenresCompanion({
    this.id = const Value.absent(),
    this.provider = const Value.absent(),
    this.providerGenreId = const Value.absent(),
    this.name = const Value.absent(),
    this.language = const Value.absent(),
  });
  GenresCompanion.insert({
    this.id = const Value.absent(),
    required String provider,
    required String providerGenreId,
    required String name,
    required String language,
  }) : provider = Value(provider),
       providerGenreId = Value(providerGenreId),
       name = Value(name),
       language = Value(language);
  static Insertable<GenreRow> custom({
    Expression<int>? id,
    Expression<String>? provider,
    Expression<String>? providerGenreId,
    Expression<String>? name,
    Expression<String>? language,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (provider != null) 'provider': provider,
      if (providerGenreId != null) 'provider_genre_id': providerGenreId,
      if (name != null) 'name': name,
      if (language != null) 'language': language,
    });
  }

  GenresCompanion copyWith({
    Value<int>? id,
    Value<String>? provider,
    Value<String>? providerGenreId,
    Value<String>? name,
    Value<String>? language,
  }) {
    return GenresCompanion(
      id: id ?? this.id,
      provider: provider ?? this.provider,
      providerGenreId: providerGenreId ?? this.providerGenreId,
      name: name ?? this.name,
      language: language ?? this.language,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (providerGenreId.present) {
      map['provider_genre_id'] = Variable<String>(providerGenreId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresCompanion(')
          ..write('id: $id, ')
          ..write('provider: $provider, ')
          ..write('providerGenreId: $providerGenreId, ')
          ..write('name: $name, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }
}

class $MediaGenresTable extends MediaGenres
    with TableInfo<$MediaGenresTable, MediaGenreRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaGenresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _genreIdMeta = const VerificationMeta(
    'genreId',
  );
  @override
  late final GeneratedColumn<int> genreId = GeneratedColumn<int>(
    'genre_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES genres (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [mediaId, genreId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_genres';
  @override
  VerificationContext validateIntegrity(
    Insertable<MediaGenreRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('genre_id')) {
      context.handle(
        _genreIdMeta,
        genreId.isAcceptableOrUnknown(data['genre_id']!, _genreIdMeta),
      );
    } else if (isInserting) {
      context.missing(_genreIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mediaId, genreId};
  @override
  MediaGenreRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaGenreRow(
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      genreId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}genre_id'],
      )!,
    );
  }

  @override
  $MediaGenresTable createAlias(String alias) {
    return $MediaGenresTable(attachedDatabase, alias);
  }
}

class MediaGenreRow extends DataClass implements Insertable<MediaGenreRow> {
  final String mediaId;
  final int genreId;
  const MediaGenreRow({required this.mediaId, required this.genreId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['media_id'] = Variable<String>(mediaId);
    map['genre_id'] = Variable<int>(genreId);
    return map;
  }

  MediaGenresCompanion toCompanion(bool nullToAbsent) {
    return MediaGenresCompanion(
      mediaId: Value(mediaId),
      genreId: Value(genreId),
    );
  }

  factory MediaGenreRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaGenreRow(
      mediaId: serializer.fromJson<String>(json['mediaId']),
      genreId: serializer.fromJson<int>(json['genreId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mediaId': serializer.toJson<String>(mediaId),
      'genreId': serializer.toJson<int>(genreId),
    };
  }

  MediaGenreRow copyWith({String? mediaId, int? genreId}) => MediaGenreRow(
    mediaId: mediaId ?? this.mediaId,
    genreId: genreId ?? this.genreId,
  );
  MediaGenreRow copyWithCompanion(MediaGenresCompanion data) {
    return MediaGenreRow(
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      genreId: data.genreId.present ? data.genreId.value : this.genreId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaGenreRow(')
          ..write('mediaId: $mediaId, ')
          ..write('genreId: $genreId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mediaId, genreId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaGenreRow &&
          other.mediaId == this.mediaId &&
          other.genreId == this.genreId);
}

class MediaGenresCompanion extends UpdateCompanion<MediaGenreRow> {
  final Value<String> mediaId;
  final Value<int> genreId;
  final Value<int> rowid;
  const MediaGenresCompanion({
    this.mediaId = const Value.absent(),
    this.genreId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaGenresCompanion.insert({
    required String mediaId,
    required int genreId,
    this.rowid = const Value.absent(),
  }) : mediaId = Value(mediaId),
       genreId = Value(genreId);
  static Insertable<MediaGenreRow> custom({
    Expression<String>? mediaId,
    Expression<int>? genreId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mediaId != null) 'media_id': mediaId,
      if (genreId != null) 'genre_id': genreId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaGenresCompanion copyWith({
    Value<String>? mediaId,
    Value<int>? genreId,
    Value<int>? rowid,
  }) {
    return MediaGenresCompanion(
      mediaId: mediaId ?? this.mediaId,
      genreId: genreId ?? this.genreId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (genreId.present) {
      map['genre_id'] = Variable<int>(genreId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaGenresCompanion(')
          ..write('mediaId: $mediaId, ')
          ..write('genreId: $genreId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PeopleTable extends People with TableInfo<$PeopleTable, PersonRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PeopleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerMeta = const VerificationMeta(
    'provider',
  );
  @override
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
    'provider',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerIdMeta = const VerificationMeta(
    'providerId',
  );
  @override
  late final GeneratedColumn<String> providerId = GeneratedColumn<String>(
    'provider_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _profilePathMeta = const VerificationMeta(
    'profilePath',
  );
  @override
  late final GeneratedColumn<String> profilePath = GeneratedColumn<String>(
    'profile_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _knownForDepartmentMeta =
      const VerificationMeta('knownForDepartment');
  @override
  late final GeneratedColumn<String> knownForDepartment =
      GeneratedColumn<String>(
        'known_for_department',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    provider,
    providerId,
    name,
    profilePath,
    knownForDepartment,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'people';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('provider')) {
      context.handle(
        _providerMeta,
        provider.isAcceptableOrUnknown(data['provider']!, _providerMeta),
      );
    } else if (isInserting) {
      context.missing(_providerMeta);
    }
    if (data.containsKey('provider_id')) {
      context.handle(
        _providerIdMeta,
        providerId.isAcceptableOrUnknown(data['provider_id']!, _providerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_providerIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('profile_path')) {
      context.handle(
        _profilePathMeta,
        profilePath.isAcceptableOrUnknown(
          data['profile_path']!,
          _profilePathMeta,
        ),
      );
    }
    if (data.containsKey('known_for_department')) {
      context.handle(
        _knownForDepartmentMeta,
        knownForDepartment.isAcceptableOrUnknown(
          data['known_for_department']!,
          _knownForDepartmentMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {provider, providerId},
  ];
  @override
  PersonRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      provider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider'],
      )!,
      providerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      profilePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_path'],
      ),
      knownForDepartment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}known_for_department'],
      ),
    );
  }

  @override
  $PeopleTable createAlias(String alias) {
    return $PeopleTable(attachedDatabase, alias);
  }
}

class PersonRow extends DataClass implements Insertable<PersonRow> {
  final String id;
  final String provider;
  final String providerId;
  final String name;
  final String? profilePath;
  final String? knownForDepartment;
  const PersonRow({
    required this.id,
    required this.provider,
    required this.providerId,
    required this.name,
    this.profilePath,
    this.knownForDepartment,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['provider'] = Variable<String>(provider);
    map['provider_id'] = Variable<String>(providerId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || profilePath != null) {
      map['profile_path'] = Variable<String>(profilePath);
    }
    if (!nullToAbsent || knownForDepartment != null) {
      map['known_for_department'] = Variable<String>(knownForDepartment);
    }
    return map;
  }

  PeopleCompanion toCompanion(bool nullToAbsent) {
    return PeopleCompanion(
      id: Value(id),
      provider: Value(provider),
      providerId: Value(providerId),
      name: Value(name),
      profilePath: profilePath == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePath),
      knownForDepartment: knownForDepartment == null && nullToAbsent
          ? const Value.absent()
          : Value(knownForDepartment),
    );
  }

  factory PersonRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonRow(
      id: serializer.fromJson<String>(json['id']),
      provider: serializer.fromJson<String>(json['provider']),
      providerId: serializer.fromJson<String>(json['providerId']),
      name: serializer.fromJson<String>(json['name']),
      profilePath: serializer.fromJson<String?>(json['profilePath']),
      knownForDepartment: serializer.fromJson<String?>(
        json['knownForDepartment'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'provider': serializer.toJson<String>(provider),
      'providerId': serializer.toJson<String>(providerId),
      'name': serializer.toJson<String>(name),
      'profilePath': serializer.toJson<String?>(profilePath),
      'knownForDepartment': serializer.toJson<String?>(knownForDepartment),
    };
  }

  PersonRow copyWith({
    String? id,
    String? provider,
    String? providerId,
    String? name,
    Value<String?> profilePath = const Value.absent(),
    Value<String?> knownForDepartment = const Value.absent(),
  }) => PersonRow(
    id: id ?? this.id,
    provider: provider ?? this.provider,
    providerId: providerId ?? this.providerId,
    name: name ?? this.name,
    profilePath: profilePath.present ? profilePath.value : this.profilePath,
    knownForDepartment: knownForDepartment.present
        ? knownForDepartment.value
        : this.knownForDepartment,
  );
  PersonRow copyWithCompanion(PeopleCompanion data) {
    return PersonRow(
      id: data.id.present ? data.id.value : this.id,
      provider: data.provider.present ? data.provider.value : this.provider,
      providerId: data.providerId.present
          ? data.providerId.value
          : this.providerId,
      name: data.name.present ? data.name.value : this.name,
      profilePath: data.profilePath.present
          ? data.profilePath.value
          : this.profilePath,
      knownForDepartment: data.knownForDepartment.present
          ? data.knownForDepartment.value
          : this.knownForDepartment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonRow(')
          ..write('id: $id, ')
          ..write('provider: $provider, ')
          ..write('providerId: $providerId, ')
          ..write('name: $name, ')
          ..write('profilePath: $profilePath, ')
          ..write('knownForDepartment: $knownForDepartment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    provider,
    providerId,
    name,
    profilePath,
    knownForDepartment,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonRow &&
          other.id == this.id &&
          other.provider == this.provider &&
          other.providerId == this.providerId &&
          other.name == this.name &&
          other.profilePath == this.profilePath &&
          other.knownForDepartment == this.knownForDepartment);
}

class PeopleCompanion extends UpdateCompanion<PersonRow> {
  final Value<String> id;
  final Value<String> provider;
  final Value<String> providerId;
  final Value<String> name;
  final Value<String?> profilePath;
  final Value<String?> knownForDepartment;
  final Value<int> rowid;
  const PeopleCompanion({
    this.id = const Value.absent(),
    this.provider = const Value.absent(),
    this.providerId = const Value.absent(),
    this.name = const Value.absent(),
    this.profilePath = const Value.absent(),
    this.knownForDepartment = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PeopleCompanion.insert({
    required String id,
    required String provider,
    required String providerId,
    required String name,
    this.profilePath = const Value.absent(),
    this.knownForDepartment = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       provider = Value(provider),
       providerId = Value(providerId),
       name = Value(name);
  static Insertable<PersonRow> custom({
    Expression<String>? id,
    Expression<String>? provider,
    Expression<String>? providerId,
    Expression<String>? name,
    Expression<String>? profilePath,
    Expression<String>? knownForDepartment,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (provider != null) 'provider': provider,
      if (providerId != null) 'provider_id': providerId,
      if (name != null) 'name': name,
      if (profilePath != null) 'profile_path': profilePath,
      if (knownForDepartment != null)
        'known_for_department': knownForDepartment,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PeopleCompanion copyWith({
    Value<String>? id,
    Value<String>? provider,
    Value<String>? providerId,
    Value<String>? name,
    Value<String?>? profilePath,
    Value<String?>? knownForDepartment,
    Value<int>? rowid,
  }) {
    return PeopleCompanion(
      id: id ?? this.id,
      provider: provider ?? this.provider,
      providerId: providerId ?? this.providerId,
      name: name ?? this.name,
      profilePath: profilePath ?? this.profilePath,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (providerId.present) {
      map['provider_id'] = Variable<String>(providerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (profilePath.present) {
      map['profile_path'] = Variable<String>(profilePath.value);
    }
    if (knownForDepartment.present) {
      map['known_for_department'] = Variable<String>(knownForDepartment.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeopleCompanion(')
          ..write('id: $id, ')
          ..write('provider: $provider, ')
          ..write('providerId: $providerId, ')
          ..write('name: $name, ')
          ..write('profilePath: $profilePath, ')
          ..write('knownForDepartment: $knownForDepartment, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaCreditsTable extends MediaCredits
    with TableInfo<$MediaCreditsTable, MediaCreditRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaCreditsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES people (id)',
    ),
  );
  static const VerificationMeta _creditTypeMeta = const VerificationMeta(
    'creditType',
  );
  @override
  late final GeneratedColumn<String> creditType = GeneratedColumn<String>(
    'credit_type',
    aliasedName,
    false,
    check: () => creditType.isIn(const ['cast', 'crew']),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterMeta = const VerificationMeta(
    'character',
  );
  @override
  late final GeneratedColumn<String> character = GeneratedColumn<String>(
    'character',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobMeta = const VerificationMeta('job');
  @override
  late final GeneratedColumn<String> job = GeneratedColumn<String>(
    'job',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'department',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mediaId,
    personId,
    creditType,
    character,
    job,
    department,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_credits';
  @override
  VerificationContext validateIntegrity(
    Insertable<MediaCreditRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('credit_type')) {
      context.handle(
        _creditTypeMeta,
        creditType.isAcceptableOrUnknown(data['credit_type']!, _creditTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_creditTypeMeta);
    }
    if (data.containsKey('character')) {
      context.handle(
        _characterMeta,
        character.isAcceptableOrUnknown(data['character']!, _characterMeta),
      );
    }
    if (data.containsKey('job')) {
      context.handle(
        _jobMeta,
        job.isAcceptableOrUnknown(data['job']!, _jobMeta),
      );
    }
    if (data.containsKey('department')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['department']!, _departmentMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaCreditRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaCreditRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      creditType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}credit_type'],
      )!,
      character: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character'],
      ),
      job: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}job'],
      ),
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $MediaCreditsTable createAlias(String alias) {
    return $MediaCreditsTable(attachedDatabase, alias);
  }
}

class MediaCreditRow extends DataClass implements Insertable<MediaCreditRow> {
  final String id;
  final String mediaId;
  final String personId;

  /// 'cast' | 'crew'
  final String creditType;
  final String? character;
  final String? job;
  final String? department;
  final int orderIndex;
  const MediaCreditRow({
    required this.id,
    required this.mediaId,
    required this.personId,
    required this.creditType,
    this.character,
    this.job,
    this.department,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['media_id'] = Variable<String>(mediaId);
    map['person_id'] = Variable<String>(personId);
    map['credit_type'] = Variable<String>(creditType);
    if (!nullToAbsent || character != null) {
      map['character'] = Variable<String>(character);
    }
    if (!nullToAbsent || job != null) {
      map['job'] = Variable<String>(job);
    }
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  MediaCreditsCompanion toCompanion(bool nullToAbsent) {
    return MediaCreditsCompanion(
      id: Value(id),
      mediaId: Value(mediaId),
      personId: Value(personId),
      creditType: Value(creditType),
      character: character == null && nullToAbsent
          ? const Value.absent()
          : Value(character),
      job: job == null && nullToAbsent ? const Value.absent() : Value(job),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
      orderIndex: Value(orderIndex),
    );
  }

  factory MediaCreditRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaCreditRow(
      id: serializer.fromJson<String>(json['id']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      personId: serializer.fromJson<String>(json['personId']),
      creditType: serializer.fromJson<String>(json['creditType']),
      character: serializer.fromJson<String?>(json['character']),
      job: serializer.fromJson<String?>(json['job']),
      department: serializer.fromJson<String?>(json['department']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mediaId': serializer.toJson<String>(mediaId),
      'personId': serializer.toJson<String>(personId),
      'creditType': serializer.toJson<String>(creditType),
      'character': serializer.toJson<String?>(character),
      'job': serializer.toJson<String?>(job),
      'department': serializer.toJson<String?>(department),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  MediaCreditRow copyWith({
    String? id,
    String? mediaId,
    String? personId,
    String? creditType,
    Value<String?> character = const Value.absent(),
    Value<String?> job = const Value.absent(),
    Value<String?> department = const Value.absent(),
    int? orderIndex,
  }) => MediaCreditRow(
    id: id ?? this.id,
    mediaId: mediaId ?? this.mediaId,
    personId: personId ?? this.personId,
    creditType: creditType ?? this.creditType,
    character: character.present ? character.value : this.character,
    job: job.present ? job.value : this.job,
    department: department.present ? department.value : this.department,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  MediaCreditRow copyWithCompanion(MediaCreditsCompanion data) {
    return MediaCreditRow(
      id: data.id.present ? data.id.value : this.id,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      personId: data.personId.present ? data.personId.value : this.personId,
      creditType: data.creditType.present
          ? data.creditType.value
          : this.creditType,
      character: data.character.present ? data.character.value : this.character,
      job: data.job.present ? data.job.value : this.job,
      department: data.department.present
          ? data.department.value
          : this.department,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaCreditRow(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('personId: $personId, ')
          ..write('creditType: $creditType, ')
          ..write('character: $character, ')
          ..write('job: $job, ')
          ..write('department: $department, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    mediaId,
    personId,
    creditType,
    character,
    job,
    department,
    orderIndex,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaCreditRow &&
          other.id == this.id &&
          other.mediaId == this.mediaId &&
          other.personId == this.personId &&
          other.creditType == this.creditType &&
          other.character == this.character &&
          other.job == this.job &&
          other.department == this.department &&
          other.orderIndex == this.orderIndex);
}

class MediaCreditsCompanion extends UpdateCompanion<MediaCreditRow> {
  final Value<String> id;
  final Value<String> mediaId;
  final Value<String> personId;
  final Value<String> creditType;
  final Value<String?> character;
  final Value<String?> job;
  final Value<String?> department;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const MediaCreditsCompanion({
    this.id = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.personId = const Value.absent(),
    this.creditType = const Value.absent(),
    this.character = const Value.absent(),
    this.job = const Value.absent(),
    this.department = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaCreditsCompanion.insert({
    required String id,
    required String mediaId,
    required String personId,
    required String creditType,
    this.character = const Value.absent(),
    this.job = const Value.absent(),
    this.department = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mediaId = Value(mediaId),
       personId = Value(personId),
       creditType = Value(creditType);
  static Insertable<MediaCreditRow> custom({
    Expression<String>? id,
    Expression<String>? mediaId,
    Expression<String>? personId,
    Expression<String>? creditType,
    Expression<String>? character,
    Expression<String>? job,
    Expression<String>? department,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mediaId != null) 'media_id': mediaId,
      if (personId != null) 'person_id': personId,
      if (creditType != null) 'credit_type': creditType,
      if (character != null) 'character': character,
      if (job != null) 'job': job,
      if (department != null) 'department': department,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaCreditsCompanion copyWith({
    Value<String>? id,
    Value<String>? mediaId,
    Value<String>? personId,
    Value<String>? creditType,
    Value<String?>? character,
    Value<String?>? job,
    Value<String?>? department,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return MediaCreditsCompanion(
      id: id ?? this.id,
      mediaId: mediaId ?? this.mediaId,
      personId: personId ?? this.personId,
      creditType: creditType ?? this.creditType,
      character: character ?? this.character,
      job: job ?? this.job,
      department: department ?? this.department,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (creditType.present) {
      map['credit_type'] = Variable<String>(creditType.value);
    }
    if (character.present) {
      map['character'] = Variable<String>(character.value);
    }
    if (job.present) {
      map['job'] = Variable<String>(job.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaCreditsCompanion(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('personId: $personId, ')
          ..write('creditType: $creditType, ')
          ..write('character: $character, ')
          ..write('job: $job, ')
          ..write('department: $department, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SeasonsTable extends Seasons with TableInfo<$SeasonsTable, SeasonRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeasonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _seasonNumberMeta = const VerificationMeta(
    'seasonNumber',
  );
  @override
  late final GeneratedColumn<int> seasonNumber = GeneratedColumn<int>(
    'season_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerIdMeta = const VerificationMeta(
    'providerId',
  );
  @override
  late final GeneratedColumn<String> providerId = GeneratedColumn<String>(
    'provider_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _overviewMeta = const VerificationMeta(
    'overview',
  );
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
    'overview',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _airDateMeta = const VerificationMeta(
    'airDate',
  );
  @override
  late final GeneratedColumn<DateTime> airDate = GeneratedColumn<DateTime>(
    'air_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _episodeCountMeta = const VerificationMeta(
    'episodeCount',
  );
  @override
  late final GeneratedColumn<int> episodeCount = GeneratedColumn<int>(
    'episode_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _posterPathMeta = const VerificationMeta(
    'posterPath',
  );
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
    'poster_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mediaId,
    seasonNumber,
    providerId,
    name,
    overview,
    airDate,
    episodeCount,
    posterPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'seasons';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeasonRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('season_number')) {
      context.handle(
        _seasonNumberMeta,
        seasonNumber.isAcceptableOrUnknown(
          data['season_number']!,
          _seasonNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_seasonNumberMeta);
    }
    if (data.containsKey('provider_id')) {
      context.handle(
        _providerIdMeta,
        providerId.isAcceptableOrUnknown(data['provider_id']!, _providerIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('overview')) {
      context.handle(
        _overviewMeta,
        overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta),
      );
    }
    if (data.containsKey('air_date')) {
      context.handle(
        _airDateMeta,
        airDate.isAcceptableOrUnknown(data['air_date']!, _airDateMeta),
      );
    }
    if (data.containsKey('episode_count')) {
      context.handle(
        _episodeCountMeta,
        episodeCount.isAcceptableOrUnknown(
          data['episode_count']!,
          _episodeCountMeta,
        ),
      );
    }
    if (data.containsKey('poster_path')) {
      context.handle(
        _posterPathMeta,
        posterPath.isAcceptableOrUnknown(data['poster_path']!, _posterPathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {mediaId, seasonNumber},
  ];
  @override
  SeasonRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeasonRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      seasonNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}season_number'],
      )!,
      providerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      overview: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}overview'],
      ),
      airDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}air_date'],
      ),
      episodeCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_count'],
      )!,
      posterPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poster_path'],
      ),
    );
  }

  @override
  $SeasonsTable createAlias(String alias) {
    return $SeasonsTable(attachedDatabase, alias);
  }
}

class SeasonRow extends DataClass implements Insertable<SeasonRow> {
  final String id;
  final String mediaId;
  final int seasonNumber;
  final String? providerId;
  final String? name;
  final String? overview;
  final DateTime? airDate;
  final int episodeCount;
  final String? posterPath;
  const SeasonRow({
    required this.id,
    required this.mediaId,
    required this.seasonNumber,
    this.providerId,
    this.name,
    this.overview,
    this.airDate,
    required this.episodeCount,
    this.posterPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['media_id'] = Variable<String>(mediaId);
    map['season_number'] = Variable<int>(seasonNumber);
    if (!nullToAbsent || providerId != null) {
      map['provider_id'] = Variable<String>(providerId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || airDate != null) {
      map['air_date'] = Variable<DateTime>(airDate);
    }
    map['episode_count'] = Variable<int>(episodeCount);
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    return map;
  }

  SeasonsCompanion toCompanion(bool nullToAbsent) {
    return SeasonsCompanion(
      id: Value(id),
      mediaId: Value(mediaId),
      seasonNumber: Value(seasonNumber),
      providerId: providerId == null && nullToAbsent
          ? const Value.absent()
          : Value(providerId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      airDate: airDate == null && nullToAbsent
          ? const Value.absent()
          : Value(airDate),
      episodeCount: Value(episodeCount),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
    );
  }

  factory SeasonRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeasonRow(
      id: serializer.fromJson<String>(json['id']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      seasonNumber: serializer.fromJson<int>(json['seasonNumber']),
      providerId: serializer.fromJson<String?>(json['providerId']),
      name: serializer.fromJson<String?>(json['name']),
      overview: serializer.fromJson<String?>(json['overview']),
      airDate: serializer.fromJson<DateTime?>(json['airDate']),
      episodeCount: serializer.fromJson<int>(json['episodeCount']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mediaId': serializer.toJson<String>(mediaId),
      'seasonNumber': serializer.toJson<int>(seasonNumber),
      'providerId': serializer.toJson<String?>(providerId),
      'name': serializer.toJson<String?>(name),
      'overview': serializer.toJson<String?>(overview),
      'airDate': serializer.toJson<DateTime?>(airDate),
      'episodeCount': serializer.toJson<int>(episodeCount),
      'posterPath': serializer.toJson<String?>(posterPath),
    };
  }

  SeasonRow copyWith({
    String? id,
    String? mediaId,
    int? seasonNumber,
    Value<String?> providerId = const Value.absent(),
    Value<String?> name = const Value.absent(),
    Value<String?> overview = const Value.absent(),
    Value<DateTime?> airDate = const Value.absent(),
    int? episodeCount,
    Value<String?> posterPath = const Value.absent(),
  }) => SeasonRow(
    id: id ?? this.id,
    mediaId: mediaId ?? this.mediaId,
    seasonNumber: seasonNumber ?? this.seasonNumber,
    providerId: providerId.present ? providerId.value : this.providerId,
    name: name.present ? name.value : this.name,
    overview: overview.present ? overview.value : this.overview,
    airDate: airDate.present ? airDate.value : this.airDate,
    episodeCount: episodeCount ?? this.episodeCount,
    posterPath: posterPath.present ? posterPath.value : this.posterPath,
  );
  SeasonRow copyWithCompanion(SeasonsCompanion data) {
    return SeasonRow(
      id: data.id.present ? data.id.value : this.id,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      seasonNumber: data.seasonNumber.present
          ? data.seasonNumber.value
          : this.seasonNumber,
      providerId: data.providerId.present
          ? data.providerId.value
          : this.providerId,
      name: data.name.present ? data.name.value : this.name,
      overview: data.overview.present ? data.overview.value : this.overview,
      airDate: data.airDate.present ? data.airDate.value : this.airDate,
      episodeCount: data.episodeCount.present
          ? data.episodeCount.value
          : this.episodeCount,
      posterPath: data.posterPath.present
          ? data.posterPath.value
          : this.posterPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SeasonRow(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('seasonNumber: $seasonNumber, ')
          ..write('providerId: $providerId, ')
          ..write('name: $name, ')
          ..write('overview: $overview, ')
          ..write('airDate: $airDate, ')
          ..write('episodeCount: $episodeCount, ')
          ..write('posterPath: $posterPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    mediaId,
    seasonNumber,
    providerId,
    name,
    overview,
    airDate,
    episodeCount,
    posterPath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeasonRow &&
          other.id == this.id &&
          other.mediaId == this.mediaId &&
          other.seasonNumber == this.seasonNumber &&
          other.providerId == this.providerId &&
          other.name == this.name &&
          other.overview == this.overview &&
          other.airDate == this.airDate &&
          other.episodeCount == this.episodeCount &&
          other.posterPath == this.posterPath);
}

class SeasonsCompanion extends UpdateCompanion<SeasonRow> {
  final Value<String> id;
  final Value<String> mediaId;
  final Value<int> seasonNumber;
  final Value<String?> providerId;
  final Value<String?> name;
  final Value<String?> overview;
  final Value<DateTime?> airDate;
  final Value<int> episodeCount;
  final Value<String?> posterPath;
  final Value<int> rowid;
  const SeasonsCompanion({
    this.id = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.seasonNumber = const Value.absent(),
    this.providerId = const Value.absent(),
    this.name = const Value.absent(),
    this.overview = const Value.absent(),
    this.airDate = const Value.absent(),
    this.episodeCount = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SeasonsCompanion.insert({
    required String id,
    required String mediaId,
    required int seasonNumber,
    this.providerId = const Value.absent(),
    this.name = const Value.absent(),
    this.overview = const Value.absent(),
    this.airDate = const Value.absent(),
    this.episodeCount = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mediaId = Value(mediaId),
       seasonNumber = Value(seasonNumber);
  static Insertable<SeasonRow> custom({
    Expression<String>? id,
    Expression<String>? mediaId,
    Expression<int>? seasonNumber,
    Expression<String>? providerId,
    Expression<String>? name,
    Expression<String>? overview,
    Expression<DateTime>? airDate,
    Expression<int>? episodeCount,
    Expression<String>? posterPath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mediaId != null) 'media_id': mediaId,
      if (seasonNumber != null) 'season_number': seasonNumber,
      if (providerId != null) 'provider_id': providerId,
      if (name != null) 'name': name,
      if (overview != null) 'overview': overview,
      if (airDate != null) 'air_date': airDate,
      if (episodeCount != null) 'episode_count': episodeCount,
      if (posterPath != null) 'poster_path': posterPath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SeasonsCompanion copyWith({
    Value<String>? id,
    Value<String>? mediaId,
    Value<int>? seasonNumber,
    Value<String?>? providerId,
    Value<String?>? name,
    Value<String?>? overview,
    Value<DateTime?>? airDate,
    Value<int>? episodeCount,
    Value<String?>? posterPath,
    Value<int>? rowid,
  }) {
    return SeasonsCompanion(
      id: id ?? this.id,
      mediaId: mediaId ?? this.mediaId,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      providerId: providerId ?? this.providerId,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      airDate: airDate ?? this.airDate,
      episodeCount: episodeCount ?? this.episodeCount,
      posterPath: posterPath ?? this.posterPath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (seasonNumber.present) {
      map['season_number'] = Variable<int>(seasonNumber.value);
    }
    if (providerId.present) {
      map['provider_id'] = Variable<String>(providerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (airDate.present) {
      map['air_date'] = Variable<DateTime>(airDate.value);
    }
    if (episodeCount.present) {
      map['episode_count'] = Variable<int>(episodeCount.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeasonsCompanion(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('seasonNumber: $seasonNumber, ')
          ..write('providerId: $providerId, ')
          ..write('name: $name, ')
          ..write('overview: $overview, ')
          ..write('airDate: $airDate, ')
          ..write('episodeCount: $episodeCount, ')
          ..write('posterPath: $posterPath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EpisodesTable extends Episodes
    with TableInfo<$EpisodesTable, EpisodeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EpisodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _seasonIdMeta = const VerificationMeta(
    'seasonId',
  );
  @override
  late final GeneratedColumn<String> seasonId = GeneratedColumn<String>(
    'season_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES seasons (id)',
    ),
  );
  static const VerificationMeta _seasonNumberMeta = const VerificationMeta(
    'seasonNumber',
  );
  @override
  late final GeneratedColumn<int> seasonNumber = GeneratedColumn<int>(
    'season_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _episodeNumberMeta = const VerificationMeta(
    'episodeNumber',
  );
  @override
  late final GeneratedColumn<int> episodeNumber = GeneratedColumn<int>(
    'episode_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _absoluteNumberMeta = const VerificationMeta(
    'absoluteNumber',
  );
  @override
  late final GeneratedColumn<int> absoluteNumber = GeneratedColumn<int>(
    'absolute_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _providerIdMeta = const VerificationMeta(
    'providerId',
  );
  @override
  late final GeneratedColumn<String> providerId = GeneratedColumn<String>(
    'provider_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _overviewMeta = const VerificationMeta(
    'overview',
  );
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
    'overview',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _airDateMeta = const VerificationMeta(
    'airDate',
  );
  @override
  late final GeneratedColumn<DateTime> airDate = GeneratedColumn<DateTime>(
    'air_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _runtimeMinutesMeta = const VerificationMeta(
    'runtimeMinutes',
  );
  @override
  late final GeneratedColumn<int> runtimeMinutes = GeneratedColumn<int>(
    'runtime_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stillPathMeta = const VerificationMeta(
    'stillPath',
  );
  @override
  late final GeneratedColumn<String> stillPath = GeneratedColumn<String>(
    'still_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mediaId,
    seasonId,
    seasonNumber,
    episodeNumber,
    absoluteNumber,
    providerId,
    title,
    overview,
    airDate,
    runtimeMinutes,
    stillPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'episodes';
  @override
  VerificationContext validateIntegrity(
    Insertable<EpisodeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('season_id')) {
      context.handle(
        _seasonIdMeta,
        seasonId.isAcceptableOrUnknown(data['season_id']!, _seasonIdMeta),
      );
    }
    if (data.containsKey('season_number')) {
      context.handle(
        _seasonNumberMeta,
        seasonNumber.isAcceptableOrUnknown(
          data['season_number']!,
          _seasonNumberMeta,
        ),
      );
    }
    if (data.containsKey('episode_number')) {
      context.handle(
        _episodeNumberMeta,
        episodeNumber.isAcceptableOrUnknown(
          data['episode_number']!,
          _episodeNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_episodeNumberMeta);
    }
    if (data.containsKey('absolute_number')) {
      context.handle(
        _absoluteNumberMeta,
        absoluteNumber.isAcceptableOrUnknown(
          data['absolute_number']!,
          _absoluteNumberMeta,
        ),
      );
    }
    if (data.containsKey('provider_id')) {
      context.handle(
        _providerIdMeta,
        providerId.isAcceptableOrUnknown(data['provider_id']!, _providerIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('overview')) {
      context.handle(
        _overviewMeta,
        overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta),
      );
    }
    if (data.containsKey('air_date')) {
      context.handle(
        _airDateMeta,
        airDate.isAcceptableOrUnknown(data['air_date']!, _airDateMeta),
      );
    }
    if (data.containsKey('runtime_minutes')) {
      context.handle(
        _runtimeMinutesMeta,
        runtimeMinutes.isAcceptableOrUnknown(
          data['runtime_minutes']!,
          _runtimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('still_path')) {
      context.handle(
        _stillPathMeta,
        stillPath.isAcceptableOrUnknown(data['still_path']!, _stillPathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {mediaId, seasonNumber, episodeNumber},
  ];
  @override
  EpisodeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EpisodeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      seasonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}season_id'],
      ),
      seasonNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}season_number'],
      )!,
      episodeNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_number'],
      )!,
      absoluteNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}absolute_number'],
      ),
      providerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      overview: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}overview'],
      ),
      airDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}air_date'],
      ),
      runtimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}runtime_minutes'],
      ),
      stillPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}still_path'],
      ),
    );
  }

  @override
  $EpisodesTable createAlias(String alias) {
    return $EpisodesTable(attachedDatabase, alias);
  }
}

class EpisodeRow extends DataClass implements Insertable<EpisodeRow> {
  final String id;
  final String mediaId;
  final String? seasonId;

  /// Anime entries without seasons use season 1.
  final int seasonNumber;
  final int episodeNumber;
  final int? absoluteNumber;
  final String? providerId;
  final String? title;
  final String? overview;
  final DateTime? airDate;
  final int? runtimeMinutes;
  final String? stillPath;
  const EpisodeRow({
    required this.id,
    required this.mediaId,
    this.seasonId,
    required this.seasonNumber,
    required this.episodeNumber,
    this.absoluteNumber,
    this.providerId,
    this.title,
    this.overview,
    this.airDate,
    this.runtimeMinutes,
    this.stillPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['media_id'] = Variable<String>(mediaId);
    if (!nullToAbsent || seasonId != null) {
      map['season_id'] = Variable<String>(seasonId);
    }
    map['season_number'] = Variable<int>(seasonNumber);
    map['episode_number'] = Variable<int>(episodeNumber);
    if (!nullToAbsent || absoluteNumber != null) {
      map['absolute_number'] = Variable<int>(absoluteNumber);
    }
    if (!nullToAbsent || providerId != null) {
      map['provider_id'] = Variable<String>(providerId);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || airDate != null) {
      map['air_date'] = Variable<DateTime>(airDate);
    }
    if (!nullToAbsent || runtimeMinutes != null) {
      map['runtime_minutes'] = Variable<int>(runtimeMinutes);
    }
    if (!nullToAbsent || stillPath != null) {
      map['still_path'] = Variable<String>(stillPath);
    }
    return map;
  }

  EpisodesCompanion toCompanion(bool nullToAbsent) {
    return EpisodesCompanion(
      id: Value(id),
      mediaId: Value(mediaId),
      seasonId: seasonId == null && nullToAbsent
          ? const Value.absent()
          : Value(seasonId),
      seasonNumber: Value(seasonNumber),
      episodeNumber: Value(episodeNumber),
      absoluteNumber: absoluteNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(absoluteNumber),
      providerId: providerId == null && nullToAbsent
          ? const Value.absent()
          : Value(providerId),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      airDate: airDate == null && nullToAbsent
          ? const Value.absent()
          : Value(airDate),
      runtimeMinutes: runtimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(runtimeMinutes),
      stillPath: stillPath == null && nullToAbsent
          ? const Value.absent()
          : Value(stillPath),
    );
  }

  factory EpisodeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EpisodeRow(
      id: serializer.fromJson<String>(json['id']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      seasonId: serializer.fromJson<String?>(json['seasonId']),
      seasonNumber: serializer.fromJson<int>(json['seasonNumber']),
      episodeNumber: serializer.fromJson<int>(json['episodeNumber']),
      absoluteNumber: serializer.fromJson<int?>(json['absoluteNumber']),
      providerId: serializer.fromJson<String?>(json['providerId']),
      title: serializer.fromJson<String?>(json['title']),
      overview: serializer.fromJson<String?>(json['overview']),
      airDate: serializer.fromJson<DateTime?>(json['airDate']),
      runtimeMinutes: serializer.fromJson<int?>(json['runtimeMinutes']),
      stillPath: serializer.fromJson<String?>(json['stillPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mediaId': serializer.toJson<String>(mediaId),
      'seasonId': serializer.toJson<String?>(seasonId),
      'seasonNumber': serializer.toJson<int>(seasonNumber),
      'episodeNumber': serializer.toJson<int>(episodeNumber),
      'absoluteNumber': serializer.toJson<int?>(absoluteNumber),
      'providerId': serializer.toJson<String?>(providerId),
      'title': serializer.toJson<String?>(title),
      'overview': serializer.toJson<String?>(overview),
      'airDate': serializer.toJson<DateTime?>(airDate),
      'runtimeMinutes': serializer.toJson<int?>(runtimeMinutes),
      'stillPath': serializer.toJson<String?>(stillPath),
    };
  }

  EpisodeRow copyWith({
    String? id,
    String? mediaId,
    Value<String?> seasonId = const Value.absent(),
    int? seasonNumber,
    int? episodeNumber,
    Value<int?> absoluteNumber = const Value.absent(),
    Value<String?> providerId = const Value.absent(),
    Value<String?> title = const Value.absent(),
    Value<String?> overview = const Value.absent(),
    Value<DateTime?> airDate = const Value.absent(),
    Value<int?> runtimeMinutes = const Value.absent(),
    Value<String?> stillPath = const Value.absent(),
  }) => EpisodeRow(
    id: id ?? this.id,
    mediaId: mediaId ?? this.mediaId,
    seasonId: seasonId.present ? seasonId.value : this.seasonId,
    seasonNumber: seasonNumber ?? this.seasonNumber,
    episodeNumber: episodeNumber ?? this.episodeNumber,
    absoluteNumber: absoluteNumber.present
        ? absoluteNumber.value
        : this.absoluteNumber,
    providerId: providerId.present ? providerId.value : this.providerId,
    title: title.present ? title.value : this.title,
    overview: overview.present ? overview.value : this.overview,
    airDate: airDate.present ? airDate.value : this.airDate,
    runtimeMinutes: runtimeMinutes.present
        ? runtimeMinutes.value
        : this.runtimeMinutes,
    stillPath: stillPath.present ? stillPath.value : this.stillPath,
  );
  EpisodeRow copyWithCompanion(EpisodesCompanion data) {
    return EpisodeRow(
      id: data.id.present ? data.id.value : this.id,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      seasonId: data.seasonId.present ? data.seasonId.value : this.seasonId,
      seasonNumber: data.seasonNumber.present
          ? data.seasonNumber.value
          : this.seasonNumber,
      episodeNumber: data.episodeNumber.present
          ? data.episodeNumber.value
          : this.episodeNumber,
      absoluteNumber: data.absoluteNumber.present
          ? data.absoluteNumber.value
          : this.absoluteNumber,
      providerId: data.providerId.present
          ? data.providerId.value
          : this.providerId,
      title: data.title.present ? data.title.value : this.title,
      overview: data.overview.present ? data.overview.value : this.overview,
      airDate: data.airDate.present ? data.airDate.value : this.airDate,
      runtimeMinutes: data.runtimeMinutes.present
          ? data.runtimeMinutes.value
          : this.runtimeMinutes,
      stillPath: data.stillPath.present ? data.stillPath.value : this.stillPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EpisodeRow(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('seasonId: $seasonId, ')
          ..write('seasonNumber: $seasonNumber, ')
          ..write('episodeNumber: $episodeNumber, ')
          ..write('absoluteNumber: $absoluteNumber, ')
          ..write('providerId: $providerId, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('airDate: $airDate, ')
          ..write('runtimeMinutes: $runtimeMinutes, ')
          ..write('stillPath: $stillPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    mediaId,
    seasonId,
    seasonNumber,
    episodeNumber,
    absoluteNumber,
    providerId,
    title,
    overview,
    airDate,
    runtimeMinutes,
    stillPath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EpisodeRow &&
          other.id == this.id &&
          other.mediaId == this.mediaId &&
          other.seasonId == this.seasonId &&
          other.seasonNumber == this.seasonNumber &&
          other.episodeNumber == this.episodeNumber &&
          other.absoluteNumber == this.absoluteNumber &&
          other.providerId == this.providerId &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.airDate == this.airDate &&
          other.runtimeMinutes == this.runtimeMinutes &&
          other.stillPath == this.stillPath);
}

class EpisodesCompanion extends UpdateCompanion<EpisodeRow> {
  final Value<String> id;
  final Value<String> mediaId;
  final Value<String?> seasonId;
  final Value<int> seasonNumber;
  final Value<int> episodeNumber;
  final Value<int?> absoluteNumber;
  final Value<String?> providerId;
  final Value<String?> title;
  final Value<String?> overview;
  final Value<DateTime?> airDate;
  final Value<int?> runtimeMinutes;
  final Value<String?> stillPath;
  final Value<int> rowid;
  const EpisodesCompanion({
    this.id = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.seasonId = const Value.absent(),
    this.seasonNumber = const Value.absent(),
    this.episodeNumber = const Value.absent(),
    this.absoluteNumber = const Value.absent(),
    this.providerId = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.airDate = const Value.absent(),
    this.runtimeMinutes = const Value.absent(),
    this.stillPath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EpisodesCompanion.insert({
    required String id,
    required String mediaId,
    this.seasonId = const Value.absent(),
    this.seasonNumber = const Value.absent(),
    required int episodeNumber,
    this.absoluteNumber = const Value.absent(),
    this.providerId = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.airDate = const Value.absent(),
    this.runtimeMinutes = const Value.absent(),
    this.stillPath = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mediaId = Value(mediaId),
       episodeNumber = Value(episodeNumber);
  static Insertable<EpisodeRow> custom({
    Expression<String>? id,
    Expression<String>? mediaId,
    Expression<String>? seasonId,
    Expression<int>? seasonNumber,
    Expression<int>? episodeNumber,
    Expression<int>? absoluteNumber,
    Expression<String>? providerId,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<DateTime>? airDate,
    Expression<int>? runtimeMinutes,
    Expression<String>? stillPath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mediaId != null) 'media_id': mediaId,
      if (seasonId != null) 'season_id': seasonId,
      if (seasonNumber != null) 'season_number': seasonNumber,
      if (episodeNumber != null) 'episode_number': episodeNumber,
      if (absoluteNumber != null) 'absolute_number': absoluteNumber,
      if (providerId != null) 'provider_id': providerId,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (airDate != null) 'air_date': airDate,
      if (runtimeMinutes != null) 'runtime_minutes': runtimeMinutes,
      if (stillPath != null) 'still_path': stillPath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EpisodesCompanion copyWith({
    Value<String>? id,
    Value<String>? mediaId,
    Value<String?>? seasonId,
    Value<int>? seasonNumber,
    Value<int>? episodeNumber,
    Value<int?>? absoluteNumber,
    Value<String?>? providerId,
    Value<String?>? title,
    Value<String?>? overview,
    Value<DateTime?>? airDate,
    Value<int?>? runtimeMinutes,
    Value<String?>? stillPath,
    Value<int>? rowid,
  }) {
    return EpisodesCompanion(
      id: id ?? this.id,
      mediaId: mediaId ?? this.mediaId,
      seasonId: seasonId ?? this.seasonId,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      absoluteNumber: absoluteNumber ?? this.absoluteNumber,
      providerId: providerId ?? this.providerId,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      airDate: airDate ?? this.airDate,
      runtimeMinutes: runtimeMinutes ?? this.runtimeMinutes,
      stillPath: stillPath ?? this.stillPath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (seasonId.present) {
      map['season_id'] = Variable<String>(seasonId.value);
    }
    if (seasonNumber.present) {
      map['season_number'] = Variable<int>(seasonNumber.value);
    }
    if (episodeNumber.present) {
      map['episode_number'] = Variable<int>(episodeNumber.value);
    }
    if (absoluteNumber.present) {
      map['absolute_number'] = Variable<int>(absoluteNumber.value);
    }
    if (providerId.present) {
      map['provider_id'] = Variable<String>(providerId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (airDate.present) {
      map['air_date'] = Variable<DateTime>(airDate.value);
    }
    if (runtimeMinutes.present) {
      map['runtime_minutes'] = Variable<int>(runtimeMinutes.value);
    }
    if (stillPath.present) {
      map['still_path'] = Variable<String>(stillPath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EpisodesCompanion(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('seasonId: $seasonId, ')
          ..write('seasonNumber: $seasonNumber, ')
          ..write('episodeNumber: $episodeNumber, ')
          ..write('absoluteNumber: $absoluteNumber, ')
          ..write('providerId: $providerId, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('airDate: $airDate, ')
          ..write('runtimeMinutes: $runtimeMinutes, ')
          ..write('stillPath: $stillPath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserLibraryTable extends UserLibrary
    with TableInfo<$UserLibraryTable, LibraryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserLibraryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    check: () => status.isIn(const [
      'plan_to_watch',
      'watching',
      'completed',
      'on_hold',
      'dropped',
      'rewatching',
    ]),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rewatchCountMeta = const VerificationMeta(
    'rewatchCount',
  );
  @override
  late final GeneratedColumn<int> rewatchCount = GeneratedColumn<int>(
    'rewatch_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currentSeasonMeta = const VerificationMeta(
    'currentSeason',
  );
  @override
  late final GeneratedColumn<int> currentSeason = GeneratedColumn<int>(
    'current_season',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentEpisodeMeta = const VerificationMeta(
    'currentEpisode',
  );
  @override
  late final GeneratedColumn<int> currentEpisode = GeneratedColumn<int>(
    'current_episode',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    status,
    startedAt,
    completedAt,
    rewatchCount,
    currentSeason,
    currentEpisode,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_library';
  @override
  VerificationContext validateIntegrity(
    Insertable<LibraryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('rewatch_count')) {
      context.handle(
        _rewatchCountMeta,
        rewatchCount.isAcceptableOrUnknown(
          data['rewatch_count']!,
          _rewatchCountMeta,
        ),
      );
    }
    if (data.containsKey('current_season')) {
      context.handle(
        _currentSeasonMeta,
        currentSeason.isAcceptableOrUnknown(
          data['current_season']!,
          _currentSeasonMeta,
        ),
      );
    }
    if (data.containsKey('current_episode')) {
      context.handle(
        _currentEpisodeMeta,
        currentEpisode.isAcceptableOrUnknown(
          data['current_episode']!,
          _currentEpisodeMeta,
        ),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LibraryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LibraryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      rewatchCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rewatch_count'],
      )!,
      currentSeason: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_season'],
      ),
      currentEpisode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_episode'],
      ),
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $UserLibraryTable createAlias(String alias) {
    return $UserLibraryTable(attachedDatabase, alias);
  }
}

class LibraryRow extends DataClass implements Insertable<LibraryRow> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String deviceId;
  final DateTime? serverUpdatedAt;
  final String mediaId;
  final String status;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final int rewatchCount;

  /// Cached progress, derived from watch_history.
  final int? currentSeason;
  final int? currentEpisode;
  final DateTime addedAt;
  const LibraryRow({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    required this.deviceId,
    this.serverUpdatedAt,
    required this.mediaId,
    required this.status,
    this.startedAt,
    this.completedAt,
    required this.rewatchCount,
    this.currentSeason,
    this.currentEpisode,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['media_id'] = Variable<String>(mediaId);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['rewatch_count'] = Variable<int>(rewatchCount);
    if (!nullToAbsent || currentSeason != null) {
      map['current_season'] = Variable<int>(currentSeason);
    }
    if (!nullToAbsent || currentEpisode != null) {
      map['current_episode'] = Variable<int>(currentEpisode);
    }
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  UserLibraryCompanion toCompanion(bool nullToAbsent) {
    return UserLibraryCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: Value(deviceId),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      mediaId: Value(mediaId),
      status: Value(status),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      rewatchCount: Value(rewatchCount),
      currentSeason: currentSeason == null && nullToAbsent
          ? const Value.absent()
          : Value(currentSeason),
      currentEpisode: currentEpisode == null && nullToAbsent
          ? const Value.absent()
          : Value(currentEpisode),
      addedAt: Value(addedAt),
    );
  }

  factory LibraryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LibraryRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      status: serializer.fromJson<String>(json['status']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      rewatchCount: serializer.fromJson<int>(json['rewatchCount']),
      currentSeason: serializer.fromJson<int?>(json['currentSeason']),
      currentEpisode: serializer.fromJson<int?>(json['currentEpisode']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String>(deviceId),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'mediaId': serializer.toJson<String>(mediaId),
      'status': serializer.toJson<String>(status),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'rewatchCount': serializer.toJson<int>(rewatchCount),
      'currentSeason': serializer.toJson<int?>(currentSeason),
      'currentEpisode': serializer.toJson<int?>(currentEpisode),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  LibraryRow copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    String? deviceId,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    String? mediaId,
    String? status,
    Value<DateTime?> startedAt = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
    int? rewatchCount,
    Value<int?> currentSeason = const Value.absent(),
    Value<int?> currentEpisode = const Value.absent(),
    DateTime? addedAt,
  }) => LibraryRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId ?? this.deviceId,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    mediaId: mediaId ?? this.mediaId,
    status: status ?? this.status,
    startedAt: startedAt.present ? startedAt.value : this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    rewatchCount: rewatchCount ?? this.rewatchCount,
    currentSeason: currentSeason.present
        ? currentSeason.value
        : this.currentSeason,
    currentEpisode: currentEpisode.present
        ? currentEpisode.value
        : this.currentEpisode,
    addedAt: addedAt ?? this.addedAt,
  );
  LibraryRow copyWithCompanion(UserLibraryCompanion data) {
    return LibraryRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      status: data.status.present ? data.status.value : this.status,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      rewatchCount: data.rewatchCount.present
          ? data.rewatchCount.value
          : this.rewatchCount,
      currentSeason: data.currentSeason.present
          ? data.currentSeason.value
          : this.currentSeason,
      currentEpisode: data.currentEpisode.present
          ? data.currentEpisode.value
          : this.currentEpisode,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LibraryRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rewatchCount: $rewatchCount, ')
          ..write('currentSeason: $currentSeason, ')
          ..write('currentEpisode: $currentEpisode, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    status,
    startedAt,
    completedAt,
    rewatchCount,
    currentSeason,
    currentEpisode,
    addedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LibraryRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.mediaId == this.mediaId &&
          other.status == this.status &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.rewatchCount == this.rewatchCount &&
          other.currentSeason == this.currentSeason &&
          other.currentEpisode == this.currentEpisode &&
          other.addedAt == this.addedAt);
}

class UserLibraryCompanion extends UpdateCompanion<LibraryRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String> deviceId;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String> mediaId;
  final Value<String> status;
  final Value<DateTime?> startedAt;
  final Value<DateTime?> completedAt;
  final Value<int> rewatchCount;
  final Value<int?> currentSeason;
  final Value<int?> currentEpisode;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const UserLibraryCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.status = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rewatchCount = const Value.absent(),
    this.currentSeason = const Value.absent(),
    this.currentEpisode = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserLibraryCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    required String deviceId,
    this.serverUpdatedAt = const Value.absent(),
    required String mediaId,
    required String status,
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rewatchCount = const Value.absent(),
    this.currentSeason = const Value.absent(),
    this.currentEpisode = const Value.absent(),
    required DateTime addedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId),
       mediaId = Value(mediaId),
       status = Value(status),
       addedAt = Value(addedAt);
  static Insertable<LibraryRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? mediaId,
    Expression<String>? status,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? rewatchCount,
    Expression<int>? currentSeason,
    Expression<int>? currentEpisode,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (mediaId != null) 'media_id': mediaId,
      if (status != null) 'status': status,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (rewatchCount != null) 'rewatch_count': rewatchCount,
      if (currentSeason != null) 'current_season': currentSeason,
      if (currentEpisode != null) 'current_episode': currentEpisode,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserLibraryCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String>? deviceId,
    Value<DateTime?>? serverUpdatedAt,
    Value<String>? mediaId,
    Value<String>? status,
    Value<DateTime?>? startedAt,
    Value<DateTime?>? completedAt,
    Value<int>? rewatchCount,
    Value<int?>? currentSeason,
    Value<int?>? currentEpisode,
    Value<DateTime>? addedAt,
    Value<int>? rowid,
  }) {
    return UserLibraryCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      mediaId: mediaId ?? this.mediaId,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      rewatchCount: rewatchCount ?? this.rewatchCount,
      currentSeason: currentSeason ?? this.currentSeason,
      currentEpisode: currentEpisode ?? this.currentEpisode,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rewatchCount.present) {
      map['rewatch_count'] = Variable<int>(rewatchCount.value);
    }
    if (currentSeason.present) {
      map['current_season'] = Variable<int>(currentSeason.value);
    }
    if (currentEpisode.present) {
      map['current_episode'] = Variable<int>(currentEpisode.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserLibraryCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rewatchCount: $rewatchCount, ')
          ..write('currentSeason: $currentSeason, ')
          ..write('currentEpisode: $currentEpisode, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WatchHistoryTable extends WatchHistory
    with TableInfo<$WatchHistoryTable, WatchHistoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WatchHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _libraryIdMeta = const VerificationMeta(
    'libraryId',
  );
  @override
  late final GeneratedColumn<String> libraryId = GeneratedColumn<String>(
    'library_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_library (id)',
    ),
  );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _seasonNumberMeta = const VerificationMeta(
    'seasonNumber',
  );
  @override
  late final GeneratedColumn<int> seasonNumber = GeneratedColumn<int>(
    'season_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _episodeIdMeta = const VerificationMeta(
    'episodeId',
  );
  @override
  late final GeneratedColumn<String> episodeId = GeneratedColumn<String>(
    'episode_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES episodes (id)',
    ),
  );
  static const VerificationMeta _watchedAtMeta = const VerificationMeta(
    'watchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> watchedAt = GeneratedColumn<DateTime>(
    'watched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cycleMeta = const VerificationMeta('cycle');
  @override
  late final GeneratedColumn<int> cycle = GeneratedColumn<int>(
    'cycle',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _eventTypeMeta = const VerificationMeta(
    'eventType',
  );
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
    'event_type',
    aliasedName,
    false,
    check: () => eventType.isIn(const ['watched', 'started', 'completed']),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    libraryId,
    mediaId,
    seasonNumber,
    episodeId,
    watchedAt,
    cycle,
    eventType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'watch_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<WatchHistoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('library_id')) {
      context.handle(
        _libraryIdMeta,
        libraryId.isAcceptableOrUnknown(data['library_id']!, _libraryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_libraryIdMeta);
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('season_number')) {
      context.handle(
        _seasonNumberMeta,
        seasonNumber.isAcceptableOrUnknown(
          data['season_number']!,
          _seasonNumberMeta,
        ),
      );
    }
    if (data.containsKey('episode_id')) {
      context.handle(
        _episodeIdMeta,
        episodeId.isAcceptableOrUnknown(data['episode_id']!, _episodeIdMeta),
      );
    }
    if (data.containsKey('watched_at')) {
      context.handle(
        _watchedAtMeta,
        watchedAt.isAcceptableOrUnknown(data['watched_at']!, _watchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_watchedAtMeta);
    }
    if (data.containsKey('cycle')) {
      context.handle(
        _cycleMeta,
        cycle.isAcceptableOrUnknown(data['cycle']!, _cycleMeta),
      );
    }
    if (data.containsKey('event_type')) {
      context.handle(
        _eventTypeMeta,
        eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WatchHistoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WatchHistoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      libraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}library_id'],
      )!,
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      seasonNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}season_number'],
      ),
      episodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}episode_id'],
      ),
      watchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}watched_at'],
      )!,
      cycle: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle'],
      )!,
      eventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_type'],
      )!,
    );
  }

  @override
  $WatchHistoryTable createAlias(String alias) {
    return $WatchHistoryTable(attachedDatabase, alias);
  }
}

class WatchHistoryRow extends DataClass implements Insertable<WatchHistoryRow> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String deviceId;
  final DateTime? serverUpdatedAt;
  final String libraryId;
  final String mediaId;
  final int? seasonNumber;
  final String? episodeId;
  final DateTime watchedAt;

  /// Rewatch cycle number, starting at 1.
  final int cycle;
  final String eventType;
  const WatchHistoryRow({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    required this.deviceId,
    this.serverUpdatedAt,
    required this.libraryId,
    required this.mediaId,
    this.seasonNumber,
    this.episodeId,
    required this.watchedAt,
    required this.cycle,
    required this.eventType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['library_id'] = Variable<String>(libraryId);
    map['media_id'] = Variable<String>(mediaId);
    if (!nullToAbsent || seasonNumber != null) {
      map['season_number'] = Variable<int>(seasonNumber);
    }
    if (!nullToAbsent || episodeId != null) {
      map['episode_id'] = Variable<String>(episodeId);
    }
    map['watched_at'] = Variable<DateTime>(watchedAt);
    map['cycle'] = Variable<int>(cycle);
    map['event_type'] = Variable<String>(eventType);
    return map;
  }

  WatchHistoryCompanion toCompanion(bool nullToAbsent) {
    return WatchHistoryCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: Value(deviceId),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      libraryId: Value(libraryId),
      mediaId: Value(mediaId),
      seasonNumber: seasonNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(seasonNumber),
      episodeId: episodeId == null && nullToAbsent
          ? const Value.absent()
          : Value(episodeId),
      watchedAt: Value(watchedAt),
      cycle: Value(cycle),
      eventType: Value(eventType),
    );
  }

  factory WatchHistoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WatchHistoryRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      libraryId: serializer.fromJson<String>(json['libraryId']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      seasonNumber: serializer.fromJson<int?>(json['seasonNumber']),
      episodeId: serializer.fromJson<String?>(json['episodeId']),
      watchedAt: serializer.fromJson<DateTime>(json['watchedAt']),
      cycle: serializer.fromJson<int>(json['cycle']),
      eventType: serializer.fromJson<String>(json['eventType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String>(deviceId),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'libraryId': serializer.toJson<String>(libraryId),
      'mediaId': serializer.toJson<String>(mediaId),
      'seasonNumber': serializer.toJson<int?>(seasonNumber),
      'episodeId': serializer.toJson<String?>(episodeId),
      'watchedAt': serializer.toJson<DateTime>(watchedAt),
      'cycle': serializer.toJson<int>(cycle),
      'eventType': serializer.toJson<String>(eventType),
    };
  }

  WatchHistoryRow copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    String? deviceId,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    String? libraryId,
    String? mediaId,
    Value<int?> seasonNumber = const Value.absent(),
    Value<String?> episodeId = const Value.absent(),
    DateTime? watchedAt,
    int? cycle,
    String? eventType,
  }) => WatchHistoryRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId ?? this.deviceId,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    libraryId: libraryId ?? this.libraryId,
    mediaId: mediaId ?? this.mediaId,
    seasonNumber: seasonNumber.present ? seasonNumber.value : this.seasonNumber,
    episodeId: episodeId.present ? episodeId.value : this.episodeId,
    watchedAt: watchedAt ?? this.watchedAt,
    cycle: cycle ?? this.cycle,
    eventType: eventType ?? this.eventType,
  );
  WatchHistoryRow copyWithCompanion(WatchHistoryCompanion data) {
    return WatchHistoryRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      libraryId: data.libraryId.present ? data.libraryId.value : this.libraryId,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      seasonNumber: data.seasonNumber.present
          ? data.seasonNumber.value
          : this.seasonNumber,
      episodeId: data.episodeId.present ? data.episodeId.value : this.episodeId,
      watchedAt: data.watchedAt.present ? data.watchedAt.value : this.watchedAt,
      cycle: data.cycle.present ? data.cycle.value : this.cycle,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WatchHistoryRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('libraryId: $libraryId, ')
          ..write('mediaId: $mediaId, ')
          ..write('seasonNumber: $seasonNumber, ')
          ..write('episodeId: $episodeId, ')
          ..write('watchedAt: $watchedAt, ')
          ..write('cycle: $cycle, ')
          ..write('eventType: $eventType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    libraryId,
    mediaId,
    seasonNumber,
    episodeId,
    watchedAt,
    cycle,
    eventType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WatchHistoryRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.libraryId == this.libraryId &&
          other.mediaId == this.mediaId &&
          other.seasonNumber == this.seasonNumber &&
          other.episodeId == this.episodeId &&
          other.watchedAt == this.watchedAt &&
          other.cycle == this.cycle &&
          other.eventType == this.eventType);
}

class WatchHistoryCompanion extends UpdateCompanion<WatchHistoryRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String> deviceId;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String> libraryId;
  final Value<String> mediaId;
  final Value<int?> seasonNumber;
  final Value<String?> episodeId;
  final Value<DateTime> watchedAt;
  final Value<int> cycle;
  final Value<String> eventType;
  final Value<int> rowid;
  const WatchHistoryCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.libraryId = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.seasonNumber = const Value.absent(),
    this.episodeId = const Value.absent(),
    this.watchedAt = const Value.absent(),
    this.cycle = const Value.absent(),
    this.eventType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WatchHistoryCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    required String deviceId,
    this.serverUpdatedAt = const Value.absent(),
    required String libraryId,
    required String mediaId,
    this.seasonNumber = const Value.absent(),
    this.episodeId = const Value.absent(),
    required DateTime watchedAt,
    this.cycle = const Value.absent(),
    required String eventType,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId),
       libraryId = Value(libraryId),
       mediaId = Value(mediaId),
       watchedAt = Value(watchedAt),
       eventType = Value(eventType);
  static Insertable<WatchHistoryRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? libraryId,
    Expression<String>? mediaId,
    Expression<int>? seasonNumber,
    Expression<String>? episodeId,
    Expression<DateTime>? watchedAt,
    Expression<int>? cycle,
    Expression<String>? eventType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (libraryId != null) 'library_id': libraryId,
      if (mediaId != null) 'media_id': mediaId,
      if (seasonNumber != null) 'season_number': seasonNumber,
      if (episodeId != null) 'episode_id': episodeId,
      if (watchedAt != null) 'watched_at': watchedAt,
      if (cycle != null) 'cycle': cycle,
      if (eventType != null) 'event_type': eventType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WatchHistoryCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String>? deviceId,
    Value<DateTime?>? serverUpdatedAt,
    Value<String>? libraryId,
    Value<String>? mediaId,
    Value<int?>? seasonNumber,
    Value<String?>? episodeId,
    Value<DateTime>? watchedAt,
    Value<int>? cycle,
    Value<String>? eventType,
    Value<int>? rowid,
  }) {
    return WatchHistoryCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      libraryId: libraryId ?? this.libraryId,
      mediaId: mediaId ?? this.mediaId,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      episodeId: episodeId ?? this.episodeId,
      watchedAt: watchedAt ?? this.watchedAt,
      cycle: cycle ?? this.cycle,
      eventType: eventType ?? this.eventType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (libraryId.present) {
      map['library_id'] = Variable<String>(libraryId.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (seasonNumber.present) {
      map['season_number'] = Variable<int>(seasonNumber.value);
    }
    if (episodeId.present) {
      map['episode_id'] = Variable<String>(episodeId.value);
    }
    if (watchedAt.present) {
      map['watched_at'] = Variable<DateTime>(watchedAt.value);
    }
    if (cycle.present) {
      map['cycle'] = Variable<int>(cycle.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WatchHistoryCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('libraryId: $libraryId, ')
          ..write('mediaId: $mediaId, ')
          ..write('seasonNumber: $seasonNumber, ')
          ..write('episodeId: $episodeId, ')
          ..write('watchedAt: $watchedAt, ')
          ..write('cycle: $cycle, ')
          ..write('eventType: $eventType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserRatingsTable extends UserRatings
    with TableInfo<$UserRatingsTable, RatingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserRatingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    check: () => ComparableExpr(rating).isBetweenValues(0.5, 10.0),
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratedAtMeta = const VerificationMeta(
    'ratedAt',
  );
  @override
  late final GeneratedColumn<DateTime> ratedAt = GeneratedColumn<DateTime>(
    'rated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    rating,
    ratedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_ratings';
  @override
  VerificationContext validateIntegrity(
    Insertable<RatingRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('rated_at')) {
      context.handle(
        _ratedAtMeta,
        ratedAt.isAcceptableOrUnknown(data['rated_at']!, _ratedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_ratedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RatingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RatingRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      ratedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}rated_at'],
      )!,
    );
  }

  @override
  $UserRatingsTable createAlias(String alias) {
    return $UserRatingsTable(attachedDatabase, alias);
  }
}

class RatingRow extends DataClass implements Insertable<RatingRow> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String deviceId;
  final DateTime? serverUpdatedAt;
  final String mediaId;

  /// 0.5 to 10 in steps of 0.5.
  final double rating;
  final DateTime ratedAt;
  const RatingRow({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    required this.deviceId,
    this.serverUpdatedAt,
    required this.mediaId,
    required this.rating,
    required this.ratedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['media_id'] = Variable<String>(mediaId);
    map['rating'] = Variable<double>(rating);
    map['rated_at'] = Variable<DateTime>(ratedAt);
    return map;
  }

  UserRatingsCompanion toCompanion(bool nullToAbsent) {
    return UserRatingsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: Value(deviceId),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      mediaId: Value(mediaId),
      rating: Value(rating),
      ratedAt: Value(ratedAt),
    );
  }

  factory RatingRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RatingRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      rating: serializer.fromJson<double>(json['rating']),
      ratedAt: serializer.fromJson<DateTime>(json['ratedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String>(deviceId),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'mediaId': serializer.toJson<String>(mediaId),
      'rating': serializer.toJson<double>(rating),
      'ratedAt': serializer.toJson<DateTime>(ratedAt),
    };
  }

  RatingRow copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    String? deviceId,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    String? mediaId,
    double? rating,
    DateTime? ratedAt,
  }) => RatingRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId ?? this.deviceId,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    mediaId: mediaId ?? this.mediaId,
    rating: rating ?? this.rating,
    ratedAt: ratedAt ?? this.ratedAt,
  );
  RatingRow copyWithCompanion(UserRatingsCompanion data) {
    return RatingRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      rating: data.rating.present ? data.rating.value : this.rating,
      ratedAt: data.ratedAt.present ? data.ratedAt.value : this.ratedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RatingRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('rating: $rating, ')
          ..write('ratedAt: $ratedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    rating,
    ratedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RatingRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.mediaId == this.mediaId &&
          other.rating == this.rating &&
          other.ratedAt == this.ratedAt);
}

class UserRatingsCompanion extends UpdateCompanion<RatingRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String> deviceId;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String> mediaId;
  final Value<double> rating;
  final Value<DateTime> ratedAt;
  final Value<int> rowid;
  const UserRatingsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.rating = const Value.absent(),
    this.ratedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserRatingsCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    required String deviceId,
    this.serverUpdatedAt = const Value.absent(),
    required String mediaId,
    required double rating,
    required DateTime ratedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId),
       mediaId = Value(mediaId),
       rating = Value(rating),
       ratedAt = Value(ratedAt);
  static Insertable<RatingRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? mediaId,
    Expression<double>? rating,
    Expression<DateTime>? ratedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (mediaId != null) 'media_id': mediaId,
      if (rating != null) 'rating': rating,
      if (ratedAt != null) 'rated_at': ratedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserRatingsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String>? deviceId,
    Value<DateTime?>? serverUpdatedAt,
    Value<String>? mediaId,
    Value<double>? rating,
    Value<DateTime>? ratedAt,
    Value<int>? rowid,
  }) {
    return UserRatingsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      mediaId: mediaId ?? this.mediaId,
      rating: rating ?? this.rating,
      ratedAt: ratedAt ?? this.ratedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (ratedAt.present) {
      map['rated_at'] = Variable<DateTime>(ratedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserRatingsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('rating: $rating, ')
          ..write('ratedAt: $ratedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserNotesTable extends UserNotes
    with TableInfo<$UserNotesTable, NoteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserNotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _episodeIdMeta = const VerificationMeta(
    'episodeId',
  );
  @override
  late final GeneratedColumn<String> episodeId = GeneratedColumn<String>(
    'episode_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES episodes (id)',
    ),
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    episodeId,
    body,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('episode_id')) {
      context.handle(
        _episodeIdMeta,
        episodeId.isAcceptableOrUnknown(data['episode_id']!, _episodeIdMeta),
      );
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      episodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}episode_id'],
      ),
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
    );
  }

  @override
  $UserNotesTable createAlias(String alias) {
    return $UserNotesTable(attachedDatabase, alias);
  }
}

class NoteRow extends DataClass implements Insertable<NoteRow> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String deviceId;
  final DateTime? serverUpdatedAt;
  final String mediaId;
  final String? episodeId;
  final String body;
  const NoteRow({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    required this.deviceId,
    this.serverUpdatedAt,
    required this.mediaId,
    this.episodeId,
    required this.body,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['media_id'] = Variable<String>(mediaId);
    if (!nullToAbsent || episodeId != null) {
      map['episode_id'] = Variable<String>(episodeId);
    }
    map['body'] = Variable<String>(body);
    return map;
  }

  UserNotesCompanion toCompanion(bool nullToAbsent) {
    return UserNotesCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: Value(deviceId),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      mediaId: Value(mediaId),
      episodeId: episodeId == null && nullToAbsent
          ? const Value.absent()
          : Value(episodeId),
      body: Value(body),
    );
  }

  factory NoteRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      episodeId: serializer.fromJson<String?>(json['episodeId']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String>(deviceId),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'mediaId': serializer.toJson<String>(mediaId),
      'episodeId': serializer.toJson<String?>(episodeId),
      'body': serializer.toJson<String>(body),
    };
  }

  NoteRow copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    String? deviceId,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    String? mediaId,
    Value<String?> episodeId = const Value.absent(),
    String? body,
  }) => NoteRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId ?? this.deviceId,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    mediaId: mediaId ?? this.mediaId,
    episodeId: episodeId.present ? episodeId.value : this.episodeId,
    body: body ?? this.body,
  );
  NoteRow copyWithCompanion(UserNotesCompanion data) {
    return NoteRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      episodeId: data.episodeId.present ? data.episodeId.value : this.episodeId,
      body: data.body.present ? data.body.value : this.body,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('episodeId: $episodeId, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    episodeId,
    body,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.mediaId == this.mediaId &&
          other.episodeId == this.episodeId &&
          other.body == this.body);
}

class UserNotesCompanion extends UpdateCompanion<NoteRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String> deviceId;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String> mediaId;
  final Value<String?> episodeId;
  final Value<String> body;
  final Value<int> rowid;
  const UserNotesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.episodeId = const Value.absent(),
    this.body = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserNotesCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    required String deviceId,
    this.serverUpdatedAt = const Value.absent(),
    required String mediaId,
    this.episodeId = const Value.absent(),
    required String body,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId),
       mediaId = Value(mediaId),
       body = Value(body);
  static Insertable<NoteRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? mediaId,
    Expression<String>? episodeId,
    Expression<String>? body,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (mediaId != null) 'media_id': mediaId,
      if (episodeId != null) 'episode_id': episodeId,
      if (body != null) 'body': body,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserNotesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String>? deviceId,
    Value<DateTime?>? serverUpdatedAt,
    Value<String>? mediaId,
    Value<String?>? episodeId,
    Value<String>? body,
    Value<int>? rowid,
  }) {
    return UserNotesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      mediaId: mediaId ?? this.mediaId,
      episodeId: episodeId ?? this.episodeId,
      body: body ?? this.body,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (episodeId.present) {
      map['episode_id'] = Variable<String>(episodeId.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserNotesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('episodeId: $episodeId, ')
          ..write('body: $body, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WatchlistItemsTable extends WatchlistItems
    with TableInfo<$WatchlistItemsTable, WatchlistRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WatchlistItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    priority,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'watchlist_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<WatchlistRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WatchlistRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WatchlistRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $WatchlistItemsTable createAlias(String alias) {
    return $WatchlistItemsTable(attachedDatabase, alias);
  }
}

class WatchlistRow extends DataClass implements Insertable<WatchlistRow> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String deviceId;
  final DateTime? serverUpdatedAt;
  final String mediaId;
  final int priority;
  final DateTime addedAt;
  const WatchlistRow({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    required this.deviceId,
    this.serverUpdatedAt,
    required this.mediaId,
    required this.priority,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['media_id'] = Variable<String>(mediaId);
    map['priority'] = Variable<int>(priority);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  WatchlistItemsCompanion toCompanion(bool nullToAbsent) {
    return WatchlistItemsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: Value(deviceId),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      mediaId: Value(mediaId),
      priority: Value(priority),
      addedAt: Value(addedAt),
    );
  }

  factory WatchlistRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WatchlistRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      priority: serializer.fromJson<int>(json['priority']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String>(deviceId),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'mediaId': serializer.toJson<String>(mediaId),
      'priority': serializer.toJson<int>(priority),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  WatchlistRow copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    String? deviceId,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    String? mediaId,
    int? priority,
    DateTime? addedAt,
  }) => WatchlistRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId ?? this.deviceId,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    mediaId: mediaId ?? this.mediaId,
    priority: priority ?? this.priority,
    addedAt: addedAt ?? this.addedAt,
  );
  WatchlistRow copyWithCompanion(WatchlistItemsCompanion data) {
    return WatchlistRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      priority: data.priority.present ? data.priority.value : this.priority,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WatchlistRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('priority: $priority, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    priority,
    addedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WatchlistRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.mediaId == this.mediaId &&
          other.priority == this.priority &&
          other.addedAt == this.addedAt);
}

class WatchlistItemsCompanion extends UpdateCompanion<WatchlistRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String> deviceId;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String> mediaId;
  final Value<int> priority;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const WatchlistItemsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.priority = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WatchlistItemsCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    required String deviceId,
    this.serverUpdatedAt = const Value.absent(),
    required String mediaId,
    this.priority = const Value.absent(),
    required DateTime addedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId),
       mediaId = Value(mediaId),
       addedAt = Value(addedAt);
  static Insertable<WatchlistRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? mediaId,
    Expression<int>? priority,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (mediaId != null) 'media_id': mediaId,
      if (priority != null) 'priority': priority,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WatchlistItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String>? deviceId,
    Value<DateTime?>? serverUpdatedAt,
    Value<String>? mediaId,
    Value<int>? priority,
    Value<DateTime>? addedAt,
    Value<int>? rowid,
  }) {
    return WatchlistItemsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      mediaId: mediaId ?? this.mediaId,
      priority: priority ?? this.priority,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WatchlistItemsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('priority: $priority, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, FavoriteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _favoritedAtMeta = const VerificationMeta(
    'favoritedAt',
  );
  @override
  late final GeneratedColumn<DateTime> favoritedAt = GeneratedColumn<DateTime>(
    'favorited_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    favoritedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('favorited_at')) {
      context.handle(
        _favoritedAtMeta,
        favoritedAt.isAcceptableOrUnknown(
          data['favorited_at']!,
          _favoritedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_favoritedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      favoritedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}favorited_at'],
      )!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class FavoriteRow extends DataClass implements Insertable<FavoriteRow> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String deviceId;
  final DateTime? serverUpdatedAt;
  final String mediaId;
  final DateTime favoritedAt;
  const FavoriteRow({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    required this.deviceId,
    this.serverUpdatedAt,
    required this.mediaId,
    required this.favoritedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['media_id'] = Variable<String>(mediaId);
    map['favorited_at'] = Variable<DateTime>(favoritedAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: Value(deviceId),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      mediaId: Value(mediaId),
      favoritedAt: Value(favoritedAt),
    );
  }

  factory FavoriteRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      favoritedAt: serializer.fromJson<DateTime>(json['favoritedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String>(deviceId),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'mediaId': serializer.toJson<String>(mediaId),
      'favoritedAt': serializer.toJson<DateTime>(favoritedAt),
    };
  }

  FavoriteRow copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    String? deviceId,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    String? mediaId,
    DateTime? favoritedAt,
  }) => FavoriteRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId ?? this.deviceId,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    mediaId: mediaId ?? this.mediaId,
    favoritedAt: favoritedAt ?? this.favoritedAt,
  );
  FavoriteRow copyWithCompanion(FavoritesCompanion data) {
    return FavoriteRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      favoritedAt: data.favoritedAt.present
          ? data.favoritedAt.value
          : this.favoritedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('favoritedAt: $favoritedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    favoritedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.mediaId == this.mediaId &&
          other.favoritedAt == this.favoritedAt);
}

class FavoritesCompanion extends UpdateCompanion<FavoriteRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String> deviceId;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String> mediaId;
  final Value<DateTime> favoritedAt;
  final Value<int> rowid;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.favoritedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritesCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    required String deviceId,
    this.serverUpdatedAt = const Value.absent(),
    required String mediaId,
    required DateTime favoritedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId),
       mediaId = Value(mediaId),
       favoritedAt = Value(favoritedAt);
  static Insertable<FavoriteRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? mediaId,
    Expression<DateTime>? favoritedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (mediaId != null) 'media_id': mediaId,
      if (favoritedAt != null) 'favorited_at': favoritedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String>? deviceId,
    Value<DateTime?>? serverUpdatedAt,
    Value<String>? mediaId,
    Value<DateTime>? favoritedAt,
    Value<int>? rowid,
  }) {
    return FavoritesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      mediaId: mediaId ?? this.mediaId,
      favoritedAt: favoritedAt ?? this.favoritedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (favoritedAt.present) {
      map['favorited_at'] = Variable<DateTime>(favoritedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('favoritedAt: $favoritedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomCollectionsTable extends CustomCollections
    with TableInfo<$CustomCollectionsTable, CollectionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomCollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverKindMeta = const VerificationMeta(
    'coverKind',
  );
  @override
  late final GeneratedColumn<String> coverKind = GeneratedColumn<String>(
    'cover_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  static const VerificationMeta _coverMediaIdMeta = const VerificationMeta(
    'coverMediaId',
  );
  @override
  late final GeneratedColumn<String> coverMediaId = GeneratedColumn<String>(
    'cover_media_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _coverLocalPathMeta = const VerificationMeta(
    'coverLocalPath',
  );
  @override
  late final GeneratedColumn<String> coverLocalPath = GeneratedColumn<String>(
    'cover_local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverStoragePathMeta = const VerificationMeta(
    'coverStoragePath',
  );
  @override
  late final GeneratedColumn<String> coverStoragePath = GeneratedColumn<String>(
    'cover_storage_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortKeyMeta = const VerificationMeta(
    'sortKey',
  );
  @override
  late final GeneratedColumn<String> sortKey = GeneratedColumn<String>(
    'sort_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    name,
    description,
    coverKind,
    coverMediaId,
    coverLocalPath,
    coverStoragePath,
    sortKey,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_collections';
  @override
  VerificationContext validateIntegrity(
    Insertable<CollectionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('cover_kind')) {
      context.handle(
        _coverKindMeta,
        coverKind.isAcceptableOrUnknown(data['cover_kind']!, _coverKindMeta),
      );
    }
    if (data.containsKey('cover_media_id')) {
      context.handle(
        _coverMediaIdMeta,
        coverMediaId.isAcceptableOrUnknown(
          data['cover_media_id']!,
          _coverMediaIdMeta,
        ),
      );
    }
    if (data.containsKey('cover_local_path')) {
      context.handle(
        _coverLocalPathMeta,
        coverLocalPath.isAcceptableOrUnknown(
          data['cover_local_path']!,
          _coverLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('cover_storage_path')) {
      context.handle(
        _coverStoragePathMeta,
        coverStoragePath.isAcceptableOrUnknown(
          data['cover_storage_path']!,
          _coverStoragePathMeta,
        ),
      );
    }
    if (data.containsKey('sort_key')) {
      context.handle(
        _sortKeyMeta,
        sortKey.isAcceptableOrUnknown(data['sort_key']!, _sortKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_sortKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      coverKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_kind'],
      )!,
      coverMediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_media_id'],
      ),
      coverLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_local_path'],
      ),
      coverStoragePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_storage_path'],
      ),
      sortKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sort_key'],
      )!,
    );
  }

  @override
  $CustomCollectionsTable createAlias(String alias) {
    return $CustomCollectionsTable(attachedDatabase, alias);
  }
}

class CollectionRow extends DataClass implements Insertable<CollectionRow> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String deviceId;
  final DateTime? serverUpdatedAt;
  final String name;
  final String? description;
  final String coverKind;
  final String? coverMediaId;
  final String? coverLocalPath;
  final String? coverStoragePath;

  /// Fractional-index key for conflict-free ordering.
  final String sortKey;
  const CollectionRow({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    required this.deviceId,
    this.serverUpdatedAt,
    required this.name,
    this.description,
    required this.coverKind,
    this.coverMediaId,
    this.coverLocalPath,
    this.coverStoragePath,
    required this.sortKey,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['cover_kind'] = Variable<String>(coverKind);
    if (!nullToAbsent || coverMediaId != null) {
      map['cover_media_id'] = Variable<String>(coverMediaId);
    }
    if (!nullToAbsent || coverLocalPath != null) {
      map['cover_local_path'] = Variable<String>(coverLocalPath);
    }
    if (!nullToAbsent || coverStoragePath != null) {
      map['cover_storage_path'] = Variable<String>(coverStoragePath);
    }
    map['sort_key'] = Variable<String>(sortKey);
    return map;
  }

  CustomCollectionsCompanion toCompanion(bool nullToAbsent) {
    return CustomCollectionsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: Value(deviceId),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      coverKind: Value(coverKind),
      coverMediaId: coverMediaId == null && nullToAbsent
          ? const Value.absent()
          : Value(coverMediaId),
      coverLocalPath: coverLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverLocalPath),
      coverStoragePath: coverStoragePath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverStoragePath),
      sortKey: Value(sortKey),
    );
  }

  factory CollectionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      coverKind: serializer.fromJson<String>(json['coverKind']),
      coverMediaId: serializer.fromJson<String?>(json['coverMediaId']),
      coverLocalPath: serializer.fromJson<String?>(json['coverLocalPath']),
      coverStoragePath: serializer.fromJson<String?>(json['coverStoragePath']),
      sortKey: serializer.fromJson<String>(json['sortKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String>(deviceId),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'coverKind': serializer.toJson<String>(coverKind),
      'coverMediaId': serializer.toJson<String?>(coverMediaId),
      'coverLocalPath': serializer.toJson<String?>(coverLocalPath),
      'coverStoragePath': serializer.toJson<String?>(coverStoragePath),
      'sortKey': serializer.toJson<String>(sortKey),
    };
  }

  CollectionRow copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    String? deviceId,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    String? name,
    Value<String?> description = const Value.absent(),
    String? coverKind,
    Value<String?> coverMediaId = const Value.absent(),
    Value<String?> coverLocalPath = const Value.absent(),
    Value<String?> coverStoragePath = const Value.absent(),
    String? sortKey,
  }) => CollectionRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId ?? this.deviceId,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    coverKind: coverKind ?? this.coverKind,
    coverMediaId: coverMediaId.present ? coverMediaId.value : this.coverMediaId,
    coverLocalPath: coverLocalPath.present
        ? coverLocalPath.value
        : this.coverLocalPath,
    coverStoragePath: coverStoragePath.present
        ? coverStoragePath.value
        : this.coverStoragePath,
    sortKey: sortKey ?? this.sortKey,
  );
  CollectionRow copyWithCompanion(CustomCollectionsCompanion data) {
    return CollectionRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      coverKind: data.coverKind.present ? data.coverKind.value : this.coverKind,
      coverMediaId: data.coverMediaId.present
          ? data.coverMediaId.value
          : this.coverMediaId,
      coverLocalPath: data.coverLocalPath.present
          ? data.coverLocalPath.value
          : this.coverLocalPath,
      coverStoragePath: data.coverStoragePath.present
          ? data.coverStoragePath.value
          : this.coverStoragePath,
      sortKey: data.sortKey.present ? data.sortKey.value : this.sortKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('coverKind: $coverKind, ')
          ..write('coverMediaId: $coverMediaId, ')
          ..write('coverLocalPath: $coverLocalPath, ')
          ..write('coverStoragePath: $coverStoragePath, ')
          ..write('sortKey: $sortKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    name,
    description,
    coverKind,
    coverMediaId,
    coverLocalPath,
    coverStoragePath,
    sortKey,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.name == this.name &&
          other.description == this.description &&
          other.coverKind == this.coverKind &&
          other.coverMediaId == this.coverMediaId &&
          other.coverLocalPath == this.coverLocalPath &&
          other.coverStoragePath == this.coverStoragePath &&
          other.sortKey == this.sortKey);
}

class CustomCollectionsCompanion extends UpdateCompanion<CollectionRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String> deviceId;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> coverKind;
  final Value<String?> coverMediaId;
  final Value<String?> coverLocalPath;
  final Value<String?> coverStoragePath;
  final Value<String> sortKey;
  final Value<int> rowid;
  const CustomCollectionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.coverKind = const Value.absent(),
    this.coverMediaId = const Value.absent(),
    this.coverLocalPath = const Value.absent(),
    this.coverStoragePath = const Value.absent(),
    this.sortKey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomCollectionsCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    required String deviceId,
    this.serverUpdatedAt = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.coverKind = const Value.absent(),
    this.coverMediaId = const Value.absent(),
    this.coverLocalPath = const Value.absent(),
    this.coverStoragePath = const Value.absent(),
    required String sortKey,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId),
       name = Value(name),
       sortKey = Value(sortKey);
  static Insertable<CollectionRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? coverKind,
    Expression<String>? coverMediaId,
    Expression<String>? coverLocalPath,
    Expression<String>? coverStoragePath,
    Expression<String>? sortKey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (coverKind != null) 'cover_kind': coverKind,
      if (coverMediaId != null) 'cover_media_id': coverMediaId,
      if (coverLocalPath != null) 'cover_local_path': coverLocalPath,
      if (coverStoragePath != null) 'cover_storage_path': coverStoragePath,
      if (sortKey != null) 'sort_key': sortKey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomCollectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String>? deviceId,
    Value<DateTime?>? serverUpdatedAt,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? coverKind,
    Value<String?>? coverMediaId,
    Value<String?>? coverLocalPath,
    Value<String?>? coverStoragePath,
    Value<String>? sortKey,
    Value<int>? rowid,
  }) {
    return CustomCollectionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      name: name ?? this.name,
      description: description ?? this.description,
      coverKind: coverKind ?? this.coverKind,
      coverMediaId: coverMediaId ?? this.coverMediaId,
      coverLocalPath: coverLocalPath ?? this.coverLocalPath,
      coverStoragePath: coverStoragePath ?? this.coverStoragePath,
      sortKey: sortKey ?? this.sortKey,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (coverKind.present) {
      map['cover_kind'] = Variable<String>(coverKind.value);
    }
    if (coverMediaId.present) {
      map['cover_media_id'] = Variable<String>(coverMediaId.value);
    }
    if (coverLocalPath.present) {
      map['cover_local_path'] = Variable<String>(coverLocalPath.value);
    }
    if (coverStoragePath.present) {
      map['cover_storage_path'] = Variable<String>(coverStoragePath.value);
    }
    if (sortKey.present) {
      map['sort_key'] = Variable<String>(sortKey.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomCollectionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('coverKind: $coverKind, ')
          ..write('coverMediaId: $coverMediaId, ')
          ..write('coverLocalPath: $coverLocalPath, ')
          ..write('coverStoragePath: $coverStoragePath, ')
          ..write('sortKey: $sortKey, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CollectionItemsTable extends CollectionItems
    with TableInfo<$CollectionItemsTable, CollectionItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _collectionIdMeta = const VerificationMeta(
    'collectionId',
  );
  @override
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
    'collection_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES custom_collections (id)',
    ),
  );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _positionKeyMeta = const VerificationMeta(
    'positionKey',
  );
  @override
  late final GeneratedColumn<String> positionKey = GeneratedColumn<String>(
    'position_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    collectionId,
    mediaId,
    positionKey,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CollectionItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('collection_id')) {
      context.handle(
        _collectionIdMeta,
        collectionId.isAcceptableOrUnknown(
          data['collection_id']!,
          _collectionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('position_key')) {
      context.handle(
        _positionKeyMeta,
        positionKey.isAcceptableOrUnknown(
          data['position_key']!,
          _positionKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_positionKeyMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {collectionId, mediaId},
  ];
  @override
  CollectionItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      collectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}collection_id'],
      )!,
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      positionKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}position_key'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $CollectionItemsTable createAlias(String alias) {
    return $CollectionItemsTable(attachedDatabase, alias);
  }
}

class CollectionItemRow extends DataClass
    implements Insertable<CollectionItemRow> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String deviceId;
  final DateTime? serverUpdatedAt;
  final String collectionId;
  final String mediaId;
  final String positionKey;
  final DateTime addedAt;
  const CollectionItemRow({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    required this.deviceId,
    this.serverUpdatedAt,
    required this.collectionId,
    required this.mediaId,
    required this.positionKey,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['collection_id'] = Variable<String>(collectionId);
    map['media_id'] = Variable<String>(mediaId);
    map['position_key'] = Variable<String>(positionKey);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  CollectionItemsCompanion toCompanion(bool nullToAbsent) {
    return CollectionItemsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: Value(deviceId),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      collectionId: Value(collectionId),
      mediaId: Value(mediaId),
      positionKey: Value(positionKey),
      addedAt: Value(addedAt),
    );
  }

  factory CollectionItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionItemRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      collectionId: serializer.fromJson<String>(json['collectionId']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      positionKey: serializer.fromJson<String>(json['positionKey']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String>(deviceId),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'collectionId': serializer.toJson<String>(collectionId),
      'mediaId': serializer.toJson<String>(mediaId),
      'positionKey': serializer.toJson<String>(positionKey),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  CollectionItemRow copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    String? deviceId,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    String? collectionId,
    String? mediaId,
    String? positionKey,
    DateTime? addedAt,
  }) => CollectionItemRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId ?? this.deviceId,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    collectionId: collectionId ?? this.collectionId,
    mediaId: mediaId ?? this.mediaId,
    positionKey: positionKey ?? this.positionKey,
    addedAt: addedAt ?? this.addedAt,
  );
  CollectionItemRow copyWithCompanion(CollectionItemsCompanion data) {
    return CollectionItemRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      positionKey: data.positionKey.present
          ? data.positionKey.value
          : this.positionKey,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionItemRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('collectionId: $collectionId, ')
          ..write('mediaId: $mediaId, ')
          ..write('positionKey: $positionKey, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    collectionId,
    mediaId,
    positionKey,
    addedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionItemRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.collectionId == this.collectionId &&
          other.mediaId == this.mediaId &&
          other.positionKey == this.positionKey &&
          other.addedAt == this.addedAt);
}

class CollectionItemsCompanion extends UpdateCompanion<CollectionItemRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String> deviceId;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String> collectionId;
  final Value<String> mediaId;
  final Value<String> positionKey;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const CollectionItemsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.positionKey = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionItemsCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    required String deviceId,
    this.serverUpdatedAt = const Value.absent(),
    required String collectionId,
    required String mediaId,
    required String positionKey,
    required DateTime addedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId),
       collectionId = Value(collectionId),
       mediaId = Value(mediaId),
       positionKey = Value(positionKey),
       addedAt = Value(addedAt);
  static Insertable<CollectionItemRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? collectionId,
    Expression<String>? mediaId,
    Expression<String>? positionKey,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (collectionId != null) 'collection_id': collectionId,
      if (mediaId != null) 'media_id': mediaId,
      if (positionKey != null) 'position_key': positionKey,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String>? deviceId,
    Value<DateTime?>? serverUpdatedAt,
    Value<String>? collectionId,
    Value<String>? mediaId,
    Value<String>? positionKey,
    Value<DateTime>? addedAt,
    Value<int>? rowid,
  }) {
    return CollectionItemsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      collectionId: collectionId ?? this.collectionId,
      mediaId: mediaId ?? this.mediaId,
      positionKey: positionKey ?? this.positionKey,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (positionKey.present) {
      map['position_key'] = Variable<String>(positionKey.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionItemsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('collectionId: $collectionId, ')
          ..write('mediaId: $mediaId, ')
          ..write('positionKey: $positionKey, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, ReminderRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    check: () =>
        kind.isIn(const ['viewing', 'watchlist', 'continue', 'release']),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repeatRuleMeta = const VerificationMeta(
    'repeatRule',
  );
  @override
  late final GeneratedColumn<String> repeatRule = GeneratedColumn<String>(
    'repeat_rule',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notificationIdMeta = const VerificationMeta(
    'notificationId',
  );
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
    'notification_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    kind,
    mediaId,
    title,
    body,
    scheduledAt,
    timezone,
    repeatRule,
    enabled,
    notificationId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('repeat_rule')) {
      context.handle(
        _repeatRuleMeta,
        repeatRule.isAcceptableOrUnknown(data['repeat_rule']!, _repeatRuleMeta),
      );
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('notification_id')) {
      context.handle(
        _notificationIdMeta,
        notificationId.isAcceptableOrUnknown(
          data['notification_id']!,
          _notificationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notificationIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      ),
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
      repeatRule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}repeat_rule'],
      ),
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      notificationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notification_id'],
      )!,
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class ReminderRow extends DataClass implements Insertable<ReminderRow> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String deviceId;
  final DateTime? serverUpdatedAt;
  final String kind;
  final String? mediaId;
  final String title;
  final String? body;
  final DateTime scheduledAt;
  final String timezone;
  final String? repeatRule;
  final bool enabled;

  /// Integer id used with the local notification plugin.
  final int notificationId;
  const ReminderRow({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    required this.deviceId,
    this.serverUpdatedAt,
    required this.kind,
    this.mediaId,
    required this.title,
    this.body,
    required this.scheduledAt,
    required this.timezone,
    this.repeatRule,
    required this.enabled,
    required this.notificationId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['kind'] = Variable<String>(kind);
    if (!nullToAbsent || mediaId != null) {
      map['media_id'] = Variable<String>(mediaId);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['timezone'] = Variable<String>(timezone);
    if (!nullToAbsent || repeatRule != null) {
      map['repeat_rule'] = Variable<String>(repeatRule);
    }
    map['enabled'] = Variable<bool>(enabled);
    map['notification_id'] = Variable<int>(notificationId);
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: Value(deviceId),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      kind: Value(kind),
      mediaId: mediaId == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaId),
      title: Value(title),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      scheduledAt: Value(scheduledAt),
      timezone: Value(timezone),
      repeatRule: repeatRule == null && nullToAbsent
          ? const Value.absent()
          : Value(repeatRule),
      enabled: Value(enabled),
      notificationId: Value(notificationId),
    );
  }

  factory ReminderRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      kind: serializer.fromJson<String>(json['kind']),
      mediaId: serializer.fromJson<String?>(json['mediaId']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String?>(json['body']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      timezone: serializer.fromJson<String>(json['timezone']),
      repeatRule: serializer.fromJson<String?>(json['repeatRule']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      notificationId: serializer.fromJson<int>(json['notificationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String>(deviceId),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'kind': serializer.toJson<String>(kind),
      'mediaId': serializer.toJson<String?>(mediaId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String?>(body),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'timezone': serializer.toJson<String>(timezone),
      'repeatRule': serializer.toJson<String?>(repeatRule),
      'enabled': serializer.toJson<bool>(enabled),
      'notificationId': serializer.toJson<int>(notificationId),
    };
  }

  ReminderRow copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    String? deviceId,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    String? kind,
    Value<String?> mediaId = const Value.absent(),
    String? title,
    Value<String?> body = const Value.absent(),
    DateTime? scheduledAt,
    String? timezone,
    Value<String?> repeatRule = const Value.absent(),
    bool? enabled,
    int? notificationId,
  }) => ReminderRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId ?? this.deviceId,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    kind: kind ?? this.kind,
    mediaId: mediaId.present ? mediaId.value : this.mediaId,
    title: title ?? this.title,
    body: body.present ? body.value : this.body,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    timezone: timezone ?? this.timezone,
    repeatRule: repeatRule.present ? repeatRule.value : this.repeatRule,
    enabled: enabled ?? this.enabled,
    notificationId: notificationId ?? this.notificationId,
  );
  ReminderRow copyWithCompanion(RemindersCompanion data) {
    return ReminderRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      kind: data.kind.present ? data.kind.value : this.kind,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      repeatRule: data.repeatRule.present
          ? data.repeatRule.value
          : this.repeatRule,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      notificationId: data.notificationId.present
          ? data.notificationId.value
          : this.notificationId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('kind: $kind, ')
          ..write('mediaId: $mediaId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('timezone: $timezone, ')
          ..write('repeatRule: $repeatRule, ')
          ..write('enabled: $enabled, ')
          ..write('notificationId: $notificationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    kind,
    mediaId,
    title,
    body,
    scheduledAt,
    timezone,
    repeatRule,
    enabled,
    notificationId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.kind == this.kind &&
          other.mediaId == this.mediaId &&
          other.title == this.title &&
          other.body == this.body &&
          other.scheduledAt == this.scheduledAt &&
          other.timezone == this.timezone &&
          other.repeatRule == this.repeatRule &&
          other.enabled == this.enabled &&
          other.notificationId == this.notificationId);
}

class RemindersCompanion extends UpdateCompanion<ReminderRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String> deviceId;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String> kind;
  final Value<String?> mediaId;
  final Value<String> title;
  final Value<String?> body;
  final Value<DateTime> scheduledAt;
  final Value<String> timezone;
  final Value<String?> repeatRule;
  final Value<bool> enabled;
  final Value<int> notificationId;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.kind = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.timezone = const Value.absent(),
    this.repeatRule = const Value.absent(),
    this.enabled = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    required String deviceId,
    this.serverUpdatedAt = const Value.absent(),
    required String kind,
    this.mediaId = const Value.absent(),
    required String title,
    this.body = const Value.absent(),
    required DateTime scheduledAt,
    required String timezone,
    this.repeatRule = const Value.absent(),
    this.enabled = const Value.absent(),
    required int notificationId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId),
       kind = Value(kind),
       title = Value(title),
       scheduledAt = Value(scheduledAt),
       timezone = Value(timezone),
       notificationId = Value(notificationId);
  static Insertable<ReminderRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? kind,
    Expression<String>? mediaId,
    Expression<String>? title,
    Expression<String>? body,
    Expression<DateTime>? scheduledAt,
    Expression<String>? timezone,
    Expression<String>? repeatRule,
    Expression<bool>? enabled,
    Expression<int>? notificationId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (kind != null) 'kind': kind,
      if (mediaId != null) 'media_id': mediaId,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (timezone != null) 'timezone': timezone,
      if (repeatRule != null) 'repeat_rule': repeatRule,
      if (enabled != null) 'enabled': enabled,
      if (notificationId != null) 'notification_id': notificationId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String>? deviceId,
    Value<DateTime?>? serverUpdatedAt,
    Value<String>? kind,
    Value<String?>? mediaId,
    Value<String>? title,
    Value<String?>? body,
    Value<DateTime>? scheduledAt,
    Value<String>? timezone,
    Value<String?>? repeatRule,
    Value<bool>? enabled,
    Value<int>? notificationId,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      kind: kind ?? this.kind,
      mediaId: mediaId ?? this.mediaId,
      title: title ?? this.title,
      body: body ?? this.body,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      timezone: timezone ?? this.timezone,
      repeatRule: repeatRule ?? this.repeatRule,
      enabled: enabled ?? this.enabled,
      notificationId: notificationId ?? this.notificationId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (repeatRule.present) {
      map['repeat_rule'] = Variable<String>(repeatRule.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('kind: $kind, ')
          ..write('mediaId: $mediaId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('timezone: $timezone, ')
          ..write('repeatRule: $repeatRule, ')
          ..write('enabled: $enabled, ')
          ..write('notificationId: $notificationId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CalendarEventsTable extends CalendarEvents
    with TableInfo<$CalendarEventsTable, CalendarEventRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _baseRevisionMeta = const VerificationMeta(
    'baseRevision',
  );
  @override
  late final GeneratedColumn<int> baseRevision = GeneratedColumn<int>(
    'base_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES media (id)',
    ),
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    check: () => kind.isIn(const ['release', 'custom']),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eventDateMeta = const VerificationMeta(
    'eventDate',
  );
  @override
  late final GeneratedColumn<DateTime> eventDate = GeneratedColumn<DateTime>(
    'event_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    kind,
    eventDate,
    title,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalendarEventRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('base_revision')) {
      context.handle(
        _baseRevisionMeta,
        baseRevision.isAcceptableOrUnknown(
          data['base_revision']!,
          _baseRevisionMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('event_date')) {
      context.handle(
        _eventDateMeta,
        eventDate.isAcceptableOrUnknown(data['event_date']!, _eventDateMeta),
      );
    } else if (isInserting) {
      context.missing(_eventDateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarEventRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarEventRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      baseRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_revision'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      ),
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      eventDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}event_date'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
    );
  }

  @override
  $CalendarEventsTable createAlias(String alias) {
    return $CalendarEventsTable(attachedDatabase, alias);
  }
}

class CalendarEventRow extends DataClass
    implements Insertable<CalendarEventRow> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int revision;
  final int baseRevision;
  final String deviceId;
  final DateTime? serverUpdatedAt;
  final String? mediaId;
  final String kind;
  final DateTime eventDate;
  final String? title;
  const CalendarEventRow({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.revision,
    required this.baseRevision,
    required this.deviceId,
    this.serverUpdatedAt,
    this.mediaId,
    required this.kind,
    required this.eventDate,
    this.title,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['revision'] = Variable<int>(revision);
    map['base_revision'] = Variable<int>(baseRevision);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    if (!nullToAbsent || mediaId != null) {
      map['media_id'] = Variable<String>(mediaId);
    }
    map['kind'] = Variable<String>(kind);
    map['event_date'] = Variable<DateTime>(eventDate);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    return map;
  }

  CalendarEventsCompanion toCompanion(bool nullToAbsent) {
    return CalendarEventsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      revision: Value(revision),
      baseRevision: Value(baseRevision),
      deviceId: Value(deviceId),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      mediaId: mediaId == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaId),
      kind: Value(kind),
      eventDate: Value(eventDate),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
    );
  }

  factory CalendarEventRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarEventRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      revision: serializer.fromJson<int>(json['revision']),
      baseRevision: serializer.fromJson<int>(json['baseRevision']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      mediaId: serializer.fromJson<String?>(json['mediaId']),
      kind: serializer.fromJson<String>(json['kind']),
      eventDate: serializer.fromJson<DateTime>(json['eventDate']),
      title: serializer.fromJson<String?>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'revision': serializer.toJson<int>(revision),
      'baseRevision': serializer.toJson<int>(baseRevision),
      'deviceId': serializer.toJson<String>(deviceId),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'mediaId': serializer.toJson<String?>(mediaId),
      'kind': serializer.toJson<String>(kind),
      'eventDate': serializer.toJson<DateTime>(eventDate),
      'title': serializer.toJson<String?>(title),
    };
  }

  CalendarEventRow copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? revision,
    int? baseRevision,
    String? deviceId,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    Value<String?> mediaId = const Value.absent(),
    String? kind,
    DateTime? eventDate,
    Value<String?> title = const Value.absent(),
  }) => CalendarEventRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    revision: revision ?? this.revision,
    baseRevision: baseRevision ?? this.baseRevision,
    deviceId: deviceId ?? this.deviceId,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    mediaId: mediaId.present ? mediaId.value : this.mediaId,
    kind: kind ?? this.kind,
    eventDate: eventDate ?? this.eventDate,
    title: title.present ? title.value : this.title,
  );
  CalendarEventRow copyWithCompanion(CalendarEventsCompanion data) {
    return CalendarEventRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
      baseRevision: data.baseRevision.present
          ? data.baseRevision.value
          : this.baseRevision,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      kind: data.kind.present ? data.kind.value : this.kind,
      eventDate: data.eventDate.present ? data.eventDate.value : this.eventDate,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('kind: $kind, ')
          ..write('eventDate: $eventDate, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deletedAt,
    revision,
    baseRevision,
    deviceId,
    serverUpdatedAt,
    mediaId,
    kind,
    eventDate,
    title,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEventRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.revision == this.revision &&
          other.baseRevision == this.baseRevision &&
          other.deviceId == this.deviceId &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.mediaId == this.mediaId &&
          other.kind == this.kind &&
          other.eventDate == this.eventDate &&
          other.title == this.title);
}

class CalendarEventsCompanion extends UpdateCompanion<CalendarEventRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> revision;
  final Value<int> baseRevision;
  final Value<String> deviceId;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String?> mediaId;
  final Value<String> kind;
  final Value<DateTime> eventDate;
  final Value<String?> title;
  final Value<int> rowid;
  const CalendarEventsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.kind = const Value.absent(),
    this.eventDate = const Value.absent(),
    this.title = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarEventsCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.baseRevision = const Value.absent(),
    required String deviceId,
    this.serverUpdatedAt = const Value.absent(),
    this.mediaId = const Value.absent(),
    required String kind,
    required DateTime eventDate,
    this.title = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId),
       kind = Value(kind),
       eventDate = Value(eventDate);
  static Insertable<CalendarEventRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? revision,
    Expression<int>? baseRevision,
    Expression<String>? deviceId,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? mediaId,
    Expression<String>? kind,
    Expression<DateTime>? eventDate,
    Expression<String>? title,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (revision != null) 'revision': revision,
      if (baseRevision != null) 'base_revision': baseRevision,
      if (deviceId != null) 'device_id': deviceId,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (mediaId != null) 'media_id': mediaId,
      if (kind != null) 'kind': kind,
      if (eventDate != null) 'event_date': eventDate,
      if (title != null) 'title': title,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? revision,
    Value<int>? baseRevision,
    Value<String>? deviceId,
    Value<DateTime?>? serverUpdatedAt,
    Value<String?>? mediaId,
    Value<String>? kind,
    Value<DateTime>? eventDate,
    Value<String?>? title,
    Value<int>? rowid,
  }) {
    return CalendarEventsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      revision: revision ?? this.revision,
      baseRevision: baseRevision ?? this.baseRevision,
      deviceId: deviceId ?? this.deviceId,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      mediaId: mediaId ?? this.mediaId,
      kind: kind ?? this.kind,
      eventDate: eventDate ?? this.eventDate,
      title: title ?? this.title,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (baseRevision.present) {
      map['base_revision'] = Variable<int>(baseRevision.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (eventDate.present) {
      map['event_date'] = Variable<DateTime>(eventDate.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('revision: $revision, ')
          ..write('baseRevision: $baseRevision, ')
          ..write('deviceId: $deviceId, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('mediaId: $mediaId, ')
          ..write('kind: $kind, ')
          ..write('eventDate: $eventDate, ')
          ..write('title: $title, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    check: () => operation.isIn(const ['upsert', 'delete']),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localRevisionMeta = const VerificationMeta(
    'localRevision',
  );
  @override
  late final GeneratedColumn<int> localRevision = GeneratedColumn<int>(
    'local_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _attemptCountMeta = const VerificationMeta(
    'attemptCount',
  );
  @override
  late final GeneratedColumn<int> attemptCount = GeneratedColumn<int>(
    'attempt_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextAttemptAtMeta = const VerificationMeta(
    'nextAttemptAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextAttemptAt =
      GeneratedColumn<DateTime>(
        'next_attempt_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    operation,
    localRevision,
    status,
    attemptCount,
    nextAttemptAt,
    lastError,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('local_revision')) {
      context.handle(
        _localRevisionMeta,
        localRevision.isAcceptableOrUnknown(
          data['local_revision']!,
          _localRevisionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localRevisionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('attempt_count')) {
      context.handle(
        _attemptCountMeta,
        attemptCount.isAcceptableOrUnknown(
          data['attempt_count']!,
          _attemptCountMeta,
        ),
      );
    }
    if (data.containsKey('next_attempt_at')) {
      context.handle(
        _nextAttemptAtMeta,
        nextAttemptAt.isAcceptableOrUnknown(
          data['next_attempt_at']!,
          _nextAttemptAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextAttemptAtMeta);
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {entityType, entityId},
  ];
  @override
  SyncQueueRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      localRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_revision'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      attemptCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempt_count'],
      )!,
      nextAttemptAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_attempt_at'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueRow extends DataClass implements Insertable<SyncQueueRow> {
  final int id;
  final String entityType;
  final String entityId;
  final String operation;
  final int localRevision;
  final String status;
  final int attemptCount;
  final DateTime nextAttemptAt;
  final String? lastError;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SyncQueueRow({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.operation,
    required this.localRevision,
    required this.status,
    required this.attemptCount,
    required this.nextAttemptAt,
    this.lastError,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['operation'] = Variable<String>(operation);
    map['local_revision'] = Variable<int>(localRevision);
    map['status'] = Variable<String>(status);
    map['attempt_count'] = Variable<int>(attemptCount);
    map['next_attempt_at'] = Variable<DateTime>(nextAttemptAt);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      operation: Value(operation),
      localRevision: Value(localRevision),
      status: Value(status),
      attemptCount: Value(attemptCount),
      nextAttemptAt: Value(nextAttemptAt),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncQueueRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueRow(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      operation: serializer.fromJson<String>(json['operation']),
      localRevision: serializer.fromJson<int>(json['localRevision']),
      status: serializer.fromJson<String>(json['status']),
      attemptCount: serializer.fromJson<int>(json['attemptCount']),
      nextAttemptAt: serializer.fromJson<DateTime>(json['nextAttemptAt']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'operation': serializer.toJson<String>(operation),
      'localRevision': serializer.toJson<int>(localRevision),
      'status': serializer.toJson<String>(status),
      'attemptCount': serializer.toJson<int>(attemptCount),
      'nextAttemptAt': serializer.toJson<DateTime>(nextAttemptAt),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncQueueRow copyWith({
    int? id,
    String? entityType,
    String? entityId,
    String? operation,
    int? localRevision,
    String? status,
    int? attemptCount,
    DateTime? nextAttemptAt,
    Value<String?> lastError = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SyncQueueRow(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    operation: operation ?? this.operation,
    localRevision: localRevision ?? this.localRevision,
    status: status ?? this.status,
    attemptCount: attemptCount ?? this.attemptCount,
    nextAttemptAt: nextAttemptAt ?? this.nextAttemptAt,
    lastError: lastError.present ? lastError.value : this.lastError,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncQueueRow copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueRow(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      operation: data.operation.present ? data.operation.value : this.operation,
      localRevision: data.localRevision.present
          ? data.localRevision.value
          : this.localRevision,
      status: data.status.present ? data.status.value : this.status,
      attemptCount: data.attemptCount.present
          ? data.attemptCount.value
          : this.attemptCount,
      nextAttemptAt: data.nextAttemptAt.present
          ? data.nextAttemptAt.value
          : this.nextAttemptAt,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueRow(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('localRevision: $localRevision, ')
          ..write('status: $status, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('nextAttemptAt: $nextAttemptAt, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    operation,
    localRevision,
    status,
    attemptCount,
    nextAttemptAt,
    lastError,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueRow &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.operation == this.operation &&
          other.localRevision == this.localRevision &&
          other.status == this.status &&
          other.attemptCount == this.attemptCount &&
          other.nextAttemptAt == this.nextAttemptAt &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueRow> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> operation;
  final Value<int> localRevision;
  final Value<String> status;
  final Value<int> attemptCount;
  final Value<DateTime> nextAttemptAt;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.operation = const Value.absent(),
    this.localRevision = const Value.absent(),
    this.status = const Value.absent(),
    this.attemptCount = const Value.absent(),
    this.nextAttemptAt = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityId,
    required String operation,
    required int localRevision,
    this.status = const Value.absent(),
    this.attemptCount = const Value.absent(),
    required DateTime nextAttemptAt,
    this.lastError = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : entityType = Value(entityType),
       entityId = Value(entityId),
       operation = Value(operation),
       localRevision = Value(localRevision),
       nextAttemptAt = Value(nextAttemptAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SyncQueueRow> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? operation,
    Expression<int>? localRevision,
    Expression<String>? status,
    Expression<int>? attemptCount,
    Expression<DateTime>? nextAttemptAt,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (operation != null) 'operation': operation,
      if (localRevision != null) 'local_revision': localRevision,
      if (status != null) 'status': status,
      if (attemptCount != null) 'attempt_count': attemptCount,
      if (nextAttemptAt != null) 'next_attempt_at': nextAttemptAt,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SyncQueueCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? operation,
    Value<int>? localRevision,
    Value<String>? status,
    Value<int>? attemptCount,
    Value<DateTime>? nextAttemptAt,
    Value<String?>? lastError,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      operation: operation ?? this.operation,
      localRevision: localRevision ?? this.localRevision,
      status: status ?? this.status,
      attemptCount: attemptCount ?? this.attemptCount,
      nextAttemptAt: nextAttemptAt ?? this.nextAttemptAt,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (localRevision.present) {
      map['local_revision'] = Variable<int>(localRevision.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (attemptCount.present) {
      map['attempt_count'] = Variable<int>(attemptCount.value);
    }
    if (nextAttemptAt.present) {
      map['next_attempt_at'] = Variable<DateTime>(nextAttemptAt.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('localRevision: $localRevision, ')
          ..write('status: $status, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('nextAttemptAt: $nextAttemptAt, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataTable extends SyncMetadata
    with TableInfo<$SyncMetadataTable, SyncMetadataRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _metaKeyMeta = const VerificationMeta(
    'metaKey',
  );
  @override
  late final GeneratedColumn<String> metaKey = GeneratedColumn<String>(
    'meta_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metaValueMeta = const VerificationMeta(
    'metaValue',
  );
  @override
  late final GeneratedColumn<String> metaValue = GeneratedColumn<String>(
    'meta_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [metaKey, metaValue, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetadataRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meta_key')) {
      context.handle(
        _metaKeyMeta,
        metaKey.isAcceptableOrUnknown(data['meta_key']!, _metaKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_metaKeyMeta);
    }
    if (data.containsKey('meta_value')) {
      context.handle(
        _metaValueMeta,
        metaValue.isAcceptableOrUnknown(data['meta_value']!, _metaValueMeta),
      );
    } else if (isInserting) {
      context.missing(_metaValueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {metaKey};
  @override
  SyncMetadataRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataRow(
      metaKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meta_key'],
      )!,
      metaValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meta_value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncMetadataTable createAlias(String alias) {
    return $SyncMetadataTable(attachedDatabase, alias);
  }
}

class SyncMetadataRow extends DataClass implements Insertable<SyncMetadataRow> {
  final String metaKey;
  final String metaValue;
  final DateTime updatedAt;
  const SyncMetadataRow({
    required this.metaKey,
    required this.metaValue,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['meta_key'] = Variable<String>(metaKey);
    map['meta_value'] = Variable<String>(metaValue);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncMetadataCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataCompanion(
      metaKey: Value(metaKey),
      metaValue: Value(metaValue),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncMetadataRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataRow(
      metaKey: serializer.fromJson<String>(json['metaKey']),
      metaValue: serializer.fromJson<String>(json['metaValue']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'metaKey': serializer.toJson<String>(metaKey),
      'metaValue': serializer.toJson<String>(metaValue),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncMetadataRow copyWith({
    String? metaKey,
    String? metaValue,
    DateTime? updatedAt,
  }) => SyncMetadataRow(
    metaKey: metaKey ?? this.metaKey,
    metaValue: metaValue ?? this.metaValue,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncMetadataRow copyWithCompanion(SyncMetadataCompanion data) {
    return SyncMetadataRow(
      metaKey: data.metaKey.present ? data.metaKey.value : this.metaKey,
      metaValue: data.metaValue.present ? data.metaValue.value : this.metaValue,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataRow(')
          ..write('metaKey: $metaKey, ')
          ..write('metaValue: $metaValue, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(metaKey, metaValue, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataRow &&
          other.metaKey == this.metaKey &&
          other.metaValue == this.metaValue &&
          other.updatedAt == this.updatedAt);
}

class SyncMetadataCompanion extends UpdateCompanion<SyncMetadataRow> {
  final Value<String> metaKey;
  final Value<String> metaValue;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncMetadataCompanion({
    this.metaKey = const Value.absent(),
    this.metaValue = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadataCompanion.insert({
    required String metaKey,
    required String metaValue,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : metaKey = Value(metaKey),
       metaValue = Value(metaValue),
       updatedAt = Value(updatedAt);
  static Insertable<SyncMetadataRow> custom({
    Expression<String>? metaKey,
    Expression<String>? metaValue,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (metaKey != null) 'meta_key': metaKey,
      if (metaValue != null) 'meta_value': metaValue,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadataCompanion copyWith({
    Value<String>? metaKey,
    Value<String>? metaValue,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SyncMetadataCompanion(
      metaKey: metaKey ?? this.metaKey,
      metaValue: metaValue ?? this.metaValue,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (metaKey.present) {
      map['meta_key'] = Variable<String>(metaKey.value);
    }
    if (metaValue.present) {
      map['meta_value'] = Variable<String>(metaValue.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataCompanion(')
          ..write('metaKey: $metaKey, ')
          ..write('metaValue: $metaValue, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BackupHistoryTable extends BackupHistory
    with TableInfo<$BackupHistoryTable, BackupHistoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _storagePathMeta = const VerificationMeta(
    'storagePath',
  );
  @override
  late final GeneratedColumn<String> storagePath = GeneratedColumn<String>(
    'storage_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sizeBytesMeta = const VerificationMeta(
    'sizeBytes',
  );
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
    'size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _checksumSha256Meta = const VerificationMeta(
    'checksumSha256',
  );
  @override
  late final GeneratedColumn<String> checksumSha256 = GeneratedColumn<String>(
    'checksum_sha256',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _backupVersionMeta = const VerificationMeta(
    'backupVersion',
  );
  @override
  late final GeneratedColumn<int> backupVersion = GeneratedColumn<int>(
    'backup_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countsMeta = const VerificationMeta('counts');
  @override
  late final GeneratedColumn<String> counts = GeneratedColumn<String>(
    'counts',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  static const VerificationMeta _errorMeta = const VerificationMeta('error');
  @override
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
    'error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kind,
    status,
    storagePath,
    fileName,
    sizeBytes,
    checksumSha256,
    backupVersion,
    appVersion,
    schemaVersion,
    counts,
    error,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backup_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<BackupHistoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('storage_path')) {
      context.handle(
        _storagePathMeta,
        storagePath.isAcceptableOrUnknown(
          data['storage_path']!,
          _storagePathMeta,
        ),
      );
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    }
    if (data.containsKey('size_bytes')) {
      context.handle(
        _sizeBytesMeta,
        sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta),
      );
    }
    if (data.containsKey('checksum_sha256')) {
      context.handle(
        _checksumSha256Meta,
        checksumSha256.isAcceptableOrUnknown(
          data['checksum_sha256']!,
          _checksumSha256Meta,
        ),
      );
    }
    if (data.containsKey('backup_version')) {
      context.handle(
        _backupVersionMeta,
        backupVersion.isAcceptableOrUnknown(
          data['backup_version']!,
          _backupVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_backupVersionMeta);
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    } else if (isInserting) {
      context.missing(_appVersionMeta);
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_schemaVersionMeta);
    }
    if (data.containsKey('counts')) {
      context.handle(
        _countsMeta,
        counts.isAcceptableOrUnknown(data['counts']!, _countsMeta),
      );
    }
    if (data.containsKey('error')) {
      context.handle(
        _errorMeta,
        error.isAcceptableOrUnknown(data['error']!, _errorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupHistoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupHistoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      storagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}storage_path'],
      ),
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      ),
      sizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size_bytes'],
      )!,
      checksumSha256: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checksum_sha256'],
      ),
      backupVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}backup_version'],
      )!,
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      counts: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}counts'],
      )!,
      error: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BackupHistoryTable createAlias(String alias) {
    return $BackupHistoryTable(attachedDatabase, alias);
  }
}

class BackupHistoryRow extends DataClass
    implements Insertable<BackupHistoryRow> {
  final String id;
  final String kind;
  final String status;
  final String? storagePath;
  final String? fileName;
  final int sizeBytes;
  final String? checksumSha256;
  final int backupVersion;
  final String appVersion;
  final int schemaVersion;

  /// JSON object with per-entity counts.
  final String counts;
  final String? error;
  final DateTime createdAt;
  const BackupHistoryRow({
    required this.id,
    required this.kind,
    required this.status,
    this.storagePath,
    this.fileName,
    required this.sizeBytes,
    this.checksumSha256,
    required this.backupVersion,
    required this.appVersion,
    required this.schemaVersion,
    required this.counts,
    this.error,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['kind'] = Variable<String>(kind);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || storagePath != null) {
      map['storage_path'] = Variable<String>(storagePath);
    }
    if (!nullToAbsent || fileName != null) {
      map['file_name'] = Variable<String>(fileName);
    }
    map['size_bytes'] = Variable<int>(sizeBytes);
    if (!nullToAbsent || checksumSha256 != null) {
      map['checksum_sha256'] = Variable<String>(checksumSha256);
    }
    map['backup_version'] = Variable<int>(backupVersion);
    map['app_version'] = Variable<String>(appVersion);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['counts'] = Variable<String>(counts);
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<String>(error);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BackupHistoryCompanion toCompanion(bool nullToAbsent) {
    return BackupHistoryCompanion(
      id: Value(id),
      kind: Value(kind),
      status: Value(status),
      storagePath: storagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(storagePath),
      fileName: fileName == null && nullToAbsent
          ? const Value.absent()
          : Value(fileName),
      sizeBytes: Value(sizeBytes),
      checksumSha256: checksumSha256 == null && nullToAbsent
          ? const Value.absent()
          : Value(checksumSha256),
      backupVersion: Value(backupVersion),
      appVersion: Value(appVersion),
      schemaVersion: Value(schemaVersion),
      counts: Value(counts),
      error: error == null && nullToAbsent
          ? const Value.absent()
          : Value(error),
      createdAt: Value(createdAt),
    );
  }

  factory BackupHistoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupHistoryRow(
      id: serializer.fromJson<String>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      status: serializer.fromJson<String>(json['status']),
      storagePath: serializer.fromJson<String?>(json['storagePath']),
      fileName: serializer.fromJson<String?>(json['fileName']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      checksumSha256: serializer.fromJson<String?>(json['checksumSha256']),
      backupVersion: serializer.fromJson<int>(json['backupVersion']),
      appVersion: serializer.fromJson<String>(json['appVersion']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      counts: serializer.fromJson<String>(json['counts']),
      error: serializer.fromJson<String?>(json['error']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'kind': serializer.toJson<String>(kind),
      'status': serializer.toJson<String>(status),
      'storagePath': serializer.toJson<String?>(storagePath),
      'fileName': serializer.toJson<String?>(fileName),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'checksumSha256': serializer.toJson<String?>(checksumSha256),
      'backupVersion': serializer.toJson<int>(backupVersion),
      'appVersion': serializer.toJson<String>(appVersion),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'counts': serializer.toJson<String>(counts),
      'error': serializer.toJson<String?>(error),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BackupHistoryRow copyWith({
    String? id,
    String? kind,
    String? status,
    Value<String?> storagePath = const Value.absent(),
    Value<String?> fileName = const Value.absent(),
    int? sizeBytes,
    Value<String?> checksumSha256 = const Value.absent(),
    int? backupVersion,
    String? appVersion,
    int? schemaVersion,
    String? counts,
    Value<String?> error = const Value.absent(),
    DateTime? createdAt,
  }) => BackupHistoryRow(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    status: status ?? this.status,
    storagePath: storagePath.present ? storagePath.value : this.storagePath,
    fileName: fileName.present ? fileName.value : this.fileName,
    sizeBytes: sizeBytes ?? this.sizeBytes,
    checksumSha256: checksumSha256.present
        ? checksumSha256.value
        : this.checksumSha256,
    backupVersion: backupVersion ?? this.backupVersion,
    appVersion: appVersion ?? this.appVersion,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    counts: counts ?? this.counts,
    error: error.present ? error.value : this.error,
    createdAt: createdAt ?? this.createdAt,
  );
  BackupHistoryRow copyWithCompanion(BackupHistoryCompanion data) {
    return BackupHistoryRow(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      status: data.status.present ? data.status.value : this.status,
      storagePath: data.storagePath.present
          ? data.storagePath.value
          : this.storagePath,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      checksumSha256: data.checksumSha256.present
          ? data.checksumSha256.value
          : this.checksumSha256,
      backupVersion: data.backupVersion.present
          ? data.backupVersion.value
          : this.backupVersion,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      counts: data.counts.present ? data.counts.value : this.counts,
      error: data.error.present ? data.error.value : this.error,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupHistoryRow(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('status: $status, ')
          ..write('storagePath: $storagePath, ')
          ..write('fileName: $fileName, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('checksumSha256: $checksumSha256, ')
          ..write('backupVersion: $backupVersion, ')
          ..write('appVersion: $appVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('counts: $counts, ')
          ..write('error: $error, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    kind,
    status,
    storagePath,
    fileName,
    sizeBytes,
    checksumSha256,
    backupVersion,
    appVersion,
    schemaVersion,
    counts,
    error,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupHistoryRow &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.status == this.status &&
          other.storagePath == this.storagePath &&
          other.fileName == this.fileName &&
          other.sizeBytes == this.sizeBytes &&
          other.checksumSha256 == this.checksumSha256 &&
          other.backupVersion == this.backupVersion &&
          other.appVersion == this.appVersion &&
          other.schemaVersion == this.schemaVersion &&
          other.counts == this.counts &&
          other.error == this.error &&
          other.createdAt == this.createdAt);
}

class BackupHistoryCompanion extends UpdateCompanion<BackupHistoryRow> {
  final Value<String> id;
  final Value<String> kind;
  final Value<String> status;
  final Value<String?> storagePath;
  final Value<String?> fileName;
  final Value<int> sizeBytes;
  final Value<String?> checksumSha256;
  final Value<int> backupVersion;
  final Value<String> appVersion;
  final Value<int> schemaVersion;
  final Value<String> counts;
  final Value<String?> error;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BackupHistoryCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.status = const Value.absent(),
    this.storagePath = const Value.absent(),
    this.fileName = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.checksumSha256 = const Value.absent(),
    this.backupVersion = const Value.absent(),
    this.appVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.counts = const Value.absent(),
    this.error = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BackupHistoryCompanion.insert({
    required String id,
    required String kind,
    required String status,
    this.storagePath = const Value.absent(),
    this.fileName = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.checksumSha256 = const Value.absent(),
    required int backupVersion,
    required String appVersion,
    required int schemaVersion,
    this.counts = const Value.absent(),
    this.error = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       status = Value(status),
       backupVersion = Value(backupVersion),
       appVersion = Value(appVersion),
       schemaVersion = Value(schemaVersion),
       createdAt = Value(createdAt);
  static Insertable<BackupHistoryRow> custom({
    Expression<String>? id,
    Expression<String>? kind,
    Expression<String>? status,
    Expression<String>? storagePath,
    Expression<String>? fileName,
    Expression<int>? sizeBytes,
    Expression<String>? checksumSha256,
    Expression<int>? backupVersion,
    Expression<String>? appVersion,
    Expression<int>? schemaVersion,
    Expression<String>? counts,
    Expression<String>? error,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (status != null) 'status': status,
      if (storagePath != null) 'storage_path': storagePath,
      if (fileName != null) 'file_name': fileName,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (checksumSha256 != null) 'checksum_sha256': checksumSha256,
      if (backupVersion != null) 'backup_version': backupVersion,
      if (appVersion != null) 'app_version': appVersion,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (counts != null) 'counts': counts,
      if (error != null) 'error': error,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BackupHistoryCompanion copyWith({
    Value<String>? id,
    Value<String>? kind,
    Value<String>? status,
    Value<String?>? storagePath,
    Value<String?>? fileName,
    Value<int>? sizeBytes,
    Value<String?>? checksumSha256,
    Value<int>? backupVersion,
    Value<String>? appVersion,
    Value<int>? schemaVersion,
    Value<String>? counts,
    Value<String?>? error,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return BackupHistoryCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      status: status ?? this.status,
      storagePath: storagePath ?? this.storagePath,
      fileName: fileName ?? this.fileName,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      checksumSha256: checksumSha256 ?? this.checksumSha256,
      backupVersion: backupVersion ?? this.backupVersion,
      appVersion: appVersion ?? this.appVersion,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      counts: counts ?? this.counts,
      error: error ?? this.error,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (storagePath.present) {
      map['storage_path'] = Variable<String>(storagePath.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (checksumSha256.present) {
      map['checksum_sha256'] = Variable<String>(checksumSha256.value);
    }
    if (backupVersion.present) {
      map['backup_version'] = Variable<int>(backupVersion.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (counts.present) {
      map['counts'] = Variable<String>(counts.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupHistoryCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('status: $status, ')
          ..write('storagePath: $storagePath, ')
          ..write('fileName: $fileName, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('checksumSha256: $checksumSha256, ')
          ..write('backupVersion: $backupVersion, ')
          ..write('appVersion: $appVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('counts: $counts, ')
          ..write('error: $error, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedMediaMetadataTable extends CachedMediaMetadata
    with TableInfo<$CachedMediaMetadataTable, CachedMetadataRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedMediaMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cacheKeyMeta = const VerificationMeta(
    'cacheKey',
  );
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
    'cache_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _responseJsonMeta = const VerificationMeta(
    'responseJson',
  );
  @override
  late final GeneratedColumn<String> responseJson = GeneratedColumn<String>(
    'response_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _etagMeta = const VerificationMeta('etag');
  @override
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    cacheKey,
    responseJson,
    etag,
    fetchedAt,
    expiresAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_media_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedMetadataRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cache_key')) {
      context.handle(
        _cacheKeyMeta,
        cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
    }
    if (data.containsKey('response_json')) {
      context.handle(
        _responseJsonMeta,
        responseJson.isAcceptableOrUnknown(
          data['response_json']!,
          _responseJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_responseJsonMeta);
    }
    if (data.containsKey('etag')) {
      context.handle(
        _etagMeta,
        etag.isAcceptableOrUnknown(data['etag']!, _etagMeta),
      );
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  CachedMetadataRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedMetadataRow(
      cacheKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cache_key'],
      )!,
      responseJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}response_json'],
      )!,
      etag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}etag'],
      ),
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $CachedMediaMetadataTable createAlias(String alias) {
    return $CachedMediaMetadataTable(attachedDatabase, alias);
  }
}

class CachedMetadataRow extends DataClass
    implements Insertable<CachedMetadataRow> {
  final String cacheKey;
  final String responseJson;
  final String? etag;
  final DateTime fetchedAt;
  final DateTime expiresAt;
  const CachedMetadataRow({
    required this.cacheKey,
    required this.responseJson,
    this.etag,
    required this.fetchedAt,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cache_key'] = Variable<String>(cacheKey);
    map['response_json'] = Variable<String>(responseJson);
    if (!nullToAbsent || etag != null) {
      map['etag'] = Variable<String>(etag);
    }
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  CachedMediaMetadataCompanion toCompanion(bool nullToAbsent) {
    return CachedMediaMetadataCompanion(
      cacheKey: Value(cacheKey),
      responseJson: Value(responseJson),
      etag: etag == null && nullToAbsent ? const Value.absent() : Value(etag),
      fetchedAt: Value(fetchedAt),
      expiresAt: Value(expiresAt),
    );
  }

  factory CachedMetadataRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedMetadataRow(
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      responseJson: serializer.fromJson<String>(json['responseJson']),
      etag: serializer.fromJson<String?>(json['etag']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cacheKey': serializer.toJson<String>(cacheKey),
      'responseJson': serializer.toJson<String>(responseJson),
      'etag': serializer.toJson<String?>(etag),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  CachedMetadataRow copyWith({
    String? cacheKey,
    String? responseJson,
    Value<String?> etag = const Value.absent(),
    DateTime? fetchedAt,
    DateTime? expiresAt,
  }) => CachedMetadataRow(
    cacheKey: cacheKey ?? this.cacheKey,
    responseJson: responseJson ?? this.responseJson,
    etag: etag.present ? etag.value : this.etag,
    fetchedAt: fetchedAt ?? this.fetchedAt,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  CachedMetadataRow copyWithCompanion(CachedMediaMetadataCompanion data) {
    return CachedMetadataRow(
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      responseJson: data.responseJson.present
          ? data.responseJson.value
          : this.responseJson,
      etag: data.etag.present ? data.etag.value : this.etag,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedMetadataRow(')
          ..write('cacheKey: $cacheKey, ')
          ..write('responseJson: $responseJson, ')
          ..write('etag: $etag, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(cacheKey, responseJson, etag, fetchedAt, expiresAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedMetadataRow &&
          other.cacheKey == this.cacheKey &&
          other.responseJson == this.responseJson &&
          other.etag == this.etag &&
          other.fetchedAt == this.fetchedAt &&
          other.expiresAt == this.expiresAt);
}

class CachedMediaMetadataCompanion extends UpdateCompanion<CachedMetadataRow> {
  final Value<String> cacheKey;
  final Value<String> responseJson;
  final Value<String?> etag;
  final Value<DateTime> fetchedAt;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const CachedMediaMetadataCompanion({
    this.cacheKey = const Value.absent(),
    this.responseJson = const Value.absent(),
    this.etag = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedMediaMetadataCompanion.insert({
    required String cacheKey,
    required String responseJson,
    this.etag = const Value.absent(),
    required DateTime fetchedAt,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : cacheKey = Value(cacheKey),
       responseJson = Value(responseJson),
       fetchedAt = Value(fetchedAt),
       expiresAt = Value(expiresAt);
  static Insertable<CachedMetadataRow> custom({
    Expression<String>? cacheKey,
    Expression<String>? responseJson,
    Expression<String>? etag,
    Expression<DateTime>? fetchedAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cacheKey != null) 'cache_key': cacheKey,
      if (responseJson != null) 'response_json': responseJson,
      if (etag != null) 'etag': etag,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedMediaMetadataCompanion copyWith({
    Value<String>? cacheKey,
    Value<String>? responseJson,
    Value<String?>? etag,
    Value<DateTime>? fetchedAt,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return CachedMediaMetadataCompanion(
      cacheKey: cacheKey ?? this.cacheKey,
      responseJson: responseJson ?? this.responseJson,
      etag: etag ?? this.etag,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
    }
    if (responseJson.present) {
      map['response_json'] = Variable<String>(responseJson.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedMediaMetadataCompanion(')
          ..write('cacheKey: $cacheKey, ')
          ..write('responseJson: $responseJson, ')
          ..write('etag: $etag, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $MediaTable media = $MediaTable(this);
  late final $AlternativeTitlesTable alternativeTitles =
      $AlternativeTitlesTable(this);
  late final $GenresTable genres = $GenresTable(this);
  late final $MediaGenresTable mediaGenres = $MediaGenresTable(this);
  late final $PeopleTable people = $PeopleTable(this);
  late final $MediaCreditsTable mediaCredits = $MediaCreditsTable(this);
  late final $SeasonsTable seasons = $SeasonsTable(this);
  late final $EpisodesTable episodes = $EpisodesTable(this);
  late final $UserLibraryTable userLibrary = $UserLibraryTable(this);
  late final $WatchHistoryTable watchHistory = $WatchHistoryTable(this);
  late final $UserRatingsTable userRatings = $UserRatingsTable(this);
  late final $UserNotesTable userNotes = $UserNotesTable(this);
  late final $WatchlistItemsTable watchlistItems = $WatchlistItemsTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $CustomCollectionsTable customCollections =
      $CustomCollectionsTable(this);
  late final $CollectionItemsTable collectionItems = $CollectionItemsTable(
    this,
  );
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $CalendarEventsTable calendarEvents = $CalendarEventsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $SyncMetadataTable syncMetadata = $SyncMetadataTable(this);
  late final $BackupHistoryTable backupHistory = $BackupHistoryTable(this);
  late final $CachedMediaMetadataTable cachedMediaMetadata =
      $CachedMediaMetadataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    appSettings,
    media,
    alternativeTitles,
    genres,
    mediaGenres,
    people,
    mediaCredits,
    seasons,
    episodes,
    userLibrary,
    watchHistory,
    userRatings,
    userNotes,
    watchlistItems,
    favorites,
    customCollections,
    collectionItems,
    reminders,
    calendarEvents,
    syncQueue,
    syncMetadata,
    backupHistory,
    cachedMediaMetadata,
  ];
}

typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String settingKey,
      required String settingValue,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> settingKey,
      Value<String> settingValue,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get settingValue => $composableBuilder(
    column: $table.settingValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settingValue => $composableBuilder(
    column: $table.settingValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get settingValue => $composableBuilder(
    column: $table.settingValue,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSettingRow,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSettingRow,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSettingRow>,
          ),
          AppSettingRow,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> settingKey = const Value.absent(),
                Value<String> settingValue = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                settingKey: settingKey,
                settingValue: settingValue,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String settingKey,
                required String settingValue,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                settingKey: settingKey,
                settingValue: settingValue,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AppSettingsTable, AppSettingRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $AppSettingsTable,
                    AppSettingRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSettingRow,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSettingRow,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSettingRow>,
      ),
      AppSettingRow,
      PrefetchHooks Function()
    >;
typedef $$MediaTableCreateCompanionBuilder = MediaCompanion Function({
  required String id,
  required String provider,
  required String providerId,
  required String mediaType,
  Value<String?> animeFormat,
  required String title,
  Value<String?> originalTitle,
  Value<String?> overview,
  Value<String?> tagline,
  Value<DateTime?> releaseDate,
  Value<DateTime?> endDate,
  Value<String?> status,
  Value<int?> runtimeMinutes,
  Value<String?> originalLanguage,
  Value<String> originCountries,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  Value<double?> externalRating,
  Value<int?> externalVoteCount,
  Value<int?> seasonCount,
  Value<int?> episodeCount,
  Value<String?> animeSeason,
  Value<int?> animeSeasonYear,
  Value<String> metadataLanguage,
  Value<DateTime?> metadataFetchedAt,
  Value<bool> isManual,
  Value<String?> ownerUserId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> revision,
  Value<int> baseRevision,
  Value<String?> deviceId,
  Value<int> rowid,
});
typedef $$MediaTableUpdateCompanionBuilder = MediaCompanion Function({
  Value<String> id,
  Value<String> provider,
  Value<String> providerId,
  Value<String> mediaType,
  Value<String?> animeFormat,
  Value<String> title,
  Value<String?> originalTitle,
  Value<String?> overview,
  Value<String?> tagline,
  Value<DateTime?> releaseDate,
  Value<DateTime?> endDate,
  Value<String?> status,
  Value<int?> runtimeMinutes,
  Value<String?> originalLanguage,
  Value<String> originCountries,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  Value<double?> externalRating,
  Value<int?> externalVoteCount,
  Value<int?> seasonCount,
  Value<int?> episodeCount,
  Value<String?> animeSeason,
  Value<int?> animeSeasonYear,
  Value<String> metadataLanguage,
  Value<DateTime?> metadataFetchedAt,
  Value<bool> isManual,
  Value<String?> ownerUserId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> revision,
  Value<int> baseRevision,
  Value<String?> deviceId,
  Value<int> rowid,
});

final class $$MediaTableReferences
    extends BaseReferences<_$AppDatabase, $MediaTable, MediaRow> {
  $$MediaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AlternativeTitlesTable, List<AlternativeTitleRow>>
  _alternativeTitlesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.alternativeTitles,
        aliasName: 'media__id__alternative_titles__media_id',
      );

  $$AlternativeTitlesTableProcessedTableManager get alternativeTitlesRefs {
    final manager = $$AlternativeTitlesTableTableManager(
      $_db,
      $_db.alternativeTitles,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _alternativeTitlesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MediaGenresTable, List<MediaGenreRow>>
  _mediaGenresRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mediaGenres,
    aliasName: 'media__id__media_genres__media_id',
  );

  $$MediaGenresTableProcessedTableManager get mediaGenresRefs {
    final manager = $$MediaGenresTableTableManager(
      $_db,
      $_db.mediaGenres,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaGenresRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MediaCreditsTable, List<MediaCreditRow>>
  _mediaCreditsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mediaCredits,
    aliasName: 'media__id__media_credits__media_id',
  );

  $$MediaCreditsTableProcessedTableManager get mediaCreditsRefs {
    final manager = $$MediaCreditsTableTableManager(
      $_db,
      $_db.mediaCredits,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaCreditsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SeasonsTable, List<SeasonRow>> _seasonsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.seasons,
    aliasName: 'media__id__seasons__media_id',
  );

  $$SeasonsTableProcessedTableManager get seasonsRefs {
    final manager = $$SeasonsTableTableManager(
      $_db,
      $_db.seasons,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_seasonsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EpisodesTable, List<EpisodeRow>>
  _episodesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.episodes,
    aliasName: 'media__id__episodes__media_id',
  );

  $$EpisodesTableProcessedTableManager get episodesRefs {
    final manager = $$EpisodesTableTableManager(
      $_db,
      $_db.episodes,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_episodesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserLibraryTable, List<LibraryRow>>
  _userLibraryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userLibrary,
    aliasName: 'media__id__user_library__media_id',
  );

  $$UserLibraryTableProcessedTableManager get userLibraryRefs {
    final manager = $$UserLibraryTableTableManager(
      $_db,
      $_db.userLibrary,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_userLibraryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WatchHistoryTable, List<WatchHistoryRow>>
  _watchHistoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.watchHistory,
    aliasName: 'media__id__watch_history__media_id',
  );

  $$WatchHistoryTableProcessedTableManager get watchHistoryRefs {
    final manager = $$WatchHistoryTableTableManager(
      $_db,
      $_db.watchHistory,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_watchHistoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserRatingsTable, List<RatingRow>>
  _userRatingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userRatings,
    aliasName: 'media__id__user_ratings__media_id',
  );

  $$UserRatingsTableProcessedTableManager get userRatingsRefs {
    final manager = $$UserRatingsTableTableManager(
      $_db,
      $_db.userRatings,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_userRatingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserNotesTable, List<NoteRow>>
  _userNotesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userNotes,
    aliasName: 'media__id__user_notes__media_id',
  );

  $$UserNotesTableProcessedTableManager get userNotesRefs {
    final manager = $$UserNotesTableTableManager(
      $_db,
      $_db.userNotes,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_userNotesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WatchlistItemsTable, List<WatchlistRow>>
  _watchlistItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.watchlistItems,
    aliasName: 'media__id__watchlist_items__media_id',
  );

  $$WatchlistItemsTableProcessedTableManager get watchlistItemsRefs {
    final manager = $$WatchlistItemsTableTableManager(
      $_db,
      $_db.watchlistItems,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_watchlistItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FavoritesTable, List<FavoriteRow>>
  _favoritesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.favorites,
    aliasName: 'media__id__favorites__media_id',
  );

  $$FavoritesTableProcessedTableManager get favoritesRefs {
    final manager = $$FavoritesTableTableManager(
      $_db,
      $_db.favorites,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_favoritesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CustomCollectionsTable, List<CollectionRow>>
  _customCollectionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.customCollections,
        aliasName: 'media__id__custom_collections__cover_media_id',
      );

  $$CustomCollectionsTableProcessedTableManager get customCollectionsRefs {
    final manager = $$CustomCollectionsTableTableManager(
      $_db,
      $_db.customCollections,
    ).filter((f) => f.coverMediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _customCollectionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CollectionItemsTable, List<CollectionItemRow>>
  _collectionItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.collectionItems,
    aliasName: 'media__id__collection_items__media_id',
  );

  $$CollectionItemsTableProcessedTableManager get collectionItemsRefs {
    final manager = $$CollectionItemsTableTableManager(
      $_db,
      $_db.collectionItems,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _collectionItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RemindersTable, List<ReminderRow>>
  _remindersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reminders,
    aliasName: 'media__id__reminders__media_id',
  );

  $$RemindersTableProcessedTableManager get remindersRefs {
    final manager = $$RemindersTableTableManager(
      $_db,
      $_db.reminders,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CalendarEventsTable, List<CalendarEventRow>>
  _calendarEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.calendarEvents,
    aliasName: 'media__id__calendar_events__media_id',
  );

  $$CalendarEventsTableProcessedTableManager get calendarEventsRefs {
    final manager = $$CalendarEventsTableTableManager(
      $_db,
      $_db.calendarEvents,
    ).filter((f) => f.mediaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_calendarEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MediaTableFilterComposer extends Composer<_$AppDatabase, $MediaTable> {
  $$MediaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get animeFormat => $composableBuilder(
    column: $table.animeFormat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalTitle => $composableBuilder(
    column: $table.originalTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagline => $composableBuilder(
    column: $table.tagline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get runtimeMinutes => $composableBuilder(
    column: $table.runtimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalLanguage => $composableBuilder(
    column: $table.originalLanguage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originCountries => $composableBuilder(
    column: $table.originCountries,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get externalRating => $composableBuilder(
    column: $table.externalRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get externalVoteCount => $composableBuilder(
    column: $table.externalVoteCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seasonCount => $composableBuilder(
    column: $table.seasonCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episodeCount => $composableBuilder(
    column: $table.episodeCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get animeSeason => $composableBuilder(
    column: $table.animeSeason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get animeSeasonYear => $composableBuilder(
    column: $table.animeSeasonYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadataLanguage => $composableBuilder(
    column: $table.metadataLanguage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get metadataFetchedAt => $composableBuilder(
    column: $table.metadataFetchedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isManual => $composableBuilder(
    column: $table.isManual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> alternativeTitlesRefs(
    Expression<bool> Function($$AlternativeTitlesTableFilterComposer f) f,
  ) {
    final $$AlternativeTitlesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alternativeTitles,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlternativeTitlesTableFilterComposer(
            $db: $db,
            $table: $db.alternativeTitles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mediaGenresRefs(
    Expression<bool> Function($$MediaGenresTableFilterComposer f) f,
  ) {
    final $$MediaGenresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaGenres,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaGenresTableFilterComposer(
            $db: $db,
            $table: $db.mediaGenres,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mediaCreditsRefs(
    Expression<bool> Function($$MediaCreditsTableFilterComposer f) f,
  ) {
    final $$MediaCreditsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaCredits,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaCreditsTableFilterComposer(
            $db: $db,
            $table: $db.mediaCredits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> seasonsRefs(
    Expression<bool> Function($$SeasonsTableFilterComposer f) f,
  ) {
    final $$SeasonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seasons,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeasonsTableFilterComposer(
            $db: $db,
            $table: $db.seasons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> episodesRefs(
    Expression<bool> Function($$EpisodesTableFilterComposer f) f,
  ) {
    final $$EpisodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.episodes,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodesTableFilterComposer(
            $db: $db,
            $table: $db.episodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userLibraryRefs(
    Expression<bool> Function($$UserLibraryTableFilterComposer f) f,
  ) {
    final $$UserLibraryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userLibrary,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLibraryTableFilterComposer(
            $db: $db,
            $table: $db.userLibrary,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> watchHistoryRefs(
    Expression<bool> Function($$WatchHistoryTableFilterComposer f) f,
  ) {
    final $$WatchHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.watchHistory,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WatchHistoryTableFilterComposer(
            $db: $db,
            $table: $db.watchHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userRatingsRefs(
    Expression<bool> Function($$UserRatingsTableFilterComposer f) f,
  ) {
    final $$UserRatingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userRatings,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserRatingsTableFilterComposer(
            $db: $db,
            $table: $db.userRatings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userNotesRefs(
    Expression<bool> Function($$UserNotesTableFilterComposer f) f,
  ) {
    final $$UserNotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userNotes,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserNotesTableFilterComposer(
            $db: $db,
            $table: $db.userNotes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> watchlistItemsRefs(
    Expression<bool> Function($$WatchlistItemsTableFilterComposer f) f,
  ) {
    final $$WatchlistItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.watchlistItems,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WatchlistItemsTableFilterComposer(
            $db: $db,
            $table: $db.watchlistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> favoritesRefs(
    Expression<bool> Function($$FavoritesTableFilterComposer f) f,
  ) {
    final $$FavoritesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableFilterComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> customCollectionsRefs(
    Expression<bool> Function($$CustomCollectionsTableFilterComposer f) f,
  ) {
    final $$CustomCollectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customCollections,
      getReferencedColumn: (t) => t.coverMediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomCollectionsTableFilterComposer(
            $db: $db,
            $table: $db.customCollections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> collectionItemsRefs(
    Expression<bool> Function($$CollectionItemsTableFilterComposer f) f,
  ) {
    final $$CollectionItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionItems,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionItemsTableFilterComposer(
            $db: $db,
            $table: $db.collectionItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> remindersRefs(
    Expression<bool> Function($$RemindersTableFilterComposer f) f,
  ) {
    final $$RemindersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableFilterComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> calendarEventsRefs(
    Expression<bool> Function($$CalendarEventsTableFilterComposer f) f,
  ) {
    final $$CalendarEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.calendarEvents,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CalendarEventsTableFilterComposer(
            $db: $db,
            $table: $db.calendarEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MediaTableOrderingComposer
    extends Composer<_$AppDatabase, $MediaTable> {
  $$MediaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get animeFormat => $composableBuilder(
    column: $table.animeFormat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalTitle => $composableBuilder(
    column: $table.originalTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagline => $composableBuilder(
    column: $table.tagline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get runtimeMinutes => $composableBuilder(
    column: $table.runtimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalLanguage => $composableBuilder(
    column: $table.originalLanguage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originCountries => $composableBuilder(
    column: $table.originCountries,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get externalRating => $composableBuilder(
    column: $table.externalRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get externalVoteCount => $composableBuilder(
    column: $table.externalVoteCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seasonCount => $composableBuilder(
    column: $table.seasonCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodeCount => $composableBuilder(
    column: $table.episodeCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get animeSeason => $composableBuilder(
    column: $table.animeSeason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get animeSeasonYear => $composableBuilder(
    column: $table.animeSeasonYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadataLanguage => $composableBuilder(
    column: $table.metadataLanguage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get metadataFetchedAt => $composableBuilder(
    column: $table.metadataFetchedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isManual => $composableBuilder(
    column: $table.isManual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MediaTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediaTable> {
  $$MediaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<String> get animeFormat => $composableBuilder(
    column: $table.animeFormat,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get originalTitle => $composableBuilder(
    column: $table.originalTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get overview =>
      $composableBuilder(column: $table.overview, builder: (column) => column);

  GeneratedColumn<String> get tagline =>
      $composableBuilder(column: $table.tagline, builder: (column) => column);

  GeneratedColumn<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get runtimeMinutes => $composableBuilder(
    column: $table.runtimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get originalLanguage => $composableBuilder(
    column: $table.originalLanguage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get originCountries => $composableBuilder(
    column: $table.originCountries,
    builder: (column) => column,
  );

  GeneratedColumn<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => column,
  );

  GeneratedColumn<double> get externalRating => $composableBuilder(
    column: $table.externalRating,
    builder: (column) => column,
  );

  GeneratedColumn<int> get externalVoteCount => $composableBuilder(
    column: $table.externalVoteCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get seasonCount => $composableBuilder(
    column: $table.seasonCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get episodeCount => $composableBuilder(
    column: $table.episodeCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get animeSeason => $composableBuilder(
    column: $table.animeSeason,
    builder: (column) => column,
  );

  GeneratedColumn<int> get animeSeasonYear => $composableBuilder(
    column: $table.animeSeasonYear,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metadataLanguage => $composableBuilder(
    column: $table.metadataLanguage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get metadataFetchedAt => $composableBuilder(
    column: $table.metadataFetchedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isManual =>
      $composableBuilder(column: $table.isManual, builder: (column) => column);

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  Expression<T> alternativeTitlesRefs<T extends Object>(
    Expression<T> Function($$AlternativeTitlesTableAnnotationComposer a) f,
  ) {
    final $$AlternativeTitlesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.alternativeTitles,
          getReferencedColumn: (t) => t.mediaId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AlternativeTitlesTableAnnotationComposer(
                $db: $db,
                $table: $db.alternativeTitles,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> mediaGenresRefs<T extends Object>(
    Expression<T> Function($$MediaGenresTableAnnotationComposer a) f,
  ) {
    final $$MediaGenresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaGenres,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaGenresTableAnnotationComposer(
            $db: $db,
            $table: $db.mediaGenres,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mediaCreditsRefs<T extends Object>(
    Expression<T> Function($$MediaCreditsTableAnnotationComposer a) f,
  ) {
    final $$MediaCreditsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaCredits,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaCreditsTableAnnotationComposer(
            $db: $db,
            $table: $db.mediaCredits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> seasonsRefs<T extends Object>(
    Expression<T> Function($$SeasonsTableAnnotationComposer a) f,
  ) {
    final $$SeasonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seasons,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeasonsTableAnnotationComposer(
            $db: $db,
            $table: $db.seasons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> episodesRefs<T extends Object>(
    Expression<T> Function($$EpisodesTableAnnotationComposer a) f,
  ) {
    final $$EpisodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.episodes,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodesTableAnnotationComposer(
            $db: $db,
            $table: $db.episodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userLibraryRefs<T extends Object>(
    Expression<T> Function($$UserLibraryTableAnnotationComposer a) f,
  ) {
    final $$UserLibraryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userLibrary,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLibraryTableAnnotationComposer(
            $db: $db,
            $table: $db.userLibrary,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> watchHistoryRefs<T extends Object>(
    Expression<T> Function($$WatchHistoryTableAnnotationComposer a) f,
  ) {
    final $$WatchHistoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.watchHistory,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WatchHistoryTableAnnotationComposer(
            $db: $db,
            $table: $db.watchHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userRatingsRefs<T extends Object>(
    Expression<T> Function($$UserRatingsTableAnnotationComposer a) f,
  ) {
    final $$UserRatingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userRatings,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserRatingsTableAnnotationComposer(
            $db: $db,
            $table: $db.userRatings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userNotesRefs<T extends Object>(
    Expression<T> Function($$UserNotesTableAnnotationComposer a) f,
  ) {
    final $$UserNotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userNotes,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserNotesTableAnnotationComposer(
            $db: $db,
            $table: $db.userNotes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> watchlistItemsRefs<T extends Object>(
    Expression<T> Function($$WatchlistItemsTableAnnotationComposer a) f,
  ) {
    final $$WatchlistItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.watchlistItems,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WatchlistItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.watchlistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> favoritesRefs<T extends Object>(
    Expression<T> Function($$FavoritesTableAnnotationComposer a) f,
  ) {
    final $$FavoritesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableAnnotationComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> customCollectionsRefs<T extends Object>(
    Expression<T> Function($$CustomCollectionsTableAnnotationComposer a) f,
  ) {
    final $$CustomCollectionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.customCollections,
          getReferencedColumn: (t) => t.coverMediaId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CustomCollectionsTableAnnotationComposer(
                $db: $db,
                $table: $db.customCollections,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> collectionItemsRefs<T extends Object>(
    Expression<T> Function($$CollectionItemsTableAnnotationComposer a) f,
  ) {
    final $$CollectionItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionItems,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.collectionItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> remindersRefs<T extends Object>(
    Expression<T> Function($$RemindersTableAnnotationComposer a) f,
  ) {
    final $$RemindersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableAnnotationComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> calendarEventsRefs<T extends Object>(
    Expression<T> Function($$CalendarEventsTableAnnotationComposer a) f,
  ) {
    final $$CalendarEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.calendarEvents,
      getReferencedColumn: (t) => t.mediaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CalendarEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.calendarEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MediaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MediaTable,
          MediaRow,
          $$MediaTableFilterComposer,
          $$MediaTableOrderingComposer,
          $$MediaTableAnnotationComposer,
          $$MediaTableCreateCompanionBuilder,
          $$MediaTableUpdateCompanionBuilder,
          (MediaRow, $$MediaTableReferences),
          MediaRow,
          PrefetchHooks Function({
            bool alternativeTitlesRefs,
            bool mediaGenresRefs,
            bool mediaCreditsRefs,
            bool seasonsRefs,
            bool episodesRefs,
            bool userLibraryRefs,
            bool watchHistoryRefs,
            bool userRatingsRefs,
            bool userNotesRefs,
            bool watchlistItemsRefs,
            bool favoritesRefs,
            bool customCollectionsRefs,
            bool collectionItemsRefs,
            bool remindersRefs,
            bool calendarEventsRefs,
          })
        > {
  $$MediaTableTableManager(_$AppDatabase db, $MediaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> provider = const Value.absent(),
                Value<String> providerId = const Value.absent(),
                Value<String> mediaType = const Value.absent(),
                Value<String?> animeFormat = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> originalTitle = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<String?> tagline = const Value.absent(),
                Value<DateTime?> releaseDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int?> runtimeMinutes = const Value.absent(),
                Value<String?> originalLanguage = const Value.absent(),
                Value<String> originCountries = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<double?> externalRating = const Value.absent(),
                Value<int?> externalVoteCount = const Value.absent(),
                Value<int?> seasonCount = const Value.absent(),
                Value<int?> episodeCount = const Value.absent(),
                Value<String?> animeSeason = const Value.absent(),
                Value<int?> animeSeasonYear = const Value.absent(),
                Value<String> metadataLanguage = const Value.absent(),
                Value<DateTime?> metadataFetchedAt = const Value.absent(),
                Value<bool> isManual = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaCompanion(
                id: id,
                provider: provider,
                providerId: providerId,
                mediaType: mediaType,
                animeFormat: animeFormat,
                title: title,
                originalTitle: originalTitle,
                overview: overview,
                tagline: tagline,
                releaseDate: releaseDate,
                endDate: endDate,
                status: status,
                runtimeMinutes: runtimeMinutes,
                originalLanguage: originalLanguage,
                originCountries: originCountries,
                posterPath: posterPath,
                backdropPath: backdropPath,
                externalRating: externalRating,
                externalVoteCount: externalVoteCount,
                seasonCount: seasonCount,
                episodeCount: episodeCount,
                animeSeason: animeSeason,
                animeSeasonYear: animeSeasonYear,
                metadataLanguage: metadataLanguage,
                metadataFetchedAt: metadataFetchedAt,
                isManual: isManual,
                ownerUserId: ownerUserId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String provider,
                required String providerId,
                required String mediaType,
                Value<String?> animeFormat = const Value.absent(),
                required String title,
                Value<String?> originalTitle = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<String?> tagline = const Value.absent(),
                Value<DateTime?> releaseDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int?> runtimeMinutes = const Value.absent(),
                Value<String?> originalLanguage = const Value.absent(),
                Value<String> originCountries = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<double?> externalRating = const Value.absent(),
                Value<int?> externalVoteCount = const Value.absent(),
                Value<int?> seasonCount = const Value.absent(),
                Value<int?> episodeCount = const Value.absent(),
                Value<String?> animeSeason = const Value.absent(),
                Value<int?> animeSeasonYear = const Value.absent(),
                Value<String> metadataLanguage = const Value.absent(),
                Value<DateTime?> metadataFetchedAt = const Value.absent(),
                Value<bool> isManual = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaCompanion.insert(
                id: id,
                provider: provider,
                providerId: providerId,
                mediaType: mediaType,
                animeFormat: animeFormat,
                title: title,
                originalTitle: originalTitle,
                overview: overview,
                tagline: tagline,
                releaseDate: releaseDate,
                endDate: endDate,
                status: status,
                runtimeMinutes: runtimeMinutes,
                originalLanguage: originalLanguage,
                originCountries: originCountries,
                posterPath: posterPath,
                backdropPath: backdropPath,
                externalRating: externalRating,
                externalVoteCount: externalVoteCount,
                seasonCount: seasonCount,
                episodeCount: episodeCount,
                animeSeason: animeSeason,
                animeSeasonYear: animeSeasonYear,
                metadataLanguage: metadataLanguage,
                metadataFetchedAt: metadataFetchedAt,
                isManual: isManual,
                ownerUserId: ownerUserId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MediaTable, MediaRow>(table),
                  $$MediaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                alternativeTitlesRefs = false,
                mediaGenresRefs = false,
                mediaCreditsRefs = false,
                seasonsRefs = false,
                episodesRefs = false,
                userLibraryRefs = false,
                watchHistoryRefs = false,
                userRatingsRefs = false,
                userNotesRefs = false,
                watchlistItemsRefs = false,
                favoritesRefs = false,
                customCollectionsRefs = false,
                collectionItemsRefs = false,
                remindersRefs = false,
                calendarEventsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (alternativeTitlesRefs) db.alternativeTitles,
                    if (mediaGenresRefs) db.mediaGenres,
                    if (mediaCreditsRefs) db.mediaCredits,
                    if (seasonsRefs) db.seasons,
                    if (episodesRefs) db.episodes,
                    if (userLibraryRefs) db.userLibrary,
                    if (watchHistoryRefs) db.watchHistory,
                    if (userRatingsRefs) db.userRatings,
                    if (userNotesRefs) db.userNotes,
                    if (watchlistItemsRefs) db.watchlistItems,
                    if (favoritesRefs) db.favorites,
                    if (customCollectionsRefs) db.customCollections,
                    if (collectionItemsRefs) db.collectionItems,
                    if (remindersRefs) db.reminders,
                    if (calendarEventsRefs) db.calendarEvents,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (alternativeTitlesRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          AlternativeTitleRow,
                          $AlternativeTitlesTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._alternativeTitlesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).alternativeTitlesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (mediaGenresRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          MediaGenreRow,
                          $MediaGenresTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._mediaGenresRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).mediaGenresRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (mediaCreditsRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          MediaCreditRow,
                          $MediaCreditsTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._mediaCreditsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).mediaCreditsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (seasonsRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          SeasonRow,
                          $SeasonsTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._seasonsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(db, table, p0).seasonsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (episodesRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          EpisodeRow,
                          $EpisodesTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._episodesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).episodesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (userLibraryRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          LibraryRow,
                          $UserLibraryTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._userLibraryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).userLibraryRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (watchHistoryRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          WatchHistoryRow,
                          $WatchHistoryTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._watchHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).watchHistoryRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (userRatingsRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          RatingRow,
                          $UserRatingsTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._userRatingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).userRatingsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (userNotesRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          NoteRow,
                          $UserNotesTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._userNotesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).userNotesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (watchlistItemsRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          WatchlistRow,
                          $WatchlistItemsTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._watchlistItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).watchlistItemsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (favoritesRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          FavoriteRow,
                          $FavoritesTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._favoritesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).favoritesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (customCollectionsRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          CollectionRow,
                          $CustomCollectionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._customCollectionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).customCollectionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'cover_media_id',
                          typedResults: items,
                        ),
                      if (collectionItemsRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          CollectionItemRow,
                          $CollectionItemsTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._collectionItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).collectionItemsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (remindersRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          ReminderRow,
                          $RemindersTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._remindersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).remindersRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                      if (calendarEventsRefs)
                        await $_getPrefetchedDataByColumns<
                          MediaRow,
                          $MediaTable,
                          CalendarEventRow,
                          $CalendarEventsTable
                        >(
                          currentTable: table,
                          referencedTable: $$MediaTableReferences
                              ._calendarEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MediaTableReferences(
                                db,
                                table,
                                p0,
                              ).calendarEventsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'media_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MediaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MediaTable,
      MediaRow,
      $$MediaTableFilterComposer,
      $$MediaTableOrderingComposer,
      $$MediaTableAnnotationComposer,
      $$MediaTableCreateCompanionBuilder,
      $$MediaTableUpdateCompanionBuilder,
      (MediaRow, $$MediaTableReferences),
      MediaRow,
      PrefetchHooks Function({
        bool alternativeTitlesRefs,
        bool mediaGenresRefs,
        bool mediaCreditsRefs,
        bool seasonsRefs,
        bool episodesRefs,
        bool userLibraryRefs,
        bool watchHistoryRefs,
        bool userRatingsRefs,
        bool userNotesRefs,
        bool watchlistItemsRefs,
        bool favoritesRefs,
        bool customCollectionsRefs,
        bool collectionItemsRefs,
        bool remindersRefs,
        bool calendarEventsRefs,
      })
    >;
typedef $$AlternativeTitlesTableCreateCompanionBuilder =
    AlternativeTitlesCompanion Function({
      required String id,
      required String mediaId,
      required String title,
      Value<String?> language,
      Value<String?> kind,
      Value<int> rowid,
    });
typedef $$AlternativeTitlesTableUpdateCompanionBuilder =
    AlternativeTitlesCompanion Function({
      Value<String> id,
      Value<String> mediaId,
      Value<String> title,
      Value<String?> language,
      Value<String?> kind,
      Value<int> rowid,
    });

final class $$AlternativeTitlesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AlternativeTitlesTable,
          AlternativeTitleRow
        > {
  $$AlternativeTitlesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('alternative_titles__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AlternativeTitlesTableFilterComposer
    extends Composer<_$AppDatabase, $AlternativeTitlesTable> {
  $$AlternativeTitlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlternativeTitlesTableOrderingComposer
    extends Composer<_$AppDatabase, $AlternativeTitlesTable> {
  $$AlternativeTitlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlternativeTitlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlternativeTitlesTable> {
  $$AlternativeTitlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlternativeTitlesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlternativeTitlesTable,
          AlternativeTitleRow,
          $$AlternativeTitlesTableFilterComposer,
          $$AlternativeTitlesTableOrderingComposer,
          $$AlternativeTitlesTableAnnotationComposer,
          $$AlternativeTitlesTableCreateCompanionBuilder,
          $$AlternativeTitlesTableUpdateCompanionBuilder,
          (AlternativeTitleRow, $$AlternativeTitlesTableReferences),
          AlternativeTitleRow,
          PrefetchHooks Function({bool mediaId})
        > {
  $$AlternativeTitlesTableTableManager(
    _$AppDatabase db,
    $AlternativeTitlesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlternativeTitlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlternativeTitlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlternativeTitlesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<String?> kind = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AlternativeTitlesCompanion(
                id: id,
                mediaId: mediaId,
                title: title,
                language: language,
                kind: kind,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mediaId,
                required String title,
                Value<String?> language = const Value.absent(),
                Value<String?> kind = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AlternativeTitlesCompanion.insert(
                id: id,
                mediaId: mediaId,
                title: title,
                language: language,
                kind: kind,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AlternativeTitlesTable, AlternativeTitleRow>(
                    table,
                  ),
                  $$AlternativeTitlesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$AlternativeTitlesTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$AlternativeTitlesTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AlternativeTitlesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlternativeTitlesTable,
      AlternativeTitleRow,
      $$AlternativeTitlesTableFilterComposer,
      $$AlternativeTitlesTableOrderingComposer,
      $$AlternativeTitlesTableAnnotationComposer,
      $$AlternativeTitlesTableCreateCompanionBuilder,
      $$AlternativeTitlesTableUpdateCompanionBuilder,
      (AlternativeTitleRow, $$AlternativeTitlesTableReferences),
      AlternativeTitleRow,
      PrefetchHooks Function({bool mediaId})
    >;
typedef $$GenresTableCreateCompanionBuilder = GenresCompanion Function({
  Value<int> id,
  required String provider,
  required String providerGenreId,
  required String name,
  required String language,
});
typedef $$GenresTableUpdateCompanionBuilder = GenresCompanion Function({
  Value<int> id,
  Value<String> provider,
  Value<String> providerGenreId,
  Value<String> name,
  Value<String> language,
});

final class $$GenresTableReferences
    extends BaseReferences<_$AppDatabase, $GenresTable, GenreRow> {
  $$GenresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MediaGenresTable, List<MediaGenreRow>>
  _mediaGenresRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mediaGenres,
    aliasName: 'genres__id__media_genres__genre_id',
  );

  $$MediaGenresTableProcessedTableManager get mediaGenresRefs {
    final manager = $$MediaGenresTableTableManager(
      $_db,
      $_db.mediaGenres,
    ).filter((f) => f.genreId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaGenresRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GenresTableFilterComposer
    extends Composer<_$AppDatabase, $GenresTable> {
  $$GenresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerGenreId => $composableBuilder(
    column: $table.providerGenreId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> mediaGenresRefs(
    Expression<bool> Function($$MediaGenresTableFilterComposer f) f,
  ) {
    final $$MediaGenresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaGenres,
      getReferencedColumn: (t) => t.genreId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaGenresTableFilterComposer(
            $db: $db,
            $table: $db.mediaGenres,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GenresTableOrderingComposer
    extends Composer<_$AppDatabase, $GenresTable> {
  $$GenresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerGenreId => $composableBuilder(
    column: $table.providerGenreId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GenresTableAnnotationComposer
    extends Composer<_$AppDatabase, $GenresTable> {
  $$GenresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<String> get providerGenreId => $composableBuilder(
    column: $table.providerGenreId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  Expression<T> mediaGenresRefs<T extends Object>(
    Expression<T> Function($$MediaGenresTableAnnotationComposer a) f,
  ) {
    final $$MediaGenresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaGenres,
      getReferencedColumn: (t) => t.genreId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaGenresTableAnnotationComposer(
            $db: $db,
            $table: $db.mediaGenres,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GenresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GenresTable,
          GenreRow,
          $$GenresTableFilterComposer,
          $$GenresTableOrderingComposer,
          $$GenresTableAnnotationComposer,
          $$GenresTableCreateCompanionBuilder,
          $$GenresTableUpdateCompanionBuilder,
          (GenreRow, $$GenresTableReferences),
          GenreRow,
          PrefetchHooks Function({bool mediaGenresRefs})
        > {
  $$GenresTableTableManager(_$AppDatabase db, $GenresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GenresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GenresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GenresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> provider = const Value.absent(),
                Value<String> providerGenreId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> language = const Value.absent(),
              }) => GenresCompanion(
                id: id,
                provider: provider,
                providerGenreId: providerGenreId,
                name: name,
                language: language,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String provider,
                required String providerGenreId,
                required String name,
                required String language,
              }) => GenresCompanion.insert(
                id: id,
                provider: provider,
                providerGenreId: providerGenreId,
                name: name,
                language: language,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$GenresTable, GenreRow>(table),
                  $$GenresTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaGenresRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (mediaGenresRefs) db.mediaGenres],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mediaGenresRefs)
                    await $_getPrefetchedDataByColumns<
                      GenreRow,
                      $GenresTable,
                      MediaGenreRow,
                      $MediaGenresTable
                    >(
                      currentTable: table,
                      referencedTable: $$GenresTableReferences
                          ._mediaGenresRefsTable(db),
                      managerFromTypedResult: (p0) => $$GenresTableReferences(
                        db,
                        table,
                        p0,
                      ).mediaGenresRefs,
                      currentColumn: 'id',
                      referencedColumn: 'genre_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GenresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GenresTable,
      GenreRow,
      $$GenresTableFilterComposer,
      $$GenresTableOrderingComposer,
      $$GenresTableAnnotationComposer,
      $$GenresTableCreateCompanionBuilder,
      $$GenresTableUpdateCompanionBuilder,
      (GenreRow, $$GenresTableReferences),
      GenreRow,
      PrefetchHooks Function({bool mediaGenresRefs})
    >;
typedef $$MediaGenresTableCreateCompanionBuilder =
    MediaGenresCompanion Function({
      required String mediaId,
      required int genreId,
      Value<int> rowid,
    });
typedef $$MediaGenresTableUpdateCompanionBuilder =
    MediaGenresCompanion Function({
      Value<String> mediaId,
      Value<int> genreId,
      Value<int> rowid,
    });

final class $$MediaGenresTableReferences
    extends BaseReferences<_$AppDatabase, $MediaGenresTable, MediaGenreRow> {
  $$MediaGenresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('media_genres__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GenresTable _genreIdTable(_$AppDatabase db) =>
      db.genres.createAlias('media_genres__genre_id__genres__id');

  $$GenresTableProcessedTableManager get genreId {
    final $_column = $_itemColumn<int>('genre_id')!;

    final manager = $$GenresTableTableManager(
      $_db,
      $_db.genres,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_genreIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MediaGenresTableFilterComposer
    extends Composer<_$AppDatabase, $MediaGenresTable> {
  $$MediaGenresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GenresTableFilterComposer get genreId {
    final $$GenresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.genreId,
      referencedTable: $db.genres,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GenresTableFilterComposer(
            $db: $db,
            $table: $db.genres,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaGenresTableOrderingComposer
    extends Composer<_$AppDatabase, $MediaGenresTable> {
  $$MediaGenresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GenresTableOrderingComposer get genreId {
    final $$GenresTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.genreId,
      referencedTable: $db.genres,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GenresTableOrderingComposer(
            $db: $db,
            $table: $db.genres,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaGenresTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediaGenresTable> {
  $$MediaGenresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GenresTableAnnotationComposer get genreId {
    final $$GenresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.genreId,
      referencedTable: $db.genres,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GenresTableAnnotationComposer(
            $db: $db,
            $table: $db.genres,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaGenresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MediaGenresTable,
          MediaGenreRow,
          $$MediaGenresTableFilterComposer,
          $$MediaGenresTableOrderingComposer,
          $$MediaGenresTableAnnotationComposer,
          $$MediaGenresTableCreateCompanionBuilder,
          $$MediaGenresTableUpdateCompanionBuilder,
          (MediaGenreRow, $$MediaGenresTableReferences),
          MediaGenreRow,
          PrefetchHooks Function({bool mediaId, bool genreId})
        > {
  $$MediaGenresTableTableManager(_$AppDatabase db, $MediaGenresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaGenresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaGenresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaGenresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> mediaId = const Value.absent(),
                Value<int> genreId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaGenresCompanion(
                mediaId: mediaId,
                genreId: genreId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String mediaId,
                required int genreId,
                Value<int> rowid = const Value.absent(),
              }) => MediaGenresCompanion.insert(
                mediaId: mediaId,
                genreId: genreId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MediaGenresTable, MediaGenreRow>(table),
                  $$MediaGenresTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false, genreId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$MediaGenresTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$MediaGenresTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (genreId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.genreId,
                        referencedTable: $$MediaGenresTableReferences
                            ._genreIdTable(db),
                        referencedColumn: $$MediaGenresTableReferences
                            ._genreIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MediaGenresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MediaGenresTable,
      MediaGenreRow,
      $$MediaGenresTableFilterComposer,
      $$MediaGenresTableOrderingComposer,
      $$MediaGenresTableAnnotationComposer,
      $$MediaGenresTableCreateCompanionBuilder,
      $$MediaGenresTableUpdateCompanionBuilder,
      (MediaGenreRow, $$MediaGenresTableReferences),
      MediaGenreRow,
      PrefetchHooks Function({bool mediaId, bool genreId})
    >;
typedef $$PeopleTableCreateCompanionBuilder = PeopleCompanion Function({
  required String id,
  required String provider,
  required String providerId,
  required String name,
  Value<String?> profilePath,
  Value<String?> knownForDepartment,
  Value<int> rowid,
});
typedef $$PeopleTableUpdateCompanionBuilder = PeopleCompanion Function({
  Value<String> id,
  Value<String> provider,
  Value<String> providerId,
  Value<String> name,
  Value<String?> profilePath,
  Value<String?> knownForDepartment,
  Value<int> rowid,
});

final class $$PeopleTableReferences
    extends BaseReferences<_$AppDatabase, $PeopleTable, PersonRow> {
  $$PeopleTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MediaCreditsTable, List<MediaCreditRow>>
  _mediaCreditsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mediaCredits,
    aliasName: 'people__id__media_credits__person_id',
  );

  $$MediaCreditsTableProcessedTableManager get mediaCreditsRefs {
    final manager = $$MediaCreditsTableTableManager(
      $_db,
      $_db.mediaCredits,
    ).filter((f) => f.personId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaCreditsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PeopleTableFilterComposer
    extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profilePath => $composableBuilder(
    column: $table.profilePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get knownForDepartment => $composableBuilder(
    column: $table.knownForDepartment,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> mediaCreditsRefs(
    Expression<bool> Function($$MediaCreditsTableFilterComposer f) f,
  ) {
    final $$MediaCreditsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaCredits,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaCreditsTableFilterComposer(
            $db: $db,
            $table: $db.mediaCredits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PeopleTableOrderingComposer
    extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profilePath => $composableBuilder(
    column: $table.profilePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get knownForDepartment => $composableBuilder(
    column: $table.knownForDepartment,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PeopleTableAnnotationComposer
    extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get profilePath => $composableBuilder(
    column: $table.profilePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get knownForDepartment => $composableBuilder(
    column: $table.knownForDepartment,
    builder: (column) => column,
  );

  Expression<T> mediaCreditsRefs<T extends Object>(
    Expression<T> Function($$MediaCreditsTableAnnotationComposer a) f,
  ) {
    final $$MediaCreditsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaCredits,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaCreditsTableAnnotationComposer(
            $db: $db,
            $table: $db.mediaCredits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PeopleTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PeopleTable,
          PersonRow,
          $$PeopleTableFilterComposer,
          $$PeopleTableOrderingComposer,
          $$PeopleTableAnnotationComposer,
          $$PeopleTableCreateCompanionBuilder,
          $$PeopleTableUpdateCompanionBuilder,
          (PersonRow, $$PeopleTableReferences),
          PersonRow,
          PrefetchHooks Function({bool mediaCreditsRefs})
        > {
  $$PeopleTableTableManager(_$AppDatabase db, $PeopleTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PeopleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PeopleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PeopleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> provider = const Value.absent(),
                Value<String> providerId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> profilePath = const Value.absent(),
                Value<String?> knownForDepartment = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PeopleCompanion(
                id: id,
                provider: provider,
                providerId: providerId,
                name: name,
                profilePath: profilePath,
                knownForDepartment: knownForDepartment,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String provider,
                required String providerId,
                required String name,
                Value<String?> profilePath = const Value.absent(),
                Value<String?> knownForDepartment = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PeopleCompanion.insert(
                id: id,
                provider: provider,
                providerId: providerId,
                name: name,
                profilePath: profilePath,
                knownForDepartment: knownForDepartment,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PeopleTable, PersonRow>(table),
                  $$PeopleTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaCreditsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (mediaCreditsRefs) db.mediaCredits],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mediaCreditsRefs)
                    await $_getPrefetchedDataByColumns<
                      PersonRow,
                      $PeopleTable,
                      MediaCreditRow,
                      $MediaCreditsTable
                    >(
                      currentTable: table,
                      referencedTable: $$PeopleTableReferences
                          ._mediaCreditsRefsTable(db),
                      managerFromTypedResult: (p0) => $$PeopleTableReferences(
                        db,
                        table,
                        p0,
                      ).mediaCreditsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'person_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PeopleTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PeopleTable,
      PersonRow,
      $$PeopleTableFilterComposer,
      $$PeopleTableOrderingComposer,
      $$PeopleTableAnnotationComposer,
      $$PeopleTableCreateCompanionBuilder,
      $$PeopleTableUpdateCompanionBuilder,
      (PersonRow, $$PeopleTableReferences),
      PersonRow,
      PrefetchHooks Function({bool mediaCreditsRefs})
    >;
typedef $$MediaCreditsTableCreateCompanionBuilder =
    MediaCreditsCompanion Function({
      required String id,
      required String mediaId,
      required String personId,
      required String creditType,
      Value<String?> character,
      Value<String?> job,
      Value<String?> department,
      Value<int> orderIndex,
      Value<int> rowid,
    });
typedef $$MediaCreditsTableUpdateCompanionBuilder =
    MediaCreditsCompanion Function({
      Value<String> id,
      Value<String> mediaId,
      Value<String> personId,
      Value<String> creditType,
      Value<String?> character,
      Value<String?> job,
      Value<String?> department,
      Value<int> orderIndex,
      Value<int> rowid,
    });

final class $$MediaCreditsTableReferences
    extends BaseReferences<_$AppDatabase, $MediaCreditsTable, MediaCreditRow> {
  $$MediaCreditsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('media_credits__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PeopleTable _personIdTable(_$AppDatabase db) =>
      db.people.createAlias('media_credits__person_id__people__id');

  $$PeopleTableProcessedTableManager get personId {
    final $_column = $_itemColumn<String>('person_id')!;

    final manager = $$PeopleTableTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MediaCreditsTableFilterComposer
    extends Composer<_$AppDatabase, $MediaCreditsTable> {
  $$MediaCreditsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get creditType => $composableBuilder(
    column: $table.creditType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get character => $composableBuilder(
    column: $table.character,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get job => $composableBuilder(
    column: $table.job,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableFilterComposer get personId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaCreditsTableOrderingComposer
    extends Composer<_$AppDatabase, $MediaCreditsTable> {
  $$MediaCreditsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get creditType => $composableBuilder(
    column: $table.creditType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get character => $composableBuilder(
    column: $table.character,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get job => $composableBuilder(
    column: $table.job,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableOrderingComposer get personId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaCreditsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediaCreditsTable> {
  $$MediaCreditsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get creditType => $composableBuilder(
    column: $table.creditType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get character =>
      $composableBuilder(column: $table.character, builder: (column) => column);

  GeneratedColumn<String> get job =>
      $composableBuilder(column: $table.job, builder: (column) => column);

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PeopleTableAnnotationComposer get personId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeopleTableAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaCreditsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MediaCreditsTable,
          MediaCreditRow,
          $$MediaCreditsTableFilterComposer,
          $$MediaCreditsTableOrderingComposer,
          $$MediaCreditsTableAnnotationComposer,
          $$MediaCreditsTableCreateCompanionBuilder,
          $$MediaCreditsTableUpdateCompanionBuilder,
          (MediaCreditRow, $$MediaCreditsTableReferences),
          MediaCreditRow,
          PrefetchHooks Function({bool mediaId, bool personId})
        > {
  $$MediaCreditsTableTableManager(_$AppDatabase db, $MediaCreditsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaCreditsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaCreditsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaCreditsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<String> personId = const Value.absent(),
                Value<String> creditType = const Value.absent(),
                Value<String?> character = const Value.absent(),
                Value<String?> job = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaCreditsCompanion(
                id: id,
                mediaId: mediaId,
                personId: personId,
                creditType: creditType,
                character: character,
                job: job,
                department: department,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mediaId,
                required String personId,
                required String creditType,
                Value<String?> character = const Value.absent(),
                Value<String?> job = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaCreditsCompanion.insert(
                id: id,
                mediaId: mediaId,
                personId: personId,
                creditType: creditType,
                character: character,
                job: job,
                department: department,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MediaCreditsTable, MediaCreditRow>(table),
                  $$MediaCreditsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false, personId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$MediaCreditsTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$MediaCreditsTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (personId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.personId,
                        referencedTable: $$MediaCreditsTableReferences
                            ._personIdTable(db),
                        referencedColumn: $$MediaCreditsTableReferences
                            ._personIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MediaCreditsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MediaCreditsTable,
      MediaCreditRow,
      $$MediaCreditsTableFilterComposer,
      $$MediaCreditsTableOrderingComposer,
      $$MediaCreditsTableAnnotationComposer,
      $$MediaCreditsTableCreateCompanionBuilder,
      $$MediaCreditsTableUpdateCompanionBuilder,
      (MediaCreditRow, $$MediaCreditsTableReferences),
      MediaCreditRow,
      PrefetchHooks Function({bool mediaId, bool personId})
    >;
typedef $$SeasonsTableCreateCompanionBuilder = SeasonsCompanion Function({
  required String id,
  required String mediaId,
  required int seasonNumber,
  Value<String?> providerId,
  Value<String?> name,
  Value<String?> overview,
  Value<DateTime?> airDate,
  Value<int> episodeCount,
  Value<String?> posterPath,
  Value<int> rowid,
});
typedef $$SeasonsTableUpdateCompanionBuilder = SeasonsCompanion Function({
  Value<String> id,
  Value<String> mediaId,
  Value<int> seasonNumber,
  Value<String?> providerId,
  Value<String?> name,
  Value<String?> overview,
  Value<DateTime?> airDate,
  Value<int> episodeCount,
  Value<String?> posterPath,
  Value<int> rowid,
});

final class $$SeasonsTableReferences
    extends BaseReferences<_$AppDatabase, $SeasonsTable, SeasonRow> {
  $$SeasonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('seasons__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EpisodesTable, List<EpisodeRow>>
  _episodesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.episodes,
    aliasName: 'seasons__id__episodes__season_id',
  );

  $$EpisodesTableProcessedTableManager get episodesRefs {
    final manager = $$EpisodesTableTableManager(
      $_db,
      $_db.episodes,
    ).filter((f) => f.seasonId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_episodesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SeasonsTableFilterComposer
    extends Composer<_$AppDatabase, $SeasonsTable> {
  $$SeasonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get airDate => $composableBuilder(
    column: $table.airDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episodeCount => $composableBuilder(
    column: $table.episodeCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> episodesRefs(
    Expression<bool> Function($$EpisodesTableFilterComposer f) f,
  ) {
    final $$EpisodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.episodes,
      getReferencedColumn: (t) => t.seasonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodesTableFilterComposer(
            $db: $db,
            $table: $db.episodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeasonsTableOrderingComposer
    extends Composer<_$AppDatabase, $SeasonsTable> {
  $$SeasonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get airDate => $composableBuilder(
    column: $table.airDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodeCount => $composableBuilder(
    column: $table.episodeCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeasonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeasonsTable> {
  $$SeasonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get overview =>
      $composableBuilder(column: $table.overview, builder: (column) => column);

  GeneratedColumn<DateTime> get airDate =>
      $composableBuilder(column: $table.airDate, builder: (column) => column);

  GeneratedColumn<int> get episodeCount => $composableBuilder(
    column: $table.episodeCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => column,
  );

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> episodesRefs<T extends Object>(
    Expression<T> Function($$EpisodesTableAnnotationComposer a) f,
  ) {
    final $$EpisodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.episodes,
      getReferencedColumn: (t) => t.seasonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodesTableAnnotationComposer(
            $db: $db,
            $table: $db.episodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeasonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeasonsTable,
          SeasonRow,
          $$SeasonsTableFilterComposer,
          $$SeasonsTableOrderingComposer,
          $$SeasonsTableAnnotationComposer,
          $$SeasonsTableCreateCompanionBuilder,
          $$SeasonsTableUpdateCompanionBuilder,
          (SeasonRow, $$SeasonsTableReferences),
          SeasonRow,
          PrefetchHooks Function({bool mediaId, bool episodesRefs})
        > {
  $$SeasonsTableTableManager(_$AppDatabase db, $SeasonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeasonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeasonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeasonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<int> seasonNumber = const Value.absent(),
                Value<String?> providerId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<DateTime?> airDate = const Value.absent(),
                Value<int> episodeCount = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SeasonsCompanion(
                id: id,
                mediaId: mediaId,
                seasonNumber: seasonNumber,
                providerId: providerId,
                name: name,
                overview: overview,
                airDate: airDate,
                episodeCount: episodeCount,
                posterPath: posterPath,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mediaId,
                required int seasonNumber,
                Value<String?> providerId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<DateTime?> airDate = const Value.absent(),
                Value<int> episodeCount = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SeasonsCompanion.insert(
                id: id,
                mediaId: mediaId,
                seasonNumber: seasonNumber,
                providerId: providerId,
                name: name,
                overview: overview,
                airDate: airDate,
                episodeCount: episodeCount,
                posterPath: posterPath,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SeasonsTable, SeasonRow>(table),
                  $$SeasonsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false, episodesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (episodesRefs) db.episodes],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$SeasonsTableReferences._mediaIdTable(
                          db,
                        ),
                        referencedColumn: $$SeasonsTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (episodesRefs)
                    await $_getPrefetchedDataByColumns<
                      SeasonRow,
                      $SeasonsTable,
                      EpisodeRow,
                      $EpisodesTable
                    >(
                      currentTable: table,
                      referencedTable: $$SeasonsTableReferences
                          ._episodesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SeasonsTableReferences(db, table, p0).episodesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'season_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SeasonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeasonsTable,
      SeasonRow,
      $$SeasonsTableFilterComposer,
      $$SeasonsTableOrderingComposer,
      $$SeasonsTableAnnotationComposer,
      $$SeasonsTableCreateCompanionBuilder,
      $$SeasonsTableUpdateCompanionBuilder,
      (SeasonRow, $$SeasonsTableReferences),
      SeasonRow,
      PrefetchHooks Function({bool mediaId, bool episodesRefs})
    >;
typedef $$EpisodesTableCreateCompanionBuilder = EpisodesCompanion Function({
  required String id,
  required String mediaId,
  Value<String?> seasonId,
  Value<int> seasonNumber,
  required int episodeNumber,
  Value<int?> absoluteNumber,
  Value<String?> providerId,
  Value<String?> title,
  Value<String?> overview,
  Value<DateTime?> airDate,
  Value<int?> runtimeMinutes,
  Value<String?> stillPath,
  Value<int> rowid,
});
typedef $$EpisodesTableUpdateCompanionBuilder = EpisodesCompanion Function({
  Value<String> id,
  Value<String> mediaId,
  Value<String?> seasonId,
  Value<int> seasonNumber,
  Value<int> episodeNumber,
  Value<int?> absoluteNumber,
  Value<String?> providerId,
  Value<String?> title,
  Value<String?> overview,
  Value<DateTime?> airDate,
  Value<int?> runtimeMinutes,
  Value<String?> stillPath,
  Value<int> rowid,
});

final class $$EpisodesTableReferences
    extends BaseReferences<_$AppDatabase, $EpisodesTable, EpisodeRow> {
  $$EpisodesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('episodes__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SeasonsTable _seasonIdTable(_$AppDatabase db) =>
      db.seasons.createAlias('episodes__season_id__seasons__id');

  $$SeasonsTableProcessedTableManager? get seasonId {
    final $_column = $_itemColumn<String>('season_id');
    if ($_column == null) return null;
    final manager = $$SeasonsTableTableManager(
      $_db,
      $_db.seasons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seasonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WatchHistoryTable, List<WatchHistoryRow>>
  _watchHistoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.watchHistory,
    aliasName: 'episodes__id__watch_history__episode_id',
  );

  $$WatchHistoryTableProcessedTableManager get watchHistoryRefs {
    final manager = $$WatchHistoryTableTableManager(
      $_db,
      $_db.watchHistory,
    ).filter((f) => f.episodeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_watchHistoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserNotesTable, List<NoteRow>>
  _userNotesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userNotes,
    aliasName: 'episodes__id__user_notes__episode_id',
  );

  $$UserNotesTableProcessedTableManager get userNotesRefs {
    final manager = $$UserNotesTableTableManager(
      $_db,
      $_db.userNotes,
    ).filter((f) => f.episodeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_userNotesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EpisodesTableFilterComposer
    extends Composer<_$AppDatabase, $EpisodesTable> {
  $$EpisodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episodeNumber => $composableBuilder(
    column: $table.episodeNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get absoluteNumber => $composableBuilder(
    column: $table.absoluteNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get airDate => $composableBuilder(
    column: $table.airDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get runtimeMinutes => $composableBuilder(
    column: $table.runtimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stillPath => $composableBuilder(
    column: $table.stillPath,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeasonsTableFilterComposer get seasonId {
    final $$SeasonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seasonId,
      referencedTable: $db.seasons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeasonsTableFilterComposer(
            $db: $db,
            $table: $db.seasons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> watchHistoryRefs(
    Expression<bool> Function($$WatchHistoryTableFilterComposer f) f,
  ) {
    final $$WatchHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.watchHistory,
      getReferencedColumn: (t) => t.episodeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WatchHistoryTableFilterComposer(
            $db: $db,
            $table: $db.watchHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userNotesRefs(
    Expression<bool> Function($$UserNotesTableFilterComposer f) f,
  ) {
    final $$UserNotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userNotes,
      getReferencedColumn: (t) => t.episodeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserNotesTableFilterComposer(
            $db: $db,
            $table: $db.userNotes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EpisodesTableOrderingComposer
    extends Composer<_$AppDatabase, $EpisodesTable> {
  $$EpisodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodeNumber => $composableBuilder(
    column: $table.episodeNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get absoluteNumber => $composableBuilder(
    column: $table.absoluteNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get airDate => $composableBuilder(
    column: $table.airDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get runtimeMinutes => $composableBuilder(
    column: $table.runtimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stillPath => $composableBuilder(
    column: $table.stillPath,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeasonsTableOrderingComposer get seasonId {
    final $$SeasonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seasonId,
      referencedTable: $db.seasons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeasonsTableOrderingComposer(
            $db: $db,
            $table: $db.seasons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EpisodesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EpisodesTable> {
  $$EpisodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get episodeNumber => $composableBuilder(
    column: $table.episodeNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get absoluteNumber => $composableBuilder(
    column: $table.absoluteNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get overview =>
      $composableBuilder(column: $table.overview, builder: (column) => column);

  GeneratedColumn<DateTime> get airDate =>
      $composableBuilder(column: $table.airDate, builder: (column) => column);

  GeneratedColumn<int> get runtimeMinutes => $composableBuilder(
    column: $table.runtimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stillPath =>
      $composableBuilder(column: $table.stillPath, builder: (column) => column);

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeasonsTableAnnotationComposer get seasonId {
    final $$SeasonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seasonId,
      referencedTable: $db.seasons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeasonsTableAnnotationComposer(
            $db: $db,
            $table: $db.seasons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> watchHistoryRefs<T extends Object>(
    Expression<T> Function($$WatchHistoryTableAnnotationComposer a) f,
  ) {
    final $$WatchHistoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.watchHistory,
      getReferencedColumn: (t) => t.episodeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WatchHistoryTableAnnotationComposer(
            $db: $db,
            $table: $db.watchHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userNotesRefs<T extends Object>(
    Expression<T> Function($$UserNotesTableAnnotationComposer a) f,
  ) {
    final $$UserNotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userNotes,
      getReferencedColumn: (t) => t.episodeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserNotesTableAnnotationComposer(
            $db: $db,
            $table: $db.userNotes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EpisodesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EpisodesTable,
          EpisodeRow,
          $$EpisodesTableFilterComposer,
          $$EpisodesTableOrderingComposer,
          $$EpisodesTableAnnotationComposer,
          $$EpisodesTableCreateCompanionBuilder,
          $$EpisodesTableUpdateCompanionBuilder,
          (EpisodeRow, $$EpisodesTableReferences),
          EpisodeRow,
          PrefetchHooks Function({
            bool mediaId,
            bool seasonId,
            bool watchHistoryRefs,
            bool userNotesRefs,
          })
        > {
  $$EpisodesTableTableManager(_$AppDatabase db, $EpisodesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EpisodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EpisodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EpisodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<String?> seasonId = const Value.absent(),
                Value<int> seasonNumber = const Value.absent(),
                Value<int> episodeNumber = const Value.absent(),
                Value<int?> absoluteNumber = const Value.absent(),
                Value<String?> providerId = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<DateTime?> airDate = const Value.absent(),
                Value<int?> runtimeMinutes = const Value.absent(),
                Value<String?> stillPath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EpisodesCompanion(
                id: id,
                mediaId: mediaId,
                seasonId: seasonId,
                seasonNumber: seasonNumber,
                episodeNumber: episodeNumber,
                absoluteNumber: absoluteNumber,
                providerId: providerId,
                title: title,
                overview: overview,
                airDate: airDate,
                runtimeMinutes: runtimeMinutes,
                stillPath: stillPath,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mediaId,
                Value<String?> seasonId = const Value.absent(),
                Value<int> seasonNumber = const Value.absent(),
                required int episodeNumber,
                Value<int?> absoluteNumber = const Value.absent(),
                Value<String?> providerId = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<DateTime?> airDate = const Value.absent(),
                Value<int?> runtimeMinutes = const Value.absent(),
                Value<String?> stillPath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EpisodesCompanion.insert(
                id: id,
                mediaId: mediaId,
                seasonId: seasonId,
                seasonNumber: seasonNumber,
                episodeNumber: episodeNumber,
                absoluteNumber: absoluteNumber,
                providerId: providerId,
                title: title,
                overview: overview,
                airDate: airDate,
                runtimeMinutes: runtimeMinutes,
                stillPath: stillPath,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$EpisodesTable, EpisodeRow>(table),
                  $$EpisodesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                mediaId = false,
                seasonId = false,
                watchHistoryRefs = false,
                userNotesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (watchHistoryRefs) db.watchHistory,
                    if (userNotesRefs) db.userNotes,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (mediaId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.mediaId,
                            referencedTable: $$EpisodesTableReferences
                                ._mediaIdTable(db),
                            referencedColumn: $$EpisodesTableReferences
                                ._mediaIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (seasonId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.seasonId,
                            referencedTable: $$EpisodesTableReferences
                                ._seasonIdTable(db),
                            referencedColumn: $$EpisodesTableReferences
                                ._seasonIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (watchHistoryRefs)
                        await $_getPrefetchedDataByColumns<
                          EpisodeRow,
                          $EpisodesTable,
                          WatchHistoryRow,
                          $WatchHistoryTable
                        >(
                          currentTable: table,
                          referencedTable: $$EpisodesTableReferences
                              ._watchHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EpisodesTableReferences(
                                db,
                                table,
                                p0,
                              ).watchHistoryRefs,
                          currentColumn: 'id',
                          referencedColumn: 'episode_id',
                          typedResults: items,
                        ),
                      if (userNotesRefs)
                        await $_getPrefetchedDataByColumns<
                          EpisodeRow,
                          $EpisodesTable,
                          NoteRow,
                          $UserNotesTable
                        >(
                          currentTable: table,
                          referencedTable: $$EpisodesTableReferences
                              ._userNotesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EpisodesTableReferences(
                                db,
                                table,
                                p0,
                              ).userNotesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'episode_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EpisodesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EpisodesTable,
      EpisodeRow,
      $$EpisodesTableFilterComposer,
      $$EpisodesTableOrderingComposer,
      $$EpisodesTableAnnotationComposer,
      $$EpisodesTableCreateCompanionBuilder,
      $$EpisodesTableUpdateCompanionBuilder,
      (EpisodeRow, $$EpisodesTableReferences),
      EpisodeRow,
      PrefetchHooks Function({
        bool mediaId,
        bool seasonId,
        bool watchHistoryRefs,
        bool userNotesRefs,
      })
    >;
typedef $$UserLibraryTableCreateCompanionBuilder =
    UserLibraryCompanion Function({
      required String id,
      required String userId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      required String deviceId,
      Value<DateTime?> serverUpdatedAt,
      required String mediaId,
      required String status,
      Value<DateTime?> startedAt,
      Value<DateTime?> completedAt,
      Value<int> rewatchCount,
      Value<int?> currentSeason,
      Value<int?> currentEpisode,
      required DateTime addedAt,
      Value<int> rowid,
    });
typedef $$UserLibraryTableUpdateCompanionBuilder =
    UserLibraryCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      Value<String> deviceId,
      Value<DateTime?> serverUpdatedAt,
      Value<String> mediaId,
      Value<String> status,
      Value<DateTime?> startedAt,
      Value<DateTime?> completedAt,
      Value<int> rewatchCount,
      Value<int?> currentSeason,
      Value<int?> currentEpisode,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });

final class $$UserLibraryTableReferences
    extends BaseReferences<_$AppDatabase, $UserLibraryTable, LibraryRow> {
  $$UserLibraryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('user_library__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WatchHistoryTable, List<WatchHistoryRow>>
  _watchHistoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.watchHistory,
    aliasName: 'user_library__id__watch_history__library_id',
  );

  $$WatchHistoryTableProcessedTableManager get watchHistoryRefs {
    final manager = $$WatchHistoryTableTableManager(
      $_db,
      $_db.watchHistory,
    ).filter((f) => f.libraryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_watchHistoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserLibraryTableFilterComposer
    extends Composer<_$AppDatabase, $UserLibraryTable> {
  $$UserLibraryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewatchCount => $composableBuilder(
    column: $table.rewatchCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentSeason => $composableBuilder(
    column: $table.currentSeason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentEpisode => $composableBuilder(
    column: $table.currentEpisode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> watchHistoryRefs(
    Expression<bool> Function($$WatchHistoryTableFilterComposer f) f,
  ) {
    final $$WatchHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.watchHistory,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WatchHistoryTableFilterComposer(
            $db: $db,
            $table: $db.watchHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserLibraryTableOrderingComposer
    extends Composer<_$AppDatabase, $UserLibraryTable> {
  $$UserLibraryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewatchCount => $composableBuilder(
    column: $table.rewatchCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentSeason => $composableBuilder(
    column: $table.currentSeason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentEpisode => $composableBuilder(
    column: $table.currentEpisode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserLibraryTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserLibraryTable> {
  $$UserLibraryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewatchCount => $composableBuilder(
    column: $table.rewatchCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentSeason => $composableBuilder(
    column: $table.currentSeason,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentEpisode => $composableBuilder(
    column: $table.currentEpisode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> watchHistoryRefs<T extends Object>(
    Expression<T> Function($$WatchHistoryTableAnnotationComposer a) f,
  ) {
    final $$WatchHistoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.watchHistory,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WatchHistoryTableAnnotationComposer(
            $db: $db,
            $table: $db.watchHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserLibraryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserLibraryTable,
          LibraryRow,
          $$UserLibraryTableFilterComposer,
          $$UserLibraryTableOrderingComposer,
          $$UserLibraryTableAnnotationComposer,
          $$UserLibraryTableCreateCompanionBuilder,
          $$UserLibraryTableUpdateCompanionBuilder,
          (LibraryRow, $$UserLibraryTableReferences),
          LibraryRow,
          PrefetchHooks Function({bool mediaId, bool watchHistoryRefs})
        > {
  $$UserLibraryTableTableManager(_$AppDatabase db, $UserLibraryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserLibraryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserLibraryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserLibraryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rewatchCount = const Value.absent(),
                Value<int?> currentSeason = const Value.absent(),
                Value<int?> currentEpisode = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserLibraryCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                status: status,
                startedAt: startedAt,
                completedAt: completedAt,
                rewatchCount: rewatchCount,
                currentSeason: currentSeason,
                currentEpisode: currentEpisode,
                addedAt: addedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                required String deviceId,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required String mediaId,
                required String status,
                Value<DateTime?> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rewatchCount = const Value.absent(),
                Value<int?> currentSeason = const Value.absent(),
                Value<int?> currentEpisode = const Value.absent(),
                required DateTime addedAt,
                Value<int> rowid = const Value.absent(),
              }) => UserLibraryCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                status: status,
                startedAt: startedAt,
                completedAt: completedAt,
                rewatchCount: rewatchCount,
                currentSeason: currentSeason,
                currentEpisode: currentEpisode,
                addedAt: addedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserLibraryTable, LibraryRow>(table),
                  $$UserLibraryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false, watchHistoryRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (watchHistoryRefs) db.watchHistory],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$UserLibraryTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$UserLibraryTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (watchHistoryRefs)
                    await $_getPrefetchedDataByColumns<
                      LibraryRow,
                      $UserLibraryTable,
                      WatchHistoryRow,
                      $WatchHistoryTable
                    >(
                      currentTable: table,
                      referencedTable: $$UserLibraryTableReferences
                          ._watchHistoryRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UserLibraryTableReferences(
                            db,
                            table,
                            p0,
                          ).watchHistoryRefs,
                      currentColumn: 'id',
                      referencedColumn: 'library_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UserLibraryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserLibraryTable,
      LibraryRow,
      $$UserLibraryTableFilterComposer,
      $$UserLibraryTableOrderingComposer,
      $$UserLibraryTableAnnotationComposer,
      $$UserLibraryTableCreateCompanionBuilder,
      $$UserLibraryTableUpdateCompanionBuilder,
      (LibraryRow, $$UserLibraryTableReferences),
      LibraryRow,
      PrefetchHooks Function({bool mediaId, bool watchHistoryRefs})
    >;
typedef $$WatchHistoryTableCreateCompanionBuilder =
    WatchHistoryCompanion Function({
      required String id,
      required String userId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      required String deviceId,
      Value<DateTime?> serverUpdatedAt,
      required String libraryId,
      required String mediaId,
      Value<int?> seasonNumber,
      Value<String?> episodeId,
      required DateTime watchedAt,
      Value<int> cycle,
      required String eventType,
      Value<int> rowid,
    });
typedef $$WatchHistoryTableUpdateCompanionBuilder =
    WatchHistoryCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      Value<String> deviceId,
      Value<DateTime?> serverUpdatedAt,
      Value<String> libraryId,
      Value<String> mediaId,
      Value<int?> seasonNumber,
      Value<String?> episodeId,
      Value<DateTime> watchedAt,
      Value<int> cycle,
      Value<String> eventType,
      Value<int> rowid,
    });

final class $$WatchHistoryTableReferences
    extends BaseReferences<_$AppDatabase, $WatchHistoryTable, WatchHistoryRow> {
  $$WatchHistoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserLibraryTable _libraryIdTable(_$AppDatabase db) =>
      db.userLibrary.createAlias('watch_history__library_id__user_library__id');

  $$UserLibraryTableProcessedTableManager get libraryId {
    final $_column = $_itemColumn<String>('library_id')!;

    final manager = $$UserLibraryTableTableManager(
      $_db,
      $_db.userLibrary,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_libraryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('watch_history__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EpisodesTable _episodeIdTable(_$AppDatabase db) =>
      db.episodes.createAlias('watch_history__episode_id__episodes__id');

  $$EpisodesTableProcessedTableManager? get episodeId {
    final $_column = $_itemColumn<String>('episode_id');
    if ($_column == null) return null;
    final manager = $$EpisodesTableTableManager(
      $_db,
      $_db.episodes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WatchHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $WatchHistoryTable> {
  $$WatchHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get watchedAt => $composableBuilder(
    column: $table.watchedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cycle => $composableBuilder(
    column: $table.cycle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnFilters(column),
  );

  $$UserLibraryTableFilterComposer get libraryId {
    final $$UserLibraryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.userLibrary,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLibraryTableFilterComposer(
            $db: $db,
            $table: $db.userLibrary,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodesTableFilterComposer get episodeId {
    final $$EpisodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.episodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodesTableFilterComposer(
            $db: $db,
            $table: $db.episodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WatchHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $WatchHistoryTable> {
  $$WatchHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get watchedAt => $composableBuilder(
    column: $table.watchedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cycle => $composableBuilder(
    column: $table.cycle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserLibraryTableOrderingComposer get libraryId {
    final $$UserLibraryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.userLibrary,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLibraryTableOrderingComposer(
            $db: $db,
            $table: $db.userLibrary,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodesTableOrderingComposer get episodeId {
    final $$EpisodesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.episodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodesTableOrderingComposer(
            $db: $db,
            $table: $db.episodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WatchHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $WatchHistoryTable> {
  $$WatchHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get watchedAt =>
      $composableBuilder(column: $table.watchedAt, builder: (column) => column);

  GeneratedColumn<int> get cycle =>
      $composableBuilder(column: $table.cycle, builder: (column) => column);

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  $$UserLibraryTableAnnotationComposer get libraryId {
    final $$UserLibraryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.userLibrary,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLibraryTableAnnotationComposer(
            $db: $db,
            $table: $db.userLibrary,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodesTableAnnotationComposer get episodeId {
    final $$EpisodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.episodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodesTableAnnotationComposer(
            $db: $db,
            $table: $db.episodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WatchHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WatchHistoryTable,
          WatchHistoryRow,
          $$WatchHistoryTableFilterComposer,
          $$WatchHistoryTableOrderingComposer,
          $$WatchHistoryTableAnnotationComposer,
          $$WatchHistoryTableCreateCompanionBuilder,
          $$WatchHistoryTableUpdateCompanionBuilder,
          (WatchHistoryRow, $$WatchHistoryTableReferences),
          WatchHistoryRow,
          PrefetchHooks Function({bool libraryId, bool mediaId, bool episodeId})
        > {
  $$WatchHistoryTableTableManager(_$AppDatabase db, $WatchHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WatchHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WatchHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WatchHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String> libraryId = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<int?> seasonNumber = const Value.absent(),
                Value<String?> episodeId = const Value.absent(),
                Value<DateTime> watchedAt = const Value.absent(),
                Value<int> cycle = const Value.absent(),
                Value<String> eventType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WatchHistoryCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                libraryId: libraryId,
                mediaId: mediaId,
                seasonNumber: seasonNumber,
                episodeId: episodeId,
                watchedAt: watchedAt,
                cycle: cycle,
                eventType: eventType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                required String deviceId,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required String libraryId,
                required String mediaId,
                Value<int?> seasonNumber = const Value.absent(),
                Value<String?> episodeId = const Value.absent(),
                required DateTime watchedAt,
                Value<int> cycle = const Value.absent(),
                required String eventType,
                Value<int> rowid = const Value.absent(),
              }) => WatchHistoryCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                libraryId: libraryId,
                mediaId: mediaId,
                seasonNumber: seasonNumber,
                episodeId: episodeId,
                watchedAt: watchedAt,
                cycle: cycle,
                eventType: eventType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WatchHistoryTable, WatchHistoryRow>(table),
                  $$WatchHistoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({libraryId = false, mediaId = false, episodeId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (libraryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.libraryId,
                            referencedTable: $$WatchHistoryTableReferences
                                ._libraryIdTable(db),
                            referencedColumn: $$WatchHistoryTableReferences
                                ._libraryIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (mediaId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.mediaId,
                            referencedTable: $$WatchHistoryTableReferences
                                ._mediaIdTable(db),
                            referencedColumn: $$WatchHistoryTableReferences
                                ._mediaIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (episodeId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.episodeId,
                            referencedTable: $$WatchHistoryTableReferences
                                ._episodeIdTable(db),
                            referencedColumn: $$WatchHistoryTableReferences
                                ._episodeIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$WatchHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WatchHistoryTable,
      WatchHistoryRow,
      $$WatchHistoryTableFilterComposer,
      $$WatchHistoryTableOrderingComposer,
      $$WatchHistoryTableAnnotationComposer,
      $$WatchHistoryTableCreateCompanionBuilder,
      $$WatchHistoryTableUpdateCompanionBuilder,
      (WatchHistoryRow, $$WatchHistoryTableReferences),
      WatchHistoryRow,
      PrefetchHooks Function({bool libraryId, bool mediaId, bool episodeId})
    >;
typedef $$UserRatingsTableCreateCompanionBuilder =
    UserRatingsCompanion Function({
      required String id,
      required String userId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      required String deviceId,
      Value<DateTime?> serverUpdatedAt,
      required String mediaId,
      required double rating,
      required DateTime ratedAt,
      Value<int> rowid,
    });
typedef $$UserRatingsTableUpdateCompanionBuilder =
    UserRatingsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      Value<String> deviceId,
      Value<DateTime?> serverUpdatedAt,
      Value<String> mediaId,
      Value<double> rating,
      Value<DateTime> ratedAt,
      Value<int> rowid,
    });

final class $$UserRatingsTableReferences
    extends BaseReferences<_$AppDatabase, $UserRatingsTable, RatingRow> {
  $$UserRatingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('user_ratings__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserRatingsTableFilterComposer
    extends Composer<_$AppDatabase, $UserRatingsTable> {
  $$UserRatingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get ratedAt => $composableBuilder(
    column: $table.ratedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserRatingsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserRatingsTable> {
  $$UserRatingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get ratedAt => $composableBuilder(
    column: $table.ratedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserRatingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserRatingsTable> {
  $$UserRatingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<DateTime> get ratedAt =>
      $composableBuilder(column: $table.ratedAt, builder: (column) => column);

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserRatingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserRatingsTable,
          RatingRow,
          $$UserRatingsTableFilterComposer,
          $$UserRatingsTableOrderingComposer,
          $$UserRatingsTableAnnotationComposer,
          $$UserRatingsTableCreateCompanionBuilder,
          $$UserRatingsTableUpdateCompanionBuilder,
          (RatingRow, $$UserRatingsTableReferences),
          RatingRow,
          PrefetchHooks Function({bool mediaId})
        > {
  $$UserRatingsTableTableManager(_$AppDatabase db, $UserRatingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserRatingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserRatingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserRatingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<DateTime> ratedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserRatingsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                rating: rating,
                ratedAt: ratedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                required String deviceId,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required String mediaId,
                required double rating,
                required DateTime ratedAt,
                Value<int> rowid = const Value.absent(),
              }) => UserRatingsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                rating: rating,
                ratedAt: ratedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserRatingsTable, RatingRow>(table),
                  $$UserRatingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$UserRatingsTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$UserRatingsTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserRatingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserRatingsTable,
      RatingRow,
      $$UserRatingsTableFilterComposer,
      $$UserRatingsTableOrderingComposer,
      $$UserRatingsTableAnnotationComposer,
      $$UserRatingsTableCreateCompanionBuilder,
      $$UserRatingsTableUpdateCompanionBuilder,
      (RatingRow, $$UserRatingsTableReferences),
      RatingRow,
      PrefetchHooks Function({bool mediaId})
    >;
typedef $$UserNotesTableCreateCompanionBuilder = UserNotesCompanion Function({
  required String id,
  required String userId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> revision,
  Value<int> baseRevision,
  required String deviceId,
  Value<DateTime?> serverUpdatedAt,
  required String mediaId,
  Value<String?> episodeId,
  required String body,
  Value<int> rowid,
});
typedef $$UserNotesTableUpdateCompanionBuilder = UserNotesCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> revision,
  Value<int> baseRevision,
  Value<String> deviceId,
  Value<DateTime?> serverUpdatedAt,
  Value<String> mediaId,
  Value<String?> episodeId,
  Value<String> body,
  Value<int> rowid,
});

final class $$UserNotesTableReferences
    extends BaseReferences<_$AppDatabase, $UserNotesTable, NoteRow> {
  $$UserNotesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('user_notes__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EpisodesTable _episodeIdTable(_$AppDatabase db) =>
      db.episodes.createAlias('user_notes__episode_id__episodes__id');

  $$EpisodesTableProcessedTableManager? get episodeId {
    final $_column = $_itemColumn<String>('episode_id');
    if ($_column == null) return null;
    final manager = $$EpisodesTableTableManager(
      $_db,
      $_db.episodes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserNotesTableFilterComposer
    extends Composer<_$AppDatabase, $UserNotesTable> {
  $$UserNotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodesTableFilterComposer get episodeId {
    final $$EpisodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.episodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodesTableFilterComposer(
            $db: $db,
            $table: $db.episodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserNotesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserNotesTable> {
  $$UserNotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodesTableOrderingComposer get episodeId {
    final $$EpisodesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.episodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodesTableOrderingComposer(
            $db: $db,
            $table: $db.episodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserNotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserNotesTable> {
  $$UserNotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodesTableAnnotationComposer get episodeId {
    final $$EpisodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.episodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodesTableAnnotationComposer(
            $db: $db,
            $table: $db.episodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserNotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserNotesTable,
          NoteRow,
          $$UserNotesTableFilterComposer,
          $$UserNotesTableOrderingComposer,
          $$UserNotesTableAnnotationComposer,
          $$UserNotesTableCreateCompanionBuilder,
          $$UserNotesTableUpdateCompanionBuilder,
          (NoteRow, $$UserNotesTableReferences),
          NoteRow,
          PrefetchHooks Function({bool mediaId, bool episodeId})
        > {
  $$UserNotesTableTableManager(_$AppDatabase db, $UserNotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserNotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserNotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<String?> episodeId = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserNotesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                episodeId: episodeId,
                body: body,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                required String deviceId,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required String mediaId,
                Value<String?> episodeId = const Value.absent(),
                required String body,
                Value<int> rowid = const Value.absent(),
              }) => UserNotesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                episodeId: episodeId,
                body: body,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserNotesTable, NoteRow>(table),
                  $$UserNotesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false, episodeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$UserNotesTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$UserNotesTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (episodeId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.episodeId,
                        referencedTable: $$UserNotesTableReferences
                            ._episodeIdTable(db),
                        referencedColumn: $$UserNotesTableReferences
                            ._episodeIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserNotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserNotesTable,
      NoteRow,
      $$UserNotesTableFilterComposer,
      $$UserNotesTableOrderingComposer,
      $$UserNotesTableAnnotationComposer,
      $$UserNotesTableCreateCompanionBuilder,
      $$UserNotesTableUpdateCompanionBuilder,
      (NoteRow, $$UserNotesTableReferences),
      NoteRow,
      PrefetchHooks Function({bool mediaId, bool episodeId})
    >;
typedef $$WatchlistItemsTableCreateCompanionBuilder =
    WatchlistItemsCompanion Function({
      required String id,
      required String userId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      required String deviceId,
      Value<DateTime?> serverUpdatedAt,
      required String mediaId,
      Value<int> priority,
      required DateTime addedAt,
      Value<int> rowid,
    });
typedef $$WatchlistItemsTableUpdateCompanionBuilder =
    WatchlistItemsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      Value<String> deviceId,
      Value<DateTime?> serverUpdatedAt,
      Value<String> mediaId,
      Value<int> priority,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });

final class $$WatchlistItemsTableReferences
    extends BaseReferences<_$AppDatabase, $WatchlistItemsTable, WatchlistRow> {
  $$WatchlistItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('watchlist_items__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WatchlistItemsTableFilterComposer
    extends Composer<_$AppDatabase, $WatchlistItemsTable> {
  $$WatchlistItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WatchlistItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $WatchlistItemsTable> {
  $$WatchlistItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WatchlistItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WatchlistItemsTable> {
  $$WatchlistItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WatchlistItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WatchlistItemsTable,
          WatchlistRow,
          $$WatchlistItemsTableFilterComposer,
          $$WatchlistItemsTableOrderingComposer,
          $$WatchlistItemsTableAnnotationComposer,
          $$WatchlistItemsTableCreateCompanionBuilder,
          $$WatchlistItemsTableUpdateCompanionBuilder,
          (WatchlistRow, $$WatchlistItemsTableReferences),
          WatchlistRow,
          PrefetchHooks Function({bool mediaId})
        > {
  $$WatchlistItemsTableTableManager(
    _$AppDatabase db,
    $WatchlistItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WatchlistItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WatchlistItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WatchlistItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WatchlistItemsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                priority: priority,
                addedAt: addedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                required String deviceId,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required String mediaId,
                Value<int> priority = const Value.absent(),
                required DateTime addedAt,
                Value<int> rowid = const Value.absent(),
              }) => WatchlistItemsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                priority: priority,
                addedAt: addedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WatchlistItemsTable, WatchlistRow>(table),
                  $$WatchlistItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$WatchlistItemsTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$WatchlistItemsTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WatchlistItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WatchlistItemsTable,
      WatchlistRow,
      $$WatchlistItemsTableFilterComposer,
      $$WatchlistItemsTableOrderingComposer,
      $$WatchlistItemsTableAnnotationComposer,
      $$WatchlistItemsTableCreateCompanionBuilder,
      $$WatchlistItemsTableUpdateCompanionBuilder,
      (WatchlistRow, $$WatchlistItemsTableReferences),
      WatchlistRow,
      PrefetchHooks Function({bool mediaId})
    >;
typedef $$FavoritesTableCreateCompanionBuilder = FavoritesCompanion Function({
  required String id,
  required String userId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> revision,
  Value<int> baseRevision,
  required String deviceId,
  Value<DateTime?> serverUpdatedAt,
  required String mediaId,
  required DateTime favoritedAt,
  Value<int> rowid,
});
typedef $$FavoritesTableUpdateCompanionBuilder = FavoritesCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> revision,
  Value<int> baseRevision,
  Value<String> deviceId,
  Value<DateTime?> serverUpdatedAt,
  Value<String> mediaId,
  Value<DateTime> favoritedAt,
  Value<int> rowid,
});

final class $$FavoritesTableReferences
    extends BaseReferences<_$AppDatabase, $FavoritesTable, FavoriteRow> {
  $$FavoritesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('favorites__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get favoritedAt => $composableBuilder(
    column: $table.favoritedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get favoritedAt => $composableBuilder(
    column: $table.favoritedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get favoritedAt => $composableBuilder(
    column: $table.favoritedAt,
    builder: (column) => column,
  );

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTable,
          FavoriteRow,
          $$FavoritesTableFilterComposer,
          $$FavoritesTableOrderingComposer,
          $$FavoritesTableAnnotationComposer,
          $$FavoritesTableCreateCompanionBuilder,
          $$FavoritesTableUpdateCompanionBuilder,
          (FavoriteRow, $$FavoritesTableReferences),
          FavoriteRow,
          PrefetchHooks Function({bool mediaId})
        > {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<DateTime> favoritedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                favoritedAt: favoritedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                required String deviceId,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required String mediaId,
                required DateTime favoritedAt,
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                favoritedAt: favoritedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FavoritesTable, FavoriteRow>(table),
                  $$FavoritesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$FavoritesTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$FavoritesTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTable,
      FavoriteRow,
      $$FavoritesTableFilterComposer,
      $$FavoritesTableOrderingComposer,
      $$FavoritesTableAnnotationComposer,
      $$FavoritesTableCreateCompanionBuilder,
      $$FavoritesTableUpdateCompanionBuilder,
      (FavoriteRow, $$FavoritesTableReferences),
      FavoriteRow,
      PrefetchHooks Function({bool mediaId})
    >;
typedef $$CustomCollectionsTableCreateCompanionBuilder =
    CustomCollectionsCompanion Function({
      required String id,
      required String userId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      required String deviceId,
      Value<DateTime?> serverUpdatedAt,
      required String name,
      Value<String?> description,
      Value<String> coverKind,
      Value<String?> coverMediaId,
      Value<String?> coverLocalPath,
      Value<String?> coverStoragePath,
      required String sortKey,
      Value<int> rowid,
    });
typedef $$CustomCollectionsTableUpdateCompanionBuilder =
    CustomCollectionsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      Value<String> deviceId,
      Value<DateTime?> serverUpdatedAt,
      Value<String> name,
      Value<String?> description,
      Value<String> coverKind,
      Value<String?> coverMediaId,
      Value<String?> coverLocalPath,
      Value<String?> coverStoragePath,
      Value<String> sortKey,
      Value<int> rowid,
    });

final class $$CustomCollectionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $CustomCollectionsTable, CollectionRow> {
  $$CustomCollectionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MediaTable _coverMediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('custom_collections__cover_media_id__media__id');

  $$MediaTableProcessedTableManager? get coverMediaId {
    final $_column = $_itemColumn<String>('cover_media_id');
    if ($_column == null) return null;
    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_coverMediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CollectionItemsTable, List<CollectionItemRow>>
  _collectionItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.collectionItems,
    aliasName: 'custom_collections__id__collection_items__collection_id',
  );

  $$CollectionItemsTableProcessedTableManager get collectionItemsRefs {
    final manager = $$CollectionItemsTableTableManager(
      $_db,
      $_db.collectionItems,
    ).filter((f) => f.collectionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _collectionItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CustomCollectionsTableFilterComposer
    extends Composer<_$AppDatabase, $CustomCollectionsTable> {
  $$CustomCollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverKind => $composableBuilder(
    column: $table.coverKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverLocalPath => $composableBuilder(
    column: $table.coverLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverStoragePath => $composableBuilder(
    column: $table.coverStoragePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sortKey => $composableBuilder(
    column: $table.sortKey,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get coverMediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.coverMediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> collectionItemsRefs(
    Expression<bool> Function($$CollectionItemsTableFilterComposer f) f,
  ) {
    final $$CollectionItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionItems,
      getReferencedColumn: (t) => t.collectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionItemsTableFilterComposer(
            $db: $db,
            $table: $db.collectionItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomCollectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomCollectionsTable> {
  $$CustomCollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverKind => $composableBuilder(
    column: $table.coverKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverLocalPath => $composableBuilder(
    column: $table.coverLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverStoragePath => $composableBuilder(
    column: $table.coverStoragePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sortKey => $composableBuilder(
    column: $table.sortKey,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get coverMediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.coverMediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomCollectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomCollectionsTable> {
  $$CustomCollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverKind =>
      $composableBuilder(column: $table.coverKind, builder: (column) => column);

  GeneratedColumn<String> get coverLocalPath => $composableBuilder(
    column: $table.coverLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverStoragePath => $composableBuilder(
    column: $table.coverStoragePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sortKey =>
      $composableBuilder(column: $table.sortKey, builder: (column) => column);

  $$MediaTableAnnotationComposer get coverMediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.coverMediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> collectionItemsRefs<T extends Object>(
    Expression<T> Function($$CollectionItemsTableAnnotationComposer a) f,
  ) {
    final $$CollectionItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionItems,
      getReferencedColumn: (t) => t.collectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.collectionItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomCollectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomCollectionsTable,
          CollectionRow,
          $$CustomCollectionsTableFilterComposer,
          $$CustomCollectionsTableOrderingComposer,
          $$CustomCollectionsTableAnnotationComposer,
          $$CustomCollectionsTableCreateCompanionBuilder,
          $$CustomCollectionsTableUpdateCompanionBuilder,
          (CollectionRow, $$CustomCollectionsTableReferences),
          CollectionRow,
          PrefetchHooks Function({bool coverMediaId, bool collectionItemsRefs})
        > {
  $$CustomCollectionsTableTableManager(
    _$AppDatabase db,
    $CustomCollectionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomCollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomCollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomCollectionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> coverKind = const Value.absent(),
                Value<String?> coverMediaId = const Value.absent(),
                Value<String?> coverLocalPath = const Value.absent(),
                Value<String?> coverStoragePath = const Value.absent(),
                Value<String> sortKey = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomCollectionsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                name: name,
                description: description,
                coverKind: coverKind,
                coverMediaId: coverMediaId,
                coverLocalPath: coverLocalPath,
                coverStoragePath: coverStoragePath,
                sortKey: sortKey,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                required String deviceId,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String> coverKind = const Value.absent(),
                Value<String?> coverMediaId = const Value.absent(),
                Value<String?> coverLocalPath = const Value.absent(),
                Value<String?> coverStoragePath = const Value.absent(),
                required String sortKey,
                Value<int> rowid = const Value.absent(),
              }) => CustomCollectionsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                name: name,
                description: description,
                coverKind: coverKind,
                coverMediaId: coverMediaId,
                coverLocalPath: coverLocalPath,
                coverStoragePath: coverStoragePath,
                sortKey: sortKey,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CustomCollectionsTable, CollectionRow>(table),
                  $$CustomCollectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({coverMediaId = false, collectionItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (collectionItemsRefs) db.collectionItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (coverMediaId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.coverMediaId,
                            referencedTable: $$CustomCollectionsTableReferences
                                ._coverMediaIdTable(db),
                            referencedColumn: $$CustomCollectionsTableReferences
                                ._coverMediaIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (collectionItemsRefs)
                        await $_getPrefetchedDataByColumns<
                          CollectionRow,
                          $CustomCollectionsTable,
                          CollectionItemRow,
                          $CollectionItemsTable
                        >(
                          currentTable: table,
                          referencedTable: $$CustomCollectionsTableReferences
                              ._collectionItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CustomCollectionsTableReferences(
                                db,
                                table,
                                p0,
                              ).collectionItemsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'collection_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CustomCollectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomCollectionsTable,
      CollectionRow,
      $$CustomCollectionsTableFilterComposer,
      $$CustomCollectionsTableOrderingComposer,
      $$CustomCollectionsTableAnnotationComposer,
      $$CustomCollectionsTableCreateCompanionBuilder,
      $$CustomCollectionsTableUpdateCompanionBuilder,
      (CollectionRow, $$CustomCollectionsTableReferences),
      CollectionRow,
      PrefetchHooks Function({bool coverMediaId, bool collectionItemsRefs})
    >;
typedef $$CollectionItemsTableCreateCompanionBuilder =
    CollectionItemsCompanion Function({
      required String id,
      required String userId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      required String deviceId,
      Value<DateTime?> serverUpdatedAt,
      required String collectionId,
      required String mediaId,
      required String positionKey,
      required DateTime addedAt,
      Value<int> rowid,
    });
typedef $$CollectionItemsTableUpdateCompanionBuilder =
    CollectionItemsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      Value<String> deviceId,
      Value<DateTime?> serverUpdatedAt,
      Value<String> collectionId,
      Value<String> mediaId,
      Value<String> positionKey,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });

final class $$CollectionItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CollectionItemsTable,
          CollectionItemRow
        > {
  $$CollectionItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CustomCollectionsTable _collectionIdTable(_$AppDatabase db) => db
      .customCollections
      .createAlias('collection_items__collection_id__custom_collections__id');

  $$CustomCollectionsTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<String>('collection_id')!;

    final manager = $$CustomCollectionsTableTableManager(
      $_db,
      $_db.customCollections,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('collection_items__media_id__media__id');

  $$MediaTableProcessedTableManager get mediaId {
    final $_column = $_itemColumn<String>('media_id')!;

    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CollectionItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get positionKey => $composableBuilder(
    column: $table.positionKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CustomCollectionsTableFilterComposer get collectionId {
    final $$CustomCollectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.customCollections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomCollectionsTableFilterComposer(
            $db: $db,
            $table: $db.customCollections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get positionKey => $composableBuilder(
    column: $table.positionKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CustomCollectionsTableOrderingComposer get collectionId {
    final $$CustomCollectionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.customCollections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomCollectionsTableOrderingComposer(
            $db: $db,
            $table: $db.customCollections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get positionKey => $composableBuilder(
    column: $table.positionKey,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$CustomCollectionsTableAnnotationComposer get collectionId {
    final $$CustomCollectionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.collectionId,
          referencedTable: $db.customCollections,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CustomCollectionsTableAnnotationComposer(
                $db: $db,
                $table: $db.customCollections,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CollectionItemsTable,
          CollectionItemRow,
          $$CollectionItemsTableFilterComposer,
          $$CollectionItemsTableOrderingComposer,
          $$CollectionItemsTableAnnotationComposer,
          $$CollectionItemsTableCreateCompanionBuilder,
          $$CollectionItemsTableUpdateCompanionBuilder,
          (CollectionItemRow, $$CollectionItemsTableReferences),
          CollectionItemRow,
          PrefetchHooks Function({bool collectionId, bool mediaId})
        > {
  $$CollectionItemsTableTableManager(
    _$AppDatabase db,
    $CollectionItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String> collectionId = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<String> positionKey = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CollectionItemsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                collectionId: collectionId,
                mediaId: mediaId,
                positionKey: positionKey,
                addedAt: addedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                required String deviceId,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required String collectionId,
                required String mediaId,
                required String positionKey,
                required DateTime addedAt,
                Value<int> rowid = const Value.absent(),
              }) => CollectionItemsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                collectionId: collectionId,
                mediaId: mediaId,
                positionKey: positionKey,
                addedAt: addedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CollectionItemsTable, CollectionItemRow>(table),
                  $$CollectionItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({collectionId = false, mediaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (collectionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.collectionId,
                        referencedTable: $$CollectionItemsTableReferences
                            ._collectionIdTable(db),
                        referencedColumn: $$CollectionItemsTableReferences
                            ._collectionIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$CollectionItemsTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$CollectionItemsTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CollectionItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CollectionItemsTable,
      CollectionItemRow,
      $$CollectionItemsTableFilterComposer,
      $$CollectionItemsTableOrderingComposer,
      $$CollectionItemsTableAnnotationComposer,
      $$CollectionItemsTableCreateCompanionBuilder,
      $$CollectionItemsTableUpdateCompanionBuilder,
      (CollectionItemRow, $$CollectionItemsTableReferences),
      CollectionItemRow,
      PrefetchHooks Function({bool collectionId, bool mediaId})
    >;
typedef $$RemindersTableCreateCompanionBuilder = RemindersCompanion Function({
  required String id,
  required String userId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> revision,
  Value<int> baseRevision,
  required String deviceId,
  Value<DateTime?> serverUpdatedAt,
  required String kind,
  Value<String?> mediaId,
  required String title,
  Value<String?> body,
  required DateTime scheduledAt,
  required String timezone,
  Value<String?> repeatRule,
  Value<bool> enabled,
  required int notificationId,
  Value<int> rowid,
});
typedef $$RemindersTableUpdateCompanionBuilder = RemindersCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> revision,
  Value<int> baseRevision,
  Value<String> deviceId,
  Value<DateTime?> serverUpdatedAt,
  Value<String> kind,
  Value<String?> mediaId,
  Value<String> title,
  Value<String?> body,
  Value<DateTime> scheduledAt,
  Value<String> timezone,
  Value<String?> repeatRule,
  Value<bool> enabled,
  Value<int> notificationId,
  Value<int> rowid,
});

final class $$RemindersTableReferences
    extends BaseReferences<_$AppDatabase, $RemindersTable, ReminderRow> {
  $$RemindersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('reminders__media_id__media__id');

  $$MediaTableProcessedTableManager? get mediaId {
    final $_column = $_itemColumn<String>('media_id');
    if ($_column == null) return null;
    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get repeatRule => $composableBuilder(
    column: $table.repeatRule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get repeatRule => $composableBuilder(
    column: $table.repeatRule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<String> get repeatRule => $composableBuilder(
    column: $table.repeatRule,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => column,
  );

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          ReminderRow,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (ReminderRow, $$RemindersTableReferences),
          ReminderRow,
          PrefetchHooks Function({bool mediaId})
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String?> mediaId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> body = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<String?> repeatRule = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> notificationId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                kind: kind,
                mediaId: mediaId,
                title: title,
                body: body,
                scheduledAt: scheduledAt,
                timezone: timezone,
                repeatRule: repeatRule,
                enabled: enabled,
                notificationId: notificationId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                required String deviceId,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required String kind,
                Value<String?> mediaId = const Value.absent(),
                required String title,
                Value<String?> body = const Value.absent(),
                required DateTime scheduledAt,
                required String timezone,
                Value<String?> repeatRule = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                required int notificationId,
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                kind: kind,
                mediaId: mediaId,
                title: title,
                body: body,
                scheduledAt: scheduledAt,
                timezone: timezone,
                repeatRule: repeatRule,
                enabled: enabled,
                notificationId: notificationId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RemindersTable, ReminderRow>(table),
                  $$RemindersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$RemindersTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$RemindersTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      ReminderRow,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (ReminderRow, $$RemindersTableReferences),
      ReminderRow,
      PrefetchHooks Function({bool mediaId})
    >;
typedef $$CalendarEventsTableCreateCompanionBuilder =
    CalendarEventsCompanion Function({
      required String id,
      required String userId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      required String deviceId,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> mediaId,
      required String kind,
      required DateTime eventDate,
      Value<String?> title,
      Value<int> rowid,
    });
typedef $$CalendarEventsTableUpdateCompanionBuilder =
    CalendarEventsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> revision,
      Value<int> baseRevision,
      Value<String> deviceId,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> mediaId,
      Value<String> kind,
      Value<DateTime> eventDate,
      Value<String?> title,
      Value<int> rowid,
    });

final class $$CalendarEventsTableReferences
    extends
        BaseReferences<_$AppDatabase, $CalendarEventsTable, CalendarEventRow> {
  $$CalendarEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MediaTable _mediaIdTable(_$AppDatabase db) =>
      db.media.createAlias('calendar_events__media_id__media__id');

  $$MediaTableProcessedTableManager? get mediaId {
    final $_column = $_itemColumn<String>('media_id');
    if ($_column == null) return null;
    final manager = $$MediaTableTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CalendarEventsTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get eventDate => $composableBuilder(
    column: $table.eventDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  $$MediaTableFilterComposer get mediaId {
    final $$MediaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CalendarEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get eventDate => $composableBuilder(
    column: $table.eventDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  $$MediaTableOrderingComposer get mediaId {
    final $$MediaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableOrderingComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CalendarEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<int> get baseRevision => $composableBuilder(
    column: $table.baseRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<DateTime> get eventDate =>
      $composableBuilder(column: $table.eventDate, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  $$MediaTableAnnotationComposer get mediaId {
    final $$MediaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mediaId,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaTableAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CalendarEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CalendarEventsTable,
          CalendarEventRow,
          $$CalendarEventsTableFilterComposer,
          $$CalendarEventsTableOrderingComposer,
          $$CalendarEventsTableAnnotationComposer,
          $$CalendarEventsTableCreateCompanionBuilder,
          $$CalendarEventsTableUpdateCompanionBuilder,
          (CalendarEventRow, $$CalendarEventsTableReferences),
          CalendarEventRow,
          PrefetchHooks Function({bool mediaId})
        > {
  $$CalendarEventsTableTableManager(
    _$AppDatabase db,
    $CalendarEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> mediaId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<DateTime> eventDate = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarEventsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                kind: kind,
                eventDate: eventDate,
                title: title,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<int> baseRevision = const Value.absent(),
                required String deviceId,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> mediaId = const Value.absent(),
                required String kind,
                required DateTime eventDate,
                Value<String?> title = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarEventsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                revision: revision,
                baseRevision: baseRevision,
                deviceId: deviceId,
                serverUpdatedAt: serverUpdatedAt,
                mediaId: mediaId,
                kind: kind,
                eventDate: eventDate,
                title: title,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CalendarEventsTable, CalendarEventRow>(table),
                  $$CalendarEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mediaId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mediaId,
                        referencedTable: $$CalendarEventsTableReferences
                            ._mediaIdTable(db),
                        referencedColumn: $$CalendarEventsTableReferences
                            ._mediaIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CalendarEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CalendarEventsTable,
      CalendarEventRow,
      $$CalendarEventsTableFilterComposer,
      $$CalendarEventsTableOrderingComposer,
      $$CalendarEventsTableAnnotationComposer,
      $$CalendarEventsTableCreateCompanionBuilder,
      $$CalendarEventsTableUpdateCompanionBuilder,
      (CalendarEventRow, $$CalendarEventsTableReferences),
      CalendarEventRow,
      PrefetchHooks Function({bool mediaId})
    >;
typedef $$SyncQueueTableCreateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  required String entityType,
  required String entityId,
  required String operation,
  required int localRevision,
  Value<String> status,
  Value<int> attemptCount,
  required DateTime nextAttemptAt,
  Value<String?> lastError,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$SyncQueueTableUpdateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  Value<String> entityType,
  Value<String> entityId,
  Value<String> operation,
  Value<int> localRevision,
  Value<String> status,
  Value<int> attemptCount,
  Value<DateTime> nextAttemptAt,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get localRevision => $composableBuilder(
    column: $table.localRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get localRevision => $composableBuilder(
    column: $table.localRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<int> get localRevision => $composableBuilder(
    column: $table.localRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueRow,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueRow,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueRow>,
          ),
          SyncQueueRow,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<int> localRevision = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                Value<DateTime> nextAttemptAt = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SyncQueueCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operation: operation,
                localRevision: localRevision,
                status: status,
                attemptCount: attemptCount,
                nextAttemptAt: nextAttemptAt,
                lastError: lastError,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required String entityId,
                required String operation,
                required int localRevision,
                Value<String> status = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                required DateTime nextAttemptAt,
                Value<String?> lastError = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => SyncQueueCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operation: operation,
                localRevision: localRevision,
                status: status,
                attemptCount: attemptCount,
                nextAttemptAt: nextAttemptAt,
                lastError: lastError,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncQueueTable, SyncQueueRow>(table),
                  BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueRow,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueRow,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueRow>,
      ),
      SyncQueueRow,
      PrefetchHooks Function()
    >;
typedef $$SyncMetadataTableCreateCompanionBuilder =
    SyncMetadataCompanion Function({
      required String metaKey,
      required String metaValue,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SyncMetadataTableUpdateCompanionBuilder =
    SyncMetadataCompanion Function({
      Value<String> metaKey,
      Value<String> metaValue,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SyncMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get metaKey => $composableBuilder(
    column: $table.metaKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metaValue => $composableBuilder(
    column: $table.metaValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get metaKey => $composableBuilder(
    column: $table.metaKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metaValue => $composableBuilder(
    column: $table.metaValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get metaKey =>
      $composableBuilder(column: $table.metaKey, builder: (column) => column);

  GeneratedColumn<String> get metaValue =>
      $composableBuilder(column: $table.metaValue, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetadataTable,
          SyncMetadataRow,
          $$SyncMetadataTableFilterComposer,
          $$SyncMetadataTableOrderingComposer,
          $$SyncMetadataTableAnnotationComposer,
          $$SyncMetadataTableCreateCompanionBuilder,
          $$SyncMetadataTableUpdateCompanionBuilder,
          (
            SyncMetadataRow,
            BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataRow>,
          ),
          SyncMetadataRow,
          PrefetchHooks Function()
        > {
  $$SyncMetadataTableTableManager(_$AppDatabase db, $SyncMetadataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> metaKey = const Value.absent(),
                Value<String> metaValue = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataCompanion(
                metaKey: metaKey,
                metaValue: metaValue,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String metaKey,
                required String metaValue,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataCompanion.insert(
                metaKey: metaKey,
                metaValue: metaValue,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncMetadataTable, SyncMetadataRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SyncMetadataTable,
                    SyncMetadataRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetadataTable,
      SyncMetadataRow,
      $$SyncMetadataTableFilterComposer,
      $$SyncMetadataTableOrderingComposer,
      $$SyncMetadataTableAnnotationComposer,
      $$SyncMetadataTableCreateCompanionBuilder,
      $$SyncMetadataTableUpdateCompanionBuilder,
      (
        SyncMetadataRow,
        BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataRow>,
      ),
      SyncMetadataRow,
      PrefetchHooks Function()
    >;
typedef $$BackupHistoryTableCreateCompanionBuilder =
    BackupHistoryCompanion Function({
      required String id,
      required String kind,
      required String status,
      Value<String?> storagePath,
      Value<String?> fileName,
      Value<int> sizeBytes,
      Value<String?> checksumSha256,
      required int backupVersion,
      required String appVersion,
      required int schemaVersion,
      Value<String> counts,
      Value<String?> error,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$BackupHistoryTableUpdateCompanionBuilder =
    BackupHistoryCompanion Function({
      Value<String> id,
      Value<String> kind,
      Value<String> status,
      Value<String?> storagePath,
      Value<String?> fileName,
      Value<int> sizeBytes,
      Value<String?> checksumSha256,
      Value<int> backupVersion,
      Value<String> appVersion,
      Value<int> schemaVersion,
      Value<String> counts,
      Value<String?> error,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$BackupHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $BackupHistoryTable> {
  $$BackupHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get storagePath => $composableBuilder(
    column: $table.storagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checksumSha256 => $composableBuilder(
    column: $table.checksumSha256,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get backupVersion => $composableBuilder(
    column: $table.backupVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get counts => $composableBuilder(
    column: $table.counts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BackupHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $BackupHistoryTable> {
  $$BackupHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get storagePath => $composableBuilder(
    column: $table.storagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checksumSha256 => $composableBuilder(
    column: $table.checksumSha256,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get backupVersion => $composableBuilder(
    column: $table.backupVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get counts => $composableBuilder(
    column: $table.counts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BackupHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $BackupHistoryTable> {
  $$BackupHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get storagePath => $composableBuilder(
    column: $table.storagePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get checksumSha256 => $composableBuilder(
    column: $table.checksumSha256,
    builder: (column) => column,
  );

  GeneratedColumn<int> get backupVersion => $composableBuilder(
    column: $table.backupVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get counts =>
      $composableBuilder(column: $table.counts, builder: (column) => column);

  GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BackupHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BackupHistoryTable,
          BackupHistoryRow,
          $$BackupHistoryTableFilterComposer,
          $$BackupHistoryTableOrderingComposer,
          $$BackupHistoryTableAnnotationComposer,
          $$BackupHistoryTableCreateCompanionBuilder,
          $$BackupHistoryTableUpdateCompanionBuilder,
          (
            BackupHistoryRow,
            BaseReferences<
              _$AppDatabase,
              $BackupHistoryTable,
              BackupHistoryRow
            >,
          ),
          BackupHistoryRow,
          PrefetchHooks Function()
        > {
  $$BackupHistoryTableTableManager(_$AppDatabase db, $BackupHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BackupHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BackupHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BackupHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> storagePath = const Value.absent(),
                Value<String?> fileName = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                Value<String?> checksumSha256 = const Value.absent(),
                Value<int> backupVersion = const Value.absent(),
                Value<String> appVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<String> counts = const Value.absent(),
                Value<String?> error = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BackupHistoryCompanion(
                id: id,
                kind: kind,
                status: status,
                storagePath: storagePath,
                fileName: fileName,
                sizeBytes: sizeBytes,
                checksumSha256: checksumSha256,
                backupVersion: backupVersion,
                appVersion: appVersion,
                schemaVersion: schemaVersion,
                counts: counts,
                error: error,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String kind,
                required String status,
                Value<String?> storagePath = const Value.absent(),
                Value<String?> fileName = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                Value<String?> checksumSha256 = const Value.absent(),
                required int backupVersion,
                required String appVersion,
                required int schemaVersion,
                Value<String> counts = const Value.absent(),
                Value<String?> error = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => BackupHistoryCompanion.insert(
                id: id,
                kind: kind,
                status: status,
                storagePath: storagePath,
                fileName: fileName,
                sizeBytes: sizeBytes,
                checksumSha256: checksumSha256,
                backupVersion: backupVersion,
                appVersion: appVersion,
                schemaVersion: schemaVersion,
                counts: counts,
                error: error,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BackupHistoryTable, BackupHistoryRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $BackupHistoryTable,
                    BackupHistoryRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BackupHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BackupHistoryTable,
      BackupHistoryRow,
      $$BackupHistoryTableFilterComposer,
      $$BackupHistoryTableOrderingComposer,
      $$BackupHistoryTableAnnotationComposer,
      $$BackupHistoryTableCreateCompanionBuilder,
      $$BackupHistoryTableUpdateCompanionBuilder,
      (
        BackupHistoryRow,
        BaseReferences<_$AppDatabase, $BackupHistoryTable, BackupHistoryRow>,
      ),
      BackupHistoryRow,
      PrefetchHooks Function()
    >;
typedef $$CachedMediaMetadataTableCreateCompanionBuilder =
    CachedMediaMetadataCompanion Function({
      required String cacheKey,
      required String responseJson,
      Value<String?> etag,
      required DateTime fetchedAt,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$CachedMediaMetadataTableUpdateCompanionBuilder =
    CachedMediaMetadataCompanion Function({
      Value<String> cacheKey,
      Value<String> responseJson,
      Value<String?> etag,
      Value<DateTime> fetchedAt,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$CachedMediaMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $CachedMediaMetadataTable> {
  $$CachedMediaMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responseJson => $composableBuilder(
    column: $table.responseJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedMediaMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedMediaMetadataTable> {
  $$CachedMediaMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responseJson => $composableBuilder(
    column: $table.responseJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedMediaMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedMediaMetadataTable> {
  $$CachedMediaMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<String> get responseJson => $composableBuilder(
    column: $table.responseJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$CachedMediaMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedMediaMetadataTable,
          CachedMetadataRow,
          $$CachedMediaMetadataTableFilterComposer,
          $$CachedMediaMetadataTableOrderingComposer,
          $$CachedMediaMetadataTableAnnotationComposer,
          $$CachedMediaMetadataTableCreateCompanionBuilder,
          $$CachedMediaMetadataTableUpdateCompanionBuilder,
          (
            CachedMetadataRow,
            BaseReferences<
              _$AppDatabase,
              $CachedMediaMetadataTable,
              CachedMetadataRow
            >,
          ),
          CachedMetadataRow,
          PrefetchHooks Function()
        > {
  $$CachedMediaMetadataTableTableManager(
    _$AppDatabase db,
    $CachedMediaMetadataTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedMediaMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedMediaMetadataTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedMediaMetadataTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> cacheKey = const Value.absent(),
                Value<String> responseJson = const Value.absent(),
                Value<String?> etag = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedMediaMetadataCompanion(
                cacheKey: cacheKey,
                responseJson: responseJson,
                etag: etag,
                fetchedAt: fetchedAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String cacheKey,
                required String responseJson,
                Value<String?> etag = const Value.absent(),
                required DateTime fetchedAt,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedMediaMetadataCompanion.insert(
                cacheKey: cacheKey,
                responseJson: responseJson,
                etag: etag,
                fetchedAt: fetchedAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CachedMediaMetadataTable, CachedMetadataRow>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $CachedMediaMetadataTable,
                    CachedMetadataRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedMediaMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedMediaMetadataTable,
      CachedMetadataRow,
      $$CachedMediaMetadataTableFilterComposer,
      $$CachedMediaMetadataTableOrderingComposer,
      $$CachedMediaMetadataTableAnnotationComposer,
      $$CachedMediaMetadataTableCreateCompanionBuilder,
      $$CachedMediaMetadataTableUpdateCompanionBuilder,
      (
        CachedMetadataRow,
        BaseReferences<
          _$AppDatabase,
          $CachedMediaMetadataTable,
          CachedMetadataRow
        >,
      ),
      CachedMetadataRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$MediaTableTableManager get media =>
      $$MediaTableTableManager(_db, _db.media);
  $$AlternativeTitlesTableTableManager get alternativeTitles =>
      $$AlternativeTitlesTableTableManager(_db, _db.alternativeTitles);
  $$GenresTableTableManager get genres =>
      $$GenresTableTableManager(_db, _db.genres);
  $$MediaGenresTableTableManager get mediaGenres =>
      $$MediaGenresTableTableManager(_db, _db.mediaGenres);
  $$PeopleTableTableManager get people =>
      $$PeopleTableTableManager(_db, _db.people);
  $$MediaCreditsTableTableManager get mediaCredits =>
      $$MediaCreditsTableTableManager(_db, _db.mediaCredits);
  $$SeasonsTableTableManager get seasons =>
      $$SeasonsTableTableManager(_db, _db.seasons);
  $$EpisodesTableTableManager get episodes =>
      $$EpisodesTableTableManager(_db, _db.episodes);
  $$UserLibraryTableTableManager get userLibrary =>
      $$UserLibraryTableTableManager(_db, _db.userLibrary);
  $$WatchHistoryTableTableManager get watchHistory =>
      $$WatchHistoryTableTableManager(_db, _db.watchHistory);
  $$UserRatingsTableTableManager get userRatings =>
      $$UserRatingsTableTableManager(_db, _db.userRatings);
  $$UserNotesTableTableManager get userNotes =>
      $$UserNotesTableTableManager(_db, _db.userNotes);
  $$WatchlistItemsTableTableManager get watchlistItems =>
      $$WatchlistItemsTableTableManager(_db, _db.watchlistItems);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$CustomCollectionsTableTableManager get customCollections =>
      $$CustomCollectionsTableTableManager(_db, _db.customCollections);
  $$CollectionItemsTableTableManager get collectionItems =>
      $$CollectionItemsTableTableManager(_db, _db.collectionItems);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$CalendarEventsTableTableManager get calendarEvents =>
      $$CalendarEventsTableTableManager(_db, _db.calendarEvents);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$SyncMetadataTableTableManager get syncMetadata =>
      $$SyncMetadataTableTableManager(_db, _db.syncMetadata);
  $$BackupHistoryTableTableManager get backupHistory =>
      $$BackupHistoryTableTableManager(_db, _db.backupHistory);
  $$CachedMediaMetadataTableTableManager get cachedMediaMetadata =>
      $$CachedMediaMetadataTableTableManager(_db, _db.cachedMediaMetadata);
}
