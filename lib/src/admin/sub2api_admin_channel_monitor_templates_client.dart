import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_channel_monitor_template_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_channel_monitor_template_wire_mapper.dart';
import 'wire/admin_channel_monitor_template_wire_service.dart';

abstract interface class Sub2ApiAdminChannelMonitorTemplatesClient {
  Future<List<Sub2ApiAdminChannelMonitorTemplate>> list({
    Sub2ApiAdminMonitorTemplateProvider? provider,
    Sub2ApiAdminMonitorTemplateApiMode? apiMode,
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminChannelMonitorTemplate> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminChannelMonitorTemplate> create(
    Sub2ApiAdminCreateChannelMonitorTemplateRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminChannelMonitorTemplate> update(
    int id,
    Sub2ApiAdminUpdateChannelMonitorTemplateRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<void> delete(int id, {Sub2ApiRequestOptions? requestOptions});
  Future<Sub2ApiAdminApplyMonitorTemplateResult> apply(
    int id,
    List<int> monitorIds, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<List<Sub2ApiAdminAssociatedMonitor>> listMonitors(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminChannelMonitorTemplatesClient
createSub2ApiAdminChannelMonitorTemplatesClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminChannelMonitorTemplatesClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminChannelMonitorTemplateWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminChannelMonitorTemplateWireService _service;
  @override
  Future<List<Sub2ApiAdminChannelMonitorTemplate>> list({
    Sub2ApiAdminMonitorTemplateProvider? provider,
    Sub2ApiAdminMonitorTemplateApiMode? apiMode,
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, k) => _service.list(
      provider == null ? null : _provider(provider),
      apiMode == null ? null : _apiMode(apiMode),
      c,
      o,
      _auth(k),
      _key(k),
    ),
    decode: mapAdminChannelMonitorTemplates,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminChannelMonitorTemplate> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.get(id, c, o, _auth(k), _key(k)),
      decode: mapAdminChannelMonitorTemplate,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannelMonitorTemplate> create(
    Sub2ApiAdminCreateChannelMonitorTemplateRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _createBody(r);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.create(body, c, o, _auth(k), _key(k)),
      decode: mapAdminChannelMonitorTemplate,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannelMonitorTemplate> update(
    int id,
    Sub2ApiAdminUpdateChannelMonitorTemplateRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    if (r.name != null) _name(r.name!);
    final body = <String, Object?>{
      'name': ?r.name?.trim(),
      'api_mode': ?r.apiMode == null ? null : _apiMode(r.apiMode!),
      'description': ?r.description?.trim(),
      'extra_headers': ?r.extraHeaders,
      'body_override_mode': ?r.bodyOverrideMode?.name,
      'body_override': ?r.bodyOverride?.toWire(),
    };
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.update(id, body, c, o, _auth(k), _key(k)),
      decode: mapAdminChannelMonitorTemplate,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<void> delete(int id, {Sub2ApiRequestOptions? requestOptions}) {
    _id(id);
    return _executor.protectedNonReplayableRequest<void>(
      send: (c, o, k) => _service.delete(id, c, o, _auth(k), _key(k)),
      decode: mapAdminDeletedMonitorTemplate,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminApplyMonitorTemplateResult> apply(
    int id,
    List<int> monitorIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final ids = _ids(monitorIds);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.apply(
        id,
        <String, Object?>{'monitor_ids': ids},
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminApplyMonitorTemplate,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminAssociatedMonitor>> listMonitors(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.monitors(id, c, o, _auth(k), _key(k)),
      decode: mapAdminAssociatedMonitors,
      requestOptions: requestOptions,
    );
  }

  String? _auth(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? _key(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? v : null;
}

Map<String, Object?> _createBody(
  Sub2ApiAdminCreateChannelMonitorTemplateRequest r,
) {
  final name = _name(r.name);
  if (r.description.length > 500) {
    throw _validation('admin.monitor_templates.description_too_long');
  }
  if (r.provider != Sub2ApiAdminMonitorTemplateProvider.openAi &&
      r.apiMode == Sub2ApiAdminMonitorTemplateApiMode.responses) {
    throw _validation('admin.monitor_templates.invalid_api_mode');
  }
  if (r.bodyOverrideMode != Sub2ApiAdminMonitorTemplateBodyMode.off &&
      r.bodyOverride == null) {
    throw _validation('admin.monitor_templates.body_required');
  }
  return <String, Object?>{
    'name': name,
    'provider': _provider(r.provider),
    'api_mode': _apiMode(r.apiMode),
    'description': r.description.trim(),
    'extra_headers': r.extraHeaders,
    'body_override_mode': r.bodyOverrideMode.name,
    'body_override': r.bodyOverride?.toWire(),
  };
}

List<int> _ids(List<int> v) {
  if (v.isEmpty) {
    throw _validation('admin.monitor_templates.monitor_ids_required');
  }
  if (v.any((id) => id <= 0)) {
    throw _validation('admin.monitor_templates.invalid_monitor_id');
  }
  return v.toSet().toList();
}

void _id(int v) {
  if (v <= 0) throw _validation('admin.monitor_templates.invalid_id');
}

String _name(String v) {
  final t = v.trim();
  if (t.isEmpty || t.length > 100) {
    throw _validation('admin.monitor_templates.invalid_name');
  }
  return t;
}

String _provider(Sub2ApiAdminMonitorTemplateProvider v) =>
    v == Sub2ApiAdminMonitorTemplateProvider.openAi ? 'openai' : v.name;
String _apiMode(Sub2ApiAdminMonitorTemplateApiMode v) =>
    v == Sub2ApiAdminMonitorTemplateApiMode.chatCompletions
    ? 'chat_completions'
    : 'responses';
Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
