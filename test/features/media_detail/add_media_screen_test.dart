import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/features/library/domain/library_entities.dart';
import 'package:moviary/features/media_detail/domain/media_summary.dart';

import '../../helpers/fake_auth_repository.dart';
import '../../helpers/fake_repositories.dart';
import '../../helpers/test_app.dart';

void main() {
  late FakeAuthRepository auth;
  late FakeBackend backend;

  setUp(() {
    auth = FakeAuthRepository(initialUser: testUser);
    backend = FakeBackend(detail: fakeDetail(id: 'new-1', title: 'Home Video'));
  });

  tearDown(() => auth.dispose());

  Future<void> openForm(WidgetTester tester) async {
    useTallScreen(tester);
    await tester.pumpWidget(buildTestApp(auth: auth, backend: backend));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Library'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add media'));
    await tester.pumpAndSettle();
  }

  Finder titleField() => find.widgetWithText(TextFormField, 'Title');

  testWidgets('a title is required', (tester) async {
    await openForm(tester);

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Title is required'), findsOneWidget);
    expect(backend.manual.created, isEmpty);
  });

  testWidgets('runtime must be a positive whole number', (tester) async {
    await openForm(tester);

    await tester.enterText(titleField(), 'Home Video');
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Runtime in minutes (optional)'),
      '0',
    );
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Enter a whole number above 0'), findsOneWidget);
    expect(backend.manual.created, isEmpty);
  });

  testWidgets('saving creates the media, adds it to the library and opens it',
      (tester) async {
    await openForm(tester);

    await tester.enterText(titleField(), 'Home Video');
    await tester.tap(find.text('TV series'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(backend.manual.created, hasLength(1));
    expect(backend.manual.created.single.title, 'Home Video');
    expect(backend.manual.created.single.mediaType, MediaType.tv);
    expect(backend.library.setStatusCalls, [('new-1', WatchStatus.planToWatch)]);
    expect(find.text('My status'), findsOneWidget); // detail screen is open
  });

  testWidgets('if the library step fails the user still lands on the detail',
      (tester) async {
    backend.library.setStatusError = const StorageFailure(message: 'disk full');
    await openForm(tester);

    await tester.enterText(titleField(), 'Home Video');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(backend.manual.created, hasLength(1));
    expect(find.text('My status'), findsOneWidget);
    expect(
      find.text(
        'Saved, but it could not be added to your library. '
        'Choose a status on the next screen.',
      ),
      findsOneWidget,
    );
  });
}
