import 'package:dio/dio.dart';

import '../shared/configuration/sub2api_configuration.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/session/session_coordinator.dart';
import '../shared/session/sub2api_session.dart';
import '../shared/transport/request_executor.dart';
import 'models/sub2api_auth_models.dart';
import 'wire/auth_wire_service.dart';
import 'wire/sub2api_auth_dto.dart';

/// Provides password authentication operations supported by v0.1.
abstract interface class Sub2ApiAuthenticationClient {
  /// Completes a pending TOTP challenge.
  Future<Sub2ApiLoginResult> completeTwoFactorLogin(
    Sub2ApiTwoFactorLoginRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Authenticates a user with their password.
  Future<Sub2ApiLoginResult> login(
    Sub2ApiLoginRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Revokes the current session without replaying the operation.
  Future<void> logout({Sub2ApiRequestOptions? requestOptions});

  /// Rotates and persists the current refreshable session.
  Future<Sub2ApiSession> refreshCurrentSession({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Registers a new password user and returns its authentication result.
  Future<Sub2ApiLoginResult> register(
    Sub2ApiRegistrationRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal authentication implementation.
///
/// This factory is deliberately not exported from `sub2api_client.dart`.
Sub2ApiAuthenticationClient createSub2ApiAuthenticationClient({
  required Sub2ApiConfiguration configuration,
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiSessionCoordinator sessions,
}) => _Sub2ApiAuthenticationClient(
  configuration: configuration,
  dio: dio,
  requestExecutor: requestExecutor,
  sessions: sessions,
);

/// Runs the refresh callback required by the package-internal coordinator.
///
/// This helper is deliberately not exported from `sub2api_client.dart`.
Future<Sub2ApiSession> refreshSub2ApiAuthenticationSession(
  Sub2ApiAuthenticationClient client,
  Sub2ApiSession current,
) {
  if (client case _Sub2ApiAuthenticationClient()) {
    return client._refreshSession(current);
  }
  throw StateError('Unsupported Sub2ApiAuthenticationClient implementation.');
}

final class _Sub2ApiAuthenticationClient
    implements Sub2ApiAuthenticationClient {
  /// Creates an authentication feature client backed by the shared executor.
  _Sub2ApiAuthenticationClient({
    required Sub2ApiConfiguration configuration,
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiSessionCoordinator sessions,
  }) : _requestExecutor = requestExecutor,
       _sessions = sessions,
       _scope = configuration.origin.toString(),
       _service = AuthWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final String _scope;
  final AuthWireService _service;
  final Sub2ApiSessionCoordinator _sessions;

  /// Completes a pending TOTP challenge.
  @override
  Future<Sub2ApiLoginResult> completeTwoFactorLogin(
    Sub2ApiTwoFactorLoginRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final result = await _requestExecutor.publicRequest<Sub2ApiLoginResult>(
      send: (cancelToken, options, authorization) =>
          _service.completeTwoFactorLogin(
            Sub2ApiTwoFactorLoginRequestDto.fromPublic(request).toJson(),
            cancelToken,
            options,
            authorization,
          ),
      decode: _decodeLogin,
      requestOptions: requestOptions,
    );
    await _persistAuthenticatedResult(result);
    return result;
  }

  /// Authenticates a user with their password.
  @override
  Future<Sub2ApiLoginResult> login(
    Sub2ApiLoginRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final result = await _requestExecutor.publicRequest<Sub2ApiLoginResult>(
      send: (cancelToken, options, authorization) => _service.login(
        Sub2ApiLoginRequestDto.fromPublic(request).toJson(),
        cancelToken,
        options,
        authorization,
      ),
      decode: _decodeLogin,
      requestOptions: requestOptions,
    );
    await _persistAuthenticatedResult(result);
    return result;
  }

  /// Revokes an optional refresh token and does not automatically replay.
  @override
  Future<void> logout({Sub2ApiRequestOptions? requestOptions}) async {
    final snapshot = await _sessions.snapshot();
    if (snapshot == null) {
      return;
    }
    await _sessions.clear();
    await _requestExecutor.publicRequest<void>(
      send: (cancelToken, options, _) => _service.logout(
        Sub2ApiLogoutRequestDto.fromPublic(
          snapshot.session.refreshToken,
        ).toJson(),
        cancelToken,
        options,
        'Bearer ${snapshot.session.accessToken.reveal()}',
      ),
      decode: (_) {},
      requestOptions: requestOptions,
    );
  }

  /// Rotates and persists the current refreshable session.
  @override
  Future<Sub2ApiSession> refreshCurrentSession({
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final snapshot = await _sessions.snapshot();
    final session = snapshot?.session;
    if (session == null || session.refreshToken == null) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.unauthorized,
        code: 'auth.login_required',
        retryable: false,
      );
    }
    final refreshed = await _refreshSession(
      session,
      requestOptions: requestOptions,
    );
    await _sessions.replace(refreshed);
    return refreshed;
  }

  /// Registers a new password user and returns its authentication result.
  @override
  Future<Sub2ApiLoginResult> register(
    Sub2ApiRegistrationRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final result = await _requestExecutor.publicRequest<Sub2ApiLoginResult>(
      send: (cancelToken, options, authorization) => _service.register(
        Sub2ApiRegistrationRequestDto.fromPublic(request).toJson(),
        cancelToken,
        options,
        authorization,
      ),
      decode: _decodeLogin,
      requestOptions: requestOptions,
    );
    await _persistAuthenticatedResult(result);
    return result;
  }

  Future<Sub2ApiSession> _refreshSession(
    Sub2ApiSession current, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final refreshToken = current.refreshToken;
    if (refreshToken == null) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.unauthorized,
        code: 'auth.login_required',
        retryable: false,
      );
    }
    final tokens = await _requestExecutor.publicRequest<Sub2ApiRefreshedTokens>(
      send: (cancelToken, options, authorization) => _service.refresh(
        Sub2ApiRefreshRequestDto.fromPublic(refreshToken).toJson(),
        cancelToken,
        options,
        authorization,
      ),
      decode: _decodeRefresh,
      requestOptions: requestOptions,
    );
    return Sub2ApiSession(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
      scope: current.scope,
      expiresAt: DateTime.now().add(tokens.expiresIn),
    );
  }

  Future<void> _persistAuthenticatedResult(Sub2ApiLoginResult result) async {
    if (result case Sub2ApiAuthenticated(:final session)) {
      await _sessions.replace(session);
    }
  }

  Sub2ApiLoginResult _decodeLogin(Object? data) {
    try {
      return Sub2ApiLoginResponseDto.fromJson(
        _objectMap(data),
      ).toPublicModel(scope: _scope);
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_login_response',
        retryable: false,
      );
    }
  }

  static Sub2ApiRefreshedTokens _decodeRefresh(Object? data) {
    try {
      return Sub2ApiRefreshResponseDto.fromJson(
        _objectMap(data),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_refresh_response',
        retryable: false,
      );
    }
  }
}

Map<String, Object?> _objectMap(Object? value) {
  if (value is! Map) {
    throw const Sub2ApiException(
      kind: Sub2ApiFailureKind.protocol,
      code: 'protocol.invalid_login_response',
      retryable: false,
    );
  }
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_login_response',
        retryable: false,
      );
    }
    result[entry.key as String] = entry.value;
  }
  return result;
}
