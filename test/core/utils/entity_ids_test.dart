import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/utils/entity_ids.dart';

void main() {
  test('deterministic ids are stable for the same inputs', () {
    expect(
      EntityIds.libraryItem('u1', 'm1'),
      EntityIds.libraryItem('u1', 'm1'),
    );
    expect(
      EntityIds.catalogMedia(provider: 'tmdb', providerId: '1', mediaType: 'movie'),
      EntityIds.catalogMedia(provider: 'tmdb', providerId: '1', mediaType: 'movie'),
    );
  });

  test('deterministic ids differ by user, media and entity kind', () {
    final ids = {
      EntityIds.libraryItem('u1', 'm1'),
      EntityIds.libraryItem('u2', 'm1'),
      EntityIds.libraryItem('u1', 'm2'),
      EntityIds.rating('u1', 'm1'),
      EntityIds.favorite('u1', 'm1'),
      EntityIds.watchlistItem('u1', 'm1'),
    };
    expect(ids, hasLength(6));
  });

  test('catalog media ids differ by provider and type', () {
    final ids = {
      EntityIds.catalogMedia(provider: 'tmdb', providerId: '1', mediaType: 'movie'),
      EntityIds.catalogMedia(provider: 'tmdb', providerId: '1', mediaType: 'tv'),
      EntityIds.catalogMedia(provider: 'jikan', providerId: '1', mediaType: 'anime'),
    };
    expect(ids, hasLength(3));
  });

  test('random ids are unique UUIDs', () {
    final a = EntityIds.random();
    final b = EntityIds.random();
    expect(a, isNot(b));
    expect(a, matches(RegExp(r'^[0-9a-f-]{36}$')));
  });
}