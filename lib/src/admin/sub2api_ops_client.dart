import 'package:dio/dio.dart';

import '../shared/configuration/sub2api_configuration.dart';
import 'sub2api_admin_accounts_client.dart';
import 'sub2api_admin_affiliates_client.dart';
import 'sub2api_admin_announcements_client.dart';
import 'sub2api_admin_antigravity_oauth_client.dart';
import 'sub2api_admin_audit_logs_client.dart';
import 'sub2api_admin_channel_monitor_templates_client.dart';
import 'sub2api_admin_channel_monitor_v2_client.dart';
import 'sub2api_admin_channel_monitors_client.dart';
import 'sub2api_admin_channels_client.dart';
import 'sub2api_admin_cn_providers_client.dart';
import 'sub2api_admin_compliance_client.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_dashboard_client.dart';
import 'sub2api_admin_error_passthrough_client.dart';
import 'sub2api_admin_gemini_oauth_client.dart';
import 'sub2api_admin_groups_client.dart';
import 'sub2api_admin_openai_client.dart';
import 'sub2api_admin_plugins_client.dart';
import 'sub2api_admin_promo_codes_client.dart';
import 'sub2api_admin_proxies_client.dart';
import 'sub2api_admin_risk_control_client.dart';
import 'sub2api_admin_scheduled_tests_client.dart';
import 'sub2api_admin_system_client.dart';
import 'sub2api_admin_tls_fingerprints_client.dart';
import 'sub2api_admin_usage_client.dart';
import 'sub2api_admin_user_attributes_client.dart';
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
    required this.affiliates,
    required this.antigravityOAuth,
    required this.announcements,
    required this.auditLogs,
    required this.channelMonitorTemplates,
    required this.channelMonitorV2,
    required this.channelMonitors,
    required this.channels,
    required this.cnProviders,
    required this.compliance,
    required this.dashboard,
    required this.errorPassthrough,
    required this.geminiOAuth,
    required this.groups,
    required this.openAI,
    required this.plugins,
    required this.proxies,
    required this.promoCodes,
    required this.riskControl,
    required this.scheduledTests,
    required this.system,
    required this.tlsFingerprints,
    required this.usage,
    required this.userAttributes,
    required this.users,
    required Dio dio,
    required Sub2ApiOpsRequestExecutor executor,
    required bool ownsDio,
  }) : _dio = dio,
       _executor = executor,
       _ownsDio = ownsDio;

  final Sub2ApiAdminAccountsClient accounts;
  final Sub2ApiAdminAffiliatesClient affiliates;
  final Sub2ApiAdminAntigravityOAuthClient antigravityOAuth;
  final Sub2ApiAdminAnnouncementsClient announcements;
  final Sub2ApiAdminAuditLogsClient auditLogs;
  final Sub2ApiAdminChannelMonitorTemplatesClient channelMonitorTemplates;
  final Sub2ApiAdminChannelMonitorV2Client channelMonitorV2;
  final Sub2ApiAdminChannelMonitorsClient channelMonitors;
  final Sub2ApiAdminChannelsClient channels;
  final Sub2ApiAdminCNProvidersClient cnProviders;
  final Sub2ApiAdminComplianceClient compliance;
  final Sub2ApiAdminDashboardClient dashboard;
  final Sub2ApiAdminErrorPassthroughClient errorPassthrough;
  final Sub2ApiAdminGeminiOAuthClient geminiOAuth;
  final Sub2ApiAdminGroupsClient groups;
  final Sub2ApiAdminOpenAIClient openAI;
  final Sub2ApiAdminPluginsClient plugins;
  final Sub2ApiAdminProxiesClient proxies;
  final Sub2ApiAdminPromoCodesClient promoCodes;
  final Sub2ApiAdminRiskControlClient riskControl;
  final Sub2ApiAdminScheduledTestsClient scheduledTests;
  final Sub2ApiAdminSystemClient system;
  final Sub2ApiAdminTLSFingerprintsClient tlsFingerprints;
  final Sub2ApiAdminUsageClient usage;
  final Sub2ApiAdminUserAttributesClient userAttributes;
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
    affiliates: createSub2ApiAdminAffiliatesClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    antigravityOAuth: createSub2ApiAdminAntigravityOAuthClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    announcements: createSub2ApiAdminAnnouncementsClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    auditLogs: createSub2ApiAdminAuditLogsClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    channelMonitorTemplates: createSub2ApiAdminChannelMonitorTemplatesClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    channelMonitorV2: createSub2ApiAdminChannelMonitorV2Client(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    channelMonitors: createSub2ApiAdminChannelMonitorsClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    channels: createSub2ApiAdminChannelsClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    cnProviders: createSub2ApiAdminCNProvidersClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    compliance: createSub2ApiAdminComplianceClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    dashboard: createSub2ApiAdminDashboardClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    errorPassthrough: createSub2ApiAdminErrorPassthroughClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    geminiOAuth: createSub2ApiAdminGeminiOAuthClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    groups: createSub2ApiAdminGroupsClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    openAI: createSub2ApiAdminOpenAIClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    plugins: createSub2ApiAdminPluginsClient(
      dio: dio,
      requestExecutor: executor,
      rawMutationExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    proxies: createSub2ApiAdminProxiesClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    promoCodes: createSub2ApiAdminPromoCodesClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    riskControl: createSub2ApiAdminRiskControlClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    scheduledTests: createSub2ApiAdminScheduledTestsClient(
      dio: dio,
      requestExecutor: executor,
      rawMutationExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    system: createSub2ApiAdminSystemClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    tlsFingerprints: createSub2ApiAdminTLSFingerprintsClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    usage: createSub2ApiAdminUsageClient(
      dio: dio,
      requestExecutor: executor,
      credentialMode: Sub2ApiAdminCredentialMode.apiKey,
    ),
    userAttributes: createSub2ApiAdminUserAttributesClient(
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
