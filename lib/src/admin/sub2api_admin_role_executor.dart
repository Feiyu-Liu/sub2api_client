import '../auth/sub2api_authentication_client.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_models.dart';

/// JWT executor wrapper that proves the current user is an administrator.
final class Sub2ApiAdminRoleExecutor implements Sub2ApiRequestExecutor {
  Sub2ApiAdminRoleExecutor({
    required Sub2ApiAuthenticationClient authentication,
    required Sub2ApiRequestExecutor delegate,
  }) : _authentication = authentication,
       _delegate = delegate;

  final Sub2ApiAuthenticationClient _authentication;
  final Sub2ApiRequestExecutor _delegate;

  Future<Sub2ApiAdminIdentity> bootstrap({
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final current = await _authentication.getCurrentUser(
      requestOptions: requestOptions,
    );
    if (current.role != 'admin') throw _adminRequired;
    return Sub2ApiAdminIdentity(currentUser: current);
  }

  @override
  Future<T> protectedRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    await bootstrap(requestOptions: requestOptions);
    return _delegate.protectedRequest(
      send: send,
      decode: decode,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<T> protectedNonReplayableRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    await bootstrap(requestOptions: requestOptions);
    return _delegate.protectedNonReplayableRequest(
      send: send,
      decode: decode,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<void> protectedNonReplayableNoContentRequest({
    required Sub2ApiWireCall send,
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    await bootstrap(requestOptions: requestOptions);
    return _delegate.protectedNonReplayableNoContentRequest(
      send: send,
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
  }) => throw UnsupportedError('Admin clients do not send public requests.');

  @override
  Future<T> publicRequestAllowingRawSuccess<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => throw UnsupportedError('Admin clients do not send public requests.');
}

const _adminRequired = Sub2ApiException(
  kind: Sub2ApiFailureKind.forbidden,
  code: 'auth.admin_required',
  retryable: false,
);
