import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_ops_error_models.dart';

Sub2ApiAdminOpsErrorPage mapAdminOpsErrorPage(Object? data) => _guard(() {
  final s = _object(data);
  return Sub2ApiPage(
    items: _list(s['items']).map(_object).map(_record).toList(),
    total: _nonNegative(s['total']),
    page: _positive(s['page']),
    pageSize: _positive(s['page_size']),
    pages: _nonNegative(s['pages']),
  );
});
Sub2ApiAdminOpsErrorRecord mapAdminOpsErrorDetail(Object? data) =>
    _guard(() => _record(_object(data)));
Sub2ApiAdminOpsResolutionResult mapAdminOpsResolution(Object? data) => _guard(
  () => Sub2ApiAdminOpsResolutionResult(ok: _bool(_object(data)['ok'])),
);

Sub2ApiAdminOpsErrorRecord _record(Map<String, Object?> s) =>
    Sub2ApiAdminOpsErrorRecord(
      id: _positive(s['id']),
      createdAt: _date(s['created_at']),
      phase: _required(s['phase']),
      type: _required(s['type']),
      owner: _required(s['error_owner']),
      source: _required(s['error_source']),
      severity: _required(s['severity']),
      statusCode: _nonNegative(s['status_code']),
      platform: _text(s['platform']),
      model: _text(s['model']),
      resolved: _bool(s['resolved']),
      resolvedAt: _optionalDate(s['resolved_at']),
      resolvedByUserId: _nullablePositive(s['resolved_by_user_id']),
      resolvedByUserName: _text(s['resolved_by_user_name']),
      clientRequestId: _text(s['client_request_id']),
      requestId: _text(s['request_id']),
      message: Sub2ApiAdminOpsErrorContent(_text(s['message'])),
      userId: _nullablePositive(s['user_id']),
      userEmail: _text(s['user_email']),
      apiKeyId: _nullablePositive(s['api_key_id']),
      accountId: _nullablePositive(s['account_id']),
      accountName: _text(s['account_name']),
      groupId: _nullablePositive(s['group_id']),
      groupName: _text(s['group_name']),
      clientAddress: _secret(s['client_ip'], Sub2ApiAdminOpsClientAddress.new),
      requestPath: _text(s['request_path']),
      stream: _bool(s['stream']),
      inboundEndpoint: _text(s['inbound_endpoint']),
      upstreamEndpoint: _text(s['upstream_endpoint']),
      requestedModel: _text(s['requested_model']),
      upstreamModel: _text(s['upstream_model']),
      requestType: _nullableNonNegative(s['request_type']),
      userAgent: _text(s['user_agent']),
      apiKeyName: _text(s['api_key_name']),
      apiKeyDeleted: _optionalBool(s['api_key_deleted']),
      errorBody: _secret(s['error_body'], Sub2ApiAdminOpsErrorContent.new),
      upstreamStatusCode: _nullableNonNegative(s['upstream_status_code']),
      upstreamErrorMessage: _secret(
        s['upstream_error_message'],
        Sub2ApiAdminOpsErrorContent.new,
      ),
      upstreamErrorDetail: _secret(
        s['upstream_error_detail'],
        Sub2ApiAdminOpsErrorContent.new,
      ),
      upstreamErrors: _secret(
        s['upstream_errors'],
        Sub2ApiAdminOpsErrorContent.new,
      ),
      authLatencyMs: _nullableNonNegative(s['auth_latency_ms']),
      routingLatencyMs: _nullableNonNegative(s['routing_latency_ms']),
      upstreamLatencyMs: _nullableNonNegative(s['upstream_latency_ms']),
      responseLatencyMs: _nullableNonNegative(s['response_latency_ms']),
      timeToFirstTokenMs: _nullableNonNegative(s['time_to_first_token_ms']),
      isBusinessLimited: s['is_business_limited'] == null
          ? null
          : _bool(s['is_business_limited']),
      apiKeyPrefix: _optionalText(s['api_key_prefix']),
    );
T? _secret<T>(Object? v, T Function(String) create) {
  final t = _text(v);
  return t.isEmpty ? null : create(t);
}

Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
}

List<Object?> _list(Object? v) {
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

String _text(Object? v) {
  if (v == null) return '';
  if (v is! String) throw const FormatException();
  return v;
}

String _required(Object? v) {
  final t = _text(v);
  if (t.trim().isEmpty) throw const FormatException();
  return t;
}

String? _optionalText(Object? v) => v == null ? null : _text(v);
bool _bool(Object? v) {
  if (v is! bool) throw const FormatException();
  return v;
}

bool _optionalBool(Object? v) => v == null ? false : _bool(v);
int _integer(Object? v) {
  if (v is! int) throw const FormatException();
  return v;
}

int _positive(Object? v) {
  final n = _integer(v);
  if (n <= 0) throw const FormatException();
  return n;
}

int _nonNegative(Object? v) {
  final n = _integer(v);
  if (n < 0) throw const FormatException();
  return n;
}

int? _nullablePositive(Object? v) => v == null ? null : _positive(v);
int? _nullableNonNegative(Object? v) => v == null ? null : _nonNegative(v);
DateTime _date(Object? v) => DateTime.parse(_required(v)).toUtc();
DateTime? _optionalDate(Object? v) => v == null ? null : _date(v);
T _guard<T>(T Function() a) {
  try {
    return a();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_ops_error_response',
  retryable: false,
);
