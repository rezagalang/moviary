import 'package:uuid/uuid.dart';

/// Id generation for synced entities.
///
/// "One per user+media" entities (library item, rating, favorite, watchlist
/// item) and catalog media use deterministic UUIDv5 ids. Two devices that
/// create the same logical row produce the same document id, so cloud sync
/// merges them instead of creating duplicates.
abstract final class EntityIds {
  static const Uuid _uuid = Uuid();

  static String random() => _uuid.v4();

  static String _named(String name) =>
      _uuid.v5(Namespace.url.value, 'moviary:$name');

  static String catalogMedia({
    required String provider,
    required String providerId,
    required String mediaType,
  }) =>
      _named('media:$provider:$mediaType:$providerId');

  static String libraryItem(String userId, String mediaId) =>
      _named('library:$userId:$mediaId');

  static String rating(String userId, String mediaId) =>
      _named('rating:$userId:$mediaId');

  static String favorite(String userId, String mediaId) =>
      _named('favorite:$userId:$mediaId');

  static String watchlistItem(String userId, String mediaId) =>
      _named('watchlist:$userId:$mediaId');

  static String collectionItem(String collectionId, String mediaId) =>
      _named('collection_item:$collectionId:$mediaId');
}
