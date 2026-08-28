import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_page.dart';
import 'sub2api_admin_ops_dashboard_models.dart';

enum Sub2ApiAdminOpsIngressRejectReason {
  queryApiKeyDeprecated,
  apiKeyRequired,
  invalidApiKey,
  invalidAuthRateLimited,
  apiKeyAuthOverloaded,
  apiKeyDisabled,
  ipRestricted,
  userInactive,
  groupDeleted,
  groupDisabled,
  groupNotAllowed,
  groupUnassigned,
  other,
}

enum Sub2ApiAdminOpsIngressRouteFamily {
  antigravity,
  gemini,
  codex,
  messages,
  responses,
  chatCompletions,
  images,
  videos,
  embeddings,
  models,
  other,
}

enum Sub2ApiAdminOpsIngressProtocol {
  google,
  anthropic,
  openai,
  gateway,
  other,
}

final class Sub2ApiAdminOpsIngressRejectQuery {
  const Sub2ApiAdminOpsIngressRejectQuery({
    this.page = 1,
    this.pageSize = 20,
    this.timeRange = Sub2ApiAdminOpsTimeRange.oneHour,
    this.startAt,
    this.endAt,
    this.reason,
    this.routeFamily,
    this.protocol,
    this.clientAddress,
    this.userId,
    this.apiKeyId,
  });

  final int page;
  final int pageSize;
  final Sub2ApiAdminOpsTimeRange timeRange;
  final DateTime? startAt;
  final DateTime? endAt;
  final Sub2ApiAdminOpsIngressRejectReason? reason;
  final Sub2ApiAdminOpsIngressRouteFamily? routeFamily;
  final Sub2ApiAdminOpsIngressProtocol? protocol;
  final String? clientAddress;
  final int? userId;
  final int? apiKeyId;
}

typedef Sub2ApiAdminOpsIngressRejectPage =
    Sub2ApiPage<Sub2ApiAdminOpsIngressRejectRecord>;

final class Sub2ApiAdminOpsIngressRejectRecord {
  const Sub2ApiAdminOpsIngressRejectRecord({
    required this.id,
    required this.bucketStart,
    required this.reason,
    required this.routeFamily,
    required this.protocol,
    this.clientAddress,
    this.userId,
    this.apiKeyId,
    required this.requestCount,
    required this.firstSeen,
    required this.lastSeen,
  });

  final int id;
  final DateTime bucketStart;
  final Sub2ApiAdminOpsIngressRejectReason reason;
  final Sub2ApiAdminOpsIngressRouteFamily routeFamily;
  final Sub2ApiAdminOpsIngressProtocol protocol;
  final Sub2ApiAdminOpsClientAddress? clientAddress;
  final int? userId;
  final int? apiKeyId;
  final int requestCount;
  final DateTime firstSeen;
  final DateTime lastSeen;
}

final class Sub2ApiAdminOpsIngressRejectHealth {
  const Sub2ApiAdminOpsIngressRejectHealth({
    required this.cardinality,
    required this.capacity,
    required this.pendingBatches,
    required this.pendingRows,
    required this.overflowedCount,
    required this.droppedCount,
    required this.flushedRequestCount,
    required this.flushFailureCount,
    required this.accepting,
    required this.lastError,
  });

  final int cardinality;
  final int capacity;
  final int pendingBatches;
  final int pendingRows;
  final int overflowedCount;
  final int droppedCount;
  final int flushedRequestCount;
  final int flushFailureCount;
  final bool accepting;
  final String lastError;
}

final class Sub2ApiAdminOpsAuthCacheOutboxHealth {
  const Sub2ApiAdminOpsAuthCacheOutboxHealth({
    required this.running,
    required this.processed,
    required this.failures,
    required this.pending,
    required this.oldestLag,
    required this.lastError,
    required this.statsError,
    required this.healthySla,
    required this.recoverySla,
    required this.maxAttempts,
  });

  final bool running;
  final int processed;
  final int failures;
  final int pending;
  final Duration oldestLag;
  final String lastError;
  final String statsError;
  final Duration healthySla;
  final Duration recoverySla;
  final int maxAttempts;
}

final class Sub2ApiAdminOpsAuthCacheSubscriberHealth {
  const Sub2ApiAdminOpsAuthCacheSubscriberHealth({
    required this.connected,
    required this.failures,
  });

  final bool connected;
  final int failures;
}

final class Sub2ApiAdminOpsAuthLookupHealth {
  const Sub2ApiAdminOpsAuthLookupHealth({
    required this.total,
    required this.rejected,
    required this.inFlight,
    required this.capacity,
  });

  final int total;
  final int rejected;
  final int inFlight;
  final int capacity;
}

final class Sub2ApiAdminOpsInvalidAuthAbuseHealth {
  const Sub2ApiAdminOpsInvalidAuthAbuseHealth({
    required this.enabled,
    required this.tracked,
    required this.capacity,
    required this.recorded,
    required this.blocks,
    required this.rejected,
    required this.expired,
    required this.overflowed,
    required this.globalBlocked,
  });

  final bool enabled;
  final int tracked;
  final int capacity;
  final int recorded;
  final int blocks;
  final int rejected;
  final int expired;
  final int overflowed;
  final int globalBlocked;
}

final class Sub2ApiAdminOpsAuthCacheInvalidationHealth {
  const Sub2ApiAdminOpsAuthCacheInvalidationHealth({
    required this.outbox,
    required this.subscriber,
    required this.lookup,
    required this.invalidAbuse,
  });

  final Sub2ApiAdminOpsAuthCacheOutboxHealth outbox;
  final Sub2ApiAdminOpsAuthCacheSubscriberHealth subscriber;
  final Sub2ApiAdminOpsAuthLookupHealth lookup;
  final Sub2ApiAdminOpsInvalidAuthAbuseHealth invalidAbuse;
}

final class Sub2ApiAdminOpsSystemLogFilter {
  const Sub2ApiAdminOpsSystemLogFilter({
    this.startAt,
    this.endAt,
    this.host,
    this.level,
    this.component,
    this.requestId,
    this.clientRequestId,
    this.userId,
    this.apiKeyId,
    this.accountId,
    this.platform,
    this.model,
    this.query,
  });

  final DateTime? startAt;
  final DateTime? endAt;
  final String? host;
  final String? level;
  final String? component;
  final String? requestId;
  final String? clientRequestId;
  final int? userId;
  final int? apiKeyId;
  final int? accountId;
  final String? platform;
  final String? model;
  final String? query;
}

final class Sub2ApiAdminOpsSystemLogQuery {
  const Sub2ApiAdminOpsSystemLogQuery({
    this.page = 1,
    this.pageSize = 20,
    this.timeRange = Sub2ApiAdminOpsTimeRange.oneHour,
    this.filter = const Sub2ApiAdminOpsSystemLogFilter(),
  });

  final int page;
  final int pageSize;
  final Sub2ApiAdminOpsTimeRange timeRange;
  final Sub2ApiAdminOpsSystemLogFilter filter;
}

typedef Sub2ApiAdminOpsSystemLogPage =
    Sub2ApiPage<Sub2ApiAdminOpsSystemLogRecord>;

final class Sub2ApiAdminOpsSystemLogRecord {
  const Sub2ApiAdminOpsSystemLogRecord({
    required this.id,
    required this.createdAt,
    required this.host,
    required this.level,
    required this.component,
    required this.message,
    required this.requestId,
    required this.clientRequestId,
    this.userId,
    this.apiKeyId,
    this.accountId,
    required this.platform,
    required this.model,
    this.extra,
  });

  final int id;
  final DateTime createdAt;
  final String host;
  final String level;
  final String component;
  final Sub2ApiAdminOpsSystemLogContent message;
  final String requestId;
  final String clientRequestId;
  final int? userId;
  final int? apiKeyId;
  final int? accountId;
  final String platform;
  final String model;
  final Sub2ApiAdminOpsSystemLogContent? extra;
}

final class Sub2ApiAdminOpsSystemLogCleanupRequest {
  const Sub2ApiAdminOpsSystemLogCleanupRequest({required this.filter});

  final Sub2ApiAdminOpsSystemLogFilter filter;
}

final class Sub2ApiAdminOpsSystemLogCleanupResult {
  const Sub2ApiAdminOpsSystemLogCleanupResult({required this.deleted});

  final int deleted;
}

final class Sub2ApiAdminOpsSystemLogSinkHealth {
  const Sub2ApiAdminOpsSystemLogSinkHealth({
    required this.queueDepth,
    required this.queueCapacity,
    required this.droppedCount,
    required this.writeFailedCount,
    required this.writtenCount,
    required this.averageWriteDelay,
    required this.lastError,
  });

  final int queueDepth;
  final int queueCapacity;
  final int droppedCount;
  final int writeFailedCount;
  final int writtenCount;
  final Duration averageWriteDelay;
  final String lastError;
}
