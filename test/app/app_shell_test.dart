import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fake_auth_repository.dart';
import '../helpers/test_app.dart';

const _bannerText = 'You are offline. Your saved library is still available.';

void main() {
  testWidgets('shows five destinations and switches tabs', (tester) async {
    final auth = FakeAuthRepository(initialUser: testUser);
    addTearDown(auth.dispose);

    await tester.pumpWidget(buildTestApp(auth: auth));
    await tester.pumpAndSettle();

    expect(find.byType(NavigationDestination), findsNWidgets(5));

    await tester.tap(find.text('Explore'));
    await tester.pumpAndSettle();
    expect(find.text('Search movies, series and anime'), findsOneWidget);

    await tester.tap(find.text('Library'));
    await tester.pumpAndSettle();
    expect(find.text('Your library is empty'), findsOneWidget);
  });

  testWidgets('shows the offline banner when offline', (tester) async {
    final auth = FakeAuthRepository(initialUser: testUser);
    addTearDown(auth.dispose);

    await tester.pumpWidget(buildTestApp(auth: auth, online: false));
    await tester.pumpAndSettle();

    expect(find.text(_bannerText), findsOneWidget);
  });

  testWidgets('hides the offline banner when online', (tester) async {
    final auth = FakeAuthRepository(initialUser: testUser);
    addTearDown(auth.dispose);

    await tester.pumpWidget(buildTestApp(auth: auth, online: true));
    await tester.pumpAndSettle();

    expect(find.text(_bannerText), findsNothing);
  });
}