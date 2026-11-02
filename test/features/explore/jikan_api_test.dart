import 'package:dio/dio.dart' show RequestOptions;
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/core/utils/entity_ids.dart';
import 'package:moviary/features/explore/data/jikan_api.dart';
import 'package:moviary/features/media_detail/domain/media_summary.dart';

import '../../helpers/fake_http_adapter.dart';

const _body = {
  'data': [
    {
      'mal_id': 1,
      'title': 'Cowboy Bebop',
      'title_english': 'Cowboy Bebop',
      'title_japanese': 'カウボーイビバップ',
      'synopsis': 'Bounty hunters in space.',
      'aired': {'from': '1998-04-03T00:00:00+00:00'},
      'duration': '24 min per ep',
      'score': 8.75,
      'images': {
        'jpg': {
          'image_url': 'https://cdn.test/small.jpg',
          'large_image_url': 'https://cdn.test/large.jpg',
        },
      },
    },
    {
      'mal_id': 2,
      'title': 'Sen to Chihiro no Kamikakushi',
      'title_english': 'Spirited Away',
      'duration': '2 hr 5 min',
      'aired': {'from': null},
      'images': {
        'jpg': {'image_url': 'https://cdn.test/small2.jpg'},
      },
    },
    {'mal_id': 3, 'title': 'Unknown Duration', 'duration': 'Unknown'},
    {'title': 'No id'},
  ],
};

void main() {
  late FakeHttpAdapter adapter;
  late FakeResponse Function(RequestOptions) handler;

  JikanApi build() {
    adapter = FakeHttpAdapter((options) => handler(options));
    return JikanApi(fakeDio(adapter));
  }

  setUp(() => handler = (_) => const FakeResponse(200, _body));

  test('maps anime rows', () async {
    final items = await build().topAnime();

    expect(items.map((e) => e.title),
        ['Cowboy Bebop', 'Spirited Away', 'Unknown Duration']);

    final bebop = items.first;
    expect(bebop.provider, 'jikan');
    expect(bebop.mediaType, MediaType.anime);
    expect(
      bebop.id,
      EntityIds.catalogMedia(
        provider: 'jikan',
        providerId: '1',
        mediaType: 'anime',
      ),
    );
    expect(bebop.originalTitle, 'カウボーイビバップ');
    expect(bebop.overview, 'Bounty hunters in space.');
    expect(bebop.releaseDate, DateTime.utc(1998, 4, 3));
    expect(bebop.runtimeMinutes, 24);
    expect(bebop.posterPath, 'https://cdn.test/large.jpg');
    expect(bebop.externalRating, 8.75);

    final chihiro = items[1];
    expect(chihiro.originalTitle, 'Sen to Chihiro no Kamikakushi');
    expect(chihiro.runtimeMinutes, 125);
    expect(chihiro.releaseDate, isNull);
    expect(chihiro.posterPath, 'https://cdn.test/small2.jpg');

    expect(items[2].runtimeMinutes, isNull);
  });

  test('top anime and search use the right endpoints', () async {
    final api = build();
    await api.topAnime();
    await api.search('bebop');

    expect(adapter.requests[0].uri.path, endsWith('/top/anime'));
    expect(adapter.requests[1].uri.path, endsWith('/anime'));
    expect(adapter.requests[1].queryParameters['q'], 'bebop');
  });

  test('maps errors to typed failures', () async {
    final api = build();

    handler = (options) => throw noConnection(options);
    await expectLater(api.topAnime(), throwsA(isA<NetworkFailure>()));

    handler = (_) => const FakeResponse(429, {});
    await expectLater(api.topAnime(), throwsA(isA<RateLimitedFailure>()));
  });
}
