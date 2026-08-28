import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';

typedef Sub2ApiAdminRiskControlLogPage =
    Sub2ApiPage<Sub2ApiAdminRiskControlLog>;

enum Sub2ApiAdminRiskControlMode { off, observe, preBlock }

enum Sub2ApiAdminRiskControlApiKeysMode { append, replace }

enum Sub2ApiAdminRiskControlKeywordMode { keywordOnly, keywordAndApi, apiOnly }

enum Sub2ApiAdminRiskControlModelFilterType { all, include, exclude }

enum Sub2ApiAdminRiskControlAction {
  allow,
  block,
  hashBlock,
  keywordBlock,
  error,
  cyberPolicy,
}

final class Sub2ApiAdminRiskControlHash {
  const Sub2ApiAdminRiskControlHash(this.value);
  final String value;
}

final class Sub2ApiAdminRiskControlModelFilter {
  Sub2ApiAdminRiskControlModelFilter({
    required this.type,
    List<String> models = const [],
  }) : models = List.unmodifiable(models);

  final Sub2ApiAdminRiskControlModelFilterType type;
  final List<String> models;
}

final class Sub2ApiAdminRiskControlApiKeyStatus {
  const Sub2ApiAdminRiskControlApiKeyStatus({
    required this.index,
    required this.keyHash,
    required this.masked,
    required this.status,
    required this.failureCount,
    required this.successCount,
    required this.lastError,
    required this.lastLatencyMs,
    required this.lastHttpStatus,
    required this.lastTested,
    required this.configured,
    this.lastCheckedAt,
    this.frozenUntil,
  });

  final int index;
  final Sub2ApiAdminRiskControlHash keyHash;
  final Sub2ApiAdminMaskedCredential masked;
  final String status;
  final int failureCount;
  final int successCount;
  final String lastError;
  final DateTime? lastCheckedAt;
  final DateTime? frozenUntil;
  final int lastLatencyMs;
  final int lastHttpStatus;
  final bool lastTested;
  final bool configured;
}

final class Sub2ApiAdminRiskControlApiKeyLoad {
  const Sub2ApiAdminRiskControlApiKeyLoad({
    required this.index,
    required this.keyHash,
    required this.masked,
    required this.status,
    required this.active,
    required this.total,
    required this.success,
    required this.errors,
    required this.averageLatencyMs,
    required this.lastLatencyMs,
    required this.lastHttpStatus,
  });

  final int index;
  final Sub2ApiAdminRiskControlHash keyHash;
  final Sub2ApiAdminMaskedCredential masked;
  final String status;
  final int active;
  final int total;
  final int success;
  final int errors;
  final int averageLatencyMs;
  final int lastLatencyMs;
  final int lastHttpStatus;
}

final class Sub2ApiAdminRiskControlConfig {
  Sub2ApiAdminRiskControlConfig({
    required this.enabled,
    required this.mode,
    required this.baseUrl,
    required this.model,
    required this.proxyId,
    required this.apiKeyConfigured,
    required this.apiKeyMasked,
    required this.apiKeyCount,
    required List<Sub2ApiAdminMaskedCredential> apiKeyMasks,
    required List<Sub2ApiAdminRiskControlApiKeyStatus> apiKeyStatuses,
    required this.timeoutMs,
    required this.sampleRate,
    required this.allGroups,
    required List<int> groupIds,
    required this.recordNonHits,
    required Map<String, Sub2ApiDecimal> thresholds,
    required this.workerCount,
    required this.queueSize,
    required this.blockStatus,
    required this.blockMessage,
    required this.emailOnHit,
    required this.autoBanEnabled,
    required this.banThreshold,
    required this.violationWindowHours,
    required this.retryCount,
    required this.hitRetentionDays,
    required this.nonHitRetentionDays,
    required this.preHashCheckEnabled,
    required List<String> blockedKeywords,
    required this.keywordBlockingMode,
    required this.modelFilter,
    required this.cyberPolicyExcludeFromBanCount,
  }) : apiKeyMasks = List.unmodifiable(apiKeyMasks),
       apiKeyStatuses = List.unmodifiable(apiKeyStatuses),
       groupIds = List.unmodifiable(groupIds),
       thresholds = Map.unmodifiable(thresholds),
       blockedKeywords = List.unmodifiable(blockedKeywords);

  final bool enabled;
  final Sub2ApiAdminRiskControlMode mode;
  final Uri baseUrl;
  final String model;
  final int? proxyId;
  final bool apiKeyConfigured;
  final Sub2ApiAdminMaskedCredential apiKeyMasked;
  final int apiKeyCount;
  final List<Sub2ApiAdminMaskedCredential> apiKeyMasks;
  final List<Sub2ApiAdminRiskControlApiKeyStatus> apiKeyStatuses;
  final int timeoutMs;
  final int sampleRate;
  final bool allGroups;
  final List<int> groupIds;
  final bool recordNonHits;
  final Map<String, Sub2ApiDecimal> thresholds;
  final int workerCount;
  final int queueSize;
  final int blockStatus;
  final String blockMessage;
  final bool emailOnHit;
  final bool autoBanEnabled;
  final int banThreshold;
  final int violationWindowHours;
  final int retryCount;
  final int hitRetentionDays;
  final int nonHitRetentionDays;
  final bool preHashCheckEnabled;
  final List<String> blockedKeywords;
  final Sub2ApiAdminRiskControlKeywordMode keywordBlockingMode;
  final Sub2ApiAdminRiskControlModelFilter modelFilter;
  final bool cyberPolicyExcludeFromBanCount;
}

final class Sub2ApiAdminUpdateRiskControlConfigRequest {
  Sub2ApiAdminUpdateRiskControlConfigRequest({
    this.enabled,
    this.mode,
    this.baseUrl,
    this.model,
    this.proxyId,
    List<Sub2ApiAdminCredentialSecret>? apiKeys,
    this.apiKeysMode = Sub2ApiAdminRiskControlApiKeysMode.append,
    List<Sub2ApiAdminRiskControlHash>? deleteApiKeyHashes,
    this.clearApiKeys = false,
    this.timeoutMs,
    this.sampleRate,
    this.allGroups,
    List<int>? groupIds,
    this.recordNonHits,
    Map<String, Sub2ApiDecimal>? thresholds,
    this.workerCount,
    this.queueSize,
    this.blockStatus,
    this.blockMessage,
    this.emailOnHit,
    this.autoBanEnabled,
    this.banThreshold,
    this.violationWindowHours,
    this.retryCount,
    this.hitRetentionDays,
    this.nonHitRetentionDays,
    this.preHashCheckEnabled,
    List<String>? blockedKeywords,
    this.keywordBlockingMode,
    this.modelFilter,
    this.cyberPolicyExcludeFromBanCount,
  }) : apiKeys = apiKeys == null ? null : List.unmodifiable(apiKeys),
       deleteApiKeyHashes = deleteApiKeyHashes == null
           ? null
           : List.unmodifiable(deleteApiKeyHashes),
       groupIds = groupIds == null ? null : List.unmodifiable(groupIds),
       thresholds = thresholds == null ? null : Map.unmodifiable(thresholds),
       blockedKeywords = blockedKeywords == null
           ? null
           : List.unmodifiable(blockedKeywords);

  final bool? enabled;
  final Sub2ApiAdminRiskControlMode? mode;
  final Uri? baseUrl;
  final String? model;

  /// Positive ID selects a proxy; zero clears the proxy.
  final int? proxyId;
  final List<Sub2ApiAdminCredentialSecret>? apiKeys;
  final Sub2ApiAdminRiskControlApiKeysMode apiKeysMode;
  final List<Sub2ApiAdminRiskControlHash>? deleteApiKeyHashes;
  final bool clearApiKeys;
  final int? timeoutMs;
  final int? sampleRate;
  final bool? allGroups;
  final List<int>? groupIds;
  final bool? recordNonHits;
  final Map<String, Sub2ApiDecimal>? thresholds;
  final int? workerCount;
  final int? queueSize;
  final int? blockStatus;
  final String? blockMessage;
  final bool? emailOnHit;
  final bool? autoBanEnabled;
  final int? banThreshold;
  final int? violationWindowHours;
  final int? retryCount;
  final int? hitRetentionDays;
  final int? nonHitRetentionDays;
  final bool? preHashCheckEnabled;
  final List<String>? blockedKeywords;
  final Sub2ApiAdminRiskControlKeywordMode? keywordBlockingMode;
  final Sub2ApiAdminRiskControlModelFilter? modelFilter;
  final bool? cyberPolicyExcludeFromBanCount;
}

final class Sub2ApiAdminTestRiskControlApiKeysRequest {
  Sub2ApiAdminTestRiskControlApiKeysRequest({
    required List<Sub2ApiAdminCredentialSecret> apiKeys,
    required this.baseUrl,
    required this.model,
    required this.timeoutMs,
    this.proxyId,
    required this.prompt,
    List<Sub2ApiAdminModerationImage> images = const [],
  }) : apiKeys = List.unmodifiable(apiKeys),
       images = List.unmodifiable(images);

  final List<Sub2ApiAdminCredentialSecret> apiKeys;
  final Uri baseUrl;
  final String model;
  final int timeoutMs;
  final int? proxyId;
  final Sub2ApiAdminModerationPrompt prompt;
  final List<Sub2ApiAdminModerationImage> images;
}

final class Sub2ApiAdminRiskControlAuditResult {
  Sub2ApiAdminRiskControlAuditResult({
    required this.flagged,
    required this.highestCategory,
    required this.highestScore,
    required this.compositeScore,
    required Map<String, Sub2ApiDecimal> categoryScores,
    required Map<String, Sub2ApiDecimal> thresholds,
  }) : categoryScores = Map.unmodifiable(categoryScores),
       thresholds = Map.unmodifiable(thresholds);

  final bool flagged;
  final String highestCategory;
  final Sub2ApiDecimal highestScore;
  final Sub2ApiDecimal compositeScore;
  final Map<String, Sub2ApiDecimal> categoryScores;
  final Map<String, Sub2ApiDecimal> thresholds;
}

final class Sub2ApiAdminTestRiskControlApiKeysResult {
  Sub2ApiAdminTestRiskControlApiKeysResult({
    required List<Sub2ApiAdminRiskControlApiKeyStatus> items,
    required this.imageCount,
    this.auditResult,
  }) : items = List.unmodifiable(items);

  final List<Sub2ApiAdminRiskControlApiKeyStatus> items;
  final Sub2ApiAdminRiskControlAuditResult? auditResult;
  final int imageCount;
}

final class Sub2ApiAdminRiskControlStatus {
  Sub2ApiAdminRiskControlStatus({
    required this.enabled,
    required this.riskControlEnabled,
    required this.mode,
    required this.workerCount,
    required this.maxWorkers,
    required this.activeWorkers,
    required this.idleWorkers,
    required this.queueSize,
    required this.queueLength,
    required this.queueUsagePercent,
    required this.enqueued,
    required this.dropped,
    required this.processed,
    required this.errors,
    required this.preBlockActive,
    required this.preBlockChecked,
    required this.preBlockAllowed,
    required this.preBlockBlocked,
    required this.preBlockErrors,
    required this.preBlockAverageLatencyMs,
    required this.preBlockApiKeyActive,
    required this.preBlockApiKeyAvailableCount,
    required this.preBlockApiKeyTotalCalls,
    required List<Sub2ApiAdminRiskControlApiKeyLoad> preBlockApiKeyLoads,
    required List<Sub2ApiAdminRiskControlApiKeyStatus> apiKeyStatuses,
    required this.flaggedHashCount,
    required this.lastCleanupDeletedHit,
    required this.lastCleanupDeletedNonHit,
    this.lastCleanupAt,
  }) : preBlockApiKeyLoads = List.unmodifiable(preBlockApiKeyLoads),
       apiKeyStatuses = List.unmodifiable(apiKeyStatuses);

  final bool enabled;
  final bool riskControlEnabled;
  final Sub2ApiAdminRiskControlMode mode;
  final int workerCount;
  final int maxWorkers;
  final int activeWorkers;
  final int idleWorkers;
  final int queueSize;
  final int queueLength;
  final Sub2ApiDecimal queueUsagePercent;
  final int enqueued;
  final int dropped;
  final int processed;
  final int errors;
  final int preBlockActive;
  final int preBlockChecked;
  final int preBlockAllowed;
  final int preBlockBlocked;
  final int preBlockErrors;
  final int preBlockAverageLatencyMs;
  final int preBlockApiKeyActive;
  final int preBlockApiKeyAvailableCount;
  final int preBlockApiKeyTotalCalls;
  final List<Sub2ApiAdminRiskControlApiKeyLoad> preBlockApiKeyLoads;
  final List<Sub2ApiAdminRiskControlApiKeyStatus> apiKeyStatuses;
  final int flaggedHashCount;
  final DateTime? lastCleanupAt;
  final int lastCleanupDeletedHit;
  final int lastCleanupDeletedNonHit;
}

final class Sub2ApiAdminRiskControlLogQuery {
  const Sub2ApiAdminRiskControlLogQuery({
    this.page = 1,
    this.pageSize = 20,
    this.result,
    this.groupId,
    this.endpoint,
    this.search,
    this.from,
    this.to,
  });

  final int page;
  final int pageSize;
  final Sub2ApiAdminRiskControlAction? result;
  final int? groupId;
  final String? endpoint;
  final String? search;
  final DateTime? from;
  final DateTime? to;
}

final class Sub2ApiAdminRiskControlLog {
  Sub2ApiAdminRiskControlLog({
    required this.id,
    required this.requestId,
    required this.userId,
    required this.userEmail,
    required this.apiKeyId,
    required this.apiKeyName,
    required this.groupId,
    required this.groupName,
    required this.endpoint,
    required this.provider,
    required this.model,
    required this.mode,
    required this.action,
    required this.flagged,
    required this.highestCategory,
    required this.highestScore,
    required this.matchedKeyword,
    required Map<String, Sub2ApiDecimal> categoryScores,
    required Map<String, Sub2ApiDecimal> thresholdSnapshot,
    required this.inputExcerpt,
    required this.upstreamLatencyMs,
    required this.error,
    required this.violationCount,
    required this.autoBanned,
    required this.emailSent,
    required this.userStatus,
    required this.queueDelayMs,
    required this.createdAt,
  }) : categoryScores = Map.unmodifiable(categoryScores),
       thresholdSnapshot = Map.unmodifiable(thresholdSnapshot);

  final int id;
  final String requestId;
  final int? userId;
  final String userEmail;
  final int? apiKeyId;
  final String apiKeyName;
  final int? groupId;
  final String groupName;
  final String endpoint;
  final String provider;
  final String model;
  final Sub2ApiAdminRiskControlMode mode;
  final Sub2ApiAdminRiskControlAction action;
  final bool flagged;
  final String highestCategory;
  final Sub2ApiDecimal highestScore;
  final String matchedKeyword;
  final Map<String, Sub2ApiDecimal> categoryScores;
  final Map<String, Sub2ApiDecimal> thresholdSnapshot;
  final Sub2ApiAdminModerationExcerpt inputExcerpt;
  final int? upstreamLatencyMs;
  final String error;
  final int violationCount;
  final bool autoBanned;
  final bool emailSent;
  final String userStatus;
  final int? queueDelayMs;
  final DateTime createdAt;
}

final class Sub2ApiAdminRiskControlUnbanResult {
  const Sub2ApiAdminRiskControlUnbanResult({
    required this.userId,
    required this.status,
  });
  final int userId;
  final String status;
}

final class Sub2ApiAdminRiskControlDeleteHashResult {
  const Sub2ApiAdminRiskControlDeleteHashResult({
    required this.inputHash,
    required this.deleted,
  });
  final Sub2ApiAdminRiskControlHash inputHash;
  final bool deleted;
}

final class Sub2ApiAdminRiskControlClearHashesResult {
  const Sub2ApiAdminRiskControlClearHashesResult({required this.deleted});
  final int deleted;
}
