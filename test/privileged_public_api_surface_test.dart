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
    final Sub2ApiAdminAffiliatesClient adminAffiliates = admin.affiliates;
    final Sub2ApiAdminAffiliatesClient opsAffiliates = ops.affiliates;
    final Sub2ApiAdminAntigravityOAuthClient adminAntigravityOAuth =
        admin.antigravityOAuth;
    final Sub2ApiAdminAntigravityOAuthClient opsAntigravityOAuth =
        ops.antigravityOAuth;
    final Sub2ApiAdminAnnouncementsClient adminAnnouncements =
        admin.announcements;
    final Sub2ApiAdminAnnouncementsClient opsAnnouncements = ops.announcements;
    final Sub2ApiAdminAuditLogsClient adminAuditLogs = admin.auditLogs;
    final Sub2ApiAdminAuditLogsClient opsAuditLogs = ops.auditLogs;
    final Sub2ApiAdminChannelMonitorTemplatesClient adminMonitorTemplates =
        admin.channelMonitorTemplates;
    final Sub2ApiAdminChannelMonitorTemplatesClient opsMonitorTemplates =
        ops.channelMonitorTemplates;
    final Sub2ApiAdminChannelMonitorV2Client adminMonitorV2 =
        admin.channelMonitorV2;
    final Sub2ApiAdminChannelMonitorV2Client opsMonitorV2 =
        ops.channelMonitorV2;
    final Sub2ApiAdminChannelMonitorsClient adminMonitors =
        admin.channelMonitors;
    final Sub2ApiAdminChannelMonitorsClient opsMonitors = ops.channelMonitors;
    final Sub2ApiAdminChannelsClient adminChannels = admin.channels;
    final Sub2ApiAdminChannelsClient opsChannels = ops.channels;
    final Sub2ApiAdminCNProvidersClient adminCNProviders = admin.cnProviders;
    final Sub2ApiAdminCNProvidersClient opsCNProviders = ops.cnProviders;
    final Sub2ApiAdminComplianceClient adminCompliance = admin.compliance;
    final Sub2ApiAdminComplianceClient opsCompliance = ops.compliance;
    final Sub2ApiAdminGeminiOAuthClient adminGeminiOAuth = admin.geminiOAuth;
    final Sub2ApiAdminGeminiOAuthClient opsGeminiOAuth = ops.geminiOAuth;
    final Sub2ApiAdminErrorPassthroughClient adminErrorPassthrough =
        admin.errorPassthrough;
    final Sub2ApiAdminErrorPassthroughClient opsErrorPassthrough =
        ops.errorPassthrough;
    final Sub2ApiAdminOpenAIClient adminOpenAI = admin.openAI;
    final Sub2ApiAdminOpenAIClient opsOpenAI = ops.openAI;
    final Sub2ApiAdminPluginsClient adminPlugins = admin.plugins;
    final Sub2ApiAdminPluginsClient opsPlugins = ops.plugins;
    final Sub2ApiAdminProxiesClient adminProxies = admin.proxies;
    final Sub2ApiAdminProxiesClient opsProxies = ops.proxies;
    final Sub2ApiAdminPromoCodesClient adminPromoCodes = admin.promoCodes;
    final Sub2ApiAdminPromoCodesClient opsPromoCodes = ops.promoCodes;
    final Sub2ApiAdminRiskControlClient adminRiskControl = admin.riskControl;
    final Sub2ApiAdminRiskControlClient opsRiskControl = ops.riskControl;
    final Sub2ApiAdminScheduledTestsClient adminScheduledTests =
        admin.scheduledTests;
    final Sub2ApiAdminScheduledTestsClient opsScheduledTests =
        ops.scheduledTests;
    final Sub2ApiAdminSystemClient adminSystem = admin.system;
    final Sub2ApiAdminSystemClient opsSystem = ops.system;
    final Sub2ApiAdminTLSFingerprintsClient adminTLSFingerprints =
        admin.tlsFingerprints;
    final Sub2ApiAdminTLSFingerprintsClient opsTLSFingerprints =
        ops.tlsFingerprints;
    final Sub2ApiAdminUsageClient adminUsage = admin.usage;
    final Sub2ApiAdminUsageClient opsUsage = ops.usage;
    final Sub2ApiAdminUserAttributesClient adminUserAttributes =
        admin.userAttributes;
    final Sub2ApiAdminUserAttributesClient opsUserAttributes =
        ops.userAttributes;
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
      adminAffiliates,
      opsAffiliates,
      adminAntigravityOAuth,
      opsAntigravityOAuth,
      adminAnnouncements,
      opsAnnouncements,
      adminAuditLogs,
      opsAuditLogs,
      adminMonitorTemplates,
      opsMonitorTemplates,
      adminMonitorV2,
      opsMonitorV2,
      adminMonitors,
      opsMonitors,
      adminChannels,
      opsChannels,
      adminCNProviders,
      opsCNProviders,
      adminOpenAI,
      opsOpenAI,
      adminPlugins,
      opsPlugins,
      exportAccountData,
      importAccountData,
      importCodexSessions,
      adminProxies,
      opsProxies,
      adminPromoCodes,
      opsPromoCodes,
      adminRiskControl,
      opsRiskControl,
      adminScheduledTests,
      opsScheduledTests,
      adminSystem,
      opsSystem,
      adminTLSFingerprints,
      opsTLSFingerprints,
      adminUsage,
      opsUsage,
      adminUserAttributes,
      opsUserAttributes,
      exportProxyData,
      importProxyData,
      updateAdminApiKey,
      getUserSubscriptions,
      adminCompliance,
      opsCompliance,
      adminGeminiOAuth,
      opsGeminiOAuth,
      adminErrorPassthrough,
      opsErrorPassthrough,
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
