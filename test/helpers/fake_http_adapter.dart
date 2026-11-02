import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// One canned HTTP answer.
class FakeResponse {
  const FakeResponse(this.status, [this.body, this.headers = const {}]);

  final int status;
  final Object? body;
  final Map<String, List<String>> headers;
}

/// Answers Dio requests from a handler, so API clients are tested without a
/// network. The handler may throw a [DioException] to simulate a failure.
class FakeHttpAdapter implements HttpClientAdapter {
  FakeHttpAdapter(this._handler);

  final FakeResponse Function(RequestOptions options) _handler;
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final response = _handler(options);
    return ResponseBody.fromString(
      jsonEncode(response.body),
      response.status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
        ...response.headers,
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Dio fakeDio(FakeHttpAdapter adapter, {String baseUrl = 'https://api.test'}) {
  return Dio(BaseOptions(baseUrl: baseUrl))..httpClientAdapter = adapter;
}

/// A request that fails like a device without a connection.
DioException noConnection(RequestOptions options) => DioException(
      requestOptions: options,
      type: DioExceptionType.connectionError,
    );
