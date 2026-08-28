import 'dart:convert';

import 'package:dio/dio.dart';

import '../errors/sub2api_exception.dart';
import '../serialization/response_decoder.dart';

Future<Sub2ApiException> decodeSub2ApiStreamDioException(
  Sub2ApiResponseDecoder decoder,
  DioException error,
) async {
  final response = error.response;
  final data = response?.data;
  if (response == null || data is! ResponseBody) {
    return decoder.decodeDioException(error);
  }
  try {
    final bytes = <int>[];
    await for (final chunk in data.stream) {
      bytes.addAll(chunk);
      if (bytes.length > 64 * 1024) throw const FormatException();
    }
    final decoded = jsonDecode(utf8.decode(bytes));
    final normalized = Response<Object?>(
      requestOptions: response.requestOptions,
      data: decoded,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
      extra: response.extra,
      redirects: response.redirects,
      isRedirect: response.isRedirect,
    );
    return decoder.decodeDioException(
      DioException(
        requestOptions: error.requestOptions,
        response: normalized,
        type: error.type,
        error: error.error,
        stackTrace: error.stackTrace,
        message: error.message,
      ),
    );
  } on Object {
    return const Sub2ApiException(
      kind: Sub2ApiFailureKind.protocol,
      code: 'protocol.invalid_error_envelope',
      retryable: false,
    );
  }
}
