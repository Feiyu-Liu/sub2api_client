import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../sub2api_admin_setting_models.dart';

Sub2ApiAdminApiKeyStatus mapAdminApiKeyStatus(Object? data) => _guard(() {
  final source = _object(data);
  final exists = _boolean(source['exists']);
  final masked = source['masked_key'];
  if (masked != null && masked is! String) throw const FormatException();
  if (exists && (masked is! String || masked.trim().isEmpty)) {
    throw const FormatException();
  }
  return Sub2ApiAdminApiKeyStatus(
    exists: exists,
    maskedKey: masked is String && masked.isNotEmpty
        ? Sub2ApiAdminMaskedCredential(masked)
        : null,
  );
});

Sub2ApiAdminApiKeyRegenerationResult mapAdminApiKeyRegeneration(Object? data) =>
    _guard(() {
      final key = _required(_object(data)['key']);
      if (!key.startsWith('admin-')) throw const FormatException();
      return Sub2ApiAdminApiKeyRegenerationResult(key: Sub2ApiAdminApiKey(key));
    });

Sub2ApiAdminSettingActionResult mapAdminSettingAction(Object? data) => _guard(
  () => Sub2ApiAdminSettingActionResult(
    message: _required(_object(data)['message']),
  ),
);

Sub2ApiAdminEmailTemplateList mapAdminEmailTemplateList(
  Object? data,
) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminEmailTemplateList(
    events: _list(source['events']).map(_object).map((event) {
      return Sub2ApiAdminEmailTemplateEvent(
        value: _required(event['value']),
        label: _text(event['label']),
        description: _text(event['description']),
        category: _text(event['category']),
        optional: _optionalBool(event['optional']),
      );
    }).toList(),
    locales: _list(source['locales']).map(_required).toList(),
    templates: _optionalList(source['templates']).map(_object).map((template) {
      return Sub2ApiAdminEmailTemplateSummary(
        event: _required(template['event']),
        locale: _required(template['locale']),
        subject: _required(template['subject']),
        isCustom: _optionalBool(template['is_custom']),
        updatedAt: _optionalDate(template['updated_at']),
      );
    }).toList(),
    placeholders: _optionalList(source['placeholders']).map(_required).toList(),
  );
});

Sub2ApiAdminEmailTemplateDetail mapAdminEmailTemplateDetail(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminEmailTemplateDetail(
        event: _required(source['event']),
        locale: _required(source['locale']),
        subject: _required(source['subject']),
        html: Sub2ApiAdminEmailTemplateContent(_required(source['html'])),
        isCustom: _optionalBool(source['is_custom']),
        updatedAt: _optionalDate(source['updated_at']),
        placeholders: _optionalList(
          source['placeholders'],
        ).map(_required).toList(),
      );
    });

Sub2ApiAdminEmailTemplatePreview mapAdminEmailTemplatePreview(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminEmailTemplatePreview(
        subject: _required(source['subject']),
        html: Sub2ApiAdminEmailTemplateContent(_required(source['html'])),
      );
    });

Sub2ApiAdminOverloadCooldownSettings mapAdminOverloadCooldown(Object? data) =>
    _guard(() {
      final s = _object(data);
      return Sub2ApiAdminOverloadCooldownSettings(
        enabled: _boolean(s['enabled']),
        cooldownMinutes: _positive(s['cooldown_minutes']),
      );
    });
Sub2ApiAdminRateLimit429CooldownSettings mapAdminRateLimit429Cooldown(
  Object? data,
) => _guard(() {
  final s = _object(data);
  return Sub2ApiAdminRateLimit429CooldownSettings(
    enabled: _boolean(s['enabled']),
    cooldownSeconds: _positive(s['cooldown_seconds']),
  );
});
Sub2ApiAdminPanelRateLimitSettings mapAdminPanelRateLimit(Object? data) =>
    _guard(() {
      final s = _object(data);
      return Sub2ApiAdminPanelRateLimitSettings(
        enabled: _boolean(s['enabled']),
        userRpm: _nonNegative(s['user_rpm']),
        heavyRpm: _nonNegative(s['heavy_rpm']),
        exemptAdmin: _boolean(s['exempt_admin']),
        publicIpRpm: _nonNegative(s['public_ip_rpm']),
      );
    });
Sub2ApiAdminStreamTimeoutSettings mapAdminStreamTimeout(Object? data) =>
    _guard(() {
      final s = _object(data);
      return Sub2ApiAdminStreamTimeoutSettings(
        enabled: _boolean(s['enabled']),
        action: _streamAction(_required(s['action'])),
        tempUnschedMinutes: _positive(s['temp_unsched_minutes']),
        thresholdCount: _positive(s['threshold_count']),
        thresholdWindowMinutes: _positive(s['threshold_window_minutes']),
      );
    });
Sub2ApiAdminRectifierSettings mapAdminRectifier(Object? data) => _guard(() {
  final s = _object(data);
  return Sub2ApiAdminRectifierSettings(
    enabled: _boolean(s['enabled']),
    thinkingSignatureEnabled: _boolean(s['thinking_signature_enabled']),
    thinkingBudgetEnabled: _boolean(s['thinking_budget_enabled']),
    apiKeySignatureEnabled: _boolean(s['apikey_signature_enabled']),
    apiKeySignaturePatterns: _list(
      s['apikey_signature_patterns'],
    ).map(_required).toList(),
  );
});
Sub2ApiAdminBetaPolicySettings mapAdminBetaPolicy(Object? data) => _guard(() {
  final s = _object(data);
  return Sub2ApiAdminBetaPolicySettings(
    rules: _list(s['rules'])
        .map(_object)
        .map(
          (r) => Sub2ApiAdminBetaPolicyRule(
            betaToken: _required(r['beta_token']),
            action: _betaAction(_required(r['action'])),
            scope: _betaScope(_required(r['scope'])),
            errorMessage: _text(r['error_message']),
            modelWhitelist: _optionalList(
              r['model_whitelist'],
            ).map(_required).toList(),
            fallbackAction: _optionalBetaAction(r['fallback_action']),
            fallbackErrorMessage: _text(r['fallback_error_message']),
          ),
        )
        .toList(),
  );
});

Sub2ApiAdminStreamTimeoutAction _streamAction(String v) => switch (v) {
  'temp_unsched' => Sub2ApiAdminStreamTimeoutAction.tempUnsched,
  'error' => Sub2ApiAdminStreamTimeoutAction.error,
  'none' => Sub2ApiAdminStreamTimeoutAction.none,
  _ => throw const FormatException(),
};
Sub2ApiAdminBetaPolicyAction _betaAction(String v) => switch (v) {
  'pass' => Sub2ApiAdminBetaPolicyAction.pass,
  'filter' => Sub2ApiAdminBetaPolicyAction.filter,
  'block' => Sub2ApiAdminBetaPolicyAction.block,
  _ => throw const FormatException(),
};
Sub2ApiAdminBetaPolicyAction? _optionalBetaAction(Object? v) {
  final t = _text(v);
  return t.isEmpty ? null : _betaAction(t);
}

Sub2ApiAdminBetaPolicyScope _betaScope(String v) => switch (v) {
  'all' => Sub2ApiAdminBetaPolicyScope.all,
  'oauth' => Sub2ApiAdminBetaPolicyScope.oauth,
  'apikey' => Sub2ApiAdminBetaPolicyScope.apiKey,
  'bedrock' => Sub2ApiAdminBetaPolicyScope.bedrock,
  _ => throw const FormatException(),
};

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

bool _boolean(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

bool _optionalBool(Object? value) => value == null ? false : _boolean(value);

int _integer(Object? value) {
  if (value is! int) throw const FormatException();
  return value;
}

int _positive(Object? value) {
  final n = _integer(value);
  if (n <= 0) throw const FormatException();
  return n;
}

int _nonNegative(Object? value) {
  final n = _integer(value);
  if (n < 0) throw const FormatException();
  return n;
}

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

List<Object?> _optionalList(Object? value) =>
    value == null ? const <Object?>[] : _list(value);

String _text(Object? value) {
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String _required(Object? value) {
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return value;
}

DateTime? _optionalDate(Object? value) {
  final text = _text(value);
  if (text.isEmpty) return null;
  return DateTime.parse(text).toUtc();
}

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_setting_response',
  retryable: false,
);
