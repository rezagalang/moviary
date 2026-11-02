import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/storage_guard.dart';
import '../../../core/database/synced_writer.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/utils/entity_ids.dart';
import '../../library/data/personal_rows.dart';
import '../domain/media_detail_repositories.dart';
import '../domain/personal_state.dart';

class NotesRepositoryImpl implements NotesRepository {
  NotesRepositoryImpl(this._db, this._writer, this._rows);

  final AppDatabase _db;
  final SyncedWriter _writer;
  final PersonalRows _rows;

  @override
  Stream<List<NoteEntry>> watchNotes(String userId, String mediaId) {
    final query = _db.select(_db.userNotes)
      ..where((t) =>
          t.userId.equals(userId) &
          t.mediaId.equals(mediaId) &
          t.deletedAt.isNull())
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);
    return query.watch().map((rows) => rows.map(_toEntry).toList());
  }

  @override
  Future<NoteEntry> addNote(String userId, String mediaId, String body) {
    return guardStorage('addNote', () async {
      final text = _validBody(body);
      final stamp = await _writer.stamp(userId);
      final id = EntityIds.random();
      return _db.transaction(() async {
        await _rows.requireMedia(mediaId);
        await _db.into(_db.userNotes).insert(UserNotesCompanion.insert(
              id: id,
              userId: userId,
              createdAt: stamp.now,
              updatedAt: stamp.now,
              deviceId: stamp.deviceId,
              mediaId: mediaId,
              body: text,
            ));
        await _writer.enqueue(
          entityType: SyncEntityType.notes,
          entityId: id,
          operation: SyncOperation.upsert,
          revision: 1,
          now: stamp.now,
        );
        final row = await (_db.select(_db.userNotes)
              ..where((t) => t.id.equals(id)))
            .getSingle();
        return _toEntry(row);
      });
    });
  }

  @override
  Future<void> updateNote(String userId, String noteId, String body) {
    return guardStorage('updateNote', () async {
      final text = _validBody(body);
      final stamp = await _writer.stamp(userId);
      await _db.transaction(() async {
        final existing = await _activeNote(userId, noteId);
        final revision = existing.revision + 1;
        await (_db.update(_db.userNotes)..where((t) => t.id.equals(noteId)))
            .write(UserNotesCompanion(
          body: Value(text),
          updatedAt: Value(stamp.now),
          revision: Value(revision),
          deviceId: Value(stamp.deviceId),
        ));
        await _writer.enqueue(
          entityType: SyncEntityType.notes,
          entityId: noteId,
          operation: SyncOperation.upsert,
          revision: revision,
          now: stamp.now,
        );
      });
    });
  }

  @override
  Future<void> deleteNote(String userId, String noteId) {
    return guardStorage('deleteNote', () async {
      final stamp = await _writer.stamp(userId);
      await _db.transaction(() async {
        final existing = await _activeNote(userId, noteId);
        final revision = existing.revision + 1;
        await (_db.update(_db.userNotes)..where((t) => t.id.equals(noteId)))
            .write(UserNotesCompanion(
          deletedAt: Value(stamp.now),
          updatedAt: Value(stamp.now),
          revision: Value(revision),
          deviceId: Value(stamp.deviceId),
        ));
        await _writer.enqueue(
          entityType: SyncEntityType.notes,
          entityId: noteId,
          operation: SyncOperation.delete,
          revision: revision,
          now: stamp.now,
        );
      });
    });
  }

  String _validBody(String body) {
    final text = body.trim();
    if (text.isEmpty) {
      throw const ValidationFailure(message: 'Note cannot be empty');
    }
    return text;
  }

  Future<NoteRow> _activeNote(String userId, String noteId) async {
    final row = await (_db.select(_db.userNotes)
          ..where((t) =>
              t.id.equals(noteId) &
              t.userId.equals(userId) &
              t.deletedAt.isNull()))
        .getSingleOrNull();
    if (row == null) {
      throw ValidationFailure(message: 'Note "$noteId" does not exist');
    }
    return row;
  }

  NoteEntry _toEntry(NoteRow row) => NoteEntry(
        id: row.id,
        mediaId: row.mediaId,
        body: row.body,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
      );
}
