import 'package:uuid/uuid.dart';

import '../database/settings_store.dart';

/// Stable random identifier for this installation.
///
/// Used later as `device_id` on personal rows and sync documents. It is a
/// random UUID, not a hardware identifier.
class DeviceIdService {
  DeviceIdService(this._store, [this._uuid = const Uuid()]);

  static const String _key = 'device_id';

  final SettingsStore _store;
  final Uuid _uuid;
  Future<String>? _pending;

  Future<String> getOrCreate() async {
    final pending = _pending ??= _loadOrCreate();
    try {
      return await pending;
    } catch (_) {
      _pending = null; // allow a retry after a failure
      rethrow;
    }
  }

  Future<String> _loadOrCreate() async {
    final existing = await _store.read(_key);
    if (existing != null && existing.isNotEmpty) return existing;
    final id = _uuid.v4();
    await _store.write(_key, id);
    return id;
  }
}
