import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../shared/configuration/sub2api_configuration.dart';
import '../shared/contract/sub2api_stream_route.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_ops_qps_models.dart';

typedef Sub2ApiAdminOpsCredentialLoader =
    Future<String?> Function(Sub2ApiRequestOptions? requestOptions);

abstract interface class Sub2ApiAdminOpsQpsClient {
  Stream<Sub2ApiAdminOpsQpsUpdate> watch({
    Sub2ApiRequestOptions? requestOptions,
  });

  void close();
}

Sub2ApiAdminOpsQpsClient createSub2ApiAdminOpsQpsClient({
  required Sub2ApiConfiguration configuration,
  required Sub2ApiAdminCredentialMode credentialMode,
  required Sub2ApiAdminOpsCredentialLoader credentialLoader,
}) => _Client(configuration, credentialMode, credentialLoader);

final class _Client implements Sub2ApiAdminOpsQpsClient {
  _Client(this._configuration, this._mode, this._credentialLoader);

  final Sub2ApiConfiguration _configuration;
  final Sub2ApiAdminCredentialMode _mode;
  final Sub2ApiAdminOpsCredentialLoader _credentialLoader;
  final Set<WebSocket> _sockets = <WebSocket>{};
  bool _closed = false;

  @override
  @Sub2ApiStreamRoute('GET', '/api/v1/admin/ops/ws/qps')
  Stream<Sub2ApiAdminOpsQpsUpdate> watch({
    Sub2ApiRequestOptions? requestOptions,
  }) async* {
    if (_closed) throw _closedFailure;
    if (requestOptions?.cancellationToken?.isCancelled ?? false) {
      throw _cancelledFailure;
    }
    final credential = (await _credentialLoader(requestOptions))?.trim();
    if (credential == null || credential.isEmpty) {
      throw _mode == Sub2ApiAdminCredentialMode.jwt
          ? _notAuthenticated
          : _missingApiKey;
    }
    final timeout =
        requestOptions?.timeout ?? _configuration.totalRequestTimeout;
    final uri = _webSocketUri(_configuration.origin);
    late final WebSocket socket;
    try {
      socket = await WebSocket.connect(
        uri.toString(),
        headers: <String, Object?>{
          'Origin': _originHeader(_configuration.origin),
          if (_mode == Sub2ApiAdminCredentialMode.jwt)
            'Authorization': credential,
          if (_mode == Sub2ApiAdminCredentialMode.apiKey)
            'x-api-key': credential,
        },
        protocols: const <String>['sub2api-admin'],
        compression: CompressionOptions.compressionOff,
      ).timeout(timeout);
    } on TimeoutException {
      throw _timeoutFailure;
    } on SocketException {
      throw _networkFailure;
    } on WebSocketException {
      throw _handshakeFailure;
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw _unknownFailure;
    }
    if (_closed) {
      await socket.close(WebSocketStatus.goingAway, 'client_closed');
      throw _closedFailure;
    }
    _sockets.add(socket);
    final cancellation = requestOptions?.cancellationToken;
    unawaited(
      cancellation?.whenCancelled.then((_) {
        unawaited(socket.close(WebSocketStatus.normalClosure, 'cancelled'));
      }),
    );
    try {
      await for (final frame in socket) {
        if (cancellation?.isCancelled ?? false) throw _cancelledFailure;
        yield _decode(frame);
      }
      if (cancellation?.isCancelled ?? false) throw _cancelledFailure;
      if (socket.closeCode == 4001) throw _realtimeDisabled;
      if (socket.closeCode != null &&
          socket.closeCode != WebSocketStatus.normalClosure &&
          socket.closeCode != WebSocketStatus.goingAway) {
        throw _closedUnexpectedly;
      }
    } on Sub2ApiException {
      rethrow;
    } on FormatException {
      throw _invalidPayload;
    } on WebSocketException {
      throw _closedUnexpectedly;
    } on Object {
      throw _unknownFailure;
    } finally {
      _sockets.remove(socket);
      await socket.close();
    }
  }

  @override
  void close() {
    if (_closed) return;
    _closed = true;
    final sockets = List<WebSocket>.of(_sockets);
    _sockets.clear();
    for (final socket in sockets) {
      unawaited(socket.close(WebSocketStatus.goingAway, 'client_closed'));
    }
  }
}

Sub2ApiAdminOpsQpsUpdate _decode(Object? frame) {
  final Object? decoded;
  if (frame is String) {
    decoded = jsonDecode(frame);
  } else if (frame is List<int>) {
    decoded = jsonDecode(utf8.decode(frame));
  } else {
    throw const FormatException();
  }
  final source = _object(decoded);
  if (_requiredText(source['type']) != 'qps_update') {
    throw const FormatException();
  }
  final data = _object(source['data']);
  return Sub2ApiAdminOpsQpsUpdate(
    timestamp: DateTime.parse(_requiredText(source['timestamp'])).toUtc(),
    qps: Sub2ApiDecimal.fromJson(data['qps']),
    tps: Sub2ApiDecimal.fromJson(data['tps']),
    requestCount: _nonNegative(data['request_count']),
  );
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw const FormatException();
    result[entry.key as String] = entry.value;
  }
  return result;
}

String _requiredText(Object? value) {
  if (value is! String || value.trim().isEmpty) {
    throw const FormatException();
  }
  return value;
}

int _nonNegative(Object? value) {
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

Uri _webSocketUri(Uri origin) => origin.replace(
  scheme: switch (origin.scheme) {
    'http' => 'ws',
    'https' => 'wss',
    _ => throw _invalidOrigin,
  },
  path: '/api/v1/admin/ops/ws/qps',
  query: null,
  fragment: null,
);

String _originHeader(Uri origin) =>
    origin.replace(path: '', query: null, fragment: null).toString();

const _notAuthenticated = Sub2ApiException(
  kind: Sub2ApiFailureKind.unauthorized,
  code: 'auth.login_required',
  retryable: false,
);
const _missingApiKey = Sub2ApiException(
  kind: Sub2ApiFailureKind.unauthorized,
  code: 'auth.admin_api_key_required',
  retryable: false,
);
const _invalidOrigin = Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: 'config.invalid_websocket_origin',
  retryable: false,
);
const _closedFailure = Sub2ApiException(
  kind: Sub2ApiFailureKind.unknown,
  code: 'client.closed',
  retryable: false,
);
const _cancelledFailure = Sub2ApiException(
  kind: Sub2ApiFailureKind.cancelled,
  code: 'request.cancelled',
  retryable: false,
);
const _timeoutFailure = Sub2ApiException(
  kind: Sub2ApiFailureKind.timeout,
  code: 'request.timeout',
  retryable: true,
);
const _networkFailure = Sub2ApiException(
  kind: Sub2ApiFailureKind.network,
  code: 'transport.websocket_network',
  retryable: true,
);
const _handshakeFailure = Sub2ApiException(
  kind: Sub2ApiFailureKind.network,
  code: 'transport.websocket_handshake_failed',
  retryable: false,
);
const _realtimeDisabled = Sub2ApiException(
  kind: Sub2ApiFailureKind.server,
  code: 'admin.ops.realtime_disabled',
  retryable: false,
);
const _closedUnexpectedly = Sub2ApiException(
  kind: Sub2ApiFailureKind.network,
  code: 'transport.websocket_closed',
  retryable: true,
);
const _invalidPayload = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_ops_qps_update',
  retryable: false,
);
const _unknownFailure = Sub2ApiException(
  kind: Sub2ApiFailureKind.unknown,
  code: 'unknown.client',
  retryable: false,
);
