import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_setting_models.dart';
import 'wire/admin_setting_wire_mapper.dart';
import 'wire/admin_setting_wire_service.dart';

abstract interface class Sub2ApiAdminSettingsClient {
  Future<Sub2ApiAdminApiKeyStatus> getAdminApiKeyStatus({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminApiKeyRegenerationResult> regenerateAdminApiKey({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSettingActionResult> deleteAdminApiKey({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSettingActionResult> testSmtp(
    Sub2ApiAdminTestSmtpRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSettingActionResult> sendTestEmail(
    Sub2ApiAdminSendTestEmailRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminEmailTemplateList> listEmailTemplates({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminEmailTemplateDetail> getEmailTemplate(
    String event,
    String locale, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminEmailTemplateDetail> updateEmailTemplate(
    String event,
    String locale,
    Sub2ApiAdminUpdateEmailTemplateRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminEmailTemplateDetail> restoreOfficialEmailTemplate(
    String event,
    String locale, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminEmailTemplatePreview> previewEmailTemplate(
    Sub2ApiAdminPreviewEmailTemplateRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOverloadCooldownSettings> getOverloadCooldown({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOverloadCooldownSettings> updateOverloadCooldown(
    Sub2ApiAdminOverloadCooldownSettings settings, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminRateLimit429CooldownSettings> getRateLimit429Cooldown({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminRateLimit429CooldownSettings> updateRateLimit429Cooldown(
    Sub2ApiAdminRateLimit429CooldownSettings settings, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPanelRateLimitSettings> getPanelRateLimit({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPanelRateLimitSettings> updatePanelRateLimit(
    Sub2ApiAdminPanelRateLimitSettings settings, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminStreamTimeoutSettings> getStreamTimeout({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminStreamTimeoutSettings> updateStreamTimeout(
    Sub2ApiAdminStreamTimeoutSettings settings, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminRectifierSettings> getRectifier({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminRectifierSettings> updateRectifier(
    Sub2ApiAdminRectifierSettings settings, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBetaPolicySettings> getBetaPolicy({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBetaPolicySettings> updateBetaPolicy(
    Sub2ApiAdminBetaPolicySettings settings, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminSettingsClient createSub2ApiAdminSettingsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminSettingsClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminSettingWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminSettingWireService _service;

  @override
  Future<Sub2ApiAdminApiKeyStatus> getAdminApiKeyStatus({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.getAdminApiKey(c, o, _a(v), _k(v)),
    decode: mapAdminApiKeyStatus,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminApiKeyRegenerationResult> regenerateAdminApiKey({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedNonReplayableRequest(
    send: (c, o, v) => _service.regenerateAdminApiKey(c, o, _a(v), _k(v)),
    decode: mapAdminApiKeyRegeneration,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminSettingActionResult> deleteAdminApiKey({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedNonReplayableRequest(
    send: (c, o, v) => _service.deleteAdminApiKey(c, o, _a(v), _k(v)),
    decode: mapAdminSettingAction,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminSettingActionResult> testSmtp(
    Sub2ApiAdminTestSmtpRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _port(request.port);
    return _mutation(
      send: (c, o, v) => _service.testSmtp(
        <String, Object?>{
          'smtp_host': request.host.trim(),
          'smtp_port': request.port,
          'smtp_username': request.username.trim(),
          'smtp_password': request.password?.reveal() ?? '',
          'smtp_use_tls': request.useTls,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminSettingActionResult> sendTestEmail(
    Sub2ApiAdminSendTestEmailRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (!_email.hasMatch(request.email.trim())) {
      throw _validation('admin.settings.invalid_test_email');
    }
    _port(request.port);
    return _mutation(
      send: (c, o, v) => _service.sendTestEmail(
        <String, Object?>{
          'email': request.email.trim(),
          'smtp_host': request.host.trim(),
          'smtp_port': request.port,
          'smtp_username': request.username.trim(),
          'smtp_password': request.password?.reveal() ?? '',
          'smtp_from_email': request.fromEmail.trim(),
          'smtp_from_name': request.fromName.trim(),
          'smtp_use_tls': request.useTls,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminEmailTemplateList> listEmailTemplates({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.listEmailTemplates(c, o, _a(v), _k(v)),
    decode: mapAdminEmailTemplateList,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminEmailTemplateDetail> getEmailTemplate(
    String event,
    String locale, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final path = _templatePath(event, locale);
    return _executor.protectedRequest(
      send: (c, o, v) =>
          _service.getEmailTemplate(path.$1, path.$2, c, o, _a(v), _k(v)),
      decode: mapAdminEmailTemplateDetail,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminEmailTemplateDetail> updateEmailTemplate(
    String event,
    String locale,
    Sub2ApiAdminUpdateEmailTemplateRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final path = _templatePath(event, locale);
    final subject = _required(
      request.subject,
      'admin.settings.subject_required',
    );
    final html = _required(
      request.html.reveal(),
      'admin.settings.template_html_required',
    );
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.updateEmailTemplate(
        path.$1,
        path.$2,
        <String, Object?>{'subject': subject, 'html': html},
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminEmailTemplateDetail,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminEmailTemplateDetail> restoreOfficialEmailTemplate(
    String event,
    String locale, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final path = _templatePath(event, locale);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) =>
          _service.restoreEmailTemplate(path.$1, path.$2, c, o, _a(v), _k(v)),
      decode: mapAdminEmailTemplateDetail,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminEmailTemplatePreview> previewEmailTemplate(
    Sub2ApiAdminPreviewEmailTemplateRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final event = _required(request.event, 'admin.settings.event_required');
    final locale = _required(request.locale, 'admin.settings.locale_required');
    final subject = _required(
      request.subject,
      'admin.settings.subject_required',
    );
    final html = _required(
      request.html.reveal(),
      'admin.settings.template_html_required',
    );
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.previewEmailTemplate(
        <String, Object?>{
          'event': event,
          'locale': locale,
          'subject': subject,
          'html': html,
          'variables': request.variables,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminEmailTemplatePreview,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOverloadCooldownSettings> getOverloadCooldown({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.getOverloadCooldown(c, o, _a(v), _k(v)),
    decode: mapAdminOverloadCooldown,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminOverloadCooldownSettings> updateOverloadCooldown(
    Sub2ApiAdminOverloadCooldownSettings s, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (s.enabled && (s.cooldownMinutes < 1 || s.cooldownMinutes > 120)) {
      throw _validation('admin.settings.invalid_overload_cooldown');
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.updateOverloadCooldown(
        <String, Object?>{
          'enabled': s.enabled,
          'cooldown_minutes': s.cooldownMinutes,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminOverloadCooldown,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRateLimit429CooldownSettings> getRateLimit429Cooldown({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.getRateLimit429Cooldown(c, o, _a(v), _k(v)),
    decode: mapAdminRateLimit429Cooldown,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminRateLimit429CooldownSettings> updateRateLimit429Cooldown(
    Sub2ApiAdminRateLimit429CooldownSettings s, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (s.enabled && (s.cooldownSeconds < 1 || s.cooldownSeconds > 7200)) {
      throw _validation('admin.settings.invalid_429_cooldown');
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.updateRateLimit429Cooldown(
        <String, Object?>{
          'enabled': s.enabled,
          'cooldown_seconds': s.cooldownSeconds,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminRateLimit429Cooldown,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPanelRateLimitSettings> getPanelRateLimit({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.getPanelRateLimit(c, o, _a(v), _k(v)),
    decode: mapAdminPanelRateLimit,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminPanelRateLimitSettings> updatePanelRateLimit(
    Sub2ApiAdminPanelRateLimitSettings s, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (<int>[
      s.userRpm,
      s.heavyRpm,
      s.publicIpRpm,
    ].any((v) => v < 0 || v > 100000)) {
      throw _validation('admin.settings.invalid_panel_rate_limit');
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.updatePanelRateLimit(
        <String, Object?>{
          'enabled': s.enabled,
          'user_rpm': s.userRpm,
          'heavy_rpm': s.heavyRpm,
          'exempt_admin': s.exemptAdmin,
          'public_ip_rpm': s.publicIpRpm,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminPanelRateLimit,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminStreamTimeoutSettings> getStreamTimeout({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.getStreamTimeout(c, o, _a(v), _k(v)),
    decode: mapAdminStreamTimeout,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminStreamTimeoutSettings> updateStreamTimeout(
    Sub2ApiAdminStreamTimeoutSettings s, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (s.tempUnschedMinutes < 1 ||
        s.tempUnschedMinutes > 60 ||
        s.thresholdCount < 1 ||
        s.thresholdCount > 10 ||
        s.thresholdWindowMinutes < 1 ||
        s.thresholdWindowMinutes > 60) {
      throw _validation('admin.settings.invalid_stream_timeout');
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.updateStreamTimeout(
        <String, Object?>{
          'enabled': s.enabled,
          'action': _streamAction(s.action),
          'temp_unsched_minutes': s.tempUnschedMinutes,
          'threshold_count': s.thresholdCount,
          'threshold_window_minutes': s.thresholdWindowMinutes,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminStreamTimeout,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRectifierSettings> getRectifier({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.getRectifier(c, o, _a(v), _k(v)),
    decode: mapAdminRectifier,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminRectifierSettings> updateRectifier(
    Sub2ApiAdminRectifierSettings s, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (s.apiKeySignaturePatterns.length > 50 ||
        s.apiKeySignaturePatterns.any((p) => p.trim().length > 500)) {
      throw _validation('admin.settings.invalid_rectifier_patterns');
    }
    final patterns = s.apiKeySignaturePatterns
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList();
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.updateRectifier(
        <String, Object?>{
          'enabled': s.enabled,
          'thinking_signature_enabled': s.thinkingSignatureEnabled,
          'thinking_budget_enabled': s.thinkingBudgetEnabled,
          'apikey_signature_enabled': s.apiKeySignatureEnabled,
          'apikey_signature_patterns': patterns,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminRectifier,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminBetaPolicySettings> getBetaPolicy({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.getBetaPolicy(c, o, _a(v), _k(v)),
    decode: mapAdminBetaPolicy,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminBetaPolicySettings> updateBetaPolicy(
    Sub2ApiAdminBetaPolicySettings s, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final rules = s.rules.map(_betaRuleBody).toList();
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.updateBetaPolicy(
        <String, Object?>{'rules': rules},
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminBetaPolicy,
      requestOptions: requestOptions,
    );
  }

  Future<Sub2ApiAdminSettingActionResult> _mutation({
    required Sub2ApiWireCall send,
    required Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedNonReplayableRequest(
    send: send,
    decode: mapAdminSettingAction,
    requestOptions: requestOptions,
  );

  String? _a(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? value : null;
  String? _k(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? value : null;
}

final _email = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
void _port(int value) {
  if (value < 0 || value > 65535) {
    throw _validation('admin.settings.invalid_smtp_port');
  }
}

(String, String) _templatePath(String event, String locale) => (
  _required(event, 'admin.settings.event_required'),
  _required(locale, 'admin.settings.locale_required'),
);
String _required(String value, String code) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) throw _validation(code);
  return trimmed;
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);

String _streamAction(Sub2ApiAdminStreamTimeoutAction v) => switch (v) {
  Sub2ApiAdminStreamTimeoutAction.tempUnsched => 'temp_unsched',
  Sub2ApiAdminStreamTimeoutAction.error => 'error',
  Sub2ApiAdminStreamTimeoutAction.none => 'none',
};
String _betaAction(Sub2ApiAdminBetaPolicyAction v) => switch (v) {
  Sub2ApiAdminBetaPolicyAction.pass => 'pass',
  Sub2ApiAdminBetaPolicyAction.filter => 'filter',
  Sub2ApiAdminBetaPolicyAction.block => 'block',
};
String _betaScope(Sub2ApiAdminBetaPolicyScope v) => switch (v) {
  Sub2ApiAdminBetaPolicyScope.all => 'all',
  Sub2ApiAdminBetaPolicyScope.oauth => 'oauth',
  Sub2ApiAdminBetaPolicyScope.apiKey => 'apikey',
  Sub2ApiAdminBetaPolicyScope.bedrock => 'bedrock',
};
Map<String, Object?> _betaRuleBody(Sub2ApiAdminBetaPolicyRule r) {
  final token = r.betaToken.trim();
  if (token.isEmpty) throw _validation('admin.settings.beta_token_required');
  final models = r.modelWhitelist.map((m) => m.trim()).toList();
  if (models.any((m) => m.isEmpty)) {
    throw _validation('admin.settings.invalid_beta_model');
  }
  return <String, Object?>{
    'beta_token': token,
    'action': _betaAction(r.action),
    'scope': _betaScope(r.scope),
    'error_message': r.errorMessage.trim(),
    'model_whitelist': models,
    'fallback_action': r.fallbackAction == null
        ? ''
        : _betaAction(r.fallbackAction!),
    'fallback_error_message': r.fallbackErrorMessage.trim(),
  };
}
