import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_ops_dashboard_models.dart';
import '../sub2api_admin_ops_realtime_models.dart';

Sub2ApiAdminOpsConcurrencySnapshot mapAdminOpsConcurrency(Object? data) =>
    _guard(() {
      final s = _object(data);
      return Sub2ApiAdminOpsConcurrencySnapshot(
        enabled: _bool(s['enabled']),
        platforms: _object(s['platform']).map(
          (key, value) => MapEntry(key, _platformConcurrency(_object(value))),
        ),
        groups: _intMap(s['group'], _groupConcurrency),
        accounts: _intMap(s['account'], _accountConcurrency),
        timestamp: _date(s['timestamp']),
      );
    });
Sub2ApiAdminOpsUserConcurrencySnapshot mapAdminOpsUserConcurrency(
  Object? data,
) => _guard(() {
  final s = _object(data);
  return Sub2ApiAdminOpsUserConcurrencySnapshot(
    enabled: _bool(s['enabled']),
    users: _intMap(s['user'], _userConcurrency),
    timestamp: _date(s['timestamp']),
  );
});
Sub2ApiAdminOpsAvailabilitySnapshot mapAdminOpsAvailability(Object? data) =>
    _guard(() {
      final s = _object(data);
      return Sub2ApiAdminOpsAvailabilitySnapshot(
        enabled: _bool(s['enabled']),
        platforms: _object(s['platform']).map(
          (key, value) => MapEntry(key, _platformAvailability(_object(value))),
        ),
        groups: _intMap(s['group'], _groupAvailability),
        accounts: _intMap(s['account'], _accountAvailability),
        timestamp: _date(s['timestamp']),
      );
    });
Sub2ApiAdminOpsRealtimeTraffic mapAdminOpsTraffic(Object? data) => _guard(() {
  final s = _object(data);
  final summary = _object(s['summary']);
  return Sub2ApiAdminOpsRealtimeTraffic(
    enabled: _bool(s['enabled']),
    window: _required(summary['window']),
    startAt: _date(summary['start_time']),
    endAt: _date(summary['end_time']),
    platform: _text(summary['platform']),
    groupId: _nullablePositive(summary['group_id']),
    qps: _rate(_object(summary['qps'])),
    tps: _rate(_object(summary['tps'])),
    timestamp: _date(s['timestamp']),
  );
});

Sub2ApiAdminOpsPlatformConcurrency _platformConcurrency(
  Map<String, Object?> s,
) => Sub2ApiAdminOpsPlatformConcurrency(
  platform: _required(s['platform']),
  currentInUse: _nonNegative(s['current_in_use']),
  maxCapacity: _nonNegative(s['max_capacity']),
  loadPercentage: _decimal(s['load_percentage']),
  waitingInQueue: _nonNegative(s['waiting_in_queue']),
);
Sub2ApiAdminOpsGroupConcurrency _groupConcurrency(Map<String, Object?> s) =>
    Sub2ApiAdminOpsGroupConcurrency(
      groupId: _positive(s['group_id']),
      groupName: _required(s['group_name']),
      platform: _required(s['platform']),
      currentInUse: _nonNegative(s['current_in_use']),
      maxCapacity: _nonNegative(s['max_capacity']),
      loadPercentage: _decimal(s['load_percentage']),
      waitingInQueue: _nonNegative(s['waiting_in_queue']),
    );
Sub2ApiAdminOpsAccountConcurrency _accountConcurrency(Map<String, Object?> s) =>
    Sub2ApiAdminOpsAccountConcurrency(
      accountId: _positive(s['account_id']),
      accountName: _required(s['account_name']),
      platform: _required(s['platform']),
      groupId: _positive(s['group_id']),
      groupName: _required(s['group_name']),
      currentInUse: _nonNegative(s['current_in_use']),
      maxCapacity: _nonNegative(s['max_capacity']),
      loadPercentage: _decimal(s['load_percentage']),
      waitingInQueue: _nonNegative(s['waiting_in_queue']),
    );
Sub2ApiAdminOpsUserConcurrency _userConcurrency(Map<String, Object?> s) =>
    Sub2ApiAdminOpsUserConcurrency(
      userId: _positive(s['user_id']),
      userEmail: _required(s['user_email']),
      username: _text(s['username']),
      currentInUse: _nonNegative(s['current_in_use']),
      maxCapacity: _nonNegative(s['max_capacity']),
      loadPercentage: _decimal(s['load_percentage']),
      waitingInQueue: _nonNegative(s['waiting_in_queue']),
    );
Sub2ApiAdminOpsPlatformAvailability _platformAvailability(
  Map<String, Object?> s,
) => Sub2ApiAdminOpsPlatformAvailability(
  platform: _required(s['platform']),
  totalAccounts: _nonNegative(s['total_accounts']),
  availableCount: _nonNegative(s['available_count']),
  rateLimitCount: _nonNegative(s['rate_limit_count']),
  errorCount: _nonNegative(s['error_count']),
);
Sub2ApiAdminOpsGroupAvailability _groupAvailability(Map<String, Object?> s) =>
    Sub2ApiAdminOpsGroupAvailability(
      groupId: _positive(s['group_id']),
      groupName: _required(s['group_name']),
      platform: _required(s['platform']),
      totalAccounts: _nonNegative(s['total_accounts']),
      availableCount: _nonNegative(s['available_count']),
      rateLimitCount: _nonNegative(s['rate_limit_count']),
      errorCount: _nonNegative(s['error_count']),
    );
Sub2ApiAdminOpsAccountAvailability _accountAvailability(
  Map<String, Object?> s,
) => Sub2ApiAdminOpsAccountAvailability(
  accountId: _positive(s['account_id']),
  accountName: _required(s['account_name']),
  platform: _required(s['platform']),
  groupId: _positive(s['group_id']),
  groupName: _required(s['group_name']),
  status: _required(s['status']),
  isAvailable: _bool(s['is_available']),
  isRateLimited: _bool(s['is_rate_limited']),
  isOverloaded: _bool(s['is_overloaded']),
  hasError: _bool(s['has_error']),
  rateLimitResetAt: _optionalDate(s['rate_limit_reset_at']),
  rateLimitRemainingSeconds: _nullableNonNegative(
    s['rate_limit_remaining_sec'],
  ),
  overloadUntil: _optionalDate(s['overload_until']),
  overloadRemainingSeconds: _nullableNonNegative(s['overload_remaining_sec']),
  errorMessage: _text(s['error_message']),
  tempUnschedulableUntil: _optionalDate(s['temp_unschedulable_until']),
);
Sub2ApiAdminOpsRateSummary _rate(Map<String, Object?> s) =>
    Sub2ApiAdminOpsRateSummary(
      current: _decimal(s['current']),
      peak: _decimal(s['peak']),
      average: _decimal(s['avg']),
    );

Map<int, T> _intMap<T>(Object? value, T Function(Map<String, Object?>) decode) {
  final source = _object(value);
  final result = <int, T>{};
  for (final entry in source.entries) {
    final id = int.tryParse(entry.key);
    if (id == null || id <= 0) throw const FormatException();
    result[id] = decode(_object(entry.value));
  }
  return result;
}

Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
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

bool _bool(Object? v) {
  if (v is! bool) throw const FormatException();
  return v;
}

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
Sub2ApiDecimal _decimal(Object? v) => Sub2ApiDecimal.fromJson(v);
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
  code: 'protocol.invalid_admin_ops_realtime_response',
  retryable: false,
);
