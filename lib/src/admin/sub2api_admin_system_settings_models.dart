import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';

part 'sub2api_admin_system_settings_generated.dart';

final class Sub2ApiAdminCustomMenuItem {
  const Sub2ApiAdminCustomMenuItem({
    required this.id,
    required this.label,
    required this.iconSvg,
    required this.url,
    required this.pageSlug,
    required this.visibility,
    required this.sortOrder,
  });
  final String id;
  final String label;
  final String iconSvg;
  final String url;
  final String pageSlug;
  final String visibility;
  final int sortOrder;
}

final class Sub2ApiAdminCustomEndpoint {
  const Sub2ApiAdminCustomEndpoint({
    required this.name,
    required this.endpoint,
    required this.description,
  });
  final String name;
  final String endpoint;
  final String description;
}

final class Sub2ApiAdminDefaultSubscriptionSetting {
  const Sub2ApiAdminDefaultSubscriptionSetting({
    required this.groupId,
    required this.validityDays,
  });
  final int groupId;
  final int validityDays;
}

final class Sub2ApiAdminLoginAgreementDocument {
  const Sub2ApiAdminLoginAgreementDocument({
    required this.id,
    required this.title,
    required this.contentMarkdown,
  });
  final String id;
  final String title;
  final String contentMarkdown;
}

final class Sub2ApiAdminNotifyEmailEntry {
  const Sub2ApiAdminNotifyEmailEntry({
    required this.email,
    required this.disabled,
    required this.verified,
  });
  final String email;
  final bool disabled;
  final bool verified;
}

final class Sub2ApiAdminPlatformQuota {
  const Sub2ApiAdminPlatformQuota({
    this.dailyLimitUsd,
    this.weeklyLimitUsd,
    this.monthlyLimitUsd,
  });
  final Sub2ApiDecimal? dailyLimitUsd;
  final Sub2ApiDecimal? weeklyLimitUsd;
  final Sub2ApiDecimal? monthlyLimitUsd;
}

final class Sub2ApiAdminOpenAIFastPolicyRule {
  Sub2ApiAdminOpenAIFastPolicyRule({
    required this.serviceTier,
    required this.action,
    required this.scope,
    List<int> userIds = const <int>[],
    this.errorMessage = '',
    List<String> modelWhitelist = const <String>[],
    this.fallbackAction = '',
    this.fallbackErrorMessage = '',
  }) : userIds = List.unmodifiable(userIds),
       modelWhitelist = List.unmodifiable(modelWhitelist);
  final String serviceTier;
  final String action;
  final String scope;
  final List<int> userIds;
  final String errorMessage;
  final List<String> modelWhitelist;
  final String fallbackAction;
  final String fallbackErrorMessage;
}

final class Sub2ApiAdminOpenAIFastPolicySettings {
  Sub2ApiAdminOpenAIFastPolicySettings({
    required List<Sub2ApiAdminOpenAIFastPolicyRule> rules,
  }) : rules = List.unmodifiable(rules);
  final List<Sub2ApiAdminOpenAIFastPolicyRule> rules;
}

enum _AdminSettingKind {
  boolean,
  string,
  integer,
  decimal,
  stringList,
  intList,
  customMenuList,
  customEndpointList,
  defaultSubscriptionList,
  loginAgreementList,
  notifyEmailList,
  openAIFastPolicy,
  quotaMap,
  intMap,
  secret,
}

sealed class _AdminSettingDescriptor<T> {
  const _AdminSettingDescriptor(this.wireName, this.kind);
  final String wireName;
  final _AdminSettingKind kind;
}

final class Sub2ApiAdminSystemSettingField<T>
    extends _AdminSettingDescriptor<T> {
  const Sub2ApiAdminSystemSettingField._(super.wireName, super.kind);
}

final class Sub2ApiAdminSystemSettingUpdate<T>
    extends _AdminSettingDescriptor<T> {
  const Sub2ApiAdminSystemSettingUpdate._(super.wireName, super.kind);
}

final class Sub2ApiAdminSystemSettings {
  Sub2ApiAdminSystemSettings._(
    Map<Sub2ApiAdminSystemSettingField<Object?>, Object?> values,
  ) : _values = Map.unmodifiable(values);
  final Map<Sub2ApiAdminSystemSettingField<Object?>, Object?> _values;
  T read<T>(Sub2ApiAdminSystemSettingField<T> field) {
    if (!_values.containsKey(field)) {
      throw StateError('Setting ${field.wireName} is unavailable.');
    }
    return _values[field] as T;
  }
}

final class Sub2ApiAdminSystemSettingsPatch {
  Sub2ApiAdminSystemSettingsPatch._(
    Map<Sub2ApiAdminSystemSettingUpdate<Object?>, Object?> values,
  ) : _values = Map.unmodifiable(values);
  factory Sub2ApiAdminSystemSettingsPatch.empty() =>
      Sub2ApiAdminSystemSettingsPatch._(
        <Sub2ApiAdminSystemSettingUpdate<Object?>, Object?>{},
      );
  final Map<Sub2ApiAdminSystemSettingUpdate<Object?>, Object?> _values;
  bool get isEmpty => _values.isEmpty;
  Sub2ApiAdminSystemSettingsPatch withValue<T>(
    Sub2ApiAdminSystemSettingUpdate<T> field,
    T value,
  ) {
    final next = Map<Sub2ApiAdminSystemSettingUpdate<Object?>, Object?>.from(
      _values,
    );
    next[field] = value;
    return Sub2ApiAdminSystemSettingsPatch._(next);
  }
}

Sub2ApiAdminSystemSettings mapAdminSystemSettings(Object? data) {
  final source = _object(data);
  final values = <Sub2ApiAdminSystemSettingField<Object?>, Object?>{};
  for (final field in _adminSystemSettingFields) {
    values[field] = _decodeSetting(field.kind, source[field.wireName]);
  }
  return Sub2ApiAdminSystemSettings._(values);
}

Map<String, Object?> adminSystemSettingsPatchBody(
  Sub2ApiAdminSystemSettingsPatch patch,
) => patch._values.map(
  (field, value) => MapEntry(field.wireName, _encodeSetting(field.kind, value)),
);

Object? _decodeSetting(_AdminSettingKind kind, Object? value) => switch (kind) {
  _AdminSettingKind.boolean => _bool(value),
  _AdminSettingKind.string => _string(value),
  _AdminSettingKind.integer => _int(value),
  _AdminSettingKind.decimal => Sub2ApiDecimal.fromJson(value),
  _AdminSettingKind.stringList => _listOrEmpty(value).map(_string).toList(),
  _AdminSettingKind.intList => _listOrEmpty(value).map(_int).toList(),
  _AdminSettingKind.customMenuList =>
    _listOrEmpty(value)
        .map(_object)
        .map(
          (s) => Sub2ApiAdminCustomMenuItem(
            id: _string(s['id']),
            label: _string(s['label']),
            iconSvg: _string(s['icon_svg']),
            url: _string(s['url']),
            pageSlug: _string(s['page_slug']),
            visibility: _string(s['visibility']),
            sortOrder: _int(s['sort_order']),
          ),
        )
        .toList(),
  _AdminSettingKind.customEndpointList =>
    _listOrEmpty(value)
        .map(_object)
        .map(
          (s) => Sub2ApiAdminCustomEndpoint(
            name: _string(s['name']),
            endpoint: _string(s['endpoint']),
            description: _string(s['description']),
          ),
        )
        .toList(),
  _AdminSettingKind.defaultSubscriptionList =>
    _listOrEmpty(value)
        .map(_object)
        .map(
          (s) => Sub2ApiAdminDefaultSubscriptionSetting(
            groupId: _int(s['group_id']),
            validityDays: _int(s['validity_days']),
          ),
        )
        .toList(),
  _AdminSettingKind.loginAgreementList =>
    _listOrEmpty(value)
        .map(_object)
        .map(
          (s) => Sub2ApiAdminLoginAgreementDocument(
            id: _string(s['id']),
            title: _string(s['title']),
            contentMarkdown: _string(s['content_md']),
          ),
        )
        .toList(),
  _AdminSettingKind.notifyEmailList =>
    _listOrEmpty(value)
        .map(_object)
        .map(
          (s) => Sub2ApiAdminNotifyEmailEntry(
            email: _string(s['email']),
            disabled: _bool(s['disabled']),
            verified: _bool(s['verified']),
          ),
        )
        .toList(),
  _AdminSettingKind.openAIFastPolicy =>
    value == null ? null : _openAIFast(_object(value)),
  _AdminSettingKind.quotaMap => _objectOrEmpty(
    value,
  ).map((k, v) => MapEntry(k, _quota(_object(v)))),
  _AdminSettingKind.intMap => _objectOrEmpty(
    value,
  ).map((k, v) => MapEntry(k, _int(v))),
  _AdminSettingKind.secret => Sub2ApiAdminSettingSecret(_string(value)),
};

Object? _encodeSetting(_AdminSettingKind kind, Object? value) => switch (kind) {
  _AdminSettingKind.secret => (value as Sub2ApiAdminSettingSecret).reveal(),
  _AdminSettingKind.decimal => _decimalToDouble(value as Sub2ApiDecimal),
  _AdminSettingKind.customMenuList =>
    (value as List<Sub2ApiAdminCustomMenuItem>)
        .map(
          (v) => <String, Object?>{
            'id': v.id,
            'label': v.label,
            'icon_svg': v.iconSvg,
            'url': v.url,
            'page_slug': v.pageSlug,
            'visibility': v.visibility,
            'sort_order': v.sortOrder,
          },
        )
        .toList(),
  _AdminSettingKind.customEndpointList =>
    (value as List<Sub2ApiAdminCustomEndpoint>)
        .map(
          (v) => <String, Object?>{
            'name': v.name,
            'endpoint': v.endpoint,
            'description': v.description,
          },
        )
        .toList(),
  _AdminSettingKind.defaultSubscriptionList =>
    (value as List<Sub2ApiAdminDefaultSubscriptionSetting>)
        .map(
          (v) => <String, Object?>{
            'group_id': v.groupId,
            'validity_days': v.validityDays,
          },
        )
        .toList(),
  _AdminSettingKind.loginAgreementList =>
    (value as List<Sub2ApiAdminLoginAgreementDocument>)
        .map(
          (v) => <String, Object?>{
            'id': v.id,
            'title': v.title,
            'content_md': v.contentMarkdown,
          },
        )
        .toList(),
  _AdminSettingKind.notifyEmailList =>
    (value as List<Sub2ApiAdminNotifyEmailEntry>)
        .map(
          (v) => <String, Object?>{
            'email': v.email,
            'disabled': v.disabled,
            'verified': v.verified,
          },
        )
        .toList(),
  _AdminSettingKind.openAIFastPolicy => _encodeOpenAIFast(
    value as Sub2ApiAdminOpenAIFastPolicySettings,
  ),
  _AdminSettingKind.quotaMap =>
    (value as Map<String, Sub2ApiAdminPlatformQuota>).map(
      (k, v) => MapEntry(k, <String, Object?>{
        'daily': v.dailyLimitUsd == null
            ? null
            : _decimalToDouble(v.dailyLimitUsd!),
        'weekly': v.weeklyLimitUsd == null
            ? null
            : _decimalToDouble(v.weeklyLimitUsd!),
        'monthly': v.monthlyLimitUsd == null
            ? null
            : _decimalToDouble(v.monthlyLimitUsd!),
      }),
    ),
  _ => value,
};

Sub2ApiAdminOpenAIFastPolicySettings _openAIFast(Map<String, Object?> s) =>
    Sub2ApiAdminOpenAIFastPolicySettings(
      rules: _listOrEmpty(s['rules'])
          .map(_object)
          .map(
            (r) => Sub2ApiAdminOpenAIFastPolicyRule(
              serviceTier: _string(r['service_tier']),
              action: _string(r['action']),
              scope: _string(r['scope']),
              userIds: _listOrEmpty(r['user_ids']).map(_int).toList(),
              errorMessage: _string(r['error_message']),
              modelWhitelist: _listOrEmpty(
                r['model_whitelist'],
              ).map(_string).toList(),
              fallbackAction: _string(r['fallback_action']),
              fallbackErrorMessage: _string(r['fallback_error_message']),
            ),
          )
          .toList(),
    );
Map<String, Object?> _encodeOpenAIFast(
  Sub2ApiAdminOpenAIFastPolicySettings v,
) => <String, Object?>{
  'rules': v.rules
      .map(
        (r) => <String, Object?>{
          'service_tier': r.serviceTier,
          'action': r.action,
          'scope': r.scope,
          'user_ids': r.userIds,
          'error_message': r.errorMessage,
          'model_whitelist': r.modelWhitelist,
          'fallback_action': r.fallbackAction,
          'fallback_error_message': r.fallbackErrorMessage,
        },
      )
      .toList(),
};
Sub2ApiAdminPlatformQuota _quota(Map<String, Object?> s) =>
    Sub2ApiAdminPlatformQuota(
      dailyLimitUsd: s['daily'] == null
          ? null
          : Sub2ApiDecimal.fromJson(s['daily']),
      weeklyLimitUsd: s['weekly'] == null
          ? null
          : Sub2ApiDecimal.fromJson(s['weekly']),
      monthlyLimitUsd: s['monthly'] == null
          ? null
          : Sub2ApiDecimal.fromJson(s['monthly']),
    );
double _decimalToDouble(Sub2ApiDecimal d) {
  final v = double.tryParse(d.toJson());
  if (v == null || !v.isFinite || Sub2ApiDecimal.parse(v.toString()) != d) {
    throw const Sub2ApiException(
      kind: Sub2ApiFailureKind.validation,
      code: 'admin.settings.value_not_representable',
      retryable: false,
    );
  }
  return v;
}

Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw _invalid;
  return Map<String, Object?>.from(v);
}

Map<String, Object?> _objectOrEmpty(Object? v) =>
    v == null ? <String, Object?>{} : _object(v);
List<Object?> _list(Object? v) {
  if (v is! List) throw _invalid;
  return v.cast<Object?>();
}

List<Object?> _listOrEmpty(Object? v) =>
    v == null ? const <Object?>[] : _list(v);
String _string(Object? v) {
  if (v == null) return '';
  if (v is! String) throw _invalid;
  return v;
}

int _int(Object? v) {
  if (v is! int) throw _invalid;
  return v;
}

bool _bool(Object? v) {
  if (v is! bool) throw _invalid;
  return v;
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_system_settings_response',
  retryable: false,
);
