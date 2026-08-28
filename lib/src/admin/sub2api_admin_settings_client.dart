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
