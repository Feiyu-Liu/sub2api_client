import 'package:dio/dio.dart';

import '../auth/sub2api_authentication_client.dart';
import '../shared/configuration/sub2api_configuration.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/session/session_coordinator.dart';
import '../shared/session/sub2api_session.dart';
import '../shared/transport/request_executor_impl.dart';
import 'sub2api_admin_accounts_client.dart';
import 'sub2api_admin_antigravity_oauth_client.dart';
import 'sub2api_admin_audit_logs_client.dart';
import 'sub2api_admin_compliance_client.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_dashboard_client.dart';
import 'sub2api_admin_groups_client.dart';
import 'sub2api_admin_models.dart';
import 'sub2api_admin_proxies_client.dart';
import 'sub2api_admin_role_executor.dart';
import 'sub2api_admin_users_client.dart';

/// Administrator-JWT facade for the Sub2API management plane.
final class Sub2ApiAdminClient {
  factory Sub2ApiAdminClient({
    required Sub2ApiConfiguration configuration,
    required Sub2ApiSessionStore sessionStore,
  }) {
    final dio = _createDio(configuration);
    return _create(
      configuration: configuration,
      sessionStore: sessionStore,
      dio: dio,
      ownsDio: true,
    );
  }

  Sub2ApiAdminClient._({
    required this.accounts,
    required this.antigravityOAuth,
    required this.auditLogs,
    required this.compliance,
    required this.dashboard,
    required this.groups,
    required this.proxies,
    required this.users,
    required Sub2ApiAdminRoleExecutor adminExecutor,
    required Dio dio,
    required Sub2ApiRequestExecutorImpl executor,
    required bool ownsDio,
    required Sub2ApiSessionCoordinator sessions,
  }) : _adminExecutor = adminExecutor,
       _dio = dio,
       _executor = executor,
       _ownsDio = ownsDio,
       _sessions = sessions;

  final Sub2ApiAdminAccountsClient accounts;
  final Sub2ApiAdminAntigravityOAuthClient antigravityOAuth;
  final Sub2ApiAdminAuditLogsClient auditLogs;
  final Sub2ApiAdminComplianceClient compliance;
  final Sub2ApiAdminDashboardClient dashboard;
  final Sub2ApiAdminGroupsClient groups;
  final Sub2ApiAdminProxiesClient proxies;
  final Sub2ApiAdminUsersClient users;
  final Sub2ApiAdminRoleExecutor _adminExecutor;
  final Dio _dio;
  final Sub2ApiRequestExecutorImpl _executor;
  final bool _ownsDio;
  final Sub2ApiSessionCoordinator _sessions;
  bool _closed = false;

  Future<Sub2ApiAdminIdentity> bootstrap({
    Sub2ApiRequestOptions? requestOptions,
  }) => _adminExecutor.bootstrap(requestOptions: requestOptions);

  void close() {
    if (_closed) return;
    _closed = true;
    _executor.close();
    _sessions.close();
    if (_ownsDio) _dio.close(force: true);
  }
}

Sub2ApiAdminClient _create({
  required Sub2ApiConfiguration configuration,
  required Sub2ApiSessionStore sessionStore,
  required Dio dio,
  required bool ownsDio,
}) {
  final sessions = Sub2ApiSessionCoordinator(sessionStore);
  late final Sub2ApiAuthenticationClient authentication;
  final executor = Sub2ApiRequestExecutorImpl(
    configuration: configuration,
    sessions: sessions,
    refreshSession: (current) =>
        refreshSub2ApiAuthenticationSession(authentication, current),
  );
  authentication = createSub2ApiAuthenticationClient(
    configuration: configuration,
    dio: dio,
    requestExecutor: executor,
    sessions: sessions,
  );
  final adminExecutor = Sub2ApiAdminRoleExecutor(
    authentication: authentication,
    delegate: executor,
  );
  return Sub2ApiAdminClient._(
    accounts: createSub2ApiAdminAccountsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      streamExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    antigravityOAuth: createSub2ApiAdminAntigravityOAuthClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    auditLogs: createSub2ApiAdminAuditLogsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    compliance: createSub2ApiAdminComplianceClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    dashboard: createSub2ApiAdminDashboardClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    groups: createSub2ApiAdminGroupsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    proxies: createSub2ApiAdminProxiesClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    users: createSub2ApiAdminUsersClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    adminExecutor: adminExecutor,
    dio: dio,
    executor: executor,
    ownsDio: ownsDio,
    sessions: sessions,
  );
}

Dio _createDio(Sub2ApiConfiguration configuration) => Dio(
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

Sub2ApiAdminClient createSub2ApiAdminClientForTesting({
  required Sub2ApiConfiguration configuration,
  required Sub2ApiSessionStore sessionStore,
  required Dio dio,
}) => _create(
  configuration: configuration,
  sessionStore: sessionStore,
  dio: dio,
  ownsDio: false,
);
