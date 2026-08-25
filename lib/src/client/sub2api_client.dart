import 'package:dio/dio.dart';

import '../auth/sub2api_authentication_client.dart';
import '../billing/sub2api_billing_client.dart';
import '../capability/sub2api_capability_client.dart';
import '../keys/sub2api_key_client.dart';
import '../shared/configuration/sub2api_configuration.dart';
import '../shared/session/session_coordinator.dart';
import '../shared/session/sub2api_session.dart';
import '../shared/transport/request_executor_impl.dart';
import '../usage/sub2api_usage_client.dart';
import '../user/sub2api_user_client.dart';

/// User-facing facade for the fixed Sub2API v0.1 contract.
final class Sub2ApiClient {
  /// Creates a client that owns its internal HTTP transport.
  factory Sub2ApiClient({
    required Sub2ApiConfiguration configuration,
    required Sub2ApiSessionStore sessionStore,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: configuration.origin.toString(),
        connectTimeout: configuration.connectTimeout,
        sendTimeout: configuration.sendTimeout,
        receiveTimeout: configuration.receiveTimeout,
        followRedirects: false,
        maxRedirects: 0,
        responseType: ResponseType.json,
        headers: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    return _createClient(
      configuration: configuration,
      sessionStore: sessionStore,
      dio: dio,
      ownsDio: true,
    );
  }

  Sub2ApiClient._({
    required this.auth,
    required this.billing,
    required this.capabilities,
    required Dio dio,
    required Sub2ApiRequestExecutorImpl executor,
    required this.keys,
    required bool ownsDio,
    required Sub2ApiSessionCoordinator sessions,
    required this.usage,
    required this.user,
  }) : _dio = dio,
       _executor = executor,
       _ownsDio = ownsDio,
       _sessions = sessions;

  /// Authentication and session lifecycle operations.
  final Sub2ApiAuthenticationClient auth;

  /// Payment configuration, plans, recharge, and order operations.
  final Sub2ApiBillingClient billing;

  /// Public server capability bootstrap.
  final Sub2ApiCapabilityClient capabilities;

  /// API/Installation Key operations.
  final Sub2ApiKeyClient keys;

  /// Usage records and aggregate statistics.
  final Sub2ApiUsageClient usage;

  /// Current-user profile operations.
  final Sub2ApiUserClient user;

  final Dio _dio;
  final Sub2ApiRequestExecutorImpl _executor;
  final bool _ownsDio;
  final Sub2ApiSessionCoordinator _sessions;
  bool _closed = false;

  /// Releases client-owned resources. Calling this method repeatedly is safe.
  void close() {
    if (_closed) {
      return;
    }
    _closed = true;
    _executor.close();
    _sessions.close();
    if (_ownsDio) {
      _dio.close(force: true);
    }
  }
}

Sub2ApiClient _createClient({
  required Sub2ApiConfiguration configuration,
  required Sub2ApiSessionStore sessionStore,
  required Dio dio,
  required bool ownsDio,
}) {
  final sessions = Sub2ApiSessionCoordinator(sessionStore);
  late final Sub2ApiAuthenticationClient auth;
  final executor = Sub2ApiRequestExecutorImpl(
    configuration: configuration,
    sessions: sessions,
    refreshSession: (current) =>
        refreshSub2ApiAuthenticationSession(auth, current),
  );
  auth = createSub2ApiAuthenticationClient(
    configuration: configuration,
    dio: dio,
    requestExecutor: executor,
    sessions: sessions,
  );
  return Sub2ApiClient._(
    auth: auth,
    billing: createSub2ApiBillingClient(requestExecutor: executor, dio: dio),
    capabilities: createSub2ApiCapabilityClient(
      dio: dio,
      requestExecutor: executor,
    ),
    dio: dio,
    executor: executor,
    keys: createSub2ApiKeyClient(dio: dio, requestExecutor: executor),
    ownsDio: ownsDio,
    sessions: sessions,
    usage: createSub2ApiUsageClient(requestExecutor: executor, dio: dio),
    user: createSub2ApiUserClient(dio: dio, requestExecutor: executor),
  );
}

/// Internal test seam. It is intentionally not exported by the public library.
Sub2ApiClient createSub2ApiClientForTesting({
  required Sub2ApiConfiguration configuration,
  required Sub2ApiSessionStore sessionStore,
  required Dio dio,
  bool ownsDio = false,
}) => _createClient(
  configuration: configuration,
  sessionStore: sessionStore,
  dio: dio,
  ownsDio: ownsDio,
);
