import 'package:dio/dio.dart' show RequestOptions;
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/core/network/api_config.dart';
import 'package:moviary/core/utils/entity_ids.dart';
import 'package:moviary/features/explore/data/tmdb_api.dart';
import 'package:moviary/features/media_detail/domain/media_summary.dart';

import '../../helpers/fake_http_adapter.dart';

const _trendingBody = {
  'results': [
    {
      'id': 438631,
      'media_type': 'movie',
      'title': 'Dune',
      'original_title': 'Dune',
      'overview': ' A noble family. ',
      'release_date': '2021-09-15',
      'poster_path': '/dune.jpg',
      'backdrop_path': '/dune_bg.jpg',
      'vote_average': 7.8,
      'vote_count': 11000,
    },
    {
      'id': 1396,
      'media_type': 'tv',
      'name': 'Breaking Bad',
      'original_name': 'Breaking Bad',
      'first_air_date': '2008-01-20',
      'poster_path': null,
      'vote_average': 0,
      'vote_count': 0,
    },
    {'id': 31, 'media_type': 'person', 'name': 'Someone Famous'},
    {'id': 99, 'media_type': 'movie'}, // no title: skipped
    'not a map',
  ],
};

void main() {
  late FakeHttpAdapter adapter;
  late FakeResponse Function(RequestOptions) handler;

  TmdbApi build({ApiConfig config = const ApiConfig(tmdbApiKey: 'k')}) {
    adapter = FakeHttpAdapter((options) => handler(options));
    return TmdbApi(fakeDio(adapter), config);
  }

  setUp(() => handler = (_) => const FakeResponse(200, _trendingBody));

  test('maps movies and series, skipping people and broken rows', () async {
    final api = build();
    final items = await api.trending(language: 'en-US');

    expect(items.map((e) => e.title), ['Dune', 'Breaking Bad']);

    final dune = items.first;
    expect(dune.provider, 'tmdb');
    expect(dune.providerId, '438631');
    expect(dune.mediaType, MediaType.movie);
    expect(
      dune.id,
      EntityIds.catalogMedia(
        provider: 'tmdb',
        providerId: '438631',
        mediaType: 'movie',
      ),
    );
    expect(dune.originalTitle, isNull); // same as the title
    expect(dune.overview, 'A noble family.');
    expect(dune.releaseDate, DateTime.utc(2021, 9, 15));
    expect(dune.posterPath, 'https://image.tmdb.org/t/p/w342/dune.jpg');
    expect(dune.backdropPath, 'https://image.tmdb.org/t/p/w780/dune_bg.jpg');
    expect(dune.externalRating, 7.8);

    final show = items.last;
    expect(show.mediaType, MediaType.tv);
    expect(show.posterPath, isNull);
    expect(show.externalRating, isNull); // no votes yet
  });

  test('sends the key and language, and the right path', () async {
    final api = build();
    await api.trending(language: 'id-ID');

    final request = adapter.requests.single;
    expect(request.uri.path, endsWith('/trending/all/week'));
    expect(request.queryParameters['api_key'], 'k');
    expect(request.queryParameters['language'], 'id-ID');
  });

  test('a read access token is used instead of the key query parameter',
      () async {
    final api = build(config: const ApiConfig(tmdbReadAccessToken: 'token'));
    await api.trending(language: 'en-US');

    expect(adapter.requests.single.queryParameters.containsKey('api_key'),
        isFalse);
  });

  test('popular lists fall back to the list type when media_type is absent',
      () async {
    handler = (_) => const FakeResponse(200, {
          'results': [
            {'id': 5, 'title': 'Alien', 'release_date': ''},
          ],
        });
    final api = build();

    final movies = await api.popularMovies(language: 'en-US');
    expect(movies.single.mediaType, MediaType.movie);
    expect(movies.single.releaseDate, isNull);

    handler = (_) => const FakeResponse(200, {
          'results': [
            {'id': 6, 'name': 'Severance'},
          ],
        });
    final shows = await api.popularTv(language: 'en-US');
    expect(shows.single.mediaType, MediaType.tv);
  });

  test('search sends the query', () async {
    final api = build();
    await api.search('dune', language: 'en-US');

    final request = adapter.requests.single;
    expect(request.uri.path, endsWith('/search/multi'));
    expect(request.queryParameters['query'], 'dune');
  });

  test('without credentials it fails with ConfigFailure and sends nothing',
      () async {
    final api = build(config: const ApiConfig());

    await expectLater(
      api.trending(language: 'en-US'),
      throwsA(isA<ConfigFailure>()),
    );
    expect(adapter.requests, isEmpty);
  });

  test('maps transport and HTTP errors to typed failures', () async {
    final api = build();

    handler = (options) => throw noConnection(options);
    await expectLater(
      api.trending(language: 'en-US'),
      throwsA(isA<NetworkFailure>()),
    );

    handler = (_) => const FakeResponse(401, {'status_message': 'Invalid'});
    await expectLater(
      api.trending(language: 'en-US'),
      throwsA(isA<ConfigFailure>()),
    );

    handler = (_) => const FakeResponse(429, {}, {
          'retry-after': ['7'],
        });
    await expectLater(
      api.trending(language: 'en-US'),
      throwsA(
        isA<RateLimitedFailure>()
            .having((f) => f.retryAfter, 'retryAfter', const Duration(seconds: 7)),
      ),
    );

    handler = (_) => const FakeResponse(500, {});
    await expectLater(
      api.trending(language: 'en-US'),
      throwsA(isA<UnknownFailure>()),
    );
  });

  test('an unexpected body is an UnknownFailure, not a crash', () async {
    handler = (_) => const FakeResponse(200, ['unexpected']);
    final api = build();

    await expectLater(
      api.trending(language: 'en-US'),
      throwsA(isA<UnknownFailure>()),
    );
  });
}
