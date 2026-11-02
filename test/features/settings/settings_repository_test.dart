import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviary/core/database/app_database.dart';
import 'package:moviary/core/database/settings_store.dart';
import 'package:moviary/core/errors/app_failure.dart';
import 'package:moviary/core/providers.dart';
import 'package:moviary/features/settings/data/settings_repository_impl.dart';
import 'package:moviary/features/settings/domain/app_preferences.dart';
import 'package:moviary/features/settings/presentation/settings_providers.dart';

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

  group('SettingsRepositoryImpl', () {
    test('returns defaults when nothing is stored', () async {
      final prefs = await SettingsRepositoryImpl(store).load();
      expect(prefs, AppPreferences.defaults);
    });

    test('persists theme and language across repository instances', () async {
      final repo = SettingsRepositoryImpl(store);
      await repo.saveThemeChoice(AppThemeChoice.dark);
      await repo.saveLanguage(AppLanguage.indonesian);

      final reloaded = await SettingsRepositoryImpl(store).load();
      expect(reloaded.themeChoice, AppThemeChoice.dark);
      expect(reloaded.language, AppLanguage.indonesian);
    });

    test('falls back to defaults for unknown stored values', () async {
      await store.write(SettingsRepositoryImpl.themeKey, 'banana');
      final prefs = await SettingsRepositoryImpl(store).load();
      expect(prefs.themeChoice, AppThemeChoice.system);
    });

    test('wraps write errors in StorageFailure', () async {
      final failing = _MockSettingsStore();
      when(() => failing.write(any(), any())).thenThrow(Exception('disk full'));

      await expectLater(
        SettingsRepositoryImpl(failing).saveThemeChoice(AppThemeChoice.dark),
        throwsA(isA<StorageFailure>()),
      );
    });
  });

  group('PreferencesNotifier', () {
    test('updates state and persists the change', () async {
      final container = ProviderContainer(overrides: [
        appDatabaseProvider.overrideWithValue(db),
        initialPreferencesProvider.overrideWithValue(AppPreferences.defaults),
      ]);
      addTearDown(container.dispose);

      await container
          .read(preferencesProvider.notifier)
          .setThemeChoice(AppThemeChoice.dark);

      expect(container.read(preferencesProvider).themeChoice, AppThemeChoice.dark);
      final stored = await SettingsRepositoryImpl(store).load();
      expect(stored.themeChoice, AppThemeChoice.dark);
    });

    test('keeps the previous state when saving fails', () async {
      final failing = _MockSettingsStore();
      when(() => failing.write(any(), any())).thenThrow(Exception('disk full'));

      final container = ProviderContainer(overrides: [
        initialPreferencesProvider.overrideWithValue(AppPreferences.defaults),
        settingsRepositoryProvider
            .overrideWithValue(SettingsRepositoryImpl(failing)),
      ]);
      addTearDown(container.dispose);

      await expectLater(
        container
            .read(preferencesProvider.notifier)
            .setThemeChoice(AppThemeChoice.dark),
        throwsA(isA<StorageFailure>()),
      );
      expect(container.read(preferencesProvider), AppPreferences.defaults);
    });
  });
}
