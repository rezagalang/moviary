import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database/app_database.dart';
import 'database/settings_store.dart';
import 'database/synced_writer.dart';
import 'network/connectivity_service.dart';
import 'services/app_clock.dart';
import 'services/device_id_service.dart';

/// Overridden in `main.dart` with the opened database.
final appDatabaseProvider = Provider<AppDatabase>(
  (ref) => throw UnimplementedError(
    'appDatabaseProvider must be overridden in the root ProviderScope.',
  ),
);

final appClockProvider = Provider<AppClock>((ref) => const SystemClock());

final settingsStoreProvider = Provider<SettingsStore>(
  (ref) => SettingsStore(
    ref.watch(appDatabaseProvider),
    ref.watch(appClockProvider),
  ),
);

final deviceIdServiceProvider = Provider<DeviceIdService>(
  (ref) => DeviceIdService(ref.watch(settingsStoreProvider)),
);

final syncedWriterProvider = Provider<SyncedWriter>(
  (ref) => SyncedWriter(
    ref.watch(appDatabaseProvider),
    ref.watch(appClockProvider),
    ref.watch(deviceIdServiceProvider),
  ),
);

final connectivityServiceProvider =
    Provider<ConnectivityService>((ref) => ConnectivityService());

/// `true` when a network interface is available.
final connectivityStatusProvider = StreamProvider<bool>((ref) async* {
  final service = ref.watch(connectivityServiceProvider);
  yield await service.hasNetworkInterface();
  yield* service.watch();
});