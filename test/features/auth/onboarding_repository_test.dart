import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviary/core/database/app_database.dart';
import 'package:moviary/core/database/settings_store.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/features/auth/data/onboarding_repository_impl.dart';

import '../../helpers/fixed_clock.dart';

class _MockSettingsStore extends Mock implements SettingsStore {}

void main() {
  late AppDatabase db;
  late SettingsStore store;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    store = SettingsStore(db, FixedClock(DateTime.utc(2026, 1, 1)));
  });

  tearDown(() => db.close());

  test('is not completed by default', () async {
    expect(await OnboardingRepositoryImpl(store).isCompleted(), isFalse);
  });

  test('completion persists across repository instances', () async {
    await OnboardingRepositoryImpl(store).markCompleted();
    expect(await OnboardingRepositoryImpl(store).isCompleted(), isTrue);
  });

  test('wraps write errors in StorageFailure', () async {
    final failing = _MockSettingsStore();
    when(() => failing.write(any(), any())).thenThrow(Exception('disk full'));

    await expectLater(
      OnboardingRepositoryImpl(failing).markCompleted(),
      throwsA(isA<StorageFailure>()),
    );
  });
}
