import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';
import '../usage/sub2api_usage_models.dart';
import 'sub2api_admin_models.dart';

typedef Sub2ApiAdminUsagePage = Sub2ApiPage<Sub2ApiAdminUsageRecord>;
typedef Sub2ApiAdminUsageCleanupTaskPage =
    Sub2ApiPage<Sub2ApiAdminUsageCleanupTask>;

enum Sub2ApiAdminUsageStatsPeriod { today, week, month }

enum Sub2ApiAdminUsageSortOrder { ascending, descending }

enum Sub2ApiAdminUsageCleanupStatus {
  pending,
  running,
  succeeded,
  failed,
  canceled,
}

final class Sub2ApiAdminUsageQuery {
  const Sub2ApiAdminUsageQuery({
    this.page = 1,
    this.pageSize = 20,
    this.exactTotal = false,
    this.userId,
    this.apiKeyId,
    this.accountId,
    this.groupId,
    this.requestId,
    this.model,
    this.requestType,
    this.stream,
    this.billingType,
    this.billingMode,
    this.upstreamModelMismatch,
    this.startDate,
    this.endDate,
    this.timezone,
    this.sortBy = 'created_at',
    this.sortOrder = Sub2ApiAdminUsageSortOrder.descending,
  });

  final int page;
  final int pageSize;
  final bool exactTotal;
  final int? userId;
  final int? apiKeyId;
  final int? accountId;
  final int? groupId;
  final String? requestId;
  final String? model;
  final Sub2ApiAdminUsageRequestType? requestType;
  final bool? stream;
  final Sub2ApiAdminBillingType? billingType;
  final String? billingMode;
  final bool? upstreamModelMismatch;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? timezone;
  final String sortBy;
  final Sub2ApiAdminUsageSortOrder sortOrder;
}

final class Sub2ApiAdminUsageStatsQuery {
  const Sub2ApiAdminUsageStatsQuery({
    this.userId,
    this.apiKeyId,
    this.accountId,
    this.groupId,
    this.model,
    this.requestType,
    this.stream,
    this.billingType,
    this.billingMode,
    this.upstreamModelMismatch,
    this.startDate,
    this.endDate,
    this.period = Sub2ApiAdminUsageStatsPeriod.today,
    this.timezone,
    this.bypassCache = false,
  });

  final int? userId;
  final int? apiKeyId;
  final int? accountId;
  final int? groupId;
  final String? model;
  final Sub2ApiAdminUsageRequestType? requestType;
  final bool? stream;
  final Sub2ApiAdminBillingType? billingType;
  final String? billingMode;
  final bool? upstreamModelMismatch;
  final DateTime? startDate;
  final DateTime? endDate;
  final Sub2ApiAdminUsageStatsPeriod period;
  final String? timezone;
  final bool bypassCache;
}

final class Sub2ApiAdminUsageRecord {
  const Sub2ApiAdminUsageRecord({
    required this.usage,
    required this.imageInputTokens,
    required this.imageInputCost,
    this.sessionId,
    this.upstreamModel,
    this.upstreamResponseModel,
    this.upstreamModelMismatch,
    this.channelId,
    this.modelMappingChain,
    this.billingTier,
    this.accountRateMultiplier,
    this.accountStatsCost,
    this.account,
  });

  final Sub2ApiUsageRecord usage;
  final int imageInputTokens;
  final Sub2ApiDecimal imageInputCost;
  final String? sessionId;
  final String? upstreamModel;
  final String? upstreamResponseModel;
  final bool? upstreamModelMismatch;
  final int? channelId;
  final String? modelMappingChain;
  final String? billingTier;
  final Sub2ApiDecimal? accountRateMultiplier;
  final Sub2ApiDecimal? accountStatsCost;
  final Sub2ApiAdminUsageAccountSummary? account;
}

final class Sub2ApiAdminUsageAccountSummary {
  const Sub2ApiAdminUsageAccountSummary({required this.id, required this.name});

  final int id;
  final String name;
}

final class Sub2ApiAdminUsageStats {
  Sub2ApiAdminUsageStats({
    required this.usage,
    required List<Sub2ApiAdminUsageEndpointStat> endpoints,
    required List<Sub2ApiAdminUsageEndpointStat> upstreamEndpoints,
    required List<Sub2ApiAdminUsageEndpointStat> endpointPaths,
    this.totalAccountCost,
  }) : endpoints = List.unmodifiable(endpoints),
       upstreamEndpoints = List.unmodifiable(upstreamEndpoints),
       endpointPaths = List.unmodifiable(endpointPaths);

  final Sub2ApiUsageStats usage;
  final Sub2ApiDecimal? totalAccountCost;
  final List<Sub2ApiAdminUsageEndpointStat> endpoints;
  final List<Sub2ApiAdminUsageEndpointStat> upstreamEndpoints;
  final List<Sub2ApiAdminUsageEndpointStat> endpointPaths;
}

final class Sub2ApiAdminUsageEndpointStat {
  const Sub2ApiAdminUsageEndpointStat({
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

final class Sub2ApiAdminUsageUserSearchResult {
  const Sub2ApiAdminUsageUserSearchResult({
    required this.id,
    required this.email,
    required this.deleted,
  });

  final int id;
  final String email;
  final bool deleted;
}

final class Sub2ApiAdminUsageApiKeySearchResult {
  const Sub2ApiAdminUsageApiKeySearchResult({
    required this.id,
    required this.name,
    required this.userId,
  });

  final int id;
  final String name;
  final int userId;
}

final class Sub2ApiAdminUsageCleanupFilters {
  const Sub2ApiAdminUsageCleanupFilters({
    required this.startTime,
    required this.endTime,
    this.userId,
    this.apiKeyId,
    this.accountId,
    this.groupId,
    this.model,
    this.requestType,
    this.stream,
    this.billingType,
  });

  final DateTime startTime;
  final DateTime endTime;
  final int? userId;
  final int? apiKeyId;
  final int? accountId;
  final int? groupId;
  final String? model;
  final Sub2ApiAdminUsageRequestType? requestType;
  final bool? stream;
  final Sub2ApiAdminBillingType? billingType;
}

final class Sub2ApiAdminUsageCleanupTask {
  const Sub2ApiAdminUsageCleanupTask({
    required this.id,
    required this.status,
    required this.filters,
    required this.createdBy,
    required this.deletedRows,
    required this.createdAt,
    required this.updatedAt,
    this.errorMessage,
    this.canceledBy,
    this.canceledAt,
    this.startedAt,
    this.finishedAt,
  });

  final int id;
  final Sub2ApiAdminUsageCleanupStatus status;
  final Sub2ApiAdminUsageCleanupFilters filters;
  final int createdBy;
  final int deletedRows;
  final String? errorMessage;
  final int? canceledBy;
  final DateTime? canceledAt;
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
}

final class Sub2ApiAdminCreateUsageCleanupTaskRequest {
  const Sub2ApiAdminCreateUsageCleanupTaskRequest({
    required this.idempotencyKey,
    required this.startDate,
    required this.endDate,
    this.userId,
    this.apiKeyId,
    this.accountId,
    this.groupId,
    this.model,
    this.requestType,
    this.stream,
    this.billingType,
    this.timezone,
  });

  final String idempotencyKey;
  final DateTime startDate;
  final DateTime endDate;
  final int? userId;
  final int? apiKeyId;
  final int? accountId;
  final int? groupId;
  final String? model;
  final Sub2ApiAdminUsageRequestType? requestType;
  final bool? stream;
  final Sub2ApiAdminBillingType? billingType;
  final String? timezone;
}

final class Sub2ApiAdminCancelUsageCleanupTaskResult {
  const Sub2ApiAdminCancelUsageCleanupTaskResult({
    required this.id,
    required this.status,
  });

  final int id;
  final Sub2ApiAdminUsageCleanupStatus status;
}
