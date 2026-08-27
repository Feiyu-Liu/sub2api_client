import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../request/sub2api_request_options.dart';

/// Internal Retrofit call shape shared by all feature clients.
typedef Sub2ApiWireCall =
    Future<HttpResponse<Object?>> Function(
      CancelToken cancelToken,
      Options options,
      String? authorization,
    );

typedef Sub2ApiWireStreamCall =
    Future<Response<ResponseBody>> Function(
      CancelToken cancelToken,
      Options options,
      String? authorization,
    );

abstract interface class Sub2ApiProtectedStreamExecutor {
  Future<Response<ResponseBody>> protectedNonReplayableStreamRequest({
    required Sub2ApiWireStreamCall send,
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Internal seam for raw-success mutations that must never be replayed.
abstract interface class Sub2ApiProtectedRawMutationExecutor {
  Future<T> protectedNonReplayableRequestAllowingRawSuccess<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Internal execution seam that owns envelope, error, deadline, and refresh.
abstract interface class Sub2ApiRequestExecutor {
  Future<T> publicRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Sends a public endpoint whose fixed contract permits envelope or raw 200.
  Future<T> publicRequestAllowingRawSuccess<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Uses the current JWT when present, otherwise sends an anonymous request.
  ///
  /// An authenticated 401 follows the normal refresh policy and never silently
  /// downgrades to anonymous visibility.
  Future<T> optionalAuthenticatedRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<T> protectedRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Sends a protected endpoint whose fixed contract permits envelope or raw
  /// HTTP 200 success payloads.
  Future<T> protectedRequestAllowingRawSuccess<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Sends a protected operation that must never be replayed automatically.
  Future<T> protectedNonReplayableRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Sends an authenticated non-replayable operation returning empty HTTP 204.
  Future<void> protectedNonReplayableNoContentRequest({
    required Sub2ApiWireCall send,
    Sub2ApiRequestOptions? requestOptions,
  });
}
