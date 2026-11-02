import 'package:connectivity_plus/connectivity_plus.dart';

/// Reports whether a network *interface* is available.
///
/// This is not proof of internet access. The sync engine (Phase 5) treats a
/// connectivity event only as a trigger and confirms with a real request.
class ConnectivityService {
  ConnectivityService([Connectivity? connectivity])
      : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  bool _hasLink(List<ConnectivityResult> results) =>
      results.any((r) => r != ConnectivityResult.none);

  Future<bool> hasNetworkInterface() async =>
      _hasLink(await _connectivity.checkConnectivity());

  Stream<bool> watch() =>
      _connectivity.onConnectivityChanged.map(_hasLink).distinct();
}
