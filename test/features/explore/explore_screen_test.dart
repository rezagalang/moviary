import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/features/explore/domain/discovery_repository.dart';
import 'package:moviary/features/media_detail/domain/media_summary.dart';

import '../../helpers/fake_auth_repository.dart';
import '../../helpers/fake_repositories.dart';
import '../../helpers/test_app.dart';

void main() {
  late FakeAuthRepository auth;

  setUp(() => auth = FakeAuthRepository(initialUser: testUser));
  tearDown(() => auth.dispose());

  Future<void> openExplore(WidgetTester tester, FakeBackend backend) async {
    useTallScreen(tester);
    await tester.pumpWidget(buildTestApp(auth: auth, backend: backend));
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationBar),
        matching: find.text('Explore'),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> search(WidgetTester tester, String text) async {
    await tester.enterText(find.byType(TextField), text);
    await tester.pump(const Duration(milliseconds: 500)); // debounce
    await tester.pumpAndSettle();
  }

  FakeBackend withContent() => FakeBackend(
        detail: fakeDetail(id: 'remote-1', title: 'Dune'),
        sections: {
          DiscoverySection.trending: [fakeRemote('1', 'Dune', year: 2021)],
          DiscoverySection.popularMovies: [fakeRemote('2', 'Alien', year: 1979)],
          DiscoverySection.topAnime: [
            fakeRemote('3', 'Cowboy Bebop', type: MediaType.anime),
          ],
        },
        searchResults: [
          fakeRemote('1', 'Dune', year: 2021),
          fakeRemote('3', 'Dune Anime', type: MediaType.anime),
        ],
      );

  testWidgets('shows discovery rails and hides empty ones', (tester) async {
    await openExplore(tester, withContent());

    expect(find.text('Trending this week'), findsOneWidget);
    expect(find.text('Popular movies'), findsOneWidget);
    expect(find.text('Top anime'), findsOneWidget);
    expect(find.text('Popular series'), findsNothing); // nothing returned
    expect(find.text('Dune'), findsOneWidget);
    expect(find.text('Cowboy Bebop'), findsOneWidget);
  });

  testWidgets('searching shows results with type and year', (tester) async {
    final backend = withContent();
    await openExplore(tester, backend);

    await search(tester, 'dune');

    expect(backend.discovery.searchCalls, ['dune']);
    expect(find.text('Trending this week'), findsNothing);
    expect(find.text('Movie  ·  2021'), findsOneWidget);
    expect(find.text('Dune Anime'), findsOneWidget);
  });

  testWidgets('the type filter narrows the results', (tester) async {
    await openExplore(tester, withContent());
    await search(tester, 'dune');

    await tester.tap(find.widgetWithText(ChoiceChip, 'Anime'));
    await tester.pumpAndSettle();

    expect(find.text('Dune Anime'), findsOneWidget);
    expect(find.text('Movie  ·  2021'), findsNothing);
  });

  testWidgets('a search with no matches says so', (tester) async {
    final backend = withContent()..discovery.searchResults = [];
    await openExplore(tester, backend);

    await search(tester, 'zzzz');

    expect(find.text('No matches'), findsOneWidget);
    expect(find.text('Try different keywords or another type.'), findsOneWidget);
  });

  testWidgets('clearing the search returns to discovery', (tester) async {
    await openExplore(tester, withContent());
    await search(tester, 'dune');

    await tester.tap(find.byIcon(Icons.clear));
    await tester.pumpAndSettle();

    expect(find.text('Trending this week'), findsOneWidget);
  });

  testWidgets('tapping a result saves it locally and opens its detail',
      (tester) async {
    final backend = withContent();
    await openExplore(tester, backend);

    await tester.tap(find.text('Alien'));
    await tester.pumpAndSettle();

    expect(backend.catalog.ensured.single.title, 'Alien');
    expect(
      find.text('Choose a status to add it to your library.'),
      findsOneWidget,
    );
  });

  testWidgets('a storage failure keeps the user on Explore', (tester) async {
    final backend = withContent();
    backend.catalog.failure = const StorageFailure();
    await openExplore(tester, backend);

    await tester.tap(find.text('Alien'));
    await tester.pumpAndSettle();

    expect(find.text('Something went wrong. Please try again.'), findsOneWidget);
    expect(find.text('Choose a status to add it to your library.'), findsNothing);
  });

  testWidgets('offline shows one clear message with a retry', (tester) async {
    final backend = FakeBackend(discoveryFailure: const NetworkFailure());
    await openExplore(tester, backend);

    expect(
      find.text('You are offline. Connect to the internet to discover new titles.'),
      findsOneWidget,
    );

    backend.discovery
      ..failure = null
      ..sections[DiscoverySection.trending] = [fakeRemote('1', 'Dune')];
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.text('Dune'), findsOneWidget);
  });

  testWidgets('a missing TMDB key is explained', (tester) async {
    final backend = FakeBackend(discoveryFailure: const ConfigFailure());
    await openExplore(tester, backend);

    expect(
      find.text('Discovery is not set up yet. Add a TMDB key to env/dev.json.'),
      findsOneWidget,
    );
  });
}
