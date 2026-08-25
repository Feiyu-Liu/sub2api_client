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

/// Internal execution seam that owns envelope, error, deadline, and refresh.
abstract interface class Sub2ApiRequestExecutor {
  Future<T> publicRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<T> protectedRequest<T>({
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
}
