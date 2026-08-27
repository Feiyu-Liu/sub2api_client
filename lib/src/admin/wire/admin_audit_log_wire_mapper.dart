import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_audit_log_models.dart';

Sub2ApiAdminAuditLogPage mapAdminAuditLogPage(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiPage<Sub2ApiAdminAuditLog>(
    items: _list(source, 'items').map(_object).map(_auditLog).toList(),
    total: _nonNegativeInteger(source, 'total'),
    page: _positiveInteger(source, 'page'),
    pageSize: _positiveInteger(source, 'page_size'),
    pages: _nonNegativeInteger(source, 'pages'),
  );
});

Sub2ApiAdminAuditLog mapAdminAuditLog(Object? data) =>
    _map(() => _auditLog(_object(data)));

Sub2ApiAdminClearAuditLogsResult mapAdminClearAuditLogsResult(Object? data) =>
    _map(
      () => Sub2ApiAdminClearAuditLogsResult(
        deleted: _nonNegativeInteger(_object(data), 'deleted'),
      ),
    );

Sub2ApiAdminAuditLog _auditLog(Map<String, Object?> source) {
  final actorUserId = _nullablePositiveInteger(source, 'actor_user_id');
  final statusCode = _nonNegativeInteger(source, 'status_code');
  if (statusCode < 100 || statusCode > 599) throw const FormatException();
  final requestBody = _nullableString(source, 'request_body');
  final extra = source['extra'] == null
      ? const <String, Object?>{}
      : _object(source['extra']);
  return Sub2ApiAdminAuditLog(
    id: _positiveInteger(source, 'id'),
    createdAt: _dateTime(source, 'created_at'),
    actorUserId: actorUserId,
    actorEmail: _optionalString(source, 'actor_email'),
    actorRole: _optionalString(source, 'actor_role'),
    authMethod: _nonEmptyString(source, 'auth_method'),
    credentialMasked: _optionalString(source, 'credential_masked'),
    action: _nonEmptyString(source, 'action'),
    method: _nonEmptyString(source, 'method'),
    path: _nonEmptyString(source, 'path'),
    requestId: _optionalString(source, 'request_id'),
    clientIp: _optionalString(source, 'client_ip'),
    userAgent: _optionalString(source, 'user_agent'),
    requestBody: requestBody == null || requestBody.isEmpty
        ? null
        : Sub2ApiAdminRedactedRequestBody(requestBody),
    statusCode: statusCode,
    latency: Duration(milliseconds: _nonNegativeInteger(source, 'latency_ms')),
    metadata: Sub2ApiAdminAuditLogMetadata(
      deletedRows: _nullableNonNegativeInteger(extra, 'deleted_rows'),
    ),
  );
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw const FormatException();
    result[entry.key as String] = entry.value;
  }
  return result;
}

List<Object?> _list(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return value;
}

String _optionalString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String? _nullableString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! String) throw const FormatException();
  return value;
}

int _positiveInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

int _nonNegativeInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

int? _nullablePositiveInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

int? _nullableNonNegativeInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

DateTime _dateTime(Map<String, Object?> source, String key) =>
    DateTime.parse(_nonEmptyString(source, key)).toUtc();

T _map<T>(T Function() action) {
  try {
    return action();
  } on Sub2ApiException catch (error) {
    if (error.code == _invalidResponse.code) rethrow;
    throw _invalidResponse;
  } on Object {
    throw _invalidResponse;
  }
}

const _invalidResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_audit_log_response',
  retryable: false,
);
