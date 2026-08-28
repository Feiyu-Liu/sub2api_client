import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../../usage/sub2api_usage_dto.dart';
import '../../usage/sub2api_usage_mapper.dart';
import '../sub2api_admin_models.dart';
import '../sub2api_admin_usage_models.dart';

Sub2ApiAdminUsagePage mapAdminUsagePage(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiPage<Sub2ApiAdminUsageRecord>(
    items: _list(
      source,
      'items',
    ).map(_object).map(_usageRecord).toList(growable: false),
    total: _nonNegativeInteger(source, 'total'),
    page: _positiveInteger(source, 'page'),
    pageSize: _positiveInteger(source, 'page_size'),
    pages: _positiveInteger(source, 'pages'),
  );
});

Sub2ApiAdminUsageStats mapAdminUsageStats(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminUsageStats(
    usage: mapUsageStatistics(source),
    totalAccountCost: _nullableDecimal(source, 'total_account_cost'),
    endpoints: _endpointStats(source['endpoints']),
    upstreamEndpoints: _endpointStats(source['upstream_endpoints']),
    endpointPaths: _endpointStats(source['endpoint_paths']),
  );
});

List<Sub2ApiAdminUsageUserSearchResult> mapAdminUsageUsers(Object? data) =>
    _map(
      () => _array(data)
          .map(_object)
          .map(
            (source) => Sub2ApiAdminUsageUserSearchResult(
              id: _positiveInteger(source, 'id'),
              email: _nonEmptyString(source, 'email'),
              deleted: _boolean(source, 'deleted'),
            ),
          )
          .toList(growable: false),
    );

List<Sub2ApiAdminUsageApiKeySearchResult> mapAdminUsageApiKeys(Object? data) =>
    _map(
      () => _array(data)
          .map(_object)
          .map(
            (source) => Sub2ApiAdminUsageApiKeySearchResult(
              id: _positiveInteger(source, 'id'),
              name: _nonEmptyString(source, 'name'),
              userId: _positiveInteger(source, 'user_id'),
            ),
          )
          .toList(growable: false),
    );

Sub2ApiAdminUsageCleanupTaskPage mapAdminUsageCleanupTaskPage(Object? data) =>
    _map(() {
      final source = _object(data);
      return Sub2ApiPage<Sub2ApiAdminUsageCleanupTask>(
        items: _list(
          source,
          'items',
        ).map(_object).map(_cleanupTask).toList(growable: false),
        total: _nonNegativeInteger(source, 'total'),
        page: _positiveInteger(source, 'page'),
        pageSize: _positiveInteger(source, 'page_size'),
        pages: _positiveInteger(source, 'pages'),
      );
    });

Sub2ApiAdminUsageCleanupTask mapAdminUsageCleanupTask(Object? data) =>
    _map(() => _cleanupTask(_object(data)));

Sub2ApiAdminCancelUsageCleanupTaskResult mapAdminCancelUsageCleanupTask(
  Object? data,
) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminCancelUsageCleanupTaskResult(
    id: _positiveInteger(source, 'id'),
    status: _cleanupStatus(_nonEmptyString(source, 'status')),
  );
});

Sub2ApiAdminUsageRecord _usageRecord(
  Map<String, Object?> source,
) => Sub2ApiAdminUsageRecord(
  usage: mapUsageRecord(Sub2ApiUsageRecordDto.fromJson(source)),
  imageInputTokens: _nonNegativeInteger(source, 'image_input_tokens'),
  imageInputCost: _decimal(source, 'image_input_cost'),
  sessionId: _nullableString(source, 'session_id'),
  upstreamModel: _nullableString(source, 'upstream_model'),
  upstreamResponseModel: _nullableString(source, 'upstream_response_model'),
  upstreamModelMismatch: _nullableBoolean(source, 'upstream_model_mismatch'),
  channelId: _nullablePositiveInteger(source, 'channel_id'),
  modelMappingChain: _nullableString(source, 'model_mapping_chain'),
  billingTier: _nullableString(source, 'billing_tier'),
  accountRateMultiplier: _nullableDecimal(source, 'account_rate_multiplier'),
  accountStatsCost: _nullableDecimal(source, 'account_stats_cost'),
  account: source['account'] == null
      ? null
      : _accountSummary(_object(source['account'])),
);

Sub2ApiAdminUsageAccountSummary _accountSummary(Map<String, Object?> source) =>
    Sub2ApiAdminUsageAccountSummary(
      id: _positiveInteger(source, 'id'),
      name: _nonEmptyString(source, 'name'),
    );

List<Sub2ApiAdminUsageEndpointStat> _endpointStats(Object? value) {
  if (value == null) return const <Sub2ApiAdminUsageEndpointStat>[];
  return _array(value)
      .map(_object)
      .map(
        (source) => Sub2ApiAdminUsageEndpointStat(
          endpoint: _nonEmptyString(source, 'endpoint'),
          requests: _nonNegativeInteger(source, 'requests'),
          totalTokens: _nonNegativeInteger(source, 'total_tokens'),
          cost: _decimal(source, 'cost'),
          actualCost: _decimal(source, 'actual_cost'),
        ),
      )
      .toList(growable: false);
}

Sub2ApiAdminUsageCleanupTask _cleanupTask(Map<String, Object?> source) {
  final filters = _object(source['filters']);
  return Sub2ApiAdminUsageCleanupTask(
    id: _positiveInteger(source, 'id'),
    status: _cleanupStatus(_nonEmptyString(source, 'status')),
    filters: Sub2ApiAdminUsageCleanupFilters(
      startTime: _dateTime(filters, 'start_time'),
      endTime: _dateTime(filters, 'end_time'),
      userId: _nullablePositiveInteger(filters, 'user_id'),
      apiKeyId: _nullablePositiveInteger(filters, 'api_key_id'),
      accountId: _nullablePositiveInteger(filters, 'account_id'),
      groupId: _nullablePositiveInteger(filters, 'group_id'),
      model: _nullableString(filters, 'model'),
      requestType: filters['request_type'] == null
          ? null
          : _requestType(_nonEmptyString(filters, 'request_type')),
      stream: _nullableBoolean(filters, 'stream'),
      billingType: filters['billing_type'] == null
          ? null
          : _billingType(_integer(filters, 'billing_type')),
    ),
    createdBy: _positiveInteger(source, 'created_by'),
    deletedRows: _nonNegativeInteger(source, 'deleted_rows'),
    errorMessage: _nullableString(source, 'error_message'),
    canceledBy: _nullablePositiveInteger(source, 'canceled_by'),
    canceledAt: _nullableDateTime(source, 'canceled_at'),
    startedAt: _nullableDateTime(source, 'started_at'),
    finishedAt: _nullableDateTime(source, 'finished_at'),
    createdAt: _dateTime(source, 'created_at'),
    updatedAt: _dateTime(source, 'updated_at'),
  );
}

Sub2ApiAdminUsageRequestType _requestType(String value) => switch (value) {
  'unknown' => Sub2ApiAdminUsageRequestType.unknown,
  'sync' => Sub2ApiAdminUsageRequestType.sync,
  'stream' => Sub2ApiAdminUsageRequestType.stream,
  'ws_v2' => Sub2ApiAdminUsageRequestType.webSocketV2,
  'cyber' => Sub2ApiAdminUsageRequestType.cyber,
  'live' => Sub2ApiAdminUsageRequestType.live,
  _ => throw const FormatException(),
};

Sub2ApiAdminBillingType _billingType(int value) => switch (value) {
  0 => Sub2ApiAdminBillingType.balance,
  1 => Sub2ApiAdminBillingType.subscription,
  _ => throw const FormatException(),
};

Sub2ApiAdminUsageCleanupStatus _cleanupStatus(String value) => switch (value) {
  'pending' => Sub2ApiAdminUsageCleanupStatus.pending,
  'running' => Sub2ApiAdminUsageCleanupStatus.running,
  'succeeded' => Sub2ApiAdminUsageCleanupStatus.succeeded,
  'failed' => Sub2ApiAdminUsageCleanupStatus.failed,
  'canceled' => Sub2ApiAdminUsageCleanupStatus.canceled,
  _ => throw const FormatException(),
};

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _array(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

List<Object?> _list(Map<String, Object?> source, String key) =>
    _array(source[key]);

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return value;
}

String? _nullableString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! String) throw const FormatException();
  return value;
}

bool _boolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! bool) throw const FormatException();
  return value;
}

bool? _nullableBoolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! bool) throw const FormatException();
  return value;
}

int _integer(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int) throw const FormatException();
  return value;
}

int _positiveInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value <= 0) throw const FormatException();
  return value;
}

int _nonNegativeInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value < 0) throw const FormatException();
  return value;
}

int? _nullablePositiveInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

Sub2ApiDecimal _decimal(Map<String, Object?> source, String key) =>
    Sub2ApiDecimal.fromJson(source[key]);

Sub2ApiDecimal? _nullableDecimal(Map<String, Object?> source, String key) =>
    source[key] == null ? null : Sub2ApiDecimal.fromJson(source[key]);

DateTime _dateTime(Map<String, Object?> source, String key) =>
    DateTime.parse(_nonEmptyString(source, key)).toUtc();

DateTime? _nullableDateTime(Map<String, Object?> source, String key) =>
    source[key] == null ? null : _dateTime(source, key);

T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_usage_response',
  retryable: false,
);
