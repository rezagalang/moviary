import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/storage_guard.dart';
import '../../../core/database/synced_writer.dart';
import '../../../core/utils/entity_ids.dart';
import '../../media_detail/data/media_mappers.dart';
import '../domain/library_entities.dart';
import '../domain/library_repository.dart';
import '../domain/status_dates.dart';
import 'personal_rows.dart';

class LibraryRepositoryImpl implements LibraryRepository {
  LibraryRepositoryImpl(this._db, this._writer, this._rows);

  final AppDatabase _db;
  final SyncedWriter _writer;
  final PersonalRows _rows;

  @override
  Stream<List<LibraryEntry>> watchEntries(String userId, LibraryQuery query) {
    final lib = _db.userLibrary;
    final m = _db.media;
    final r = _db.userRatings;
    final f = _db.favorites;
    final w = _db.watchlistItems;

    final select = _db.select(lib).join([
      innerJoin(m, m.id.equalsExp(lib.mediaId)),
      leftOuterJoin(
        r,
        r.mediaId.equalsExp(lib.mediaId) &
            r.userId.equals(userId) &
            r.deletedAt.isNull(),
      ),
      leftOuterJoin(
        f,
        f.mediaId.equalsExp(lib.mediaId) &
            f.userId.equals(userId) &
            f.deletedAt.isNull(),
      ),
      leftOuterJoin(
        w,
        w.mediaId.equalsExp(lib.mediaId) &
            w.userId.equals(userId) &
            w.deletedAt.isNull(),
      ),
    ]);

    Expression<bool> where =
        lib.userId.equals(userId) & lib.deletedAt.isNull() & m.deletedAt.isNull();

    final search = query.search.trim().toLowerCase();
    if (search.isNotEmpty) {
      where = where &
          (m.title.lower().contains(search) |
              m.originalTitle.lower().contains(search));
    }
    if (query.statuses.isNotEmpty) {
      where = where &
          lib.status.isIn(query.statuses.map((s) => s.storageValue));
    }
    if (query.mediaTypes.isNotEmpty) {
      where = where &
          m.mediaType.isIn(query.mediaTypes.map((t) => t.storageValue));
    }
    if (query.onlyFavorites) where = where & f.id.isNotNull();
    if (query.onlyWatchlist) where = where & w.id.isNotNull();

    final ordering = switch (query.sort) {
      LibrarySort.recentlyAdded => [OrderingTerm.desc(lib.addedAt)],
      LibrarySort.title => [OrderingTerm.asc(m.title.lower())],
      LibrarySort.rating => [
          OrderingTerm(
            expression: r.rating,
            mode: OrderingMode.desc,
            nulls: NullsOrder.last,
          ),
          OrderingTerm.asc(m.title.lower()),
        ],
      LibrarySort.releaseDate => [
          OrderingTerm(
            expression: m.releaseDate,
            mode: OrderingMode.desc,
            nulls: NullsOrder.last,
          ),
          OrderingTerm.asc(m.title.lower()),
        ],
      LibrarySort.recentlyUpdated => [OrderingTerm.desc(lib.updatedAt)],
    };

    select
      ..where(where)
      ..orderBy(ordering);

    return select.watch().map((rows) {
      return rows.map((row) {
        final item = row.readTable(lib);
        return LibraryEntry(
          id: item.id,
          media: mediaFromRow(row.readTable(m)),
          status: WatchStatus.fromStorage(item.status),
          addedAt: item.addedAt,
          updatedAt: item.updatedAt,
          startedAt: item.startedAt,
          completedAt: item.completedAt,
          rewatchCount: item.rewatchCount,
          rating: row.readTableOrNull(r)?.rating,
          isFavorite: row.readTableOrNull(f) != null,
          isInWatchlist: row.readTableOrNull(w) != null,
        );
      }).toList();
    });
  }

  @override
  Stream<LibraryCounts> watchCounts(String userId) {
    return _db
        .customSelect(
          'SELECT l.status AS status, COUNT(*) AS c FROM user_library l '
          'INNER JOIN media m ON m.id = l.media_id '
          'WHERE l.user_id = ? AND l.deleted_at IS NULL '
          'AND m.deleted_at IS NULL GROUP BY l.status',
          variables: [Variable.withString(userId)],
          // Same rules as [watchEntries], so Home counts match the Library.
          readsFrom: {_db.userLibrary, _db.media},
        )
        .watch()
        .map((rows) {
      final byStatus = <WatchStatus, int>{
        for (final row in rows)
          WatchStatus.fromStorage(row.read<String>('status')):
              row.read<int>('c'),
      };
      return LibraryCounts(byStatus);
    });
  }

  @override
  Future<void> setStatus(String userId, String mediaId, WatchStatus status) {
    return guardStorage('setStatus', () async {
      final stamp = await _writer.stamp(userId);
      await _db.transaction(() => _applyStatus(stamp, mediaId, status));
    });
  }

  @override
  Future<void> bulkSetStatus(
    String userId,
    Set<String> mediaIds,
    WatchStatus status,
  ) {
    return guardStorage('bulkSetStatus', () async {
      final stamp = await _writer.stamp(userId);
      await _db.transaction(() async {
        for (final mediaId in mediaIds) {
          await _applyStatus(stamp, mediaId, status);
        }
      });
    });
  }

  @override
  Future<void> removeFromLibrary(String userId, String mediaId) {
    return guardStorage('removeFromLibrary', () async {
      final stamp = await _writer.stamp(userId);
      await _db.transaction(() => _remove(stamp, mediaId));
    });
  }

  @override
  Future<void> bulkRemove(String userId, Set<String> mediaIds) {
    return guardStorage('bulkRemove', () async {
      final stamp = await _writer.stamp(userId);
      await _db.transaction(() async {
        for (final mediaId in mediaIds) {
          await _remove(stamp, mediaId);
        }
      });
    });
  }

  Future<void> _applyStatus(
    WriteStamp s,
    String mediaId,
    WatchStatus status,
  ) async {
    await _rows.requireMedia(mediaId);

    final table = _db.userLibrary;
    final id = EntityIds.libraryItem(s.userId, mediaId);
    final existing = await (_db.select(table)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    // Non-null only for a live (not removed) library entry.
    final LibraryRow? active =
        (existing != null && existing.deletedAt == null) ? existing : null;
    final wasActive = active != null;
    final previous =
        active == null ? null : WatchStatus.fromStorage(active.status);

    if (previous != status) {
      final dates = resolveStatusDates(
        newStatus: status,
        previousStatus: previous,
        startedAt: active?.startedAt,
        completedAt: active?.completedAt,
        rewatchCount: active?.rewatchCount ?? 0,
        now: s.now,
      );

      final int revision;
      if (existing == null) {
        revision = 1;
        await _db.into(table).insert(UserLibraryCompanion.insert(
              id: id,
              userId: s.userId,
              createdAt: s.now,
              updatedAt: s.now,
              deviceId: s.deviceId,
              mediaId: mediaId,
              status: status.storageValue,
              addedAt: s.now,
              startedAt: Value(dates.startedAt),
              completedAt: Value(dates.completedAt),
              rewatchCount: Value(dates.rewatchCount),
            ));
      } else {
        revision = existing.revision + 1;
        await (_db.update(table)..where((t) => t.id.equals(id))).write(
          UserLibraryCompanion(
            status: Value(status.storageValue),
            startedAt: Value(dates.startedAt),
            completedAt: Value(dates.completedAt),
            rewatchCount: Value(dates.rewatchCount),
            // A re-added (previously removed) item is a fresh addition.
            addedAt: wasActive ? const Value.absent() : Value(s.now),
            deletedAt: const Value(null),
            updatedAt: Value(s.now),
            revision: Value(revision),
            deviceId: Value(s.deviceId),
          ),
        );
      }
      await _writer.enqueue(
        entityType: SyncEntityType.library,
        entityId: id,
        operation: SyncOperation.upsert,
        revision: revision,
        now: s.now,
      );
    }

    if (status == WatchStatus.planToWatch) {
      await _rows.setWatchlist(s, mediaId, true);
    }
  }

  Future<void> _remove(WriteStamp s, String mediaId) async {
    final table = _db.userLibrary;
    final id = EntityIds.libraryItem(s.userId, mediaId);
    final existing = await (_db.select(table)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (existing == null || existing.deletedAt != null) return;

    final revision = existing.revision + 1;
    await (_db.update(table)..where((t) => t.id.equals(id))).write(
      UserLibraryCompanion(
        deletedAt: Value(s.now),
        updatedAt: Value(s.now),
        revision: Value(revision),
        deviceId: Value(s.deviceId),
      ),
    );
    await _writer.enqueue(
      entityType: SyncEntityType.library,
      entityId: id,
      operation: SyncOperation.delete,
      revision: revision,
      now: s.now,
    );
  }
}