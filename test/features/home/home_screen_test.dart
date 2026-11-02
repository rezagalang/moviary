import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/features/library/domain/library_entities.dart';

import '../../helpers/fake_auth_repository.dart';
import '../../helpers/fake_repositories.dart';
import '../../helpers/test_app.dart';

void main() {
  late FakeAuthRepository auth;

  setUp(() => auth = FakeAuthRepository(initialUser: testUser));
  tearDown(() => auth.dispose());

  Future<void> openHome(WidgetTester tester, FakeBackend backend) async {
    useTallScreen(tester);
    await tester.pumpWidget(buildTestApp(auth: auth, backend: backend));
    await tester.pumpAndSettle();
  }

  testWidgets('greets the user by first name', (tester) async {
    await openHome(tester, FakeBackend());
    expect(find.text('Hello, Alice'), findsOneWidget);
  });

  testWidgets('an empty library invites the user to add media', (tester) async {
    await openHome(tester, FakeBackend());

    expect(find.text('Start your collection'), findsOneWidget);
    expect(find.text('In your library'), findsNothing);
  });

  testWidgets('shows real counts and only the rails that have content',
      (tester) async {
    await openHome(
      tester,
      FakeBackend(entries: [
        fakeEntry('m1', 'Alien', status: WatchStatus.completed),
        fakeEntry('m2', 'Breaking Bad', status: WatchStatus.watching),
        fakeEntry('m3', 'Cowboy Bebop', status: WatchStatus.planToWatch),
      ]),
    );

    expect(find.text('In your library'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('Continue watching'), findsOneWidget);
    expect(find.text('Recently added'), findsOneWidget);
    expect(find.text('Recently completed'), findsOneWidget);
  });

  testWidgets('rewatching counts as watching on the stats card',
      (tester) async {
    await openHome(
      tester,
      FakeBackend(entries: [
        fakeEntry('m1', 'Alien', status: WatchStatus.watching),
        fakeEntry('m2', 'Breaking Bad', status: WatchStatus.rewatching),
      ]),
    );

    expect(find.text('Watching'), findsOneWidget);
    expect(find.text('2'), findsNWidgets(2)); // in library + watching
    expect(find.text('Continue watching'), findsOneWidget);
  });

  testWidgets('hides rails with nothing in them', (tester) async {
    await openHome(
      tester,
      FakeBackend(entries: [
        fakeEntry('m3', 'Cowboy Bebop', status: WatchStatus.planToWatch),
      ]),
    );

    expect(find.text('Continue watching'), findsNothing);
    expect(find.text('Recently completed'), findsNothing);
    expect(find.text('Recently added'), findsOneWidget);
  });
}