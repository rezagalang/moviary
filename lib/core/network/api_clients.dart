import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../errors/app_failure.dart';
import 'api_config.dart';

const Duration _timeout = Duration(seconds: 15);

final apiConfigProvider = Provider<ApiConfig>(
  (ref) => ApiConfig.fromEnvironment,
);

final tmdbDioProvider = Provider<Dio>((ref) {
  final config = ref.watch(apiConfigProvider);
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    connectTimeout: _timeout,
    sendTimeout: _timeout,
    receiveTimeout: _timeout,
    headers: {
      if (config.tmdbReadAccessToken.isNotEmpty)
        'Authorization': 'Bearer ${config.tmdbReadAccessToken}',
    },
  ));
  ref.onDispose(dio.close);
  return dio;
});

/// Jikan (MyAnimeList) needs no key. Its limit is about 3 requests/second.
final jikanDioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.jikan.moe/v4',
    connectTimeout: _timeout,
    sendTimeout: _timeout,
    receiveTimeout: _timeout,
  ));
  ref.onDispose(dio.close);
  return dio;
});

/// Converts a Dio exception into a typed [AppFailure] so presentation never
/// depends on Dio.
AppFailure mapDioException(DioException e) {
  final type = e.type;
  if (type == DioExceptionType.connectionTimeout ||
      type == DioExceptionType.sendTimeout ||
      type == DioExceptionType.receiveTimeout ||
      type == DioExceptionType.connectionError) {
    return NetworkFailure(cause: e, stackTrace: e.stackTrace);
  }
  if (type == DioExceptionType.badResponse) {
    final status = e.response?.statusCode;
    if (status == 429) {
      final seconds = int.tryParse(e.response?.headers.value('retry-after') ?? '');
      return RateLimitedFailure(
        retryAfter: seconds == null ? null : Duration(seconds: seconds),
        cause: e,
        stackTrace: e.stackTrace,
      );
    }
    if (status == 401 || status == 403) {
      return ConfigFailure(
        message: 'API credentials were rejected ($status)',
        cause: e,
        stackTrace: e.stackTrace,
      );
    }
    return UnknownFailure(
      message: 'Server responded with $status',
      cause: e,
      stackTrace: e.stackTrace,
    );
  }
  if (e.error is SocketException) {
    return NetworkFailure(cause: e, stackTrace: e.stackTrace);
  }
  return UnknownFailure(
    message: 'Request failed',
    cause: e,
    stackTrace: e.stackTrace,
  );
}
