/// API credentials, passed with `--dart-define-from-file=env/dev.json`.
///
/// Prefer the TMDB "API Read Access Token" (v4, sent as a Bearer header). The
/// plain v3 API key also works. With neither set, discovery shows a clear
/// "not configured" message instead of failing silently.
final class ApiConfig {
  const ApiConfig({this.tmdbReadAccessToken = '', this.tmdbApiKey = ''});

  static const ApiConfig fromEnvironment = ApiConfig(
    tmdbReadAccessToken: String.fromEnvironment('TMDB_READ_ACCESS_TOKEN'),
    tmdbApiKey: String.fromEnvironment('TMDB_API_KEY'),
  );

  final String tmdbReadAccessToken;
  final String tmdbApiKey;

  bool get tmdbConfigured =>
      tmdbReadAccessToken.isNotEmpty || tmdbApiKey.isNotEmpty;
}
