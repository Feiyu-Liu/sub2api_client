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
