import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_totp_models.dart';
import 'wire/totp_wire_dtos.dart';
import 'wire/totp_wire_service.dart';

/// Provides current-user TOTP enrollment and step-up operations.
abstract interface class Sub2ApiTotpClient {
  /// Removes TOTP after password or email-code identity verification.
  Future<void> disable(
    Sub2ApiTotpIdentityProof proof, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Starts password- or email-code-gated TOTP enrollment.
  Future<Sub2ApiTotpSetupResult> beginSetup(
    Sub2ApiTotpIdentityProof proof, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Completes TOTP enrollment using the setup token and current code.
  Future<void> enable(
    Sub2ApiEnableTotpRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads global feature availability and the current enrollment state.
  Future<Sub2ApiTotpStatus> getStatus({Sub2ApiRequestOptions? requestOptions});

  /// Reads whether enrollment/removal requires an email code or password.
  Future<Sub2ApiTotpVerificationMethod> getVerificationMethod({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Sends the email identity proof used by TOTP enrollment or removal.
  Future<void> sendEmailVerificationCode({
    String? locale,
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Verifies a TOTP code and grants the current session a sudo window.
  Future<Sub2ApiTotpStepUpGrant> stepUp(
    Sub2ApiVerificationCode code, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal TOTP implementation.
Sub2ApiTotpClient createSub2ApiTotpClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
}) => _Sub2ApiTotpClient(dio: dio, requestExecutor: requestExecutor);

final class _Sub2ApiTotpClient implements Sub2ApiTotpClient {
  _Sub2ApiTotpClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
  }) : _requestExecutor = requestExecutor,
       _service = TotpWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final TotpWireService _service;

  @override
  Future<void> disable(
    Sub2ApiTotpIdentityProof proof, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedNonReplayableRequest<void>(
    send: (cancelToken, options, authorization) => _service.disable(
      _identityProofBody(proof),
      cancelToken,
      options,
      authorization,
    ),
    decode: _decodeSuccess,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiTotpSetupResult> beginSetup(
    Sub2ApiTotpIdentityProof proof, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedNonReplayableRequest<Sub2ApiTotpSetupResult>(
    send: (cancelToken, options, authorization) => _service.beginSetup(
      _identityProofBody(proof),
      cancelToken,
      options,
      authorization,
    ),
    decode: _decodeSetup,
    requestOptions: requestOptions,
  );

  @override
  Future<void> enable(
    Sub2ApiEnableTotpRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final code = _sixDigitCode(request.code.reveal());
    final setupToken = _requiredProof(
      request.setupToken.reveal(),
      'totp.setup_token_required',
    );
    return _requestExecutor.protectedNonReplayableRequest<void>(
      send: (cancelToken, options, authorization) => _service.enable(
        <String, Object?>{'totp_code': code, 'setup_token': setupToken},
        cancelToken,
        options,
        authorization,
      ),
      decode: _decodeSuccess,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiTotpStatus> getStatus({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest<Sub2ApiTotpStatus>(
    send: (cancelToken, options, authorization) =>
        _service.getStatus(cancelToken, options, authorization),
    decode: _decodeStatus,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiTotpVerificationMethod> getVerificationMethod({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest<Sub2ApiTotpVerificationMethod>(
    send: (cancelToken, options, authorization) =>
        _service.getVerificationMethod(cancelToken, options, authorization),
    decode: _decodeVerificationMethod,
    requestOptions: requestOptions,
  );

  @override
  Future<void> sendEmailVerificationCode({
    String? locale,
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedNonReplayableRequest<void>(
    send: (cancelToken, options, authorization) => _service
        .sendEmailVerificationCode(cancelToken, options, authorization, locale),
    decode: _decodeSuccess,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiTotpStepUpGrant> stepUp(
    Sub2ApiVerificationCode code, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final value = _sixDigitCode(code.reveal());
    return _requestExecutor
        .protectedNonReplayableRequest<Sub2ApiTotpStepUpGrant>(
          send: (cancelToken, options, authorization) => _service.stepUp(
            <String, Object?>{'code': value},
            cancelToken,
            options,
            authorization,
          ),
          decode: _decodeStepUp,
          requestOptions: requestOptions,
        );
  }

  static Sub2ApiTotpStatus _decodeStatus(Object? data) {
    try {
      return TotpStatusWireDto.fromJson(_objectMap(data)).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidTotpStatus;
    }
  }

  static Sub2ApiTotpVerificationMethod _decodeVerificationMethod(Object? data) {
    try {
      return TotpVerificationMethodWireDto.fromJson(
        _objectMap(data, invalidTotpVerificationMethod),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidTotpVerificationMethod;
    }
  }

  static void _decodeSuccess(Object? data) {
    try {
      TotpSuccessWireDto.fromJson(
        _objectMap(data, invalidTotpMutationResponse),
      ).requireSuccess();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidTotpMutationResponse;
    }
  }

  static Sub2ApiTotpSetupResult _decodeSetup(Object? data) {
    try {
      return TotpSetupWireDto.fromJson(
        _objectMap(data, invalidTotpSetupResponse),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidTotpSetupResponse;
    }
  }

  static Sub2ApiTotpStepUpGrant _decodeStepUp(Object? data) {
    try {
      return TotpStepUpWireDto.fromJson(
        _objectMap(data, invalidTotpStepUpResponse),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidTotpStepUpResponse;
    }
  }

  static Map<String, Object?> _identityProofBody(
    Sub2ApiTotpIdentityProof proof,
  ) => switch (proof) {
    Sub2ApiTotpEmailProof(:final code) => <String, Object?>{
      'email_code': _requiredProof(code.reveal(), 'totp.email_code_required'),
    },
    Sub2ApiTotpPasswordProof(:final password) => <String, Object?>{
      'password': _requiredProof(password.reveal(), 'totp.password_required'),
    },
  };

  static String _requiredProof(String value, String code) {
    if (value.isEmpty) {
      throw Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: code,
        retryable: false,
      );
    }
    return value;
  }

  static String _sixDigitCode(String value) {
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'totp.invalid_code',
        retryable: false,
      );
    }
    return value;
  }

  static Map<String, Object?> _objectMap(
    Object? value, [
    Sub2ApiException failure = invalidTotpStatus,
  ]) {
    if (value is! Map) throw failure;
    final result = <String, Object?>{};
    for (final entry in value.entries) {
      if (entry.key is! String) throw failure;
      result[entry.key as String] = entry.value;
    }
    return result;
  }
}
