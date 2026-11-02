import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviary/features/auth/presentation/auth_providers.dart';

import '../../helpers/fake_auth_repository.dart';

ProviderContainer _container(FakeAuthRepository repo) {
  final container = ProviderContainer(overrides: [
    authRepositoryProvider.overrideWithValue(repo),
    initialAuthUserProvider.overrideWithValue(repo.currentUser),
  ]);
  addTearDown(container.dispose);
  return container;
}

void main() {
  test('starts from the restored user without waiting for the network', () {
    final repo = FakeAuthRepository(initialUser: testUser);
    addTearDown(repo.dispose);

    expect(_container(repo).read(authSessionProvider), testUser);
  });

  test('follows sign-in and sign-out', () async {
    final repo = FakeAuthRepository();
    addTearDown(repo.dispose);
    final container = _container(repo);

    expect(container.read(authSessionProvider), isNull);

    await container.read(authSessionProvider.notifier).signInWithGoogle();
    await pumpEventQueue();
    expect(container.read(authSessionProvider), testUser);
    expect(container.read(currentUserIdProvider), 'u1');

    await container.read(authSessionProvider.notifier).signOut();
    await pumpEventQueue();
    expect(container.read(authSessionProvider), isNull);
    expect(container.read(currentUserIdProvider), isNull);
    expect(repo.signOutCalls, 1);
  });
}
