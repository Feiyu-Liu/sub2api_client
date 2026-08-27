import 'dart:io';

import 'package:sub2api_client/sub2api_admin_client.dart';
import 'package:sub2api_client/sub2api_ops_client.dart';
import 'package:test/test.dart';

void main() {
  test('Admin and Ops expose isolated typed management facades', () {
    final admin = Sub2ApiAdminClient(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://sub2api.test'),
      ),
      sessionStore: Sub2ApiMemorySessionStore(),
    );
    final ops = Sub2ApiOpsClient(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://sub2api.test'),
      ),
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('public-surface-key-sentinel'),
      ),
    );
    addTearDown(admin.close);
    addTearDown(ops.close);

    final Sub2ApiAdminDashboardClient adminDashboard = admin.dashboard;
    final Sub2ApiAdminDashboardClient opsDashboard = ops.dashboard;
    final Sub2ApiAdminUsersClient adminUsers = admin.users;
    final Sub2ApiAdminUsersClient opsUsers = ops.users;
    final Sub2ApiAdminAccountsClient adminAccounts = admin.accounts;
    final Sub2ApiAdminAccountsClient opsAccounts = ops.accounts;
    final Sub2ApiAdminProxiesClient adminProxies = admin.proxies;
    final Sub2ApiAdminProxiesClient opsProxies = ops.proxies;
    final Future<Sub2ApiAdminProxyDataExport> Function({
      Sub2ApiAdminProxyDataExportQuery query,
      Sub2ApiRequestOptions? requestOptions,
    })
    exportProxyData = adminProxies.exportData;
    final Future<Sub2ApiAdminProxyDataImportResult> Function(
      Sub2ApiAdminProxyDataArchive, {
      Sub2ApiRequestOptions? requestOptions,
    })
    importProxyData = opsProxies.importData;
    final Future<Sub2ApiAdminUpdateApiKeyResult> Function(
      int,
      Sub2ApiAdminUpdateApiKeyRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    updateAdminApiKey = adminUsers.updateApiKey;
    final Future<List<Sub2ApiAdminSubscription>> Function(
      int, {
      Sub2ApiRequestOptions? requestOptions,
    })
    getUserSubscriptions = adminUsers.getSubscriptions;
    final Future<Sub2ApiAdminIdentity> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    bootstrap = admin.bootstrap;
    final Future<Sub2ApiAdminDashboardStats> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    adminStats = adminDashboard.getStats;
    final Future<Sub2ApiAdminDashboardStats> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    opsStats = opsDashboard.getStats;
    final Future<Sub2ApiAdminAccountDataExport> Function({
      Sub2ApiAdminAccountDataExportQuery query,
      Sub2ApiRequestOptions? requestOptions,
    })
    exportAccountData = adminAccounts.exportData;
    final Future<Sub2ApiAdminAccountDataImportResult> Function(
      Sub2ApiAdminAccountDataImportRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    importAccountData = adminAccounts.importData;
    final Future<Sub2ApiAdminCodexSessionImportResult> Function(
      Sub2ApiAdminCodexSessionImportRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    importCodexSessions = adminAccounts.importCodexSessions;

    expect(<Object>[
      bootstrap,
      adminStats,
      opsStats,
      adminUsers,
      opsUsers,
      adminAccounts,
      opsAccounts,
      exportAccountData,
      importAccountData,
      importCodexSessions,
      adminProxies,
      opsProxies,
      exportProxyData,
      importProxyData,
      updateAdminApiKey,
      getUserSubscriptions,
    ], everyElement(isNotNull));
  });

  test(
    'privileged entrypoints do not export transport implementation seams',
    () {
      for (final path in <String>[
        'lib/sub2api_admin_client.dart',
        'lib/sub2api_ops_client.dart',
      ]) {
        final source = File(path).readAsStringSync();
        expect(source, isNot(contains('Dio')));
        expect(source, isNot(contains('Retrofit')));
        expect(source, isNot(contains('createSub2Api')));
      }
    },
  );
}
