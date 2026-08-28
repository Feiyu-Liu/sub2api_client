import 'package:dio/dio.dart';

import '../shared/configuration/sub2api_configuration.dart';
import '../shared/contract/sub2api_browser_route.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_user_account.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/session/session_coordinator.dart';
import '../shared/transport/request_executor.dart';
import '../shared/wire/sub2api_user_account_wire_dto.dart';
import 'sub2api_identity_models.dart';
import 'wire/identity_wire_dtos.dart';
import 'wire/identity_wire_service.dart';

/// Provides current-user email and third-party identity binding operations.
abstract interface class Sub2ApiIdentityClient {
  /// Builds the public server-rendered notification unsubscribe page URI.
  Sub2ApiNotificationUnsubscribeInstruction buildNotificationEmailUnsubscribe(
    Sub2ApiNotificationUnsubscribeToken token,
  );

  /// Removes a notification email from the current account.
  Future<Sub2ApiUserAccountSnapshot> removeNotificationEmail(
    String email, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Enables or disables a notification email entry.
  Future<Sub2ApiUserAccountSnapshot> toggleNotificationEmail(
    String email, {
    required bool disabled,
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Verifies and binds a local email identity.
  Future<Sub2ApiUserAccountSnapshot> bindEmail(
    Sub2ApiBindEmailIdentityRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Removes a third-party identity and clears the revoked local session.
  Future<Sub2ApiUserAccountSnapshot> unbind(
    Sub2ApiIdentityProvider provider, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Verifies and adds a notification email to the current account.
  Future<Sub2ApiUserAccountSnapshot> verifyNotificationEmail(
    Sub2ApiVerifyNotificationEmailRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Sends a verification code before binding a local email identity.
  Future<Sub2ApiIdentityCodeSent> sendEmailBindingCode(
    String email, {
    String? locale,
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Sends a verification code before adding a notification email.
  Future<Sub2ApiIdentityCodeSent> sendNotificationEmailCode(
    String email, {
    String? locale,
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Prepares a browser redirect for binding a third-party identity.
  Future<Sub2ApiIdentityBindingInstruction> startBinding(
    Sub2ApiStartIdentityBindingRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal identity implementation.
Sub2ApiIdentityClient createSub2ApiIdentityClient({
  required Sub2ApiConfiguration configuration,
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiSessionCoordinator sessions,
}) => _Sub2ApiIdentityClient(
  configuration: configuration,
  dio: dio,
  requestExecutor: requestExecutor,
  sessions: sessions,
);

final class _Sub2ApiIdentityClient implements Sub2ApiIdentityClient {
  _Sub2ApiIdentityClient({
    required Sub2ApiConfiguration configuration,
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiSessionCoordinator sessions,
  }) : _origin = configuration.origin,
       _requestExecutor = requestExecutor,
       _service = IdentityWireService(dio),
       _sessions = sessions;

  final Uri _origin;
  final Sub2ApiRequestExecutor _requestExecutor;
  final IdentityWireService _service;
  final Sub2ApiSessionCoordinator _sessions;

  @override
  @Sub2ApiBrowserRoute('GET', '/api/v1/settings/email-unsubscribe')
  Sub2ApiNotificationUnsubscribeInstruction buildNotificationEmailUnsubscribe(
    Sub2ApiNotificationUnsubscribeToken token,
  ) {
    final value = token.reveal().trim();
    if (value.isEmpty) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'identity.unsubscribe_token_required',
        retryable: false,
      );
    }
    return Sub2ApiNotificationUnsubscribeInstruction(
      uri: _origin.resolveUri(
        Uri(
          path: '/api/v1/settings/email-unsubscribe',
          queryParameters: <String, String>{'token': value},
        ),
      ),
    );
  }

  @override
  Future<Sub2ApiUserAccountSnapshot> removeNotificationEmail(
    String email, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedEmail = _email(email);
    return _requestExecutor
        .protectedNonReplayableRequest<Sub2ApiUserAccountSnapshot>(
          send: (cancelToken, options, authorization) =>
              _service.removeNotificationEmail(
                <String, Object?>{'email': normalizedEmail},
                cancelToken,
                options,
                authorization,
              ),
          decode: _decodeAccount,
          requestOptions: requestOptions,
        );
  }

  @override
  Future<Sub2ApiUserAccountSnapshot> toggleNotificationEmail(
    String email, {
    required bool disabled,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedEmail = _email(email);
    return _requestExecutor
        .protectedNonReplayableRequest<Sub2ApiUserAccountSnapshot>(
          send: (cancelToken, options, authorization) =>
              _service.toggleNotificationEmail(
                <String, Object?>{
                  'email': normalizedEmail,
                  'disabled': disabled,
                },
                cancelToken,
                options,
                authorization,
              ),
          decode: _decodeAccount,
          requestOptions: requestOptions,
        );
  }

  @override
  Future<Sub2ApiUserAccountSnapshot> bindEmail(
    Sub2ApiBindEmailIdentityRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final email = _email(request.email);
    final code = _verificationCode(request.verificationCode.reveal());
    final password = _requiredSecret(
      request.password.reveal(),
      'identity.password_required',
    );
    final account = await _requestExecutor
        .protectedNonReplayableRequest<Sub2ApiUserAccountSnapshot>(
          send: (cancelToken, options, authorization) => _service.bindEmail(
            <String, Object?>{
              'email': email,
              'verify_code': code,
              'password': password,
            },
            cancelToken,
            options,
            authorization,
          ),
          decode: _decodeAccount,
          requestOptions: requestOptions,
        );
    await _sessions.clear();
    return account;
  }

  @override
  Future<Sub2ApiUserAccountSnapshot> unbind(
    Sub2ApiIdentityProvider provider, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final account = await _requestExecutor
        .protectedNonReplayableRequest<Sub2ApiUserAccountSnapshot>(
          send: (cancelToken, options, authorization) => _service.unbind(
            provider.wireName,
            cancelToken,
            options,
            authorization,
          ),
          decode: _decodeAccount,
          requestOptions: requestOptions,
        );
    await _sessions.clear();
    return account;
  }

  @override
  Future<Sub2ApiUserAccountSnapshot> verifyNotificationEmail(
    Sub2ApiVerifyNotificationEmailRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final email = _email(request.email);
    final code = _verificationCode(request.code.reveal());
    return _requestExecutor
        .protectedNonReplayableRequest<Sub2ApiUserAccountSnapshot>(
          send: (cancelToken, options, authorization) =>
              _service.verifyNotificationEmail(
                <String, Object?>{'email': email, 'code': code},
                cancelToken,
                options,
                authorization,
              ),
          decode: _decodeAccount,
          requestOptions: requestOptions,
        );
  }

  @override
  Future<Sub2ApiIdentityCodeSent> sendEmailBindingCode(
    String email, {
    String? locale,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedEmail = _email(email);
    return _requestExecutor
        .protectedNonReplayableRequest<Sub2ApiIdentityCodeSent>(
          send: (cancelToken, options, authorization) =>
              _service.sendEmailBindingCode(
                <String, Object?>{'email': normalizedEmail},
                cancelToken,
                options,
                authorization,
                locale,
              ),
          decode: _decodeCodeSent,
          requestOptions: requestOptions,
        );
  }

  @override
  Future<Sub2ApiIdentityCodeSent> sendNotificationEmailCode(
    String email, {
    String? locale,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedEmail = _email(email);
    return _requestExecutor
        .protectedNonReplayableRequest<Sub2ApiIdentityCodeSent>(
          send: (cancelToken, options, authorization) =>
              _service.sendNotificationEmailCode(
                <String, Object?>{'email': normalizedEmail},
                cancelToken,
                options,
                authorization,
                locale,
              ),
          decode: _decodeCodeSent,
          requestOptions: requestOptions,
        );
  }

  @override
  Future<Sub2ApiIdentityBindingInstruction> startBinding(
    Sub2ApiStartIdentityBindingRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final redirect = request.redirectTo.trim();
    if (redirect.length > 2048 ||
        !redirect.startsWith('/') ||
        redirect.startsWith('//')) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'identity.invalid_redirect',
        retryable: false,
      );
    }
    return _requestExecutor.protectedRequest<Sub2ApiIdentityBindingInstruction>(
      send: (cancelToken, options, authorization) => _service.startBinding(
        <String, Object?>{
          'provider': request.provider.wireName,
          'redirect_to': redirect,
        },
        cancelToken,
        options,
        authorization,
      ),
      decode: _decodeInstruction,
      requestOptions: requestOptions,
    );
  }

  static Sub2ApiIdentityBindingInstruction _decodeInstruction(Object? data) {
    try {
      return IdentityBindingInstructionWireDto.fromJson(
        _objectMap(data),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidIdentityBindingInstruction;
    }
  }

  static Sub2ApiIdentityCodeSent _decodeCodeSent(Object? data) {
    try {
      return IdentityCodeSentWireDto.fromJson(
        _objectMap(data, invalidIdentityCodeSent),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidIdentityCodeSent;
    }
  }

  static Sub2ApiUserAccountSnapshot _decodeAccount(Object? data) {
    try {
      return Sub2ApiUserAccountWireDto.fromJson(
        _objectMap(data, invalidUserAccountSnapshot),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidUserAccountSnapshot;
    }
  }

  static Map<String, Object?> _objectMap(
    Object? value, [
    Sub2ApiException failure = invalidIdentityBindingInstruction,
  ]) {
    if (value is! Map) throw failure;
    final result = <String, Object?>{};
    for (final entry in value.entries) {
      if (entry.key is! String) throw failure;
      result[entry.key as String] = entry.value;
    }
    return result;
  }

  static String _email(String value) {
    final normalized = value.trim();
    final at = normalized.indexOf('@');
    if (at <= 0 ||
        at == normalized.length - 1 ||
        normalized.contains(RegExp(r'\s'))) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'identity.invalid_email',
        retryable: false,
      );
    }
    return normalized;
  }

  static String _verificationCode(String value) {
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'identity.invalid_verification_code',
        retryable: false,
      );
    }
    return value;
  }

  static String _requiredSecret(String value, String code) {
    if (value.isEmpty) {
      throw Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: code,
        retryable: false,
      );
    }
    return value;
  }
}
