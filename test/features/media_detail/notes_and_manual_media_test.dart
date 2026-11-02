import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/database/synced_writer.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/features/library/data/library_repository_impl.dart';
import 'package:moviary/features/library/domain/library_entities.dart';
import 'package:moviary/features/media_detail/data/manual_media_repository_impl.dart';
import 'package:moviary/features/media_detail/data/notes_repository_impl.dart';
import 'package:moviary/features/media_detail/domain/media_summary.dart';

import '../../helpers/db_fixture.dart';

void main() {
  late DbFixture fx;
  late NotesRepositoryImpl notes;
  late ManualMediaRepositoryImpl manual;

  const alice = 'alice';

  setUp(() async {
    fx = DbFixture.create();
    notes = NotesRepositoryImpl(fx.db, fx.writer, fx.rows);
    manual = ManualMediaRepositoryImpl(fx.db, fx.writer);
    await fx.seedMedia('m1', title: 'Alien');
  });

  tearDown(() => fx.close());

  group('notes', () {
    test('adds notes, newest first, and queues them', () async {
      final first = await notes.addNote(alice, 'm1', 'Great ending');
      fx.advance();
      final second = await notes.addNote(alice, 'm1', '  Rewatch soon  ');

      final list = await notes.watchNotes(alice, 'm1').first;
      expect(list.map((n) => n.id), [second.id, first.id]);
      expect(list.first.body, 'Rewatch soon');
      expect(await fx.queue(), hasLength(2));
    });

    test('updating bumps the revision', () async {
      final note = await notes.addNote(alice, 'm1', 'v1');
      fx.advance();
      await notes.updateNote(alice, note.id, 'v2');

      final row = await fx.db.select(fx.db.userNotes).getSingle();
      expect(row.body, 'v2');
      expect(row.revision, 2);
      final queued = await fx.queueEntry(SyncEntityType.notes, note.id);
      expect(queued!.localRevision, 2);
    });

    test('deleting soft-deletes and queues a delete', () async {
      final note = await notes.addNote(alice, 'm1', 'temp');
      fx.advance();
      await notes.deleteNote(alice, note.id);

      expect(await notes.watchNotes(alice, 'm1').first, isEmpty);
      final queued = await fx.queueEntry(SyncEntityType.notes, note.id);
      expect(queued!.operation, 'delete');
      expect((await fx.db.select(fx.db.userNotes).getSingle()).deletedAt, isNotNull);
    });

    test('rejects empty notes and unknown media or notes', () async {
      await expectLater(
        notes.addNote(alice, 'm1', '   '),
        throwsA(isA<ValidationFailure>()),
      );
      await expectLater(
        notes.addNote(alice, 'nope', 'text'),
        throwsA(isA<ValidationFailure>()),
      );
      await expectLater(
        notes.updateNote(alice, 'missing', 'text'),
        throwsA(isA<ValidationFailure>()),
      );
      expect(await fx.queue(), isEmpty);
    });

    test('a user cannot edit another user\'s note', () async {
      final note = await notes.addNote(alice, 'm1', 'private');
      await expectLater(
        notes.updateNote('bob', note.id, 'hijack'),
        throwsA(isA<ValidationFailure>()),
      );
      await expectLater(
        notes.deleteNote('bob', note.id),
        throwsA(isA<ValidationFailure>()),
      );
    });
  });

  group('manual media', () {
    test('creates owned media that syncs as custom_media', () async {
      final media = await manual.create(
        alice,
        const ManualMediaInput(
          title: '  My Home Video  ',
          mediaType: MediaType.movie,
          overview: 'Family trip',
          runtimeMinutes: 42,
        ),
      );

      expect(media.title, 'My Home Video');
      expect(media.isManual, isTrue);
      expect(media.provider, 'manual');
      expect(media.providerId, media.id);

      final row = await (fx.db.select(fx.db.media)
            ..where((t) => t.id.equals(media.id)))
          .getSingle();
      expect(row.ownerUserId, alice);
      expect(row.revision, 1);

      final queued = await fx.queueEntry(SyncEntityType.customMedia, media.id);
      expect(queued, isNotNull);
    });

    test('blank optional fields are stored as null', () async {
      final media = await manual.create(
        alice,
        const ManualMediaInput(
          title: 'X',
          mediaType: MediaType.tv,
          overview: '   ',
          originalTitle: '',
        ),
      );
      expect(media.overview, isNull);
      expect(media.originalTitle, isNull);
    });

    test('rejects a blank title and a non-positive runtime', () async {
      await expectLater(
        manual.create(alice, const ManualMediaInput(title: '  ', mediaType: MediaType.movie)),
        throwsA(isA<ValidationFailure>()),
      );
      await expectLater(
        manual.create(
          alice,
          const ManualMediaInput(
            title: 'X',
            mediaType: MediaType.movie,
            runtimeMinutes: 0,
          ),
        ),
        throwsA(isA<ValidationFailure>()),
      );
      expect(await fx.db.select(fx.db.media).get(), hasLength(1)); // only the seed
      expect(await fx.queue(), isEmpty);
    });

    test('manual media can be added to the library offline', () async {
      final media = await manual.create(
        alice,
        const ManualMediaInput(title: 'Home Video', mediaType: MediaType.movie),
      );
      final library = LibraryRepositoryImpl(fx.db, fx.writer, fx.rows);

      await library.setStatus(alice, media.id, WatchStatus.completed);

      final list = await library.watchEntries(alice, const LibraryQuery()).first;
      expect(list.single.media.id, media.id);
      expect(list.single.status, WatchStatus.completed);
    });
  });
}
