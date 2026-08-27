import '../shared/models/sub2api_page.dart';

typedef Sub2ApiAdminAuditLogPage = Sub2ApiPage<Sub2ApiAdminAuditLog>;

final class Sub2ApiAdminAuditLogQuery {
  const Sub2ApiAdminAuditLogQuery({
    this.page,
    this.pageSize,
    this.startTime,
    this.endTime,
    this.actorUserId,
    this.actorEmail,
    this.authMethod,
    this.action,
    this.method,
    this.clientIp,
    this.success,
    this.search,
  });

  final int? page;
  final int? pageSize;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? actorUserId;
  final String? actorEmail;
  final String? authMethod;
  final String? action;
  final String? method;
  final String? clientIp;
  final bool? success;
  final String? search;
}

/// A server-redacted request body captured for audit inspection.
final class Sub2ApiAdminRedactedRequestBody {
  const Sub2ApiAdminRedactedRequestBody(this.value);

  final String value;

  @override
  String toString() => '<redacted-request-body>';
}

/// Typed metadata currently emitted for an audit-log clear trace.
final class Sub2ApiAdminAuditLogMetadata {
  const Sub2ApiAdminAuditLogMetadata({this.deletedRows});

  final int? deletedRows;
}

final class Sub2ApiAdminAuditLog {
  const Sub2ApiAdminAuditLog({
    required this.id,
    required this.createdAt,
    required this.actorUserId,
    required this.actorEmail,
    required this.actorRole,
    required this.authMethod,
    required this.credentialMasked,
    required this.action,
    required this.method,
    required this.path,
    required this.requestId,
    required this.clientIp,
    required this.userAgent,
    required this.requestBody,
    required this.statusCode,
    required this.latency,
    required this.metadata,
  });

  final int id;
  final DateTime createdAt;
  final int? actorUserId;
  final String actorEmail;
  final String actorRole;
  final String authMethod;
  final String credentialMasked;
  final String action;
  final String method;
  final String path;
  final String requestId;
  final String clientIp;
  final String userAgent;
  final Sub2ApiAdminRedactedRequestBody? requestBody;
  final int statusCode;
  final Duration latency;
  final Sub2ApiAdminAuditLogMetadata metadata;

  bool get succeeded => statusCode < 400;

  @override
  String toString() =>
      'Sub2ApiAdminAuditLog(id: $id, createdAt: $createdAt, '
      'actorUserId: $actorUserId, actorEmail: $actorEmail, '
      'actorRole: $actorRole, authMethod: $authMethod, '
      'credentialMasked: <masked>, action: $action, method: $method, '
      'path: $path, requestId: $requestId, clientIp: $clientIp, '
      'userAgent: $userAgent, requestBody: <redacted>, '
      'statusCode: $statusCode, latency: $latency, metadata: $metadata)';
}

final class Sub2ApiAdminClearAuditLogsResult {
  const Sub2ApiAdminClearAuditLogsResult({required this.deleted});

  final int deleted;
}
