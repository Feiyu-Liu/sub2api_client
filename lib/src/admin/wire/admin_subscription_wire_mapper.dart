import '../../commerce/sub2api_commerce_models.dart';
import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_subscription_models.dart';

Sub2ApiAdminSubscriptionPage mapAdminSubscriptionPage(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiPage(
        items: _list(source['items']).map(_object).map(_subscription).toList(),
        total: _nonNegative(source['total']),
        page: _positive(source['page']),
        pageSize: _positive(source['page_size']),
        pages: _nonNegative(source['pages']),
      );
    });

Sub2ApiAdminSubscription mapAdminSubscription(Object? data) =>
    _guard(() => _subscription(_object(data)));

Sub2ApiSubscriptionProgress mapAdminSubscriptionProgress(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiSubscriptionProgress(
        id: _positive(source['id']),
        groupName: _requiredText(source['group_name']),
        expiresAt: _date(source['expires_at']),
        expiresInDays: _integer(source['expires_in_days']),
        daily: _window(source['daily']),
        weekly: _window(source['weekly']),
        monthly: _window(source['monthly']),
      );
    });

Sub2ApiAdminBulkAssignSubscriptionsResult mapAdminBulkAssignSubscriptions(
  Object? data,
) => _guard(() {
  final source = _object(data);
  final statuses = <int, String>{};
  for (final entry in _object(source['statuses']).entries) {
    final userId = int.tryParse(entry.key);
    if (userId == null || userId <= 0) throw const FormatException();
    statuses[userId] = _requiredText(entry.value);
  }
  return Sub2ApiAdminBulkAssignSubscriptionsResult(
    successCount: _nonNegative(source['success_count']),
    createdCount: _nonNegative(source['created_count']),
    reusedCount: _nonNegative(source['reused_count']),
    failedCount: _nonNegative(source['failed_count']),
    subscriptions: _list(
      source['subscriptions'],
    ).map(_object).map(_subscription).toList(),
    errors: _list(source['errors']).map(_requiredText).toList(),
    statuses: statuses,
  );
});

Sub2ApiAdminSubscriptionActionResult mapAdminSubscriptionAction(Object? data) =>
    _guard(
      () => Sub2ApiAdminSubscriptionActionResult(
        message: _requiredText(_object(data)['message']),
      ),
    );

Sub2ApiAdminSubscription _subscription(Map<String, Object?> source) {
  final group = source['group'] == null ? null : _object(source['group']);
  final user = source['user'] == null ? null : _object(source['user']);
  final assignedByUser = source['assigned_by_user'] == null
      ? null
      : _object(source['assigned_by_user']);
  return Sub2ApiAdminSubscription(
    subscription: Sub2ApiUserSubscription(
      id: _positive(source['id']),
      userId: _positive(source['user_id']),
      groupId: _positive(source['group_id']),
      startsAt: _date(source['starts_at']),
      expiresAt: _date(source['expires_at']),
      status: _requiredText(source['status']),
      dailyWindowStart: _optionalDate(source['daily_window_start']),
      weeklyWindowStart: _optionalDate(source['weekly_window_start']),
      monthlyWindowStart: _optionalDate(source['monthly_window_start']),
      dailyUsageUsd: Sub2ApiDecimal.fromJson(source['daily_usage_usd']),
      weeklyUsageUsd: Sub2ApiDecimal.fromJson(source['weekly_usage_usd']),
      monthlyUsageUsd: Sub2ApiDecimal.fromJson(source['monthly_usage_usd']),
      createdAt: _date(source['created_at']),
      updatedAt: _date(source['updated_at']),
      revokedAt: _optionalDate(source['revoked_at']),
      group: group == null
          ? null
          : Sub2ApiCommerceGroupSummary(
              id: _positive(group['id']),
              name: _requiredText(group['name']),
              platform: _requiredText(group['platform']),
              subscriptionType: _requiredText(group['subscription_type']),
            ),
    ),
    assignedBy: _optionalPositive(source['assigned_by']),
    assignedAt: _date(source['assigned_at']),
    notes: _text(source['notes']),
    assignedByUser: assignedByUser == null
        ? null
        : Sub2ApiAdminSubscriptionAssigner(
            id: _positive(assignedByUser['id']),
            email: _requiredText(assignedByUser['email']),
            username: _text(assignedByUser['username']),
            role: _requiredText(assignedByUser['role']),
            status: _requiredText(assignedByUser['status']),
          ),
    user: user == null
        ? null
        : Sub2ApiAdminSubscriptionUserSummary(
            id: _positive(user['id']),
            email: _requiredText(user['email']),
            username: _text(user['username']),
            role: _requiredText(user['role']),
            status: _requiredText(user['status']),
          ),
  );
}

Sub2ApiSubscriptionUsageWindow? _window(Object? value) {
  if (value == null) return null;
  final source = _object(value);
  return Sub2ApiSubscriptionUsageWindow(
    limitUsd: Sub2ApiDecimal.fromJson(source['limit_usd']),
    usedUsd: Sub2ApiDecimal.fromJson(source['used_usd']),
    remainingUsd: Sub2ApiDecimal.fromJson(source['remaining_usd']),
    percentage: Sub2ApiDecimal.fromJson(source['percentage']),
    windowStart: _date(source['window_start']),
    resetsAt: _date(source['resets_at']),
    resetsInSeconds: _integer(source['resets_in_seconds']),
  );
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

String _text(Object? value) {
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String _requiredText(Object? value) {
  final text = _text(value);
  if (text.trim().isEmpty) throw const FormatException();
  return text;
}

int _integer(Object? value) {
  if (value is! int) throw const FormatException();
  return value;
}

int _positive(Object? value) {
  final number = _integer(value);
  if (number <= 0) throw const FormatException();
  return number;
}

int _nonNegative(Object? value) {
  final number = _integer(value);
  if (number < 0) throw const FormatException();
  return number;
}

int? _optionalPositive(Object? value) =>
    value == null ? null : _positive(value);

DateTime _date(Object? value) => DateTime.parse(_requiredText(value)).toUtc();

DateTime? _optionalDate(Object? value) => value == null ? null : _date(value);

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_subscription_response',
  retryable: false,
);
