import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/database/app_database.dart' show MediaRow;
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/features/explore/data/catalog_repository_impl.dart';
import 'package:moviary/features/library/data/library_repository_impl.dart';
import 'package:moviary/features/library/domain/library_entities.dart';
import 'package:moviary/features/media_detail/data/media_mappers.dart';
import 'package:moviary/features/media_detail/domain/media_summary.dart';

import '../../helpers/db_fixture.dart';

MediaSummary _remote({
  String title = 'Dune',
  String? overview = 'A noble family.',
  String? poster = 'https://image.tmdb.org/t/p/w342/dune.jpg',
}) {
  return MediaSummary(
    id: 'tmdb-movie-438631',
    provider: 'tmdb',
    providerId: '438631',
    mediaType: MediaType.movie,
    title: title,
    overview: overview,
    releaseDate: DateTime.utc(2021, 9, 15),
    posterPath: poster,
    externalRating: 7.8,
  );
}

void main() {
  late DbFixture fx;
  late CatalogRepositoryImpl catalog;

  setUp(() {
    fx = DbFixture.create();
    catalog = CatalogRepositoryImpl(fx.db, fx.clock);
  });

  tearDown(() => fx.close());

  Future<List<MediaRow>> rows() => fx.db.select(fx.db.media).get();

  test('stores a discovered title without queueing it for sync', () async {
    await catalog.ensureLocal(_remote());

    final stored = (await rows()).single;
    expect(stored.provider, 'tmdb');
    expect(stored.mediaType, 'movie');
    expect(stored.title, 'Dune');
    expect(stored.posterPath, 'https://image.tmdb.org/t/p/w342/dune.jpg');
    expect(stored.isManual, isFalse);
    expect(stored.metadataFetchedAt, isNotNull);
    expect(await fx.queue(), isEmpty);
  });

  test('calling it again refreshes instead of duplicating', () async {
    await catalog.ensureLocal(_remote());
    fx.advance();
    await catalog.ensureLocal(_remote(title: 'Dune (2021)'));

    final stored = await rows();
    expect(stored, hasLength(1));
    expect(stored.single.title, 'Dune (2021)');
  });

  test('a refresh never replaces stored detail with null', () async {
    await catalog.ensureLocal(_remote());
    await catalog.ensureLocal(_remote(overview: null, poster: null));

    final stored = (await rows()).single;
    expect(stored.overview, 'A noble family.');
    expect(stored.posterPath, 'https://image.tmdb.org/t/p/w342/dune.jpg');
  });

  test('refuses manual media', () async {
    const manual = MediaSummary(
      id: 'm',
      provider: 'manual',
      providerId: 'm',
      mediaType: MediaType.movie,
      title: 'Mine',
      isManual: true,
    );

    await expectLater(
      catalog.ensureLocal(manual),
      throwsA(isA<ValidationFailure>()),
    );
    expect(await rows(), isEmpty);
  });

  test('a stored title can be added to the library', () async {
    final remote = _remote();
    await catalog.ensureLocal(remote);

    final library = LibraryRepositoryImpl(fx.db, fx.writer, fx.rows);
    await library.setStatus('alice', remote.id, WatchStatus.planToWatch);

    final entries = await library.watchEntries('alice', const LibraryQuery()).first;
    expect(entries.single.media.title, 'Dune');
    expect(mediaFromRow((await rows()).single).providerId, '438631');
  });
}