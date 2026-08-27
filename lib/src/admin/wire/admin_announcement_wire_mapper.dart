import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_announcement_models.dart';

Sub2ApiAdminAnnouncementPage mapAdminAnnouncementPage(Object? data) => _map(() {
  final s = _object(data);
  return Sub2ApiPage(
    items: _list(s, 'items').map(_object).map(_announcement).toList(),
    total: _nonNegativeInt(s, 'total'),
    page: _positiveInt(s, 'page'),
    pageSize: _positiveInt(s, 'page_size'),
    pages: _nonNegativeInt(s, 'pages'),
  );
});
Sub2ApiAdminAnnouncement mapAdminAnnouncement(Object? data) =>
    _map(() => _announcement(_object(data)));
Sub2ApiAdminAnnouncementReadStatusPage mapAdminAnnouncementReadStatusPage(
  Object? data,
) => _map(() {
  final s = _object(data);
  return Sub2ApiPage(
    items: _list(s, 'items').map(_object).map(_readStatus).toList(),
    total: _nonNegativeInt(s, 'total'),
    page: _positiveInt(s, 'page'),
    pageSize: _positiveInt(s, 'page_size'),
    pages: _nonNegativeInt(s, 'pages'),
  );
});
Sub2ApiAdminDeleteAnnouncementResult mapAdminDeleteAnnouncement(Object? data) =>
    _map(
      () => Sub2ApiAdminDeleteAnnouncementResult(
        _nonEmpty(_object(data), 'message'),
      ),
    );

Sub2ApiAdminAnnouncement _announcement(Map<String, Object?> s) =>
    Sub2ApiAdminAnnouncement(
      id: _positiveInt(s, 'id'),
      title: _nonEmpty(s, 'title'),
      content: _nonEmpty(s, 'content'),
      status: _status(_nonEmpty(s, 'status')),
      notifyMode: _notify(_nonEmpty(s, 'notify_mode')),
      targeting: _targeting(_object(s['targeting'])),
      startsAt: _nullableDate(s, 'starts_at'),
      endsAt: _nullableDate(s, 'ends_at'),
      createdBy: _nullablePositiveInt(s, 'created_by'),
      updatedBy: _nullablePositiveInt(s, 'updated_by'),
      createdAt: _date(s, 'created_at'),
      updatedAt: _date(s, 'updated_at'),
    );

Sub2ApiAdminAnnouncementReadStatus _readStatus(Map<String, Object?> s) =>
    Sub2ApiAdminAnnouncementReadStatus(
      userId: _positiveInt(s, 'user_id'),
      email: _nonEmpty(s, 'email'),
      username: _string(s, 'username'),
      balance: _decimal(s, 'balance'),
      eligible: _bool(s, 'eligible'),
      readAt: _nullableDate(s, 'read_at'),
    );

Sub2ApiAdminAnnouncementTargeting _targeting(Map<String, Object?> s) =>
    Sub2ApiAdminAnnouncementTargeting(
      anyOf: _optionalList(s, 'any_of')
          .map(_object)
          .map(
            (g) => Sub2ApiAdminAnnouncementConditionGroup(
              _optionalList(g, 'all_of').map(_object).map(_condition).toList(),
            ),
          )
          .toList(),
    );
Sub2ApiAdminAnnouncementCondition _condition(Map<String, Object?> s) =>
    switch (_nonEmpty(s, 'type')) {
      'subscription' => Sub2ApiAdminAnnouncementSubscriptionCondition(
        _positiveIntList(s, 'group_ids'),
      ),
      'balance' => Sub2ApiAdminAnnouncementBalanceCondition(
        operator: _balanceOperator(_nonEmpty(s, 'operator')),
        value: _decimal(s, 'value'),
      ),
      _ => throw const FormatException(),
    };

Sub2ApiAdminAnnouncementStatus _status(String v) => switch (v) {
  'draft' => Sub2ApiAdminAnnouncementStatus.draft,
  'active' => Sub2ApiAdminAnnouncementStatus.active,
  'archived' => Sub2ApiAdminAnnouncementStatus.archived,
  _ => throw const FormatException(),
};
Sub2ApiAdminAnnouncementNotifyMode _notify(String v) => switch (v) {
  'silent' => Sub2ApiAdminAnnouncementNotifyMode.silent,
  'popup' => Sub2ApiAdminAnnouncementNotifyMode.popup,
  _ => throw const FormatException(),
};
Sub2ApiAdminAnnouncementBalanceOperator _balanceOperator(String v) =>
    switch (v) {
      'gt' => Sub2ApiAdminAnnouncementBalanceOperator.gt,
      'gte' => Sub2ApiAdminAnnouncementBalanceOperator.gte,
      'lt' => Sub2ApiAdminAnnouncementBalanceOperator.lt,
      'lte' => Sub2ApiAdminAnnouncementBalanceOperator.lte,
      'eq' => Sub2ApiAdminAnnouncementBalanceOperator.eq,
      _ => throw const FormatException(),
    };

Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
}

List<Object?> _list(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

List<Object?> _optionalList(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v == null) return const [];
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

String _string(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! String) throw const FormatException();
  return v;
}

String _nonEmpty(Map<String, Object?> s, String k) {
  final v = _string(s, k);
  if (v.trim().isEmpty) throw const FormatException();
  return v;
}

bool _bool(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! bool) throw const FormatException();
  return v;
}

int _positiveInt(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! int || v <= 0) throw const FormatException();
  return v;
}

int _nonNegativeInt(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! int || v < 0) throw const FormatException();
  return v;
}

int? _nullablePositiveInt(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v == null) return null;
  if (v is! int || v <= 0) throw const FormatException();
  return v;
}

List<int> _positiveIntList(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! List || v.any((e) => e is! int || e <= 0)) {
    throw const FormatException();
  }
  return v.cast<int>().toList();
}

Sub2ApiDecimal _decimal(Map<String, Object?> s, String k) {
  if (!s.containsKey(k)) throw const FormatException();
  return Sub2ApiDecimal.fromJson(s[k]);
}

DateTime _date(Map<String, Object?> s, String k) =>
    DateTime.parse(_nonEmpty(s, k)).toUtc();
DateTime? _nullableDate(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v == null) return null;
  if (v is! String || v.trim().isEmpty) throw const FormatException();
  return DateTime.parse(v).toUtc();
}

T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_announcement_response',
  retryable: false,
);
