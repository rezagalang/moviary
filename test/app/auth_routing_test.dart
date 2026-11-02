import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/core/errors/app_failure.dart';

import '../helpers/fake_auth_repository.dart';
import '../helpers/test_app.dart';

void main() {
  testWidgets('first launch shows onboarding; Skip leads to login',
      (tester) async {
    final auth = FakeAuthRepository();
    addTearDown(auth.dispose);

    await tester.pumpWidget(
      buildTestApp(auth: auth, onboardingCompleted: false),
    );
    await tester.pumpAndSettle();

    expect(find.text('Your whole collection in one place'), findsOneWidget);

    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    expect(find.text('Continue with Google'), findsOneWidget);
  });

  testWidgets('onboarding pages lead to login via Get started', (tester) async {
    final auth = FakeAuthRepository();
    addTearDown(auth.dispose);

    await tester.pumpWidget(
      buildTestApp(auth: auth, onboardingCompleted: false),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Get started'));
    await tester.pumpAndSettle();

    expect(find.text('Continue with Google'), findsOneWidget);
  });

  testWidgets('signed-out user sees login and reaches Home after signing in',
      (tester) async {
    final auth = FakeAuthRepository();
    addTearDown(auth.dispose);

    await tester.pumpWidget(buildTestApp(auth: auth));
    await tester.pumpAndSettle();
    expect(find.text('Continue with Google'), findsOneWidget);

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    expect(auth.signInCalls, 1);
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('offline sign-in attempt shows a message and does not call auth',
      (tester) async {
    final auth = FakeAuthRepository();
    addTearDown(auth.dispose);

    await tester.pumpWidget(buildTestApp(auth: auth, online: false));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    expect(
      find.text('You are offline. Connect to the internet to sign in.'),
      findsOneWidget,
    );
    expect(auth.signInCalls, 0);
  });

  testWidgets('cancelled sign-in stays on login without an error',
      (tester) async {
    final auth = FakeAuthRepository(
      signInError: const SignInCancelledFailure(),
    );
    addTearDown(auth.dispose);

    await tester.pumpWidget(buildTestApp(auth: auth));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsNothing);
    expect(find.text('Continue with Google'), findsOneWidget);
  });

  testWidgets('other sign-in failures show an error message', (tester) async {
    final auth = FakeAuthRepository(
      signInError: const AuthFailure(message: 'boom'),
    );
    addTearDown(auth.dispose);

    await tester.pumpWidget(buildTestApp(auth: auth));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    expect(find.text('Sign-in failed. Please try again.'), findsOneWidget);
  });

  testWidgets('a restored session opens Home directly, even offline',
      (tester) async {
    final auth = FakeAuthRepository(initialUser: testUser);
    addTearDown(auth.dispose);

    await tester.pumpWidget(buildTestApp(auth: auth, online: false));
    await tester.pumpAndSettle();

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Continue with Google'), findsNothing);
  });

  testWidgets('signing out from Profile returns to login', (tester) async {
    final auth = FakeAuthRepository(initialUser: testUser);
    addTearDown(auth.dispose);

    await tester.pumpWidget(buildTestApp(auth: auth));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(find.text('alice@example.com'), findsOneWidget);

    await tester.tap(find.text('Sign out'));
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byType(AlertDialog),
        matching: find.text('Sign out'),
      ),
    );
    await tester.pumpAndSettle();

    expect(auth.signOutCalls, 1);
    expect(find.text('Continue with Google'), findsOneWidget);
  });
}
