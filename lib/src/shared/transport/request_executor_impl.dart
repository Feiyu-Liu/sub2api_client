import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../configuration/sub2api_configuration.dart';
import '../errors/sub2api_exception.dart';
import '../request/sub2api_request_options.dart';
import '../serialization/response_decoder.dart';
import '../session/session_coordinator.dart';
import '../session/sub2api_session.dart';
import 'request_executor.dart';

typedef Sub2ApiRefreshSession =
    Future<Sub2ApiSession> Function(Sub2ApiSession current);

final class Sub2ApiRequestExecutorImpl implements Sub2ApiRequestExecutor {
  Sub2ApiRequestExecutorImpl({
    required Sub2ApiConfiguration configuration,
    required Sub2ApiSessionCoordinator sessions,
    required Sub2ApiRefreshSession refreshSession,
    Sub2ApiResponseDecoder decoder = const Sub2ApiResponseDecoder(),
  }) : _configuration = configuration,
       _sessions = sessions,
       _refreshSession = refreshSession,
       _decoder = decoder;

  final Sub2ApiConfiguration _configuration;
  final Sub2ApiResponseDecoder _decoder;
  final Sub2ApiRefreshSession _refreshSession;
  final Sub2ApiSessionCoordinator _sessions;

  bool _closed = false;

  @override
  Future<T> publicRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    _ensureOpen();
    final control = _RequestControl(
      configuration: _configuration,
      requestOptions: requestOptions,
    );
    return _attempt(control, send, decode, authorization: null);
  }

  @override
  Future<T> protectedRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    _ensureOpen();
    final control = _RequestControl(
      configuration: _configuration,
      requestOptions: requestOptions,
    );
    final snapshot = await control.waitFor(_sessions.snapshot());
    if (snapshot == null) {
      throw _notAuthenticated;
    }
    try {
      return await _attempt(
        control,
        send,
        decode,
        authorization: _authorization(snapshot.session),
      );
    } on Sub2ApiException catch (error) {
      if (error.kind != Sub2ApiFailureKind.unauthorized) {
        rethrow;
      }
    }

    if (!_sessions.isCurrent(snapshot)) {
      throw _notAuthenticated;
    }
    if (!snapshot.session.isRefreshable) {
      await _sessions.clearIfCurrent(snapshot);
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.unauthorized,
        code: 'auth.login_required',
        retryable: false,
      );
    }

    late final Sub2ApiSession refreshed;
    try {
      final sharedRefresh = _sessions.refresh(
        snapshot,
        () => _refreshSession(snapshot.session),
      );
      refreshed = await control.waitFor(sharedRefresh);
    } on Sub2ApiException catch (error) {
      if (_decoder.isSessionInvalid(error)) {
        await _sessions.clearIfCurrent(snapshot);
      }
      rethrow;
    }

    final replaySnapshot = await control.waitFor(_sessions.snapshot());
    if (replaySnapshot == null ||
        !identical(replaySnapshot.session, refreshed)) {
      throw _notAuthenticated;
    }
    try {
      return await _attempt(
        control,
        send,
        decode,
        authorization: _authorization(refreshed),
      );
    } on Sub2ApiException catch (error) {
      if (error.kind == Sub2ApiFailureKind.unauthorized) {
        await _sessions.clearIfCurrent(replaySnapshot);
      }
      rethrow;
    }
  }

  @override
  Future<T> protectedNonReplayableRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    _ensureOpen();
    final control = _RequestControl(
      configuration: _configuration,
      requestOptions: requestOptions,
    );
    final snapshot = await control.waitFor(_sessions.snapshot());
    if (snapshot == null) {
      throw _notAuthenticated;
    }
    return _attempt(
      control,
      send,
      decode,
      authorization: _authorization(snapshot.session),
    );
  }

  void close() {
    _closed = true;
  }

  Future<T> _attempt<T>(
    _RequestControl control,
    Sub2ApiWireCall send,
    T Function(Object? data) decode, {
    required String? authorization,
  }) async {
    try {
      final response = await control.execute(
        (cancelToken, options) => send(cancelToken, options, authorization),
      );
      return _decoder.decodeSuccess(response, decode);
    } on DioException catch (error) {
      throw _decoder.decodeDioException(error);
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.unknown,
        code: 'unknown.client',
        retryable: false,
      );
    }
  }

  String _authorization(Sub2ApiSession session) =>
      'Bearer ${session.accessToken.reveal()}';

  void _ensureOpen() {
    if (_closed) {
      throw _closedException;
    }
  }

  static const _closedException = Sub2ApiException(
    kind: Sub2ApiFailureKind.unknown,
    code: 'client.closed',
    retryable: false,
  );

  static const _notAuthenticated = Sub2ApiException(
    kind: Sub2ApiFailureKind.unauthorized,
    code: 'auth.login_required',
    retryable: false,
  );
}

final class _RequestControl {
  _RequestControl({
    required Sub2ApiConfiguration configuration,
    required Sub2ApiRequestOptions? requestOptions,
  }) : _configuration = configuration,
       _cancellationToken = requestOptions?.cancellationToken,
       _budget = requestOptions?.timeout ?? configuration.totalRequestTimeout,
       _stopwatch = Stopwatch()..start();

  final Duration _budget;
  final Sub2ApiCancellationToken? _cancellationToken;
  final Sub2ApiConfiguration _configuration;
  final Stopwatch _stopwatch;

  Duration get _remaining => _budget - _stopwatch.elapsed;

  Future<HttpResponse<Object?>> execute(
    Future<HttpResponse<Object?>> Function(
      CancelToken cancelToken,
      Options options,
    )
    send,
  ) async {
    _throwIfUnavailable();
    final remaining = _remaining;
    final cancelToken = CancelToken();
    final timer = Timer(remaining, () {
      cancelToken.cancel(_timeoutException);
    });
    unawaited(
      _cancellationToken?.whenCancelled.then((_) {
        cancelToken.cancel(_cancelledException);
      }),
    );
    try {
      return await send(
        cancelToken,
        Options(
          sendTimeout: _minimum(_configuration.sendTimeout, remaining),
          receiveTimeout: _minimum(_configuration.receiveTimeout, remaining),
        ),
      );
    } finally {
      timer.cancel();
    }
  }

  Future<T> waitFor<T>(Future<T> operation) {
    _throwIfUnavailable();
    final remaining = _remaining;
    final timeout = Future<T>.delayed(remaining, () => throw _timeoutException);
    final cancellation = _cancellationToken?.whenCancelled.then<T>(
      (_) => throw _cancelledException,
    );
    return Future.any<T>([operation, timeout, ?cancellation]);
  }

  void _throwIfUnavailable() {
    if (_cancellationToken?.isCancelled ?? false) {
      throw _cancelledException;
    }
    if (_remaining <= Duration.zero) {
      throw _timeoutException;
    }
  }

  static Duration _minimum(Duration left, Duration right) =>
      left <= right ? left : right;

  static const _cancelledException = Sub2ApiException(
    kind: Sub2ApiFailureKind.cancelled,
    code: 'request.cancelled',
    retryable: false,
  );

  static const _timeoutException = Sub2ApiException(
    kind: Sub2ApiFailureKind.timeout,
    code: 'request.timeout',
    retryable: true,
  );
}
