import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/storage_guard.dart';
import '../../../core/database/synced_writer.dart';
import '../../library/data/personal_rows.dart';
import '../../library/domain/library_entities.dart';
import '../domain/media_detail_repositories.dart';
import '../domain/personal_state.dart';
import 'media_mappers.dart';

class PersonalStateRepositoryImpl implements PersonalStateRepository {
  PersonalStateRepositoryImpl(this._db, this._writer, this._rows);

  final AppDatabase _db;
  final SyncedWriter _writer;
  final PersonalRows _rows;

  @override
  Stream<MediaDetail?> watchDetail(String userId, String mediaId) {
    final m = _db.media;
    final lib = _db.userLibrary;
    final r = _db.userRatings;
    final f = _db.favorites;
    final w = _db.watchlistItems;

    final select = _db.select(m).join([
      leftOuterJoin(
        lib,
        lib.mediaId.equalsExp(m.id) &
            lib.userId.equals(userId) &
            lib.deletedAt.isNull(),
      ),
      leftOuterJoin(
        r,
        r.mediaId.equalsExp(m.id) &
            r.userId.equals(userId) &
            r.deletedAt.isNull(),
      ),
      leftOuterJoin(
        f,
        f.mediaId.equalsExp(m.id) &
            f.userId.equals(userId) &
            f.deletedAt.isNull(),
      ),
      leftOuterJoin(
        w,
        w.mediaId.equalsExp(m.id) &
            w.userId.equals(userId) &
            w.deletedAt.isNull(),
      ),
    ])
      ..where(m.id.equals(mediaId) & m.deletedAt.isNull());

    return select.watch().map((rows) {
      if (rows.isEmpty) return null;
      final row = rows.first;
      final item = row.readTableOrNull(lib);
      return MediaDetail(
        media: mediaFromRow(row.readTable(m)),
        personal: PersonalState(
          status: item == null ? null : WatchStatus.fromStorage(item.status),
          rating: row.readTableOrNull(r)?.rating,
          isFavorite: row.readTableOrNull(f) != null,
          isInWatchlist: row.readTableOrNull(w) != null,
        ),
      );
    });
  }

  @override
  Future<void> setRating(String userId, String mediaId, double? rating) {
    return guardStorage('setRating', () async {
      final stamp = await _writer.stamp(userId);
      await _db.transaction(() => _rows.setRating(stamp, mediaId, rating));
    });
  }

  @override
  Future<void> setFavorite(String userId, String mediaId, bool value) {
    return guardStorage('setFavorite', () async {
      final stamp = await _writer.stamp(userId);
      await _db.transaction(() => _rows.setFavorite(stamp, mediaId, value));
    });
  }

  @override
  Future<void> setWatchlist(String userId, String mediaId, bool value) {
    return guardStorage('setWatchlist', () async {
      final stamp = await _writer.stamp(userId);
      await _db.transaction(() => _rows.setWatchlist(stamp, mediaId, value));
    });
  }
}
