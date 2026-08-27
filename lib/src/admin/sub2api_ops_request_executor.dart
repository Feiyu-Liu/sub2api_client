import 'dart:async';

import 'package:dio/dio.dart';

import '../shared/configuration/sub2api_configuration.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/serialization/response_decoder.dart';
import '../shared/transport/request_executor.dart';
import '../shared/transport/stream_error_decoder.dart';
import 'sub2api_ops_credentials.dart';

/// Admin API Key executor with no JWT, refresh, or credential fallback path.
final class Sub2ApiOpsRequestExecutor
    implements
        Sub2ApiRequestExecutor,
        Sub2ApiProtectedRawMutationExecutor,
        Sub2ApiProtectedStreamExecutor {
  Sub2ApiOpsRequestExecutor({
    required Sub2ApiConfiguration configuration,
    required Sub2ApiAdminApiKeyProvider credentialProvider,
    Sub2ApiResponseDecoder decoder = const Sub2ApiResponseDecoder(),
  }) : _configuration = configuration,
       _credentialProvider = credentialProvider,
       _decoder = decoder;

  final Sub2ApiConfiguration _configuration;
  final Sub2ApiAdminApiKeyProvider _credentialProvider;
  final Sub2ApiResponseDecoder _decoder;
  bool _closed = false;

  void close() => _closed = true;

  @override
  Future<T> protectedRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => _execute(send: send, decode: decode, requestOptions: requestOptions);

  @override
  Future<T> protectedRequestAllowingRawSuccess<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => _execute(
    send: send,
    decode: decode,
    requestOptions: requestOptions,
    allowRawSuccess: true,
  );

  @override
  Future<T> protectedNonReplayableRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => _execute(send: send, decode: decode, requestOptions: requestOptions);

  @override
  Future<T> protectedNonReplayableRequestAllowingRawSuccess<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => _execute(
    send: send,
    decode: decode,
    requestOptions: requestOptions,
    allowRawSuccess: true,
  );

  @override
  Future<Response<ResponseBody>> protectedNonReplayableStreamRequest({
    required Sub2ApiWireStreamCall send,
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    if (_closed) throw _closedFailure;
    final key = await _credentialProvider.load();
    final value = key?.reveal().trim();
    if (value == null || value.isEmpty) throw _missingCredential;
    final timeout =
        requestOptions?.timeout ?? _configuration.totalRequestTimeout;
    final cancelToken = CancelToken();
    final timer = Timer(timeout, () => cancelToken.cancel(_timeoutFailure));
    unawaited(
      requestOptions?.cancellationToken?.whenCancelled.then((_) {
        cancelToken.cancel(_cancelledFailure);
      }),
    );
    try {
      return await send(
        cancelToken,
        Options(
          sendTimeout: _minimum(_configuration.sendTimeout, timeout),
          receiveTimeout: _minimum(_configuration.receiveTimeout, timeout),
          responseType: ResponseType.stream,
        ),
        value,
      );
    } on DioException catch (error) {
      throw await decodeSub2ApiStreamDioException(_decoder, error);
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw _unknownFailure;
    } finally {
      timer.cancel();
    }
  }

  @override
  Future<void> protectedNonReplayableNoContentRequest({
    required Sub2ApiWireCall send,
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    await _execute<void>(
      send: send,
      decodeNoContent: true,
      decode: (_) {},
      requestOptions: requestOptions,
    );
  }

  @override
  Future<T> optionalAuthenticatedRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => protectedRequest(
    send: send,
    decode: decode,
    requestOptions: requestOptions,
  );

  @override
  Future<T> publicRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => throw UnsupportedError('Ops clients do not send public requests.');

  @override
  Future<T> publicRequestAllowingRawSuccess<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => throw UnsupportedError('Ops clients do not send public requests.');

  Future<T> _execute<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    required Sub2ApiRequestOptions? requestOptions,
    bool decodeNoContent = false,
    bool allowRawSuccess = false,
  }) async {
    if (_closed) throw _closedFailure;
    final key = await _credentialProvider.load();
    final value = key?.reveal().trim();
    if (value == null || value.isEmpty) throw _missingCredential;
    final timeout =
        requestOptions?.timeout ?? _configuration.totalRequestTimeout;
    final cancelToken = CancelToken();
    final timer = Timer(timeout, () => cancelToken.cancel(_timeoutFailure));
    unawaited(
      requestOptions?.cancellationToken?.whenCancelled.then((_) {
        cancelToken.cancel(_cancelledFailure);
      }),
    );
    try {
      final response = await send(
        cancelToken,
        Options(
          sendTimeout: _minimum(_configuration.sendTimeout, timeout),
          receiveTimeout: _minimum(_configuration.receiveTimeout, timeout),
        ),
        value,
      );
      if (decodeNoContent) {
        _decoder.decodeNoContent(response);
        return null as T;
      }
      return allowRawSuccess
          ? _decoder.decodeSuccessOrRaw(response, decode)
          : _decoder.decodeSuccess(response, decode);
    } on DioException catch (error) {
      throw _decoder.decodeDioException(error);
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw _unknownFailure;
    } finally {
      timer.cancel();
    }
  }

  static Duration _minimum(Duration left, Duration right) =>
      left <= right ? left : right;
}

const _missingCredential = Sub2ApiException(
  kind: Sub2ApiFailureKind.unauthorized,
  code: 'auth.admin_api_key_required',
  retryable: false,
);
const _closedFailure = Sub2ApiException(
  kind: Sub2ApiFailureKind.unknown,
  code: 'client.closed',
  retryable: false,
);
const _timeoutFailure = Sub2ApiException(
  kind: Sub2ApiFailureKind.timeout,
  code: 'request.timeout',
  retryable: true,
);
const _cancelledFailure = Sub2ApiException(
  kind: Sub2ApiFailureKind.cancelled,
  code: 'request.cancelled',
  retryable: false,
);
const _unknownFailure = Sub2ApiException(
  kind: Sub2ApiFailureKind.unknown,
  code: 'unknown.client',
  retryable: false,
);
