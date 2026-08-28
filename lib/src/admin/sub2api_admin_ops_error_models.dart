import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_page.dart';
import 'sub2api_admin_ops_dashboard_models.dart';

typedef Sub2ApiAdminOpsErrorPage = Sub2ApiPage<Sub2ApiAdminOpsErrorRecord>;

enum Sub2ApiAdminOpsErrorView { errors, excluded, all }

enum Sub2ApiAdminOpsErrorSortBy { createdAt, model, statusCode }

enum Sub2ApiAdminOpsSortOrder { ascending, descending }

final class Sub2ApiAdminOpsErrorQuery {
  const Sub2ApiAdminOpsErrorQuery({
    this.page = 1,
    this.pageSize = 20,
    this.timeRange = Sub2ApiAdminOpsTimeRange.oneHour,
    this.startAt,
    this.endAt,
    this.view = Sub2ApiAdminOpsErrorView.errors,
    this.phase,
    this.owner,
    this.source,
    this.query,
    this.userQuery,
    this.model,
    this.category,
    this.platform,
    this.groupId,
    this.accountId,
    this.userId,
    this.apiKeyId,
    this.resolved,
    this.statusCodes = const <int>[],
    this.sortBy = Sub2ApiAdminOpsErrorSortBy.createdAt,
    this.sortOrder = Sub2ApiAdminOpsSortOrder.descending,
  });
  final int page;
  final int pageSize;
  final Sub2ApiAdminOpsTimeRange timeRange;
  final DateTime? startAt;
  final DateTime? endAt;
  final Sub2ApiAdminOpsErrorView view;
  final String? phase;
  final String? owner;
  final String? source;
  final String? query;
  final String? userQuery;
  final String? model;
  final String? category;
  final String? platform;
  final int? groupId;
  final int? accountId;
  final int? userId;
  final int? apiKeyId;
  final bool? resolved;
  final List<int> statusCodes;
  final Sub2ApiAdminOpsErrorSortBy sortBy;
  final Sub2ApiAdminOpsSortOrder sortOrder;
}

final class Sub2ApiAdminOpsErrorRecord {
  const Sub2ApiAdminOpsErrorRecord({
    required this.id,
    required this.createdAt,
    required this.phase,
    required this.type,
    required this.owner,
    required this.source,
    required this.severity,
    required this.statusCode,
    required this.platform,
    required this.model,
    required this.resolved,
    this.resolvedAt,
    this.resolvedByUserId,
    required this.resolvedByUserName,
    required this.clientRequestId,
    required this.requestId,
    required this.message,
    this.userId,
    required this.userEmail,
    this.apiKeyId,
    this.accountId,
    required this.accountName,
    this.groupId,
    required this.groupName,
    this.clientAddress,
    required this.requestPath,
    required this.stream,
    required this.inboundEndpoint,
    required this.upstreamEndpoint,
    required this.requestedModel,
    required this.upstreamModel,
    this.requestType,
    required this.userAgent,
    required this.apiKeyName,
    required this.apiKeyDeleted,
    this.errorBody,
    this.upstreamStatusCode,
    this.upstreamErrorMessage,
    this.upstreamErrorDetail,
    this.upstreamErrors,
    this.authLatencyMs,
    this.routingLatencyMs,
    this.upstreamLatencyMs,
    this.responseLatencyMs,
    this.timeToFirstTokenMs,
    this.isBusinessLimited,
    this.apiKeyPrefix,
  });
  final int id;
  final DateTime createdAt;
  final String phase;
  final String type;
  final String owner;
  final String source;
  final String severity;
  final int statusCode;
  final String platform;
  final String model;
  final bool resolved;
  final DateTime? resolvedAt;
  final int? resolvedByUserId;
  final String resolvedByUserName;
  final String clientRequestId;
  final String requestId;
  final Sub2ApiAdminOpsErrorContent message;
  final int? userId;
  final String userEmail;
  final int? apiKeyId;
  final int? accountId;
  final String accountName;
  final int? groupId;
  final String groupName;
  final Sub2ApiAdminOpsClientAddress? clientAddress;
  final String requestPath;
  final bool stream;
  final String inboundEndpoint;
  final String upstreamEndpoint;
  final String requestedModel;
  final String upstreamModel;
  final int? requestType;
  final String userAgent;
  final String apiKeyName;
  final bool apiKeyDeleted;
  final Sub2ApiAdminOpsErrorContent? errorBody;
  final int? upstreamStatusCode;
  final Sub2ApiAdminOpsErrorContent? upstreamErrorMessage;
  final Sub2ApiAdminOpsErrorContent? upstreamErrorDetail;
  final Sub2ApiAdminOpsErrorContent? upstreamErrors;
  final int? authLatencyMs;
  final int? routingLatencyMs;
  final int? upstreamLatencyMs;
  final int? responseLatencyMs;
  final int? timeToFirstTokenMs;
  final bool? isBusinessLimited;
  final String? apiKeyPrefix;
}

final class Sub2ApiAdminOpsResolutionResult {
  const Sub2ApiAdminOpsResolutionResult({required this.ok});
  final bool ok;
}
