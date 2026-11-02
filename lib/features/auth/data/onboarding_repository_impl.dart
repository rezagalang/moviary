import '../../../core/database/settings_store.dart';
import '../../../core/errors/app_failure.dart';
import '../domain/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl(this._store);

  static const String key = 'onboarding_completed';

  final SettingsStore _store;

  @override
  Future<bool> isCompleted() async {
    try {
      return await _store.read(key) == 'true';
    } catch (e, s) {
      throw StorageFailure(
        message: 'Could not read onboarding state',
        cause: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> markCompleted() async {
    try {
      await _store.write(key, 'true');
    } catch (e, s) {
      throw StorageFailure(
        message: 'Could not save onboarding state',
        cause: e,
        stackTrace: s,
      );
    }
  }
}
