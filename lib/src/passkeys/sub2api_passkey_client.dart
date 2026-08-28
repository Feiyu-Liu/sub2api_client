import 'package:dio/dio.dart';

import '../auth/models/sub2api_auth_models.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_passkey_models.dart';
import 'wire/passkey_wire_dtos.dart';
import 'wire/passkey_wire_service.dart';

/// Provides typed passkey login and credential-management ceremonies.
abstract interface class Sub2ApiPasskeyClient {
  /// Deletes a passkey after the account password is verified.
  Future<void> delete(
    int id,
    Sub2ApiDeletePasskeyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Lists the passkey credentials owned by the current user.
  Future<List<Sub2ApiPasskeyCredentialSummary>> list({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Renames a passkey credential owned by the current user.
  Future<void> rename(
    int id,
    String name, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Starts a discoverable-credential passkey login ceremony.
  Future<Sub2ApiPasskeyLoginChallenge> beginLogin({
    Sub2ApiCaptchaProof captcha = const Sub2ApiCaptchaProof(),
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Finishes a passkey assertion and persists the resulting user session.
  Future<Sub2ApiLoginResult> finishLogin(
    Sub2ApiFinishPasskeyLoginRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Starts a password-gated passkey registration ceremony.
  Future<Sub2ApiPasskeyRegistrationChallenge> beginRegistration(
    Sub2ApiBeginPasskeyRegistrationRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Finishes passkey enrollment and returns its stored credential metadata.
  Future<Sub2ApiPasskeyCredentialSummary> finishRegistration(
    Sub2ApiFinishPasskeyRegistrationRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal passkey implementation.
Sub2ApiPasskeyClient createSub2ApiPasskeyClient({
  required Future<Sub2ApiLoginResult> Function(Object? data)
  completeAuthentication,
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
}) => _Sub2ApiPasskeyClient(
  completeAuthentication: completeAuthentication,
  dio: dio,
  requestExecutor: requestExecutor,
);

final class _Sub2ApiPasskeyClient implements Sub2ApiPasskeyClient {
  _Sub2ApiPasskeyClient({
    required Future<Sub2ApiLoginResult> Function(Object? data)
    completeAuthentication,
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
  }) : _completeAuthentication = completeAuthentication,
       _requestExecutor = requestExecutor,
       _service = PasskeyWireService(dio);

  final Future<Sub2ApiLoginResult> Function(Object? data)
  _completeAuthentication;
  final Sub2ApiRequestExecutor _requestExecutor;
  final PasskeyWireService _service;

  @override
  Future<void> delete(
    int id,
    Sub2ApiDeletePasskeyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (id <= 0) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'passkey.invalid_id',
        retryable: false,
      );
    }
    if (request.password.reveal().isEmpty) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'passkey.password_required',
        retryable: false,
      );
    }
    return _requestExecutor.protectedNonReplayableRequest<void>(
      send: (cancelToken, options, authorization) => _service.delete(
        id,
        <String, Object?>{'password': request.password.reveal()},
        cancelToken,
        options,
        authorization,
      ),
      decode: _decodeMutationSuccess,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiPasskeyCredentialSummary>> list({
    Sub2ApiRequestOptions? requestOptions,
  }) =>
      _requestExecutor.protectedRequest<List<Sub2ApiPasskeyCredentialSummary>>(
        send: (cancelToken, options, authorization) =>
            _service.list(cancelToken, options, authorization),
        decode: _decodeCredentialList,
        requestOptions: requestOptions,
      );

  @override
  Future<void> rename(
    int id,
    String name, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedName = name.trim();
    if (id <= 0) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'passkey.invalid_id',
        retryable: false,
      );
    }
    if (normalizedName.isEmpty) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'passkey.name_required',
        retryable: false,
      );
    }
    return _requestExecutor.protectedNonReplayableRequest<void>(
      send: (cancelToken, options, authorization) => _service.rename(
        id,
        <String, Object?>{'name': normalizedName},
        cancelToken,
        options,
        authorization,
      ),
      decode: _decodeMutationSuccess,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiPasskeyLoginChallenge> beginLogin({
    Sub2ApiCaptchaProof captcha = const Sub2ApiCaptchaProof(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.publicRequest<Sub2ApiPasskeyLoginChallenge>(
    send: (cancelToken, options, authorization) => _service.beginLogin(
      <String, Object?>{
        if (captcha.wireChallengeToken != null)
          'turnstile_token': captcha.wireChallengeToken,
        if (captcha.tencentCaptchaRandstr != null)
          'tencent_captcha_randstr': captcha.tencentCaptchaRandstr,
        if (captcha.tencentCaptchaTicket != null)
          'tencent_captcha_ticket': captcha.tencentCaptchaTicket,
      },
      cancelToken,
      options,
      authorization,
    ),
    decode: _decodeLoginChallenge,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiPasskeyRegistrationChallenge> beginRegistration(
    Sub2ApiBeginPasskeyRegistrationRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest<Sub2ApiPasskeyRegistrationChallenge>(
    send: (cancelToken, options, authorization) => _service.beginRegistration(
      <String, Object?>{'password': request.password.reveal()},
      cancelToken,
      options,
      authorization,
    ),
    decode: _decodeRegistrationChallenge,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiLoginResult> finishLogin(
    Sub2ApiFinishPasskeyLoginRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final data = await _requestExecutor.publicRequest<Object?>(
      send: (cancelToken, options, authorization) => _service.finishLogin(
        passkeyFinishLoginBody(request),
        cancelToken,
        options,
        authorization,
      ),
      decode: (value) => value,
      requestOptions: requestOptions,
    );
    return _completeAuthentication(data);
  }

  @override
  Future<Sub2ApiPasskeyCredentialSummary> finishRegistration(
    Sub2ApiFinishPasskeyRegistrationRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor
      .protectedNonReplayableRequest<Sub2ApiPasskeyCredentialSummary>(
        send: (cancelToken, options, authorization) =>
            _service.finishRegistration(
              passkeyFinishRegistrationBody(request),
              cancelToken,
              options,
              authorization,
            ),
        decode: _decodeCredentialSummary,
        requestOptions: requestOptions,
      );

  static Sub2ApiPasskeyLoginChallenge _decodeLoginChallenge(Object? data) {
    try {
      return PasskeyLoginChallengeWireDto.fromJson(
        _objectMap(data),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidPasskeyLoginOptions;
    }
  }

  static Sub2ApiPasskeyRegistrationChallenge _decodeRegistrationChallenge(
    Object? data,
  ) {
    try {
      return PasskeyRegistrationChallengeWireDto.fromJson(
        _objectMap(data),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidPasskeyRegistrationOptions;
    }
  }

  static Sub2ApiPasskeyCredentialSummary _decodeCredentialSummary(
    Object? data,
  ) {
    try {
      return PasskeyCredentialSummaryWireDto.fromJson(
        _objectMap(data),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidPasskeyCredentialSummary;
    }
  }

  static List<Sub2ApiPasskeyCredentialSummary> _decodeCredentialList(
    Object? data,
  ) {
    if (data is! List) throw invalidPasskeyCredentialSummary;
    try {
      return List<Sub2ApiPasskeyCredentialSummary>.unmodifiable(
        data.map(
          (entry) => PasskeyCredentialSummaryWireDto.fromJson(
            _objectMap(entry),
          ).toPublicModel(),
        ),
      );
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidPasskeyCredentialSummary;
    }
  }

  static void _decodeMutationSuccess(Object? data) {
    final map = _objectMap(data);
    if (map['success'] != true) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_passkey_mutation_response',
        retryable: false,
      );
    }
  }

  static Map<String, Object?> _objectMap(Object? value) {
    if (value is! Map) throw invalidPasskeyLoginOptions;
    final result = <String, Object?>{};
    for (final entry in value.entries) {
      if (entry.key is! String) throw invalidPasskeyLoginOptions;
      result[entry.key as String] = entry.value;
    }
    return result;
  }
}
