import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// Offline programmable Dio adapter used by endpoint contract tests.
final class JsonResponseAdapter implements HttpClientAdapter {
  JsonResponseAdapter(this._respond);

  final FutureOr<JsonResponse> Function(RequestOptions request) _respond;

  final List<RequestOptions> requests = <RequestOptions>[];
  int closeCount = 0;

  @override
  void close({bool force = false}) {
    closeCount++;
  }

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final response = await _respond(options);
    return ResponseBody.fromString(
      jsonEncode(response.body),
      response.statusCode,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }
}

/// JSON response emitted by [JsonResponseAdapter].
final class JsonResponse {
  const JsonResponse({required this.body, this.statusCode = 200});

  final Object? body;
  final int statusCode;
}
