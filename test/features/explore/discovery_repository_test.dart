import 'package:dio/dio.dart' show RequestOptions;
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/core/network/api_config.dart';
import 'package:moviary/features/explore/data/discovery_repository_impl.dart';
import 'package:moviary/features/explore/data/jikan_api.dart';
import 'package:moviary/features/explore/data/tmdb_api.dart';
import 'package:moviary/features/explore/domain/discovery_repository.dart';
import 'package:moviary/features/media_detail/domain/media_summary.dart';

import '../../helpers/fake_http_adapter.dart';

void main() {
  late FakeHttpAdapter tmdbAdapter;
  late FakeHttpAdapter jikanAdapter;
  late FakeResponse Function(RequestOptions) tmdbHandler;
  late FakeResponse Function(RequestOptions) jikanHandler;

  DiscoveryRepositoryImpl build({
    ApiConfig config = const ApiConfig(tmdbApiKey: 'k'),
  }) {
    tmdbAdapter = FakeHttpAdapter((o) => tmdbHandler(o));
    jikanAdapter = FakeHttpAdapter((o) => jikanHandler(o));
    return DiscoveryRepositoryImpl(
      tmdb: TmdbApi(fakeDio(tmdbAdapter), config),
      jikan: JikanApi(fakeDio(jikanAdapter)),
      language: 'en-US',
    );
  }

  setUp(() {
    tmdbHandler = (_) => const FakeResponse(200, {
          'results': [
            {
              'id': 438631,
              'media_type': 'movie',
              'title': 'Dune',
            },
            {'id': 7, 'media_type': 'person', 'name': 'Someone'},
          ],
        });
    jikanHandler = (_) => const FakeResponse(200, {
          'data': [
            {'mal_id': 1, 'title': 'Cowboy Bebop'},
          ],
        });
  });

  test('search merges TMDB and Jikan results', () async {
    final repo = build();
    final items = await repo.search('  dune ');

    expect(items.map((e) => e.title), ['Dune', 'Cowboy Bebop']);
    expect(items.map((e) => e.mediaType), [MediaType.movie, MediaType.anime]);
    expect(tmdbAdapter.requests.single.queryParameters['query'], 'dune');
    expect(jikanAdapter.requests.single.queryParameters['q'], 'dune');
  });

  test('a blank query makes no requests', () async {
    final repo = build();

    expect(await repo.search('   '), isEmpty);
    expect(tmdbAdapter.requests, isEmpty);
    expect(jikanAdapter.requests, isEmpty);
  });

  test('search still returns anime when TMDB is not configured', () async {
    final repo = build(config: const ApiConfig());
    final items = await repo.search('bebop');

    expect(items.map((e) => e.title), ['Cowboy Bebop']);
  });

  test('search still returns TMDB results when Jikan is down', () async {
    jikanHandler = (_) => const FakeResponse(429, {});
    final repo = build();
    final items = await repo.search('dune');

    expect(items.map((e) => e.title), ['Dune']);
  });

  test('search fails when every provider fails', () async {
    tmdbHandler = (o) => throw noConnection(o);
    jikanHandler = (o) => throw noConnection(o);
    final repo = build();

    await expectLater(repo.search('dune'), throwsA(isA<NetworkFailure>()));
  });

  test('sections come from the right provider', () async {
    final repo = build();

    await repo.section(DiscoverySection.trending);
    expect(tmdbAdapter.requests.last.uri.path, endsWith('/trending/all/week'));

    await repo.section(DiscoverySection.popularMovies);
    expect(tmdbAdapter.requests.last.uri.path, endsWith('/movie/popular'));

    await repo.section(DiscoverySection.popularTv);
    expect(tmdbAdapter.requests.last.uri.path, endsWith('/tv/popular'));

    await repo.section(DiscoverySection.topAnime);
    expect(jikanAdapter.requests.single.uri.path, endsWith('/top/anime'));
  });
}
