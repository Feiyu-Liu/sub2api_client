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

  /// Decodes an endpoint that explicitly permits either the standard envelope
  /// or a raw 200 payload. A body containing `code` is always treated as an
  /// attempted envelope and never falls back to raw decoding.
  T decodeSuccessOrRaw<T>(
    HttpResponse<Object?> response,
    T Function(Object? data) decodeData,
  ) {
    if (response.response.statusCode != 200) {
      throw _protocol('protocol.unexpected_success_status', response.response);
    }
    final body = _stringMap(response.data);
    if (body != null && body.containsKey('code')) {
      return decodeSuccess(response, decodeData);
    }
    try {
      return decodeData(response.data);
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw _protocol('protocol.invalid_response_data', response.response);
    }
  }

  /// Validates an endpoint whose fixed success contract is an empty HTTP 204.
  void decodeNoContent(HttpResponse<Object?> response) {
    if (response.response.statusCode != 204) {
      throw _protocol('protocol.unexpected_success_status', response.response);
    }
    if (response.data != null) {
      throw _protocol('protocol.unexpected_response_body', response.response);
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
    'TOTP_NOT_ENABLED' => 'totp.not_enabled',
    'TOTP_ALREADY_ENABLED' => 'totp.already_enabled',
    'TOTP_NOT_SETUP' => 'totp.not_setup',
    'TOTP_INVALID_CODE' => 'totp.invalid_code',
    'TOTP_SETUP_EXPIRED' => 'totp.setup_expired',
    'TOTP_TOO_MANY_ATTEMPTS' => 'totp.too_many_attempts',
    'VERIFY_CODE_REQUIRED' => 'totp.verify_code_required',
    'PASSWORD_REQUIRED' => 'totp.password_required',
    'PASSWORD_INCORRECT' => 'auth.password_incorrect',
    'EMAIL_VERIFY_NOT_ENABLED' => 'totp.email_verify_not_enabled',
    'STEP_UP_ADMIN_API_KEY_FORBIDDEN' => 'auth.step_up_admin_api_key_forbidden',
    'STEP_UP_TOTP_NOT_ENABLED' => 'auth.step_up_totp_not_enabled',
    'STEP_UP_REQUIRED' => 'auth.step_up_required',
    'STEP_UP_UNAVAILABLE' => 'auth.step_up_unavailable',
    'IDENTITY_PROVIDER_INVALID' => 'identity.invalid_provider',
    'IDENTITY_REDIRECT_INVALID' => 'identity.invalid_redirect',
    'IDENTITY_UNBIND_LAST_METHOD' => 'identity.unbind_last_method',
    'AUTH_IDENTITY_OWNERSHIP_CONFLICT' => 'identity.ownership_conflict',
    'AUTH_IDENTITY_EMAIL_MISMATCH' => 'identity.email_mismatch',
    'TOO_MANY_NOTIFY_EMAILS' => 'identity.too_many_notification_emails',
    'NOTIFY_CODE_USER_RATE_LIMIT' => 'identity.notification_code_rate_limited',
    'OAUTH_PROVIDER_INVALID' => 'oauth.invalid_provider',
    'OAUTH_SUBJECT_MISSING' => 'oauth.subject_missing',
    'OAUTH_EMAIL_NOT_VERIFIED' => 'oauth.email_not_verified',
    'OAUTH_INVITATION_REQUIRED' => 'oauth.invitation_required',
    'OAUTH_DISABLED' => 'oauth.disabled',
    'OAUTH_PROVIDER_NOT_FOUND' => 'oauth.provider_not_found',
    'OAUTH_CONFIG_INVALID' => 'oauth.invalid_configuration',
    'PENDING_AUTH_SESSION_NOT_FOUND' => 'oauth.pending_session_not_found',
    'PENDING_AUTH_SESSION_EXPIRED' => 'oauth.pending_session_expired',
    'PENDING_AUTH_SESSION_CONSUMED' => 'oauth.pending_session_consumed',
    'PENDING_AUTH_CODE_INVALID' => 'oauth.pending_code_invalid',
    'PENDING_AUTH_CODE_EXPIRED' => 'oauth.pending_code_expired',
    'PENDING_AUTH_CODE_CONSUMED' => 'oauth.pending_code_consumed',
    'PENDING_AUTH_BROWSER_MISMATCH' => 'oauth.pending_browser_mismatch',
    'PENDING_AUTH_SESSION_INVALID' => 'oauth.pending_session_invalid',
    'PENDING_AUTH_TARGET_USER_MISMATCH' => 'oauth.target_user_mismatch',
    _ => 'server.${raw.toLowerCase()}',
  };

  static String _reasonCode(String raw) => switch (raw) {
    'REFRESH_TOKEN_INVALID' => 'auth.refresh_token_invalid',
    'REFRESH_TOKEN_EXPIRED' => 'auth.refresh_token_expired',
    'REFRESH_TOKEN_REUSED' => 'auth.refresh_token_reused',
    'TOKEN_REVOKED' => 'auth.token_revoked',
    'TOTP_NOT_ENABLED' => 'totp.not_enabled',
    'TOTP_ALREADY_ENABLED' => 'totp.already_enabled',
    'TOTP_NOT_SETUP' => 'totp.not_setup',
    'TOTP_INVALID_CODE' => 'totp.invalid_code',
    'TOTP_SETUP_EXPIRED' => 'totp.setup_expired',
    'TOTP_TOO_MANY_ATTEMPTS' => 'totp.too_many_attempts',
    'VERIFY_CODE_REQUIRED' => 'totp.verify_code_required',
    'PASSWORD_REQUIRED' => 'totp.password_required',
    'PASSWORD_INCORRECT' => 'auth.password_incorrect',
    'EMAIL_VERIFY_NOT_ENABLED' => 'totp.email_verify_not_enabled',
    'STEP_UP_ADMIN_API_KEY_FORBIDDEN' => 'auth.step_up_admin_api_key_forbidden',
    'STEP_UP_TOTP_NOT_ENABLED' => 'auth.step_up_totp_not_enabled',
    'STEP_UP_REQUIRED' => 'auth.step_up_required',
    'STEP_UP_UNAVAILABLE' => 'auth.step_up_unavailable',
    'IDENTITY_PROVIDER_INVALID' => 'identity.invalid_provider',
    'IDENTITY_REDIRECT_INVALID' => 'identity.invalid_redirect',
    'IDENTITY_UNBIND_LAST_METHOD' => 'identity.unbind_last_method',
    'AUTH_IDENTITY_OWNERSHIP_CONFLICT' => 'identity.ownership_conflict',
    'AUTH_IDENTITY_EMAIL_MISMATCH' => 'identity.email_mismatch',
    'TOO_MANY_NOTIFY_EMAILS' => 'identity.too_many_notification_emails',
    'NOTIFY_CODE_USER_RATE_LIMIT' => 'identity.notification_code_rate_limited',
    'OAUTH_PROVIDER_INVALID' => 'oauth.invalid_provider',
    'OAUTH_SUBJECT_MISSING' => 'oauth.subject_missing',
    'OAUTH_EMAIL_NOT_VERIFIED' => 'oauth.email_not_verified',
    'OAUTH_INVITATION_REQUIRED' => 'oauth.invitation_required',
    'OAUTH_DISABLED' => 'oauth.disabled',
    'OAUTH_PROVIDER_NOT_FOUND' => 'oauth.provider_not_found',
    'OAUTH_CONFIG_INVALID' => 'oauth.invalid_configuration',
    'PENDING_AUTH_SESSION_NOT_FOUND' => 'oauth.pending_session_not_found',
    'PENDING_AUTH_SESSION_EXPIRED' => 'oauth.pending_session_expired',
    'PENDING_AUTH_SESSION_CONSUMED' => 'oauth.pending_session_consumed',
    'PENDING_AUTH_CODE_INVALID' => 'oauth.pending_code_invalid',
    'PENDING_AUTH_CODE_EXPIRED' => 'oauth.pending_code_expired',
    'PENDING_AUTH_CODE_CONSUMED' => 'oauth.pending_code_consumed',
    'PENDING_AUTH_BROWSER_MISMATCH' => 'oauth.pending_browser_mismatch',
    'PENDING_AUTH_SESSION_INVALID' => 'oauth.pending_session_invalid',
    'PENDING_AUTH_TARGET_USER_MISMATCH' => 'oauth.target_user_mismatch',
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
