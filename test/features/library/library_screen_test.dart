import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/features/library/domain/library_entities.dart';

import '../../helpers/fake_auth_repository.dart';
import '../../helpers/fake_repositories.dart';
import '../../helpers/test_app.dart';

void main() {
  late FakeAuthRepository auth;
  late FakeBackend backend;

  setUp(() {
    auth = FakeAuthRepository(initialUser: testUser);
    backend = FakeBackend(entries: [
      fakeEntry('m1', 'Alien', status: WatchStatus.completed, rating: 9),
      fakeEntry('m2', 'Breaking Bad', status: WatchStatus.watching),
    ]);
  });

  tearDown(() => auth.dispose());

  Future<void> openLibrary(WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp(auth: auth, backend: backend));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Library'));
    await tester.pumpAndSettle();
  }

  testWidgets('lists the library as a grid and can switch to a list',
      (tester) async {
    await openLibrary(tester);

    expect(find.text('Alien'), findsOneWidget);
    expect(find.text('Breaking Bad'), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);

    await tester.tap(find.byTooltip('List view'));
    await tester.pumpAndSettle();

    expect(find.byType(ListTile), findsNWidgets(2));
  });

  testWidgets('search narrows the results after the debounce', (tester) async {
    await openLibrary(tester);

    await tester.enterText(find.byType(TextField), 'bad');
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    expect(find.text('Alien'), findsNothing);
    expect(find.text('Breaking Bad'), findsOneWidget);
    expect(backend.library.lastQuery?.search, 'bad');
  });

  testWidgets('shows a no-results message when the search matches nothing',
      (tester) async {
    await openLibrary(tester);

    await tester.enterText(find.byType(TextField), 'zzz');
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    expect(find.text('No matches'), findsOneWidget);
  });

  testWidgets('filter sheet sends the chosen status to the query',
      (tester) async {
    await openLibrary(tester);

    await tester.tap(find.byTooltip('Filters'));
    await tester.pumpAndSettle();
    await tester.tap(find.descendant(
      of: find.byType(BottomSheet),
      matching: find.text('Completed'),
    ));
    await tester.pumpAndSettle();

    expect(backend.library.lastQuery?.statuses, {WatchStatus.completed});

    // The sheet scrolls; on the 800x600 test surface Done starts off-screen.
    await tester.ensureVisible(find.text('Done'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();
    expect(find.byType(BottomSheet), findsNothing);
    expect(find.text('Breaking Bad'), findsNothing);
  });

  testWidgets('long press selects and bulk status change is applied',
      (tester) async {
    await openLibrary(tester);

    await tester.longPress(find.text('Alien'));
    await tester.pumpAndSettle();
    expect(find.text('1 selected'), findsOneWidget);

    await tester.tap(find.byTooltip('Change status'));
    await tester.pumpAndSettle();
    await tester.tap(find.descendant(
      of: find.byType(BottomSheet),
      matching: find.text('On hold'),
    ));
    await tester.pumpAndSettle();

    expect(backend.library.bulkStatusCalls, hasLength(1));
    expect(backend.library.bulkStatusCalls.single.$1, {'m1'});
    expect(backend.library.bulkStatusCalls.single.$2, WatchStatus.onHold);
    expect(find.text('1 selected'), findsNothing);
  });

  testWidgets('bulk remove asks for confirmation first', (tester) async {
    await openLibrary(tester);

    await tester.longPress(find.text('Alien'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Breaking Bad'));
    await tester.pumpAndSettle();
    expect(find.text('2 selected'), findsOneWidget);

    await tester.tap(find.byTooltip('Remove from library'));
    await tester.pumpAndSettle();
    expect(backend.library.bulkRemoveCalls, isEmpty);

    await tester.tap(find.text('Remove'));
    await tester.pumpAndSettle();

    expect(backend.library.bulkRemoveCalls.single, {'m1', 'm2'});
    expect(find.text('2 selected'), findsNothing);
  });

  testWidgets('cancelling the removal dialog changes nothing', (tester) async {
    await openLibrary(tester);

    await tester.longPress(find.text('Alien'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Remove from library'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(backend.library.bulkRemoveCalls, isEmpty);
  });

  testWidgets('select all selects every visible item', (tester) async {
    await openLibrary(tester);

    await tester.longPress(find.text('Alien'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Select all'));
    await tester.pumpAndSettle();

    expect(find.text('2 selected'), findsOneWidget);
  });

  testWidgets('an empty library explains how to start', (tester) async {
    backend = FakeBackend();
    await openLibrary(tester);

    expect(find.text('Your library is empty'), findsOneWidget);
    expect(find.text('Add media'), findsOneWidget); // the action button
  });

  testWidgets('tapping an item opens its detail screen', (tester) async {
    backend = FakeBackend(
      entries: [fakeEntry('m1', 'Alien', status: WatchStatus.completed)],
      detail: fakeDetail(status: WatchStatus.completed),
    );
    await openLibrary(tester);

    await tester.tap(find.text('Alien'));
    await tester.pumpAndSettle();

    expect(find.text('My status'), findsOneWidget);
  });
}