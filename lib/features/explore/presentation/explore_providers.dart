import 'dart:ui' show PlatformDispatcher;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/app_failure.dart';
import '../../../core/network/api_clients.dart';
import '../../../core/providers.dart';
import '../../media_detail/domain/media_summary.dart';
import '../../settings/domain/app_preferences.dart';
import '../../settings/presentation/settings_providers.dart';
import '../data/catalog_repository_impl.dart';
import '../data/discovery_repository_impl.dart';
import '../data/jikan_api.dart';
import '../data/tmdb_api.dart';
import '../domain/catalog_repository.dart';
import '../domain/discovery_repository.dart';

final tmdbApiProvider = Provider<TmdbApi>(
  (ref) => TmdbApi(ref.watch(tmdbDioProvider), ref.watch(apiConfigProvider)),
);

final jikanApiProvider = Provider<JikanApi>(
  (ref) => JikanApi(ref.watch(jikanDioProvider)),
);

/// TMDB language tag that follows the in-app language setting.
final discoveryLanguageProvider = Provider<String>((ref) {
  final language = ref.watch(preferencesProvider).language;
  final indonesian = switch (language) {
    AppLanguage.indonesian => true,
    AppLanguage.english => false,
    AppLanguage.system => PlatformDispatcher.instance.locale.languageCode == 'id',
  };
  return indonesian ? 'id-ID' : 'en-US';
});

final discoveryRepositoryProvider = Provider<DiscoveryRepository>(
  (ref) => DiscoveryRepositoryImpl(
    tmdb: ref.watch(tmdbApiProvider),
    jikan: ref.watch(jikanApiProvider),
    language: ref.watch(discoveryLanguageProvider),
  ),
);

final catalogRepositoryProvider = Provider<CatalogRepository>(
  (ref) => CatalogRepositoryImpl(
    ref.watch(appDatabaseProvider),
    ref.watch(appClockProvider),
  ),
);

/// Result of one discovery request. Failures are values, not thrown errors,
/// so one failing section never blanks the whole page and Riverpod does not
/// silently retry (which would keep an offline spinner on screen).
final class DiscoveryResult {
  const DiscoveryResult({this.items = const [], this.failure});

  final List<MediaSummary> items;
  final AppFailure? failure;

  bool get failed => failure != null;
}

Future<DiscoveryResult> _run(Future<List<MediaSummary>> Function() load) async {
  try {
    return DiscoveryResult(items: await load());
  } on AppFailure catch (failure) {
    return DiscoveryResult(failure: failure);
  }
}

final discoverySectionProvider = FutureProvider.autoDispose
    .family<DiscoveryResult, DiscoverySection>((ref, section) {
  final repository = ref.watch(discoveryRepositoryProvider);
  return _run(() => repository.section(section));
});

/// The committed (debounced) search text. Empty means "show discovery".
class ExploreQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void set(String value) => state = value;
}

final exploreQueryProvider =
    NotifierProvider<ExploreQueryNotifier, String>(ExploreQueryNotifier.new);

/// `null` means all types.
class ExploreTypeFilterNotifier extends Notifier<MediaType?> {
  @override
  MediaType? build() => null;

  void set(MediaType? value) => state = value;
}

final exploreTypeFilterProvider =
    NotifierProvider<ExploreTypeFilterNotifier, MediaType?>(
  ExploreTypeFilterNotifier.new,
);

final exploreSearchProvider =
    FutureProvider.autoDispose<DiscoveryResult>((ref) async {
  final query = ref.watch(exploreQueryProvider).trim();
  final repository = ref.watch(discoveryRepositoryProvider);
  if (query.isEmpty) return const DiscoveryResult();
  return _run(() => repository.search(query));
});
