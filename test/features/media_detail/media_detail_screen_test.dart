import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/features/library/domain/library_entities.dart';
import 'package:moviary/features/media_detail/domain/personal_state.dart';

import '../../helpers/fake_auth_repository.dart';
import '../../helpers/fake_repositories.dart';
import '../../helpers/test_app.dart';

void main() {
  late FakeAuthRepository auth;

  setUp(() => auth = FakeAuthRepository(initialUser: testUser));
  tearDown(() => auth.dispose());

  Future<void> openDetail(WidgetTester tester, FakeBackend backend) async {
    useTallScreen(tester);
    await tester.pumpWidget(buildTestApp(auth: auth, backend: backend));
    await tester.pumpAndSettle();
    await goTo(tester, '/media/m1');
  }

  testWidgets('shows the media and its personal state', (tester) async {
    final backend = FakeBackend(
      detail: fakeDetail(
        status: WatchStatus.watching,
        overview: 'In space no one can hear you scream.',
        favorite: true,
        manual: true,
      ),
    );
    await openDetail(tester, backend);

    expect(find.text('Alien'), findsWidgets);
    expect(find.text('In space no one can hear you scream.'), findsOneWidget);
    expect(find.text('Added manually'), findsOneWidget);
    expect(find.text('Movie  ·  1979  ·  117 min'), findsOneWidget);
    expect(
      tester.widget<ChoiceChip>(find.widgetWithText(ChoiceChip, 'Watching')).selected,
      isTrue,
    );
    expect(
      tester.widget<FilterChip>(find.widgetWithText(FilterChip, 'Favorite')).selected,
      isTrue,
    );
  });

  testWidgets('shows a hint until the item is in the library', (tester) async {
    await openDetail(tester, FakeBackend(detail: fakeDetail()));

    expect(
      find.text('Choose a status to add it to your library.'),
      findsOneWidget,
    );
    expect(find.text('Remove from library'), findsNothing);
  });

  testWidgets('choosing a status saves it', (tester) async {
    final backend = FakeBackend(detail: fakeDetail());
    await openDetail(tester, backend);

    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();

    expect(backend.library.setStatusCalls, [('m1', WatchStatus.completed)]);
  });

  testWidgets('favorite and watchlist toggles are saved', (tester) async {
    final backend = FakeBackend(detail: fakeDetail());
    await openDetail(tester, backend);

    await tester.tap(find.text('Favorite'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Watchlist'));
    await tester.pumpAndSettle();

    expect(backend.personal.favoriteCalls, [('m1', true)]);
    expect(backend.personal.watchlistCalls, [('m1', true)]);
  });

  testWidgets('dragging the slider saves a rating on the half-step grid',
      (tester) async {
    final backend = FakeBackend(detail: fakeDetail());
    await openDetail(tester, backend);

    await tester.drag(find.byType(Slider), const Offset(120, 0));
    await tester.pumpAndSettle();

    expect(backend.personal.ratingCalls, hasLength(1));
    final value = backend.personal.ratingCalls.single.$2!;
    expect(value, inInclusiveRange(0.5, 10));
    expect((value * 2) % 1, 0);
  });

  testWidgets('a rating can be cleared', (tester) async {
    final backend = FakeBackend(detail: fakeDetail(rating: 8));
    await openDetail(tester, backend);

    await tester.tap(find.text('Clear'));
    await tester.pumpAndSettle();

    expect(backend.personal.ratingCalls, [('m1', null)]);
  });

  testWidgets('adding a note saves it and clears the field', (tester) async {
    final backend = FakeBackend(detail: fakeDetail());
    await openDetail(tester, backend);

    await tester.enterText(find.byType(TextField), 'Great ending');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(backend.notes.addCalls, [('m1', 'Great ending')]);
    expect(tester.widget<TextField>(find.byType(TextField)).controller?.text, '');
  });

  testWidgets('an empty note is not saved', (tester) async {
    final backend = FakeBackend(detail: fakeDetail());
    await openDetail(tester, backend);

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(backend.notes.addCalls, isEmpty);
  });

  testWidgets('existing notes can be edited and deleted', (tester) async {
    final backend = FakeBackend(
      detail: fakeDetail(),
      notes: [
        NoteEntry(
          id: 'n1',
          mediaId: 'm1',
          body: 'First thoughts',
          createdAt: DateTime.utc(2026),
          updatedAt: DateTime.utc(2026),
        ),
      ],
    );
    await openDetail(tester, backend);
    expect(find.text('First thoughts'), findsOneWidget);

    await tester.tap(find.byType(PopupMenuButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Edit note'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).last, 'Better thoughts');
    await tester.tap(find.text('Save').last);
    await tester.pumpAndSettle();
    expect(backend.notes.updateCalls, [('n1', 'Better thoughts')]);

    await tester.tap(find.byType(PopupMenuButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete note'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(backend.notes.deleteCalls, ['n1']);
  });

  testWidgets('removing from the library needs confirmation', (tester) async {
    final backend = FakeBackend(
      detail: fakeDetail(status: WatchStatus.completed),
    );
    await openDetail(tester, backend);

    await tester.tap(find.text('Remove from library'));
    await tester.pumpAndSettle();
    expect(backend.library.removeCalls, isEmpty);

    await tester.tap(find.text('Remove'));
    await tester.pumpAndSettle();
    expect(backend.library.removeCalls, ['m1']);
  });

  testWidgets('unknown media shows a not-found message', (tester) async {
    await openDetail(tester, FakeBackend());

    expect(find.text('This item is no longer available.'), findsOneWidget);
  });
}
