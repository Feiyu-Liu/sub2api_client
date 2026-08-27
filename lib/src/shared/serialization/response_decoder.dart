import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../errors/sub2api_exception.dart';

/// Strict decoder for the two v0.1.183 envelope families.
final class Sub2ApiResponseDecoder {
  const Sub2ApiResponseDecoder();

  T decodeSuccess<T>(
    HttpResponse<Object?> response,
    T Function(Object? data) decodeData,
  ) {
    if (response.response.statusCode != 200) {
      throw _protocol('protocol.unexpected_success_status', response.response);
    }
    final envelope = _stringMap(response.data);
    if (envelope == null ||
        envelope['code'] is! int ||
        envelope['code'] != 0 ||
        envelope['message'] is! String ||
        !envelope.containsKey('data')) {
      throw _protocol('protocol.invalid_success_envelope', response.response);
    }
    try {
      return decodeData(envelope['data']);
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw _protocol('protocol.invalid_response_data', response.response);
    }
  }

  Sub2ApiException decodeDioException(DioException error) {
    if (error.error is Sub2ApiException) {
      return error.error! as Sub2ApiException;
    }
    final type = error.type;
    if (type == DioExceptionType.cancel) {
      return const Sub2ApiException(
        kind: Sub2ApiFailureKind.cancelled,
        code: 'request.cancelled',
        retryable: false,
      );
    }
    if (type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.receiveTimeout ||
        type.name == 'transformTimeout') {
      return const Sub2ApiException(
        kind: Sub2ApiFailureKind.timeout,
        code: 'request.timeout',
        retryable: true,
      );
    }
    if (type == DioExceptionType.connectionError) {
      return const Sub2ApiException(
        kind: Sub2ApiFailureKind.network,
        code: 'network.unavailable',
        retryable: true,
      );
    }
    if (type == DioExceptionType.badCertificate) {
      return const Sub2ApiException(
        kind: Sub2ApiFailureKind.network,
        code: 'network.bad_certificate',
        retryable: false,
      );
    }
    if (type == DioExceptionType.badResponse) {
      return _decodeErrorResponse(error.response);
    }
    return const Sub2ApiException(
      kind: Sub2ApiFailureKind.unknown,
      code: 'unknown.transport',
      retryable: false,
    );
  }

  bool isSessionInvalid(Sub2ApiException exception) => const {
    'auth.refresh_token_invalid',
    'auth.refresh_token_expired',
    'auth.refresh_token_reused',
    'auth.token_revoked',
    'auth.user_not_found',
    'auth.user_inactive',
  }.contains(exception.code);

  Sub2ApiException _decodeErrorResponse(Response<Object?>? response) {
    if (response == null) {
      return const Sub2ApiException(
        kind: Sub2ApiFailureKind.network,
        code: 'network.missing_response',
        retryable: true,
      );
    }
    final body = _stringMap(response.data);
    if (body == null || body['message'] is! String) {
      return _protocol('protocol.invalid_error_envelope', response);
    }
    final status = response.statusCode;
    final codeValue = body['code'];
    if (codeValue is String) {
      return Sub2ApiException(
        kind: _kindForStatus(status),
        code: _middlewareCode(codeValue),
        retryable: _retryable(status),
        statusCode: status,
        traceId: _traceId(response),
      );
    }
    if (codeValue is int) {
      final reason = body['reason'];
      if (reason != null && reason is! String) {
        return _protocol('protocol.invalid_error_envelope', response);
      }
      return Sub2ApiException(
        kind: _kindForStatus(status ?? codeValue),
        code: reason is String && reason.isNotEmpty
            ? _reasonCode(reason)
            : 'http.${status ?? codeValue}',
        retryable: _retryable(status ?? codeValue),
        statusCode: status,
        traceId: _traceId(response),
      );
    }
    return _protocol('protocol.invalid_error_envelope', response);
  }

  Sub2ApiException _protocol(String code, Response<Object?> response) =>
      Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: code,
        retryable: false,
        statusCode: response.statusCode,
        traceId: _traceId(response),
      );

  static Map<String, Object?>? _stringMap(Object? value) {
    if (value is! Map) {
      return null;
    }
    final result = <String, Object?>{};
    for (final entry in value.entries) {
      if (entry.key is! String) {
        return null;
      }
      result[entry.key as String] = entry.value;
    }
    return result;
  }

  static String _middlewareCode(String raw) => switch (raw) {
    'UNAUTHORIZED' => 'auth.unauthorized',
    'INVALID_AUTH_HEADER' => 'auth.invalid_header',
    'EMPTY_TOKEN' => 'auth.empty_token',
    'TOKEN_EXPIRED' => 'auth.token_expired',
    'INVALID_TOKEN' => 'auth.invalid_token',
    'USER_NOT_FOUND' => 'auth.user_not_found',
    'USER_INACTIVE' => 'auth.user_inactive',
    'TOKEN_REVOKED' => 'auth.token_revoked',
    'REFRESH_TOKEN_INVALID' => 'auth.refresh_token_invalid',
    'REFRESH_TOKEN_EXPIRED' => 'auth.refresh_token_expired',
    'REFRESH_TOKEN_REUSED' => 'auth.refresh_token_reused',
    _ => 'server.${raw.toLowerCase()}',
  };

  static String _reasonCode(String raw) => switch (raw) {
    'REFRESH_TOKEN_INVALID' => 'auth.refresh_token_invalid',
    'REFRESH_TOKEN_EXPIRED' => 'auth.refresh_token_expired',
    'REFRESH_TOKEN_REUSED' => 'auth.refresh_token_reused',
    'TOKEN_REVOKED' => 'auth.token_revoked',
    _ => 'server.${raw.toLowerCase()}',
  };

  static Sub2ApiFailureKind _kindForStatus(int? status) {
    if (status == 400 || status == 422) {
      return Sub2ApiFailureKind.validation;
    }
    if (status == 401) {
      return Sub2ApiFailureKind.unauthorized;
    }
    if (status == 403) {
      return Sub2ApiFailureKind.forbidden;
    }
    if (status == 409) {
      return Sub2ApiFailureKind.conflict;
    }
    if (status == 429) {
      return Sub2ApiFailureKind.rateLimited;
    }
    if (status != null && status >= 500) {
      return Sub2ApiFailureKind.server;
    }
    return Sub2ApiFailureKind.unknown;
  }

  static bool _retryable(int? status) => status == 429 || (status ?? 0) >= 500;

  static String? _traceId(Response<Object?> response) {
    final values = response.headers.map['x-request-id'];
    return values == null || values.isEmpty ? null : values.first;
  }
}
