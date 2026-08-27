import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';
import 'sub2api_admin_user_models.dart';

typedef Sub2ApiAdminAccountPage = Sub2ApiPage<Sub2ApiAdminAccount>;

enum Sub2ApiAdminAccountPlatform {
  anthropic,
  openAi,
  gemini,
  antigravity,
  grok,
  kimi,
  zhipu,
  deepseek,
}

enum Sub2ApiAdminAccountType {
  oauth,
  setupToken,
  apiKey,
  upstream,
  bedrock,
  serviceAccount,
}

enum Sub2ApiAdminAccountStatus { active, inactive, error }

enum Sub2ApiAdminAccountSort {
  name,
  id,
  status,
  schedulable,
  priority,
  rateMultiplier,
  lastUsedAt,
  expiresAt,
  createdAt,
  upstreamBillingRate,
}

enum Sub2ApiAdminAccountUsageSource { active, passive }

sealed class Sub2ApiAdminCredentialValue {
  const Sub2ApiAdminCredentialValue();
}

final class Sub2ApiAdminCredentialSecretValue
    extends Sub2ApiAdminCredentialValue {
  const Sub2ApiAdminCredentialSecretValue(this.value);

  final Sub2ApiAdminCredentialSecret value;
}

final class Sub2ApiAdminCredentialStringValue
    extends Sub2ApiAdminCredentialValue {
  const Sub2ApiAdminCredentialStringValue(this.value);

  final String value;
}

final class Sub2ApiAdminCredentialBoolValue
    extends Sub2ApiAdminCredentialValue {
  const Sub2ApiAdminCredentialBoolValue(this.value);

  final bool value;
}

final class Sub2ApiAdminCredentialIntegerValue
    extends Sub2ApiAdminCredentialValue {
  const Sub2ApiAdminCredentialIntegerValue(this.value);

  final int value;
}

final class Sub2ApiAdminCredentialDecimalValue
    extends Sub2ApiAdminCredentialValue {
  const Sub2ApiAdminCredentialDecimalValue(this.value);

  final Sub2ApiDecimal value;
}

final class Sub2ApiAdminCredentialJsonValue
    extends Sub2ApiAdminCredentialValue {
  const Sub2ApiAdminCredentialJsonValue(this.value);

  final Sub2ApiAdminJsonValue value;
}

final class Sub2ApiAdminCredentialEntry {
  const Sub2ApiAdminCredentialEntry({required this.name, required this.value});

  final String name;
  final Sub2ApiAdminCredentialValue value;
}

final class Sub2ApiAdminCredentialSet {
  Sub2ApiAdminCredentialSet(List<Sub2ApiAdminCredentialEntry> entries)
    : entries = List.unmodifiable(entries);

  final List<Sub2ApiAdminCredentialEntry> entries;
}

final class Sub2ApiAdminAccountCreateInput {
  Sub2ApiAdminAccountCreateInput({
    required this.name,
    required this.platform,
    required this.type,
    required this.credentials,
    this.notes,
    this.extra = const Sub2ApiAdminJsonObject({}),
    this.proxyId,
    this.concurrency = 0,
    this.priority = 0,
    this.rateMultiplier,
    this.loadFactor,
    List<int> groupIds = const [],
    this.expiresAt,
    this.autoPauseOnExpired,
    this.upstreamBillingProbeEnabled,
    this.confirmMixedChannelRisk = false,
  }) : groupIds = List.unmodifiable(groupIds);

  final String name;
  final String? notes;
  final Sub2ApiAdminAccountPlatform platform;
  final Sub2ApiAdminAccountType type;
  final Sub2ApiAdminCredentialSet credentials;
  final Sub2ApiAdminJsonObject extra;
  final int? proxyId;
  final int concurrency;
  final int priority;
  final Sub2ApiDecimal? rateMultiplier;
  final int? loadFactor;
  final List<int> groupIds;
  final DateTime? expiresAt;
  final bool? autoPauseOnExpired;
  final bool? upstreamBillingProbeEnabled;
  final bool confirmMixedChannelRisk;
}

final class Sub2ApiAdminCreateAccountRequest {
  const Sub2ApiAdminCreateAccountRequest({
    required this.idempotencyKey,
    required this.account,
  });

  final String idempotencyKey;
  final Sub2ApiAdminAccountCreateInput account;
}

final class Sub2ApiAdminBatchCreateAccountsRequest {
  Sub2ApiAdminBatchCreateAccountsRequest({
    required this.idempotencyKey,
    required List<Sub2ApiAdminAccountCreateInput> accounts,
  }) : accounts = List.unmodifiable(accounts);

  final String idempotencyKey;
  final List<Sub2ApiAdminAccountCreateInput> accounts;
}

final class Sub2ApiAdminBatchCreateAccountItem {
  const Sub2ApiAdminBatchCreateAccountItem({
    required this.name,
    required this.success,
    required this.error,
    this.accountId,
  });

  final String name;
  final bool success;
  final int? accountId;
  final String error;
}

final class Sub2ApiAdminBatchCreateAccountsResult {
  Sub2ApiAdminBatchCreateAccountsResult({
    required this.success,
    required this.failed,
    required List<Sub2ApiAdminBatchCreateAccountItem> results,
  }) : results = List.unmodifiable(results);

  final int success;
  final int failed;
  final List<Sub2ApiAdminBatchCreateAccountItem> results;
}

sealed class Sub2ApiAdminProxyUpdate {
  const Sub2ApiAdminProxyUpdate();

  const factory Sub2ApiAdminProxyUpdate.unchanged() =
      Sub2ApiAdminProxyUnchanged;
  const factory Sub2ApiAdminProxyUpdate.clear() = Sub2ApiAdminProxyClear;
  const factory Sub2ApiAdminProxyUpdate.set(int proxyId) = Sub2ApiAdminProxySet;
}

final class Sub2ApiAdminProxyUnchanged extends Sub2ApiAdminProxyUpdate {
  const Sub2ApiAdminProxyUnchanged();
}

final class Sub2ApiAdminProxyClear extends Sub2ApiAdminProxyUpdate {
  const Sub2ApiAdminProxyClear();
}

final class Sub2ApiAdminProxySet extends Sub2ApiAdminProxyUpdate {
  const Sub2ApiAdminProxySet(this.proxyId);

  final int proxyId;
}

sealed class Sub2ApiAdminExpiresAtUpdate {
  const Sub2ApiAdminExpiresAtUpdate();

  const factory Sub2ApiAdminExpiresAtUpdate.unchanged() =
      Sub2ApiAdminExpiresAtUnchanged;
  const factory Sub2ApiAdminExpiresAtUpdate.clear() =
      Sub2ApiAdminExpiresAtClear;
  const factory Sub2ApiAdminExpiresAtUpdate.set(DateTime expiresAt) =
      Sub2ApiAdminExpiresAtSet;
}

final class Sub2ApiAdminExpiresAtUnchanged extends Sub2ApiAdminExpiresAtUpdate {
  const Sub2ApiAdminExpiresAtUnchanged();
}

final class Sub2ApiAdminExpiresAtClear extends Sub2ApiAdminExpiresAtUpdate {
  const Sub2ApiAdminExpiresAtClear();
}

final class Sub2ApiAdminExpiresAtSet extends Sub2ApiAdminExpiresAtUpdate {
  const Sub2ApiAdminExpiresAtSet(this.expiresAt);

  final DateTime expiresAt;
}

sealed class Sub2ApiAdminLoadFactorUpdate {
  const Sub2ApiAdminLoadFactorUpdate();

  const factory Sub2ApiAdminLoadFactorUpdate.unchanged() =
      Sub2ApiAdminLoadFactorUnchanged;
  const factory Sub2ApiAdminLoadFactorUpdate.clear() =
      Sub2ApiAdminLoadFactorClear;
  const factory Sub2ApiAdminLoadFactorUpdate.set(int loadFactor) =
      Sub2ApiAdminLoadFactorSet;
}

final class Sub2ApiAdminLoadFactorUnchanged
    extends Sub2ApiAdminLoadFactorUpdate {
  const Sub2ApiAdminLoadFactorUnchanged();
}

final class Sub2ApiAdminLoadFactorClear extends Sub2ApiAdminLoadFactorUpdate {
  const Sub2ApiAdminLoadFactorClear();
}

final class Sub2ApiAdminLoadFactorSet extends Sub2ApiAdminLoadFactorUpdate {
  const Sub2ApiAdminLoadFactorSet(this.loadFactor);

  final int loadFactor;
}

final class Sub2ApiAdminUpdateAccountRequest {
  Sub2ApiAdminUpdateAccountRequest({
    this.name,
    this.notes,
    this.type,
    this.credentials,
    this.extra,
    this.proxy = const Sub2ApiAdminProxyUpdate.unchanged(),
    this.concurrency,
    this.priority,
    this.rateMultiplier,
    this.loadFactor = const Sub2ApiAdminLoadFactorUpdate.unchanged(),
    this.status,
    List<int>? groupIds,
    this.expiresAt = const Sub2ApiAdminExpiresAtUpdate.unchanged(),
    this.autoPauseOnExpired,
    this.upstreamBillingProbeEnabled,
    this.upstreamBillingRateSyncEnabled,
    this.confirmMixedChannelRisk = false,
  }) : groupIds = groupIds == null ? null : List.unmodifiable(groupIds);

  final String? name;
  final String? notes;
  final Sub2ApiAdminAccountType? type;
  final Sub2ApiAdminCredentialSet? credentials;

  /// `null` leaves extra unchanged; an empty object clears user-owned keys.
  final Sub2ApiAdminJsonObject? extra;

  final Sub2ApiAdminProxyUpdate proxy;
  final int? concurrency;
  final int? priority;
  final Sub2ApiDecimal? rateMultiplier;
  final Sub2ApiAdminLoadFactorUpdate loadFactor;
  final Sub2ApiAdminAccountStatus? status;

  /// `null` leaves bindings unchanged; an empty list clears all bindings.
  final List<int>? groupIds;

  final Sub2ApiAdminExpiresAtUpdate expiresAt;
  final bool? autoPauseOnExpired;
  final bool? upstreamBillingProbeEnabled;
  final bool? upstreamBillingRateSyncEnabled;
  final bool confirmMixedChannelRisk;
}

sealed class Sub2ApiAdminBatchCredentialUpdate {
  const Sub2ApiAdminBatchCredentialUpdate();

  const factory Sub2ApiAdminBatchCredentialUpdate.accountUuid(String? value) =
      Sub2ApiAdminBatchAccountUuidUpdate;
  const factory Sub2ApiAdminBatchCredentialUpdate.organizationUuid(
    String? value,
  ) = Sub2ApiAdminBatchOrganizationUuidUpdate;
  const factory Sub2ApiAdminBatchCredentialUpdate.interceptWarmupRequests(
    bool value,
  ) = Sub2ApiAdminBatchInterceptWarmupUpdate;
}

final class Sub2ApiAdminBatchAccountUuidUpdate
    extends Sub2ApiAdminBatchCredentialUpdate {
  const Sub2ApiAdminBatchAccountUuidUpdate(this.value);

  final String? value;
}

final class Sub2ApiAdminBatchOrganizationUuidUpdate
    extends Sub2ApiAdminBatchCredentialUpdate {
  const Sub2ApiAdminBatchOrganizationUuidUpdate(this.value);

  final String? value;
}

final class Sub2ApiAdminBatchInterceptWarmupUpdate
    extends Sub2ApiAdminBatchCredentialUpdate {
  const Sub2ApiAdminBatchInterceptWarmupUpdate(this.value);

  final bool value;
}

final class Sub2ApiAdminBatchUpdateCredentialsRequest {
  Sub2ApiAdminBatchUpdateCredentialsRequest({
    required List<int> accountIds,
    required this.update,
  }) : accountIds = List.unmodifiable(accountIds);

  final List<int> accountIds;
  final Sub2ApiAdminBatchCredentialUpdate update;
}

final class Sub2ApiAdminBatchAccountMutationItem {
  const Sub2ApiAdminBatchAccountMutationItem({
    required this.accountId,
    required this.success,
    required this.error,
  });

  final int accountId;
  final bool success;
  final String error;
}

final class Sub2ApiAdminBatchAccountMutationResult {
  Sub2ApiAdminBatchAccountMutationResult({
    required this.success,
    required this.failed,
    required List<int> successIds,
    required List<int> failedIds,
    required List<Sub2ApiAdminBatchAccountMutationItem> results,
  }) : successIds = List.unmodifiable(successIds),
       failedIds = List.unmodifiable(failedIds),
       results = List.unmodifiable(results);

  final int success;
  final int failed;
  final List<int> successIds;
  final List<int> failedIds;
  final List<Sub2ApiAdminBatchAccountMutationItem> results;
}

sealed class Sub2ApiAdminBulkAccountSelector {
  const Sub2ApiAdminBulkAccountSelector();

  factory Sub2ApiAdminBulkAccountSelector.ids(List<int> accountIds) =
      Sub2ApiAdminBulkAccountIdsSelector;
  const factory Sub2ApiAdminBulkAccountSelector.filters(
    Sub2ApiAdminBulkAccountFilters filters,
  ) = Sub2ApiAdminBulkAccountFiltersSelector;
  const factory Sub2ApiAdminBulkAccountSelector.allAccounts() =
      Sub2ApiAdminBulkAllAccountsSelector;
}

final class Sub2ApiAdminBulkAccountIdsSelector
    extends Sub2ApiAdminBulkAccountSelector {
  Sub2ApiAdminBulkAccountIdsSelector(List<int> accountIds)
    : accountIds = List.unmodifiable(accountIds);

  final List<int> accountIds;
}

final class Sub2ApiAdminBulkAccountFiltersSelector
    extends Sub2ApiAdminBulkAccountSelector {
  const Sub2ApiAdminBulkAccountFiltersSelector(this.filters);

  final Sub2ApiAdminBulkAccountFilters filters;
}

final class Sub2ApiAdminBulkAllAccountsSelector
    extends Sub2ApiAdminBulkAccountSelector {
  const Sub2ApiAdminBulkAllAccountsSelector();
}

sealed class Sub2ApiAdminBulkGroupFilter {
  const Sub2ApiAdminBulkGroupFilter();

  const factory Sub2ApiAdminBulkGroupFilter.any() =
      Sub2ApiAdminBulkAnyGroupFilter;
  const factory Sub2ApiAdminBulkGroupFilter.ungrouped() =
      Sub2ApiAdminBulkUngroupedFilter;
  const factory Sub2ApiAdminBulkGroupFilter.id(int groupId) =
      Sub2ApiAdminBulkGroupIdFilter;
}

final class Sub2ApiAdminBulkAnyGroupFilter extends Sub2ApiAdminBulkGroupFilter {
  const Sub2ApiAdminBulkAnyGroupFilter();
}

final class Sub2ApiAdminBulkUngroupedFilter
    extends Sub2ApiAdminBulkGroupFilter {
  const Sub2ApiAdminBulkUngroupedFilter();
}

final class Sub2ApiAdminBulkGroupIdFilter extends Sub2ApiAdminBulkGroupFilter {
  const Sub2ApiAdminBulkGroupIdFilter(this.groupId);

  final int groupId;
}

final class Sub2ApiAdminBulkAccountFilters {
  const Sub2ApiAdminBulkAccountFilters({
    this.platform,
    this.type,
    this.status,
    this.group = const Sub2ApiAdminBulkGroupFilter.any(),
    this.search,
    this.privacyMode,
  });

  final Sub2ApiAdminAccountPlatform? platform;
  final Sub2ApiAdminAccountType? type;
  final Sub2ApiAdminAccountStatus? status;
  final Sub2ApiAdminBulkGroupFilter group;
  final String? search;
  final String? privacyMode;
}

final class Sub2ApiAdminBulkUpdateAccountsRequest {
  Sub2ApiAdminBulkUpdateAccountsRequest({
    required this.selector,
    this.name,
    this.proxy = const Sub2ApiAdminProxyUpdate.unchanged(),
    this.concurrency,
    this.priority,
    this.rateMultiplier,
    this.loadFactor = const Sub2ApiAdminLoadFactorUpdate.unchanged(),
    this.status,
    this.schedulable,
    List<int>? groupIds,
    this.credentials,
    this.extra,
    this.upstreamBillingProbeEnabled,
    this.confirmMixedChannelRisk = false,
  }) : groupIds = groupIds == null ? null : List.unmodifiable(groupIds);

  final Sub2ApiAdminBulkAccountSelector selector;
  final String? name;
  final Sub2ApiAdminProxyUpdate proxy;
  final int? concurrency;
  final int? priority;
  final Sub2ApiDecimal? rateMultiplier;
  final Sub2ApiAdminLoadFactorUpdate loadFactor;
  final Sub2ApiAdminAccountStatus? status;
  final bool? schedulable;
  final List<int>? groupIds;
  final Sub2ApiAdminCredentialSet? credentials;
  final Sub2ApiAdminJsonObject? extra;
  final bool? upstreamBillingProbeEnabled;
  final bool confirmMixedChannelRisk;
}

final class Sub2ApiAdminBulkUpdateAccountsResult {
  Sub2ApiAdminBulkUpdateAccountsResult({
    required this.success,
    required this.failed,
    required List<int> successIds,
    required List<int> failedIds,
    required List<Sub2ApiAdminBatchAccountMutationItem> results,
    required this.longContextInheritedCount,
  }) : successIds = List.unmodifiable(successIds),
       failedIds = List.unmodifiable(failedIds),
       results = List.unmodifiable(results);

  final int success;
  final int failed;
  final List<int> successIds;
  final List<int> failedIds;
  final List<Sub2ApiAdminBatchAccountMutationItem> results;
  final int longContextInheritedCount;
}

final class Sub2ApiAdminApplyOAuthCredentialsRequest {
  const Sub2ApiAdminApplyOAuthCredentialsRequest({
    required this.type,
    required this.credentials,
    this.extra = const Sub2ApiAdminJsonObject({}),
  });

  final Sub2ApiAdminAccountType type;
  final Sub2ApiAdminCredentialSet credentials;
  final Sub2ApiAdminJsonObject extra;
}

enum Sub2ApiAdminAccountTestMode {
  defaultMode,
  compact,
  text,
  image,
  video,
  search,
  textToSpeech,
  speechToText,
  realtime,
}

final class Sub2ApiAdminAccountTestRequest {
  const Sub2ApiAdminAccountTestRequest({
    this.modelId,
    this.prompt,
    this.mode = Sub2ApiAdminAccountTestMode.defaultMode,
    this.imageDataUrl,
    this.audioDataUrl,
  });

  final String? modelId;
  final String? prompt;
  final Sub2ApiAdminAccountTestMode mode;
  final String? imageDataUrl;
  final String? audioDataUrl;
}

enum Sub2ApiAdminAccountTestEventType {
  testStart,
  content,
  status,
  image,
  audio,
  video,
  testComplete,
  error,
}

final class Sub2ApiAdminAccountTestEvent {
  const Sub2ApiAdminAccountTestEvent({
    required this.type,
    this.text,
    this.model,
    this.mediaUrl,
    this.mimeType,
    this.success,
    this.error,
  });

  final Sub2ApiAdminAccountTestEventType type;
  final String? text;
  final String? model;
  final Uri? mediaUrl;
  final String? mimeType;
  final bool? success;
  final String? error;
}

final class Sub2ApiAdminAccountListQuery {
  const Sub2ApiAdminAccountListQuery({
    this.page,
    this.pageSize,
    this.platform,
    this.type,
    this.status,
    this.search,
    this.groupId,
    this.ungrouped = false,
    this.privacyMode,
    this.sortBy = Sub2ApiAdminAccountSort.name,
    this.sortDescending = false,
    this.lite = false,
    this.includeSchedulerScore = false,
  });

  final int? page;
  final int? pageSize;
  final Sub2ApiAdminAccountPlatform? platform;
  final Sub2ApiAdminAccountType? type;
  final Sub2ApiAdminAccountStatus? status;
  final String? search;
  final int? groupId;
  final bool ungrouped;
  final String? privacyMode;
  final Sub2ApiAdminAccountSort sortBy;
  final bool sortDescending;
  final bool lite;
  final bool includeSchedulerScore;
}

final class Sub2ApiAdminAccount {
  Sub2ApiAdminAccount({
    required this.id,
    required this.name,
    required this.platform,
    required this.type,
    required this.credentials,
    required Map<String, bool> credentialsStatus,
    required this.extra,
    required this.concurrency,
    required this.priority,
    required this.rateMultiplier,
    required this.status,
    required this.errorMessage,
    required this.autoPauseOnExpired,
    required this.createdAt,
    required this.updatedAt,
    required this.schedulable,
    required List<int> groupIds,
    required List<Sub2ApiAdminAccountGroupBinding> accountGroups,
    required List<Sub2ApiAdminAccountGroupSummary> groups,
    required List<Sub2ApiAdminAccountSchedulerGroupScore> schedulerScores,
    this.notes,
    this.ollamaCloudUsage,
    this.proxyId,
    this.proxyFallbackOriginId,
    this.proxyFallbackOriginName,
    this.proxy,
    this.loadFactor,
    this.lastUsedAt,
    this.expiresAt,
    this.rateLimitedAt,
    this.rateLimitResetAt,
    this.overloadUntil,
    this.tempUnschedulableUntil,
    this.tempUnschedulableReason = '',
    this.sessionWindowStart,
    this.sessionWindowEnd,
    this.sessionWindowStatus = '',
    this.windowCostLimit,
    this.windowCostStickyReserve,
    this.maxSessions,
    this.sessionIdleTimeoutMinutes,
    this.baseRpm,
    this.rpmStrategy,
    this.rpmStickyBuffer,
    this.userMessageQueueMode,
    this.tlsFingerprintEnabled,
    this.tlsFingerprintProfileId,
    this.sessionIdMaskingEnabled,
    this.cacheTtlOverrideEnabled,
    this.cacheTtlOverrideTarget,
    this.customBaseUrlEnabled,
    this.customBaseUrl,
    this.quotaLimit,
    this.quotaUsed,
    this.quotaDailyLimit,
    this.quotaDailyUsed,
    this.quotaWeeklyLimit,
    this.quotaWeeklyUsed,
    this.parentAccountId,
    this.quotaDimension = '',
    this.parentEmail = '',
    this.parentPlanType = '',
    this.parentPrivacyMode = '',
    this.parentSubscriptionExpiresAt = '',
    this.parentChatGptAccountId = '',
    this.currentConcurrency = 0,
    this.schedulerScore,
    this.currentWindowCost,
    this.activeSessions,
    this.currentRpm,
  }) : credentialsStatus = Map.unmodifiable(credentialsStatus),
       groupIds = List.unmodifiable(groupIds),
       accountGroups = List.unmodifiable(accountGroups),
       groups = List.unmodifiable(groups),
       schedulerScores = List.unmodifiable(schedulerScores);

  final int id;
  final String name;
  final String? notes;
  final Sub2ApiAdminAccountPlatform platform;
  final Sub2ApiAdminAccountType type;
  final Sub2ApiAdminJsonObject credentials;
  final Map<String, bool> credentialsStatus;
  final Sub2ApiAdminJsonObject extra;
  final Sub2ApiAdminOllamaCloudUsageState? ollamaCloudUsage;
  final int? proxyId;
  final int? proxyFallbackOriginId;
  final String? proxyFallbackOriginName;
  final Sub2ApiAdminAccountProxy? proxy;
  final int concurrency;
  final int? loadFactor;
  final int priority;
  final Sub2ApiDecimal rateMultiplier;
  final Sub2ApiAdminAccountStatus status;
  final String errorMessage;
  final DateTime? lastUsedAt;
  final DateTime? expiresAt;
  final bool autoPauseOnExpired;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool schedulable;
  final DateTime? rateLimitedAt;
  final DateTime? rateLimitResetAt;
  final DateTime? overloadUntil;
  final DateTime? tempUnschedulableUntil;
  final String tempUnschedulableReason;
  final DateTime? sessionWindowStart;
  final DateTime? sessionWindowEnd;
  final String sessionWindowStatus;
  final Sub2ApiDecimal? windowCostLimit;
  final Sub2ApiDecimal? windowCostStickyReserve;
  final int? maxSessions;
  final int? sessionIdleTimeoutMinutes;
  final int? baseRpm;
  final String? rpmStrategy;
  final int? rpmStickyBuffer;
  final String? userMessageQueueMode;
  final bool? tlsFingerprintEnabled;
  final int? tlsFingerprintProfileId;
  final bool? sessionIdMaskingEnabled;
  final bool? cacheTtlOverrideEnabled;
  final String? cacheTtlOverrideTarget;
  final bool? customBaseUrlEnabled;
  final String? customBaseUrl;
  final Sub2ApiDecimal? quotaLimit;
  final Sub2ApiDecimal? quotaUsed;
  final Sub2ApiDecimal? quotaDailyLimit;
  final Sub2ApiDecimal? quotaDailyUsed;
  final Sub2ApiDecimal? quotaWeeklyLimit;
  final Sub2ApiDecimal? quotaWeeklyUsed;
  final int? parentAccountId;
  final String quotaDimension;
  final String parentEmail;
  final String parentPlanType;
  final String parentPrivacyMode;
  final String parentSubscriptionExpiresAt;
  final String parentChatGptAccountId;
  final List<int> groupIds;
  final List<Sub2ApiAdminAccountGroupBinding> accountGroups;
  final List<Sub2ApiAdminAccountGroupSummary> groups;
  final int currentConcurrency;
  final Sub2ApiAdminAccountSchedulerScore? schedulerScore;
  final List<Sub2ApiAdminAccountSchedulerGroupScore> schedulerScores;
  final Sub2ApiDecimal? currentWindowCost;
  final int? activeSessions;
  final int? currentRpm;
}

final class Sub2ApiAdminAccountProxy {
  const Sub2ApiAdminAccountProxy({
    required this.id,
    required this.name,
    required this.protocol,
    required this.host,
    required this.port,
    required this.username,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.fallbackMode,
    required this.expiryWarningDays,
    this.expiresAt,
    this.backupProxyId,
  });

  final int id;
  final String name;
  final String protocol;
  final String host;
  final int port;
  final String username;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? expiresAt;
  final String fallbackMode;
  final int? backupProxyId;
  final int expiryWarningDays;
}

final class Sub2ApiAdminAccountGroupBinding {
  const Sub2ApiAdminAccountGroupBinding({
    required this.accountId,
    required this.groupId,
    required this.priority,
    required this.createdAt,
  });

  final int accountId;
  final int groupId;
  final int priority;
  final DateTime createdAt;
}

final class Sub2ApiAdminAccountGroupSummary {
  const Sub2ApiAdminAccountGroupSummary({
    required this.id,
    required this.name,
    required this.platform,
    required this.status,
  });

  final int id;
  final String name;
  final String platform;
  final String status;
}

final class Sub2ApiAdminAccountSchedulerScore {
  const Sub2ApiAdminAccountSchedulerScore({
    required this.baseScore,
    required this.stickyScore,
    required this.stickyScoreInfinity,
    required this.stickyWeightedEnabled,
  });

  final Sub2ApiDecimal baseScore;
  final Sub2ApiDecimal stickyScore;
  final bool stickyScoreInfinity;
  final bool stickyWeightedEnabled;
}

final class Sub2ApiAdminAccountSchedulerGroupScore {
  const Sub2ApiAdminAccountSchedulerGroupScore({
    required this.score,
    this.groupId,
    this.groupName,
    this.groupPriority,
  });

  final int? groupId;
  final String? groupName;
  final int? groupPriority;
  final Sub2ApiAdminAccountSchedulerScore score;
}

final class Sub2ApiAdminUpstreamBillingProbeSettings {
  const Sub2ApiAdminUpstreamBillingProbeSettings({
    required this.enabled,
    required this.intervalMinutes,
  });

  final bool enabled;
  final int intervalMinutes;
}

final class Sub2ApiAdminOllamaCloudUsageSettings {
  const Sub2ApiAdminOllamaCloudUsageSettings({
    required this.enabled,
    required this.intervalMinutes,
    required this.debounceMinutes,
  });

  final bool enabled;
  final int intervalMinutes;
  final int debounceMinutes;
}

final class Sub2ApiAdminOllamaCloudUsageState {
  const Sub2ApiAdminOllamaCloudUsageState({
    required this.accountId,
    required this.eligible,
    required this.configured,
    required this.autoRefreshEnabled,
    required this.encryptionKeyConfigured,
    this.snapshot,
  });

  final int accountId;
  final bool eligible;
  final bool configured;
  final bool autoRefreshEnabled;
  final bool encryptionKeyConfigured;
  final Sub2ApiAdminOllamaCloudUsageSnapshot? snapshot;
}

final class Sub2ApiAdminOllamaCloudUsageSnapshot {
  const Sub2ApiAdminOllamaCloudUsageSnapshot({
    required this.status,
    required this.lastAttemptAt,
    required this.nextRefreshAt,
    required this.failureCount,
    required this.httpStatus,
    required this.lastError,
    this.data,
    this.fetchedAt,
  });

  final String status;
  final Sub2ApiAdminOllamaCloudUsageData? data;
  final DateTime? fetchedAt;
  final DateTime lastAttemptAt;
  final DateTime nextRefreshAt;
  final int failureCount;
  final int httpStatus;
  final String lastError;
}

final class Sub2ApiAdminOllamaCloudUsageData {
  Sub2ApiAdminOllamaCloudUsageData({
    required this.plan,
    required this.balance,
    required List<Sub2ApiAdminOllamaCloudUsageModel> models,
    this.fiveHour,
    this.sevenDay,
  }) : models = List.unmodifiable(models);

  final String plan;
  final Sub2ApiAdminOllamaCloudUsageWindow? fiveHour;
  final Sub2ApiAdminOllamaCloudUsageWindow? sevenDay;
  final String balance;
  final List<Sub2ApiAdminOllamaCloudUsageModel> models;
}

final class Sub2ApiAdminOllamaCloudUsageWindow {
  const Sub2ApiAdminOllamaCloudUsageWindow({
    required this.usedPercent,
    required this.resetText,
    this.resetAt,
  });

  final Sub2ApiDecimal usedPercent;
  final DateTime? resetAt;
  final String resetText;
}

final class Sub2ApiAdminOllamaCloudUsageModel {
  const Sub2ApiAdminOllamaCloudUsageModel({
    required this.model,
    required this.window,
    required this.requests,
  });

  final String model;
  final String window;
  final int requests;
}

final class Sub2ApiAdminAccountStats {
  Sub2ApiAdminAccountStats({
    required List<Sub2ApiAdminAccountUsageHistory> history,
    required this.summary,
    required List<Sub2ApiAdminAccountModelStats> models,
    required List<Sub2ApiAdminAccountEndpointStats> endpoints,
    required List<Sub2ApiAdminAccountEndpointStats> upstreamEndpoints,
  }) : history = List.unmodifiable(history),
       models = List.unmodifiable(models),
       endpoints = List.unmodifiable(endpoints),
       upstreamEndpoints = List.unmodifiable(upstreamEndpoints);

  final List<Sub2ApiAdminAccountUsageHistory> history;
  final Sub2ApiAdminAccountUsageSummary summary;
  final List<Sub2ApiAdminAccountModelStats> models;
  final List<Sub2ApiAdminAccountEndpointStats> endpoints;
  final List<Sub2ApiAdminAccountEndpointStats> upstreamEndpoints;
}

final class Sub2ApiAdminAccountUsageHistory {
  const Sub2ApiAdminAccountUsageHistory({
    required this.date,
    required this.label,
    required this.requests,
    required this.tokens,
    required this.cost,
    required this.actualCost,
    required this.userCost,
  });

  final String date;
  final String label;
  final int requests;
  final int tokens;
  final Sub2ApiDecimal cost;
  final Sub2ApiDecimal actualCost;
  final Sub2ApiDecimal userCost;
}

final class Sub2ApiAdminAccountUsageSummary {
  const Sub2ApiAdminAccountUsageSummary({
    required this.days,
    required this.actualDaysUsed,
    required this.totalCost,
    required this.totalUserCost,
    required this.totalStandardCost,
    required this.totalRequests,
    required this.totalTokens,
    required this.averageDailyCost,
    required this.averageDailyUserCost,
    required this.averageDailyRequests,
    required this.averageDailyTokens,
    required this.averageDurationMs,
  });

  final int days;
  final int actualDaysUsed;
  final Sub2ApiDecimal totalCost;
  final Sub2ApiDecimal totalUserCost;
  final Sub2ApiDecimal totalStandardCost;
  final int totalRequests;
  final int totalTokens;
  final Sub2ApiDecimal averageDailyCost;
  final Sub2ApiDecimal averageDailyUserCost;
  final Sub2ApiDecimal averageDailyRequests;
  final Sub2ApiDecimal averageDailyTokens;
  final Sub2ApiDecimal averageDurationMs;
}

final class Sub2ApiAdminAccountModelStats {
  const Sub2ApiAdminAccountModelStats({
    required this.model,
    required this.requests,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheCreationTokens,
    required this.cacheReadTokens,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
    required this.accountCost,
  });

  final String model;
  final int requests;
  final int inputTokens;
  final int outputTokens;
  final int cacheCreationTokens;
  final int cacheReadTokens;
  final int totalTokens;
  final Sub2ApiDecimal cost;
  final Sub2ApiDecimal actualCost;
  final Sub2ApiDecimal accountCost;
}

final class Sub2ApiAdminAccountEndpointStats {
  const Sub2ApiAdminAccountEndpointStats({
    required this.endpoint,
    required this.requests,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
  });

  final String endpoint;
  final int requests;
  final int totalTokens;
  final Sub2ApiDecimal cost;
  final Sub2ApiDecimal actualCost;
}

final class Sub2ApiAdminAccountUsage {
  Sub2ApiAdminAccountUsage({
    required this.source,
    required Map<String, Sub2ApiAdminAccountUsageProgress> windows,
    required this.providerDetails,
    this.updatedAt,
  }) : windows = Map.unmodifiable(windows);

  final String source;
  final DateTime? updatedAt;
  final Map<String, Sub2ApiAdminAccountUsageProgress> windows;
  final Sub2ApiAdminJsonObject providerDetails;
}

final class Sub2ApiAdminAccountUsageProgress {
  const Sub2ApiAdminAccountUsageProgress({
    required this.utilization,
    required this.remainingSeconds,
    required this.usedRequests,
    required this.limitRequests,
    this.resetsAt,
    this.windowStats,
  });

  final Sub2ApiDecimal utilization;
  final DateTime? resetsAt;
  final int remainingSeconds;
  final Sub2ApiAdminAccountTodayStats? windowStats;
  final int usedRequests;
  final int limitRequests;
}

final class Sub2ApiAdminAccountTodayStats {
  const Sub2ApiAdminAccountTodayStats({
    required this.requests,
    required this.tokens,
    required this.cost,
    required this.standardCost,
    required this.userCost,
  });

  final int requests;
  final int tokens;
  final Sub2ApiDecimal cost;
  final Sub2ApiDecimal standardCost;
  final Sub2ApiDecimal userCost;
}

final class Sub2ApiAdminAccountTempUnschedulable {
  const Sub2ApiAdminAccountTempUnschedulable({
    required this.active,
    this.state,
  });

  final bool active;
  final Sub2ApiAdminAccountTempUnschedulableState? state;
}

final class Sub2ApiAdminAccountTempUnschedulableState {
  const Sub2ApiAdminAccountTempUnschedulableState({
    required this.until,
    required this.triggeredAt,
    required this.statusCode,
    required this.matchedKeyword,
    required this.ruleIndex,
    required this.errorMessage,
    required this.triggerCount,
    required this.triggerThreshold,
    required this.triggerWindowMinutes,
  });

  final DateTime until;
  final DateTime triggeredAt;
  final int statusCode;
  final String matchedKeyword;
  final int ruleIndex;
  final String errorMessage;
  final int triggerCount;
  final int triggerThreshold;
  final int triggerWindowMinutes;
}

final class Sub2ApiAdminAccountModel {
  const Sub2ApiAdminAccountModel({
    required this.id,
    required this.type,
    required this.displayName,
    required this.object,
    required this.ownedBy,
    required this.created,
    required this.createdAt,
  });

  final String id;
  final String type;
  final String displayName;
  final String object;
  final String ownedBy;
  final int? created;
  final DateTime? createdAt;
}

final class Sub2ApiAdminScheduledTestPlan {
  const Sub2ApiAdminScheduledTestPlan({
    required this.id,
    required this.accountId,
    required this.modelId,
    required this.cronExpression,
    required this.enabled,
    required this.maxResults,
    required this.autoRecover,
    required this.createdAt,
    required this.updatedAt,
    this.lastRunAt,
    this.nextRunAt,
  });

  final int id;
  final int accountId;
  final String modelId;
  final String cronExpression;
  final bool enabled;
  final int maxResults;
  final bool autoRecover;
  final DateTime? lastRunAt;
  final DateTime? nextRunAt;
  final DateTime createdAt;
  final DateTime updatedAt;
}

final class Sub2ApiAdminAccountProbeToggleResult {
  const Sub2ApiAdminAccountProbeToggleResult({
    required this.accountId,
    required this.enabled,
  });

  final int accountId;
  final bool enabled;
}

final class Sub2ApiAdminAccountActionResult {
  const Sub2ApiAdminAccountActionResult({required this.message});

  final String message;
}

final class Sub2ApiAdminDuplicateAccountRequest {
  const Sub2ApiAdminDuplicateAccountRequest({required this.idempotencyKey});

  final String idempotencyKey;
}

final class Sub2ApiAdminAccountBatchError {
  const Sub2ApiAdminAccountBatchError({
    required this.accountId,
    required this.error,
  });

  final int accountId;
  final String error;
}

final class Sub2ApiAdminAccountBatchDeleteResult {
  Sub2ApiAdminAccountBatchDeleteResult({
    required this.total,
    required this.success,
    required this.failed,
    required List<int> successIds,
    required List<int> failedIds,
    required List<Sub2ApiAdminAccountBatchError> errors,
  }) : successIds = List.unmodifiable(successIds),
       failedIds = List.unmodifiable(failedIds),
       errors = List.unmodifiable(errors);

  final int total;
  final int success;
  final int failed;
  final List<int> successIds;
  final List<int> failedIds;
  final List<Sub2ApiAdminAccountBatchError> errors;
}

final class Sub2ApiAdminAccountBatchWarning {
  const Sub2ApiAdminAccountBatchWarning({
    required this.accountId,
    required this.warning,
  });

  final int accountId;
  final String warning;
}

final class Sub2ApiAdminAccountBatchMaintenanceResult {
  Sub2ApiAdminAccountBatchMaintenanceResult({
    required this.total,
    required this.success,
    required this.failed,
    required List<Sub2ApiAdminAccountBatchError> errors,
    required List<Sub2ApiAdminAccountBatchWarning> warnings,
  }) : errors = List.unmodifiable(errors),
       warnings = List.unmodifiable(warnings);

  final int total;
  final int success;
  final int failed;
  final List<Sub2ApiAdminAccountBatchError> errors;
  final List<Sub2ApiAdminAccountBatchWarning> warnings;
}

sealed class Sub2ApiAdminAccountRefreshResult {
  const Sub2ApiAdminAccountRefreshResult();
}

final class Sub2ApiAdminAccountRefreshCompleted
    extends Sub2ApiAdminAccountRefreshResult {
  const Sub2ApiAdminAccountRefreshCompleted(this.account);

  final Sub2ApiAdminAccount account;
}

final class Sub2ApiAdminAccountRefreshWarning
    extends Sub2ApiAdminAccountRefreshResult {
  const Sub2ApiAdminAccountRefreshWarning({
    required this.message,
    required this.warning,
  });

  final String message;
  final String warning;
}

final class Sub2ApiAdminAccountTierRefreshResult {
  const Sub2ApiAdminAccountTierRefreshResult({
    required this.tierId,
    required this.storageInfo,
    required this.driveStorageLimit,
    required this.driveStorageUsage,
    required this.updatedAt,
  });

  final String tierId;
  final Sub2ApiAdminJsonObject storageInfo;
  final int driveStorageLimit;
  final int driveStorageUsage;
  final DateTime updatedAt;
}

final class Sub2ApiAdminUpstreamModelPreviewRequest {
  const Sub2ApiAdminUpstreamModelPreviewRequest({
    required this.platform,
    required this.type,
    required this.apiKey,
    this.baseUrl,
  });

  final Sub2ApiAdminAccountPlatform platform;
  final Sub2ApiAdminAccountType type;
  final Uri? baseUrl;
  final Sub2ApiApiKeySecret apiKey;
}

final class Sub2ApiAdminCreateShadowRequest {
  Sub2ApiAdminCreateShadowRequest({
    this.name,
    this.priority,
    this.concurrency,
    List<int> groupIds = const [],
  }) : groupIds = List.unmodifiable(groupIds);

  final String? name;
  final int? priority;
  final int? concurrency;
  final List<int> groupIds;
}

final class Sub2ApiAdminCrsPreviewRequest {
  const Sub2ApiAdminCrsPreviewRequest({
    required this.baseUrl,
    required this.username,
    required this.password,
  });

  final Uri baseUrl;
  final String username;
  final Sub2ApiPassword password;
}

final class Sub2ApiAdminCrsSyncRequest {
  Sub2ApiAdminCrsSyncRequest({
    required this.baseUrl,
    required this.username,
    required this.password,
    this.syncProxies = true,
    List<String>? selectedAccountIds,
  }) : selectedAccountIds = selectedAccountIds == null
           ? null
           : List.unmodifiable(selectedAccountIds);

  final Uri baseUrl;
  final String username;
  final Sub2ApiPassword password;
  final bool syncProxies;

  /// `null` creates all new accounts; an empty list creates none.
  final List<String>? selectedAccountIds;
}

final class Sub2ApiAdminCrsPreviewAccount {
  const Sub2ApiAdminCrsPreviewAccount({
    required this.crsAccountId,
    required this.kind,
    required this.name,
    required this.platform,
    required this.type,
  });

  final String crsAccountId;
  final String kind;
  final String name;
  final Sub2ApiAdminAccountPlatform platform;
  final Sub2ApiAdminAccountType type;
}

final class Sub2ApiAdminCrsPreviewResult {
  Sub2ApiAdminCrsPreviewResult({
    required List<Sub2ApiAdminCrsPreviewAccount> newAccounts,
    required List<Sub2ApiAdminCrsPreviewAccount> existingAccounts,
  }) : newAccounts = List.unmodifiable(newAccounts),
       existingAccounts = List.unmodifiable(existingAccounts);

  final List<Sub2ApiAdminCrsPreviewAccount> newAccounts;
  final List<Sub2ApiAdminCrsPreviewAccount> existingAccounts;
}

enum Sub2ApiAdminCrsSyncAction { created, updated, skipped, failed }

final class Sub2ApiAdminCrsSyncItem {
  const Sub2ApiAdminCrsSyncItem({
    required this.crsAccountId,
    required this.kind,
    required this.name,
    required this.action,
    required this.error,
  });

  final String crsAccountId;
  final String kind;
  final String name;
  final Sub2ApiAdminCrsSyncAction action;
  final String error;
}

final class Sub2ApiAdminCrsSyncResult {
  Sub2ApiAdminCrsSyncResult({
    required this.created,
    required this.updated,
    required this.skipped,
    required this.failed,
    required List<Sub2ApiAdminCrsSyncItem> items,
  }) : items = List.unmodifiable(items);

  final int created;
  final int updated;
  final int skipped;
  final int failed;
  final List<Sub2ApiAdminCrsSyncItem> items;
}

final class Sub2ApiAdminOAuthAuthorization {
  const Sub2ApiAdminOAuthAuthorization({
    required this.authorizationUrl,
    required this.sessionId,
  });

  final Uri authorizationUrl;
  final Sub2ApiAdminOAuthSessionId sessionId;
}

final class Sub2ApiAdminOAuthCodeExchangeRequest {
  const Sub2ApiAdminOAuthCodeExchangeRequest({
    required this.sessionId,
    required this.code,
    this.proxyId,
  });

  final Sub2ApiAdminOAuthSessionId sessionId;
  final Sub2ApiOAuthAuthorizationCode code;
  final int? proxyId;
}

final class Sub2ApiAdminOAuthCookieExchangeRequest {
  const Sub2ApiAdminOAuthCookieExchangeRequest({
    required this.sessionKey,
    this.proxyId,
  });

  final Sub2ApiOAuthCookieSessionKey sessionKey;
  final int? proxyId;
}

final class Sub2ApiAdminOAuthTokenInfo {
  const Sub2ApiAdminOAuthTokenInfo({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.expiresAt,
    required this.scope,
    required this.organizationUuid,
    required this.accountUuid,
    required this.emailAddress,
    this.refreshToken,
  });

  final Sub2ApiAccessToken accessToken;
  final String tokenType;
  final Duration expiresIn;
  final DateTime expiresAt;
  final Sub2ApiRefreshToken? refreshToken;
  final String scope;
  final String organizationUuid;
  final String accountUuid;
  final String emailAddress;
}

final class Sub2ApiAdminAccountBatchUsage {
  Sub2ApiAdminAccountBatchUsage({
    required Map<int, Sub2ApiAdminAccountUsage> usage,
    required Map<int, String> errors,
  }) : usage = Map.unmodifiable(usage),
       errors = Map.unmodifiable(errors);

  final Map<int, Sub2ApiAdminAccountUsage> usage;
  final Map<int, String> errors;
}

final class Sub2ApiAdminAccountBatchTodayStats {
  Sub2ApiAdminAccountBatchTodayStats(
    Map<int, Sub2ApiAdminAccountTodayStats> stats,
  ) : stats = Map.unmodifiable(stats);

  final Map<int, Sub2ApiAdminAccountTodayStats> stats;
}

final class Sub2ApiAdminMixedChannelRiskDetails {
  const Sub2ApiAdminMixedChannelRiskDetails({
    required this.groupId,
    required this.groupName,
    required this.currentPlatform,
    required this.otherPlatform,
  });

  final int groupId;
  final String groupName;
  final String currentPlatform;
  final String otherPlatform;
}

final class Sub2ApiAdminMixedChannelCheck {
  const Sub2ApiAdminMixedChannelCheck({
    required this.hasRisk,
    required this.error,
    required this.message,
    this.details,
  });

  final bool hasRisk;
  final String error;
  final String message;
  final Sub2ApiAdminMixedChannelRiskDetails? details;
}

final class Sub2ApiAdminUpstreamBillingProbeData {
  const Sub2ApiAdminUpstreamBillingProbeData({
    required this.object,
    required this.schemaVersion,
    required this.billingScope,
    required this.observedAt,
    this.groupRateMultiplier,
    this.userRateMultiplier,
    this.resolvedRateMultiplier,
    this.peakRateEnabled,
    this.peakStart,
    this.peakEnd,
    this.peakRateMultiplier,
    this.appliedPeakMultiplier,
    this.effectiveRateMultiplier,
    this.timezone,
  });

  final String object;
  final int schemaVersion;
  final String billingScope;
  final Sub2ApiDecimal? groupRateMultiplier;
  final Sub2ApiDecimal? userRateMultiplier;
  final Sub2ApiDecimal? resolvedRateMultiplier;
  final bool? peakRateEnabled;
  final String? peakStart;
  final String? peakEnd;
  final Sub2ApiDecimal? peakRateMultiplier;
  final Sub2ApiDecimal? appliedPeakMultiplier;
  final Sub2ApiDecimal? effectiveRateMultiplier;
  final String? timezone;
  final DateTime observedAt;
}

final class Sub2ApiAdminUpstreamBillingProbeSnapshot {
  const Sub2ApiAdminUpstreamBillingProbeSnapshot({
    required this.status,
    required this.lastAttemptAt,
    required this.nextProbeAt,
    required this.failureCount,
    required this.httpStatus,
    required this.lastError,
    this.data,
    this.receivedAt,
    this.freshUntil,
    this.syncedRateMultiplier,
  });

  final String status;
  final Sub2ApiAdminUpstreamBillingProbeData? data;
  final DateTime? receivedAt;
  final DateTime? freshUntil;
  final DateTime lastAttemptAt;
  final DateTime nextProbeAt;
  final int failureCount;
  final int httpStatus;
  final String lastError;
  final Sub2ApiDecimal? syncedRateMultiplier;
}

final class Sub2ApiAdminUpstreamBillingProbeResult {
  const Sub2ApiAdminUpstreamBillingProbeResult({
    required this.accountId,
    required this.error,
    this.snapshot,
  });

  final int accountId;
  final Sub2ApiAdminUpstreamBillingProbeSnapshot? snapshot;
  final String error;
}

final class Sub2ApiAdminUpstreamBillingProbeBatchResult {
  Sub2ApiAdminUpstreamBillingProbeBatchResult(
    List<Sub2ApiAdminUpstreamBillingProbeResult> results,
  ) : results = List.unmodifiable(results);

  final List<Sub2ApiAdminUpstreamBillingProbeResult> results;
}
