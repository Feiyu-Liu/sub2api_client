import 'package:dio/dio.dart';

import '../shared/configuration/sub2api_configuration.dart';
import 'sub2api_admin_accounts_client.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_dashboard_client.dart';
import 'sub2api_admin_groups_client.dart';
import 'sub2api_admin_proxies_client.dart';
import 'sub2api_admin_users_client.dart';
import 'sub2api_ops_credentials.dart';
import 'sub2api_ops_request_executor.dart';

/// Admin API Key facade for headless operations automation.
final class Sub2ApiOpsClient {
  factory Sub2ApiOpsClient({
    required Sub2ApiConfiguration configuration,
    required Sub2ApiAdminApiKeyProvider credentialProvider,
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
    return _create(
      configuration: configuration,
      credentialProvider: credentialProvider,
      dio: dio,
      ownsDio: true,
    );
  }

  Sub2ApiOpsClient._({
    required this.accounts,
    required this.dashboard,
    required this.groups,
    required this.proxies,
    required this.users,
    required Dio dio,
    required Sub2ApiOpsRequestExecutor executor,
    required bool ownsDio,
  }) : _dio = dio,
       _executor = executor,
       _ownsDio = ownsDio;

  final Sub2ApiAdminAccountsClient accounts;
  final Sub2ApiAdminDashboardClient dashboard;
  final Sub2ApiAdminGroupsClient groups;
  final Sub2ApiAdminProxiesClient proxies;
  final Sub2ApiAdminUsersClient users;
  final Dio _dio;
  final Sub2ApiOpsRequestExecutor _executor;
  final bool _ownsDio;
  bool _closed = false;

  void close() {
    if (_closed) return;
    _closed = true;
    _executor.close();
    if (_ownsDio) _dio.close(force: true);
  }
}

Sub2ApiOpsClient _create({
  required Sub2ApiConfiguration configuration,
  required Sub2ApiAdminApiKeyProvider credentialProvider,
  required Dio dio,
  required bool ownsDio,
}) {
  final executor = Sub2ApiOpsRequestExecutor(
    configuration: configuration,
    credentialProvider: credentialProvider,
  );
  return Sub2ApiOpsClient._(
    accounts: createSub2ApiAdminAccountsClient(
      dio: dio,
      requestExecutor: executor,
      streamExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    dashboard: createSub2ApiAdminDashboardClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    groups: createSub2ApiAdminGroupsClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    proxies: createSub2ApiAdminProxiesClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    users: createSub2ApiAdminUsersClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    dio: dio,
    executor: executor,
    ownsDio: ownsDio,
  );
}

Sub2ApiOpsClient createSub2ApiOpsClientForTesting({
  required Sub2ApiConfiguration configuration,
  required Sub2ApiAdminApiKeyProvider credentialProvider,
  required Dio dio,
}) => _create(
  configuration: configuration,
  credentialProvider: credentialProvider,
  dio: dio,
  ownsDio: false,
);
