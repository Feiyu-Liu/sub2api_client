import '../../shared/errors/sub2api_exception.dart';
import '../sub2api_admin_account_models.dart';
import '../sub2api_admin_scheduled_test_models.dart';

Sub2ApiAdminScheduledTestPlan mapAdminScheduledTestPlan(Object? data) =>
    _map(() => _plan(_object(data)));

List<Sub2ApiAdminScheduledTestResult> mapAdminScheduledTestResults(
  Object? data,
) => _map(() {
  if (data is! List) throw const FormatException();
  return data.map(_object).map(_result).toList(growable: false);
});

Sub2ApiAdminDeleteScheduledTestPlanResult mapAdminDeleteScheduledTestPlan(
  Object? data,
) => _map(() {
  return Sub2ApiAdminDeleteScheduledTestPlanResult(
    _nonEmptyString(_object(data), 'message'),
  );
});

Sub2ApiAdminScheduledTestPlan _plan(Map<String, Object?> source) =>
    Sub2ApiAdminScheduledTestPlan(
      id: _positiveInteger(source, 'id'),
      accountId: _positiveInteger(source, 'account_id'),
      modelId: _string(source, 'model_id'),
      cronExpression: _nonEmptyString(source, 'cron_expression'),
      enabled: _boolean(source, 'enabled'),
      maxResults: _positiveInteger(source, 'max_results'),
      autoRecover: _boolean(source, 'auto_recover'),
      lastRunAt: _nullableDateTime(source, 'last_run_at'),
      nextRunAt: _nullableDateTime(source, 'next_run_at'),
      createdAt: _dateTime(source, 'created_at'),
      updatedAt: _dateTime(source, 'updated_at'),
    );

Sub2ApiAdminScheduledTestResult _result(Map<String, Object?> source) =>
    Sub2ApiAdminScheduledTestResult(
      id: _positiveInteger(source, 'id'),
      planId: _positiveInteger(source, 'plan_id'),
      status: _nonEmptyString(source, 'status'),
      responseText: _string(source, 'response_text'),
      errorMessage: _string(source, 'error_message'),
      latency: Duration(
        milliseconds: _nonNegativeInteger(source, 'latency_ms'),
      ),
      startedAt: _dateTime(source, 'started_at'),
      finishedAt: _dateTime(source, 'finished_at'),
      createdAt: _dateTime(source, 'created_at'),
    );

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

String _string(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String) throw const FormatException();
  return value;
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = _string(source, key);
  if (value.trim().isEmpty) throw const FormatException();
  return value;
}

bool _boolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! bool) throw const FormatException();
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

DateTime _dateTime(Map<String, Object?> source, String key) =>
    DateTime.parse(_nonEmptyString(source, key)).toUtc();

DateTime? _nullableDateTime(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return DateTime.parse(value).toUtc();
}

T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalidResponse;
  }
}

const _invalidResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_scheduled_test_response',
  retryable: false,
);
