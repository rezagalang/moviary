import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/synced_writer.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/utils/entity_ids.dart';

/// Row-level operations on the small per-user tables (ratings, favorites,
/// watchlist). Shared by the library and media-detail repositories.
///
/// Every method assumes it runs inside a transaction opened by the caller.
class PersonalRows {
  PersonalRows(this._db, this._writer);

  final AppDatabase _db;
  final SyncedWriter _writer;

  Future<void> requireMedia(String mediaId) async {
    final row = await (_db.select(_db.media)
          ..where((t) => t.id.equals(mediaId) & t.deletedAt.isNull()))
        .getSingleOrNull();
    if (row == null) {
      throw ValidationFailure(message: 'Media "$mediaId" does not exist');
    }
  }

  // ---- watchlist ----

  Future<void> setWatchlist(WriteStamp s, String mediaId, bool value) async {
    final table = _db.watchlistItems;
    final id = EntityIds.watchlistItem(s.userId, mediaId);
    final existing = await (_db.select(table)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    final active = existing != null && existing.deletedAt == null;
    if (value == active) return;

    final int revision = existing == null ? 1 : existing.revision + 1;
    if (value) {
      await requireMedia(mediaId);
      if (existing == null) {
        await _db.into(table).insert(WatchlistItemsCompanion.insert(
              id: id,
              userId: s.userId,
              createdAt: s.now,
              updatedAt: s.now,
              deviceId: s.deviceId,
              mediaId: mediaId,
              addedAt: s.now,
            ));
      } else {
        await (_db.update(table)..where((t) => t.id.equals(id))).write(
          WatchlistItemsCompanion(
            deletedAt: const Value(null),
            addedAt: Value(s.now),
            updatedAt: Value(s.now),
            revision: Value(revision),
            deviceId: Value(s.deviceId),
          ),
        );
      }
    } else {
      await (_db.update(table)..where((t) => t.id.equals(id))).write(
        WatchlistItemsCompanion(
          deletedAt: Value(s.now),
          updatedAt: Value(s.now),
          revision: Value(revision),
          deviceId: Value(s.deviceId),
        ),
      );
    }
    await _writer.enqueue(
      entityType: SyncEntityType.watchlists,
      entityId: id,
      operation: value ? SyncOperation.upsert : SyncOperation.delete,
      revision: revision,
      now: s.now,
    );
  }

  // ---- favorites ----

  Future<void> setFavorite(WriteStamp s, String mediaId, bool value) async {
    final table = _db.favorites;
    final id = EntityIds.favorite(s.userId, mediaId);
    final existing = await (_db.select(table)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    final active = existing != null && existing.deletedAt == null;
    if (value == active) return;

    final int revision = existing == null ? 1 : existing.revision + 1;
    if (value) {
      await requireMedia(mediaId);
      if (existing == null) {
        await _db.into(table).insert(FavoritesCompanion.insert(
              id: id,
              userId: s.userId,
              createdAt: s.now,
              updatedAt: s.now,
              deviceId: s.deviceId,
              mediaId: mediaId,
              favoritedAt: s.now,
            ));
      } else {
        await (_db.update(table)..where((t) => t.id.equals(id))).write(
          FavoritesCompanion(
            deletedAt: const Value(null),
            favoritedAt: Value(s.now),
            updatedAt: Value(s.now),
            revision: Value(revision),
            deviceId: Value(s.deviceId),
          ),
        );
      }
    } else {
      await (_db.update(table)..where((t) => t.id.equals(id))).write(
        FavoritesCompanion(
          deletedAt: Value(s.now),
          updatedAt: Value(s.now),
          revision: Value(revision),
          deviceId: Value(s.deviceId),
        ),
      );
    }
    await _writer.enqueue(
      entityType: SyncEntityType.favorites,
      entityId: id,
      operation: value ? SyncOperation.upsert : SyncOperation.delete,
      revision: revision,
      now: s.now,
    );
  }

  // ---- ratings ----

  /// [rating] null clears the rating.
  Future<void> setRating(WriteStamp s, String mediaId, double? rating) async {
    if (rating != null) {
      final onHalfStep = (rating * 2) == (rating * 2).roundToDouble();
      if (rating < 0.5 || rating > 10 || !onHalfStep) {
        throw ValidationFailure(
          message: 'Rating must be 0.5 to 10 in steps of 0.5 (got $rating)',
        );
      }
    }

    final table = _db.userRatings;
    final id = EntityIds.rating(s.userId, mediaId);
    final existing = await (_db.select(table)..where((t) => t.id.equals(id)))
        .getSingleOrNull();

    if (rating == null) {
      if (existing == null || existing.deletedAt != null) return;
      final revision = existing.revision + 1;
      await (_db.update(table)..where((t) => t.id.equals(id))).write(
        UserRatingsCompanion(
          deletedAt: Value(s.now),
          updatedAt: Value(s.now),
          revision: Value(revision),
          deviceId: Value(s.deviceId),
        ),
      );
      await _writer.enqueue(
        entityType: SyncEntityType.ratings,
        entityId: id,
        operation: SyncOperation.delete,
        revision: revision,
        now: s.now,
      );
      return;
    }

    if (existing != null &&
        existing.deletedAt == null &&
        existing.rating == rating) {
      return;
    }
    await requireMedia(mediaId);

    final int revision = existing == null ? 1 : existing.revision + 1;
    if (existing == null) {
      await _db.into(table).insert(UserRatingsCompanion.insert(
            id: id,
            userId: s.userId,
            createdAt: s.now,
            updatedAt: s.now,
            deviceId: s.deviceId,
            mediaId: mediaId,
            rating: rating,
            ratedAt: s.now,
          ));
    } else {
      await (_db.update(table)..where((t) => t.id.equals(id))).write(
        UserRatingsCompanion(
          rating: Value(rating),
          ratedAt: Value(s.now),
          deletedAt: const Value(null),
          updatedAt: Value(s.now),
          revision: Value(revision),
          deviceId: Value(s.deviceId),
        ),
      );
    }
    await _writer.enqueue(
      entityType: SyncEntityType.ratings,
      entityId: id,
      operation: SyncOperation.upsert,
      revision: revision,
      now: s.now,
    );
  }
}
