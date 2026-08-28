import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';

typedef Sub2ApiAdminPromptAuditEventPage =
    Sub2ApiPage<Sub2ApiAdminPromptAuditEvent>;

enum Sub2ApiAdminPromptAuditMode { off, asyncAudit, blocking }

enum Sub2ApiAdminPromptAuditDecision { pass, flag, critical }

enum Sub2ApiAdminPromptAuditRiskLevel { low, medium, high, critical }

enum Sub2ApiAdminPromptAuditAction { allow, warn, block }

enum Sub2ApiAdminPromptAuditStrategy { priority }

final class Sub2ApiAdminPromptAuditHash {
  const Sub2ApiAdminPromptAuditHash(this.value);
  final String value;
}

final class Sub2ApiAdminPromptAuditEndpoint {
  const Sub2ApiAdminPromptAuditEndpoint({
    required this.id,
    required this.name,
    required this.protocol,
    required this.baseUrl,
    required this.model,
    required this.timeout,
    required this.inputLimit,
    required this.enabled,
    required this.hasToken,
    required this.tokenStatus,
  });
  final String id;
  final String name;
  final String protocol;
  final Uri baseUrl;
  final String model;
  final Duration timeout;
  final int inputLimit;
  final bool enabled;
  final bool hasToken;
  final String tokenStatus;
}

final class Sub2ApiAdminPromptAuditConfig {
  Sub2ApiAdminPromptAuditConfig({
    required this.enabled,
    required this.blockingEnabled,
    required this.blockingLatestTurnOnly,
    required this.storePassEvents,
    required this.effectiveMode,
    required this.strategy,
    required this.workerCount,
    required this.queueCapacity,
    required List<String> scanners,
    required this.allGroups,
    required List<int> groupIds,
    required List<Sub2ApiAdminPromptAuditEndpoint> endpoints,
    required this.configVersion,
    required this.updatedAt,
    required this.updatedBy,
    required this.changeSummary,
  }) : scanners = List.unmodifiable(scanners),
       groupIds = List.unmodifiable(groupIds),
       endpoints = List.unmodifiable(endpoints);
  final bool enabled;
  final bool blockingEnabled;
  final bool blockingLatestTurnOnly;
  final bool storePassEvents;
  final Sub2ApiAdminPromptAuditMode effectiveMode;
  final Sub2ApiAdminPromptAuditStrategy strategy;
  final int workerCount;
  final int queueCapacity;
  final List<String> scanners;
  final bool allGroups;
  final List<int> groupIds;
  final List<Sub2ApiAdminPromptAuditEndpoint> endpoints;
  final int configVersion;
  final DateTime updatedAt;
  final int updatedBy;
  final String changeSummary;
}

final class Sub2ApiAdminPromptAuditEndpointUpdate {
  const Sub2ApiAdminPromptAuditEndpointUpdate({
    required this.id,
    required this.name,
    required this.baseUrl,
    this.protocol = 'openai_compatible',
    this.model = 'sileader/qwen3guard:0.6b',
    this.token,
    this.clearToken = false,
    this.timeout = const Duration(seconds: 3),
    this.inputLimit = 4000,
    this.enabled = true,
  });
  final String id;
  final String name;
  final String protocol;
  final Uri baseUrl;
  final String model;
  final Sub2ApiAdminPromptAuditEndpointToken? token;
  final bool clearToken;
  final Duration timeout;
  final int inputLimit;
  final bool enabled;
}

final class Sub2ApiAdminUpdatePromptAuditConfigRequest {
  Sub2ApiAdminUpdatePromptAuditConfigRequest({
    required this.expectedConfigVersion,
    required this.enabled,
    required this.blockingEnabled,
    required this.blockingLatestTurnOnly,
    required this.storePassEvents,
    this.strategy = Sub2ApiAdminPromptAuditStrategy.priority,
    required this.workerCount,
    required this.queueCapacity,
    required List<String> scanners,
    required this.allGroups,
    required List<int> groupIds,
    required List<Sub2ApiAdminPromptAuditEndpointUpdate> endpoints,
  }) : scanners = List.unmodifiable(scanners),
       groupIds = List.unmodifiable(groupIds),
       endpoints = List.unmodifiable(endpoints);
  final int expectedConfigVersion;
  final bool enabled;
  final bool blockingEnabled;
  final bool blockingLatestTurnOnly;
  final bool storePassEvents;
  final Sub2ApiAdminPromptAuditStrategy strategy;
  final int workerCount;
  final int queueCapacity;
  final List<String> scanners;
  final bool allGroups;
  final List<int> groupIds;
  final List<Sub2ApiAdminPromptAuditEndpointUpdate> endpoints;
}

final class Sub2ApiAdminPromptAuditProbeRequest {
  const Sub2ApiAdminPromptAuditProbeRequest({required this.endpoint});
  final Sub2ApiAdminPromptAuditEndpointUpdate endpoint;
}

final class Sub2ApiAdminPromptAuditProbeResult {
  const Sub2ApiAdminPromptAuditProbeResult({
    required this.ok,
    required this.status,
    required this.errorCode,
    required this.message,
    required this.latency,
    required this.httpStatus,
    required this.retryable,
    required this.checkedAt,
    required this.tokenApplied,
  });
  final bool ok;
  final String status;
  final String errorCode;
  final String message;
  final Duration latency;
  final int httpStatus;
  final bool retryable;
  final DateTime checkedAt;
  final bool tokenApplied;
}

final class Sub2ApiAdminPromptAuditQueueStats {
  const Sub2ApiAdminPromptAuditQueueStats({
    required this.staging,
    required this.queued,
    required this.processing,
    required this.retry,
    required this.done,
    required this.failed,
    required this.active,
  });
  final int staging;
  final int queued;
  final int processing;
  final int retry;
  final int done;
  final int failed;
  final int active;
}

final class Sub2ApiAdminPromptAuditGuardMetrics {
  const Sub2ApiAdminPromptAuditGuardMetrics({
    required this.total,
    required this.allowed,
    required this.flagged,
    required this.blocked,
    required this.unavailable,
    required this.invalid,
    required this.timeouts,
    required this.failovers,
    required this.bulkheadFull,
    required this.recordFailed,
    required this.latencyCount,
    required this.latencyAverage,
    required this.latencyP50,
    required this.latencyP95,
    required this.latencyP99,
    required this.latencyMax,
  });
  final int total;
  final int allowed;
  final int flagged;
  final int blocked;
  final int unavailable;
  final int invalid;
  final int timeouts;
  final int failovers;
  final int bulkheadFull;
  final int recordFailed;
  final int latencyCount;
  final Duration latencyAverage;
  final Duration latencyP50;
  final Duration latencyP95;
  final Duration latencyP99;
  final Duration latencyMax;
}

final class Sub2ApiAdminPromptAuditRuntime {
  Sub2ApiAdminPromptAuditRuntime({
    required this.processStatus,
    required this.effectiveMode,
    required this.expectedConfigVersion,
    required this.activeConfigVersion,
    required this.configLoadedAt,
    required this.configLoadError,
    required this.workerTotal,
    required this.workerActive,
    required this.workerHeartbeatAt,
    required this.queueCapacity,
    required this.queue,
    required this.processedTotal,
    required this.failedTotal,
    required this.enqueuedTotal,
    required this.droppedTotal,
    required this.lastProcessedAt,
    required this.lastErrorCode,
    required this.lastErrorMessage,
    required this.databaseStatus,
    required this.redisStatus,
    required Map<String, Sub2ApiAdminPromptAuditProbeResult> endpoints,
    required this.guardMetrics,
  }) : endpoints = Map.unmodifiable(endpoints);
  final String processStatus;
  final Sub2ApiAdminPromptAuditMode effectiveMode;
  final int expectedConfigVersion;
  final int activeConfigVersion;
  final DateTime? configLoadedAt;
  final String configLoadError;
  final int workerTotal;
  final int workerActive;
  final DateTime? workerHeartbeatAt;
  final int queueCapacity;
  final Sub2ApiAdminPromptAuditQueueStats queue;
  final int processedTotal;
  final int failedTotal;
  final int enqueuedTotal;
  final int droppedTotal;
  final DateTime? lastProcessedAt;
  final String lastErrorCode;
  final String lastErrorMessage;
  final String databaseStatus;
  final String redisStatus;
  final Map<String, Sub2ApiAdminPromptAuditProbeResult> endpoints;
  final Sub2ApiAdminPromptAuditGuardMetrics guardMetrics;
}

final class Sub2ApiAdminPromptAuditEventFilter {
  const Sub2ApiAdminPromptAuditEventFilter({
    this.decision,
    this.riskLevel,
    this.endpoint,
    this.groupId,
    this.userId,
    this.apiKeyId,
    this.requestId,
    this.promptHash,
    this.keyword,
    this.startAt,
    this.endAt,
  });
  final Sub2ApiAdminPromptAuditDecision? decision;
  final Sub2ApiAdminPromptAuditRiskLevel? riskLevel;
  final String? endpoint;
  final int? groupId;
  final int? userId;
  final int? apiKeyId;
  final String? requestId;
  final Sub2ApiAdminPromptAuditHash? promptHash;
  final String? keyword;
  final DateTime? startAt;
  final DateTime? endAt;
}

final class Sub2ApiAdminPromptAuditEventQuery {
  const Sub2ApiAdminPromptAuditEventQuery({
    this.page = 1,
    this.pageSize = 20,
    this.filter = const Sub2ApiAdminPromptAuditEventFilter(),
  });
  final int page;
  final int pageSize;
  final Sub2ApiAdminPromptAuditEventFilter filter;
}

final class Sub2ApiAdminPromptAuditSnapshot {
  const Sub2ApiAdminPromptAuditSnapshot({
    required this.requestId,
    required this.userId,
    required this.username,
    required this.userEmail,
    required this.apiKeyId,
    required this.apiKeyName,
    required this.groupId,
    required this.groupName,
    required this.provider,
    required this.endpoint,
    required this.protocol,
    required this.model,
    required this.promptHash,
    required this.redactedPreview,
    required this.fullPrompt,
    required this.promptLength,
    required this.messageCount,
    required this.stage,
  });
  final String requestId;
  final int userId;
  final String username;
  final String userEmail;
  final int apiKeyId;
  final String apiKeyName;
  final int? groupId;
  final String groupName;
  final String provider;
  final String endpoint;
  final String protocol;
  final String model;
  final Sub2ApiAdminPromptAuditHash promptHash;
  final Sub2ApiAdminPromptAuditContent redactedPreview;
  final Sub2ApiAdminPromptAuditContent fullPrompt;
  final int promptLength;
  final int messageCount;
  final String stage;
}

final class Sub2ApiAdminPromptAuditIssue {
  const Sub2ApiAdminPromptAuditIssue({
    required this.category,
    required this.scannerId,
    required this.title,
    required this.description,
    required this.severity,
    required this.severityLabel,
    required this.action,
    required this.actionLabel,
    required this.code,
    required this.score,
    required this.evidence,
    required this.evidenceHash,
    this.startRune,
    this.endRune,
  });
  final String category;
  final String scannerId;
  final String title;
  final String description;
  final String severity;
  final String severityLabel;
  final String action;
  final String actionLabel;
  final String code;
  final Sub2ApiDecimal score;
  final Sub2ApiAdminPromptAuditEvidence evidence;
  final Sub2ApiAdminPromptAuditHash evidenceHash;
  final int? startRune;
  final int? endRune;
}

final class Sub2ApiAdminPromptAuditEvent {
  Sub2ApiAdminPromptAuditEvent({
    required this.id,
    required this.jobId,
    required this.snapshot,
    required this.decision,
    required this.riskLevel,
    required this.action,
    required List<String> categories,
    required List<String> matchedScanners,
    required Map<String, Sub2ApiDecimal> scannerScores,
    required Map<String, Sub2ApiAdminPromptAuditEvidence> scannerEvidence,
    required this.scannerBackend,
    required this.scannerVersion,
    required this.guardEndpointId,
    required this.policyId,
    required this.policyVersion,
    required this.configVersion,
    required this.chunkTotal,
    required this.latency,
    required List<Sub2ApiAdminPromptAuditIssue> issues,
    required this.createdAt,
  }) : categories = List.unmodifiable(categories),
       matchedScanners = List.unmodifiable(matchedScanners),
       scannerScores = Map.unmodifiable(scannerScores),
       scannerEvidence = Map.unmodifiable(scannerEvidence),
       issues = List.unmodifiable(issues);
  final int id;
  final int jobId;
  final Sub2ApiAdminPromptAuditSnapshot snapshot;
  final Sub2ApiAdminPromptAuditDecision decision;
  final Sub2ApiAdminPromptAuditRiskLevel riskLevel;
  final Sub2ApiAdminPromptAuditAction action;
  final List<String> categories;
  final List<String> matchedScanners;
  final Map<String, Sub2ApiDecimal> scannerScores;
  final Map<String, Sub2ApiAdminPromptAuditEvidence> scannerEvidence;
  final String scannerBackend;
  final String scannerVersion;
  final String guardEndpointId;
  final String policyId;
  final int policyVersion;
  final int configVersion;
  final int chunkTotal;
  final Duration latency;
  final List<Sub2ApiAdminPromptAuditIssue> issues;
  final DateTime createdAt;
}

final class Sub2ApiAdminPromptAuditDeleteResult {
  const Sub2ApiAdminPromptAuditDeleteResult({
    required this.deletedEvents,
    required this.deletedJobs,
  });
  final int deletedEvents;
  final int deletedJobs;
}

final class Sub2ApiAdminPromptAuditDeletePreview {
  const Sub2ApiAdminPromptAuditDeletePreview({
    required this.matchedCount,
    required this.filterSummary,
    required this.snapshotMaxId,
    required this.filterHash,
    required this.confirmationToken,
    required this.expiresAt,
  });
  final int matchedCount;
  final Sub2ApiAdminPromptAuditEventFilter filterSummary;
  final int snapshotMaxId;
  final Sub2ApiAdminPromptAuditHash filterHash;
  final Sub2ApiAdminPromptAuditDeleteToken confirmationToken;
  final DateTime expiresAt;
}

final class Sub2ApiAdminPromptAuditDeleteByFilterRequest {
  const Sub2ApiAdminPromptAuditDeleteByFilterRequest({
    required this.filter,
    required this.snapshotMaxId,
    required this.filterHash,
    required this.confirmationToken,
    this.confirm = true,
  });
  final Sub2ApiAdminPromptAuditEventFilter filter;
  final int snapshotMaxId;
  final Sub2ApiAdminPromptAuditHash filterHash;
  final Sub2ApiAdminPromptAuditDeleteToken confirmationToken;
  final bool confirm;
}
