import 'package:dio/dio.dart';

import '../auth/sub2api_authentication_client.dart';
import '../shared/configuration/sub2api_configuration.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/session/session_coordinator.dart';
import '../shared/session/sub2api_session.dart';
import '../shared/transport/request_executor_impl.dart';
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
import 'sub2api_admin_models.dart';
import 'sub2api_admin_openai_client.dart';
import 'sub2api_admin_plugins_client.dart';
import 'sub2api_admin_promo_codes_client.dart';
import 'sub2api_admin_prompt_audit_client.dart';
import 'sub2api_admin_proxies_client.dart';
import 'sub2api_admin_risk_control_client.dart';
import 'sub2api_admin_role_executor.dart';
import 'sub2api_admin_scheduled_tests_client.dart';
import 'sub2api_admin_system_client.dart';
import 'sub2api_admin_tls_fingerprints_client.dart';
import 'sub2api_admin_usage_client.dart';
import 'sub2api_admin_user_attributes_client.dart';
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
    required this.promptAudit,
    required this.proxies,
    required this.promoCodes,
    required this.riskControl,
    required this.scheduledTests,
    required this.system,
    required this.tlsFingerprints,
    required this.usage,
    required this.userAttributes,
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
  final Sub2ApiAdminPromptAuditClient promptAudit;
  final Sub2ApiAdminProxiesClient proxies;
  final Sub2ApiAdminPromoCodesClient promoCodes;
  final Sub2ApiAdminRiskControlClient riskControl;
  final Sub2ApiAdminScheduledTestsClient scheduledTests;
  final Sub2ApiAdminSystemClient system;
  final Sub2ApiAdminTLSFingerprintsClient tlsFingerprints;
  final Sub2ApiAdminUsageClient usage;
  final Sub2ApiAdminUserAttributesClient userAttributes;
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
    affiliates: createSub2ApiAdminAffiliatesClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    antigravityOAuth: createSub2ApiAdminAntigravityOAuthClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    announcements: createSub2ApiAdminAnnouncementsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    auditLogs: createSub2ApiAdminAuditLogsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    channelMonitorTemplates: createSub2ApiAdminChannelMonitorTemplatesClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    channelMonitorV2: createSub2ApiAdminChannelMonitorV2Client(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    channelMonitors: createSub2ApiAdminChannelMonitorsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    channels: createSub2ApiAdminChannelsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    cnProviders: createSub2ApiAdminCNProvidersClient(
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
    errorPassthrough: createSub2ApiAdminErrorPassthroughClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    geminiOAuth: createSub2ApiAdminGeminiOAuthClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    groups: createSub2ApiAdminGroupsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    openAI: createSub2ApiAdminOpenAIClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    plugins: createSub2ApiAdminPluginsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      rawMutationExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    promptAudit: createSub2ApiAdminPromptAuditClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    proxies: createSub2ApiAdminProxiesClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    promoCodes: createSub2ApiAdminPromoCodesClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    riskControl: createSub2ApiAdminRiskControlClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    scheduledTests: createSub2ApiAdminScheduledTestsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      rawMutationExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    system: createSub2ApiAdminSystemClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    tlsFingerprints: createSub2ApiAdminTLSFingerprintsClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    usage: createSub2ApiAdminUsageClient(
      dio: dio,
      requestExecutor: adminExecutor,
      credentialMode: Sub2ApiAdminCredentialMode.jwt,
    ),
    userAttributes: createSub2ApiAdminUserAttributesClient(
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
