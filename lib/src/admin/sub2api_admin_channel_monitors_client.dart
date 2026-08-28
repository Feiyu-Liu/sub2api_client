import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_channel_monitor_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_channel_monitor_wire_mapper.dart';
import 'wire/admin_channel_monitor_wire_service.dart';

abstract interface class Sub2ApiAdminChannelMonitorsClient {
  Future<Sub2ApiAdminChannelMonitorPage> list({
    Sub2ApiAdminChannelMonitorListQuery query =
        const Sub2ApiAdminChannelMonitorListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminChannelMonitor> create(
    Sub2ApiAdminCreateChannelMonitorRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminChannelMonitor> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminChannelMonitor> duplicate(
    int id,
    Sub2ApiAdminDuplicateChannelMonitorRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminChannelMonitor> update(
    int id,
    Sub2ApiAdminUpdateChannelMonitorRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<void> delete(int id, {Sub2ApiRequestOptions? requestOptions});

  Future<List<Sub2ApiAdminChannelMonitorCheckResult>> run(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminChannelMonitorHistoryItem>> getHistory(
    int id, {
    String? model,
    int limit = 100,
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminChannelMonitorsClient createSub2ApiAdminChannelMonitorsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminChannelMonitorsClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminChannelMonitorWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminChannelMonitorWireService _service;

  @override
  Future<Sub2ApiAdminChannelMonitorPage> list({
    Sub2ApiAdminChannelMonitorListQuery query =
        const Sub2ApiAdminChannelMonitorListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.list(
        <String, dynamic>{
          'page': query.page,
          'page_size': query.pageSize,
          if (query.provider != null) 'provider': _provider(query.provider!),
          'enabled': ?query.enabled,
          if (query.search?.trim().isNotEmpty ?? false)
            'search': query.search!.trim(),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannelMonitorPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannelMonitor> create(
    Sub2ApiAdminCreateChannelMonitorRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _createBody(request);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.create(
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannelMonitor,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannelMonitor> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.get(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannelMonitor,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannelMonitor> duplicate(
    int id,
    Sub2ApiAdminDuplicateChannelMonitorRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final key = request.idempotencyKey.trim();
    if (key.isEmpty) {
      throw _validation('admin.channel_monitors.idempotency_key_required');
    }
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.duplicate(
        id,
        key,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannelMonitor,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannelMonitor> update(
    int id,
    Sub2ApiAdminUpdateChannelMonitorRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final body = _updateBody(request);
    if (body.isEmpty) {
      throw _validation('admin.channel_monitors.empty_update');
    }
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.update(
        id,
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannelMonitor,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<void> delete(int id, {Sub2ApiRequestOptions? requestOptions}) {
    _id(id);
    return _executor.protectedNonReplayableRequest<void>(
      send: (cancelToken, options, credential) => _service.delete(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminDeletedChannelMonitor,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminChannelMonitorCheckResult>> run(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.run(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannelMonitorRun,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminChannelMonitorHistoryItem>> getHistory(
    int id, {
    String? model,
    int limit = 100,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    if (limit <= 0 || limit > 1000) {
      throw _validation('admin.channel_monitors.invalid_history_limit');
    }
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.history(
        id,
        model?.trim().isEmpty ?? true ? null : model!.trim(),
        limit,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannelMonitorHistory,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

Map<String, Object?> _createBody(
  Sub2ApiAdminCreateChannelMonitorRequest request,
) {
  final name = _name(request.name);
  _validateMode(
    provider: request.provider,
    apiMode: request.apiMode,
    checkMode: request.checkMode,
    endpoint: request.endpoint,
    hasApiKey: request.apiKey?.reveal().trim().isNotEmpty ?? false,
    primaryModel: request.primaryModel,
    accountId: request.accountId,
  );
  _schedule(request.intervalSeconds, request.jitterSeconds);
  _optionalPositive(request.templateId, 'template_id');
  _advanced(request.bodyOverrideMode, request.bodyOverride);
  final apiKey = request.apiKey?.reveal().trim();
  if (apiKey != null && apiKey.length > 2000) {
    throw _validation('admin.channel_monitors.api_key_too_long');
  }
  return <String, Object?>{
    'name': name,
    'provider': _provider(request.provider),
    'api_mode': _apiMode(request.apiMode),
    if (request.endpoint != null) 'endpoint': _endpoint(request.endpoint!),
    if (apiKey != null && apiKey.isNotEmpty) 'api_key': apiKey,
    'primary_model': request.primaryModel.trim(),
    'extra_models': _models(request.extraModels),
    'group_name': _groupName(request.groupName),
    'enabled': request.enabled,
    'interval_seconds': request.intervalSeconds,
    'jitter_seconds': request.jitterSeconds,
    'template_id': ?request.templateId,
    'extra_headers': request.extraHeaders,
    'body_override_mode': _bodyMode(request.bodyOverrideMode),
    if (request.bodyOverride != null)
      'body_override': request.bodyOverride!.toWire(),
    'check_mode': _checkMode(request.checkMode),
    'account_id': ?request.accountId,
  };
}

Map<String, Object?> _updateBody(
  Sub2ApiAdminUpdateChannelMonitorRequest request,
) {
  if (request.name != null) _name(request.name!);
  if (request.intervalSeconds != null || request.jitterSeconds != null) {
    if (request.intervalSeconds != null && request.jitterSeconds != null) {
      _schedule(request.intervalSeconds!, request.jitterSeconds!);
    } else if (request.intervalSeconds != null &&
        (request.intervalSeconds! < 15 || request.intervalSeconds! > 3600)) {
      throw _validation('admin.channel_monitors.invalid_interval');
    } else if (request.jitterSeconds != null && request.jitterSeconds! < 0) {
      throw _validation('admin.channel_monitors.invalid_jitter');
    }
  }
  if (request.provider != null &&
      request.checkMode != null &&
      request.provider == Sub2ApiAdminChannelMonitorProvider.antigravity &&
      request.checkMode != Sub2ApiAdminChannelMonitorCheckMode.quota) {
    throw _validation('admin.channel_monitors.invalid_check_mode');
  }
  if (request.provider != null &&
      request.apiMode == Sub2ApiAdminChannelMonitorApiMode.responses &&
      request.provider != Sub2ApiAdminChannelMonitorProvider.openAi) {
    throw _validation('admin.channel_monitors.invalid_api_mode');
  }
  if (request.endpoint != null) _endpoint(request.endpoint!);
  if (request.templateId != null) {
    _optionalPositive(request.templateId, 'template_id');
  }
  if (request.accountId != null && request.accountId! < 0) {
    throw _validation('admin.channel_monitors.invalid_account_id');
  }
  if (request.bodyOverrideMode != null) {
    _advanced(request.bodyOverrideMode!, request.bodyOverride);
  }
  final key = request.apiKey?.reveal().trim();
  if (key != null && key.length > 2000) {
    throw _validation('admin.channel_monitors.api_key_too_long');
  }
  if (request.clearEndpoint && request.endpoint != null) {
    throw _validation('admin.channel_monitors.endpoint_clear_conflict');
  }
  if (request.clearTemplate && request.templateId != null) {
    throw _validation('admin.channel_monitors.template_clear_conflict');
  }
  return <String, Object?>{
    if (request.name != null) 'name': request.name!.trim(),
    if (request.provider != null) 'provider': _provider(request.provider!),
    if (request.apiMode != null) 'api_mode': _apiMode(request.apiMode!),
    if (request.clearEndpoint) 'endpoint': '',
    if (request.endpoint != null) 'endpoint': _endpoint(request.endpoint!),
    if (key != null && key.isNotEmpty) 'api_key': key,
    if (request.primaryModel != null)
      'primary_model': request.primaryModel!.trim(),
    if (request.extraModels != null)
      'extra_models': _models(request.extraModels!),
    if (request.groupName != null) 'group_name': _groupName(request.groupName!),
    'enabled': ?request.enabled,
    'interval_seconds': ?request.intervalSeconds,
    'jitter_seconds': ?request.jitterSeconds,
    'template_id': ?request.templateId,
    if (request.clearTemplate) 'clear_template': true,
    if (request.extraHeaders != null) 'extra_headers': request.extraHeaders,
    if (request.bodyOverrideMode != null)
      'body_override_mode': _bodyMode(request.bodyOverrideMode!),
    if (request.bodyOverride != null)
      'body_override': request.bodyOverride!.toWire(),
    if (request.checkMode != null) 'check_mode': _checkMode(request.checkMode!),
    'account_id': ?request.accountId,
  };
}

void _validateMode({
  required Sub2ApiAdminChannelMonitorProvider provider,
  required Sub2ApiAdminChannelMonitorApiMode apiMode,
  required Sub2ApiAdminChannelMonitorCheckMode checkMode,
  required Uri? endpoint,
  required bool hasApiKey,
  required String primaryModel,
  required int? accountId,
}) {
  if (provider == Sub2ApiAdminChannelMonitorProvider.antigravity &&
      checkMode != Sub2ApiAdminChannelMonitorCheckMode.quota) {
    throw _validation('admin.channel_monitors.invalid_check_mode');
  }
  if (apiMode == Sub2ApiAdminChannelMonitorApiMode.responses &&
      provider != Sub2ApiAdminChannelMonitorProvider.openAi) {
    throw _validation('admin.channel_monitors.invalid_api_mode');
  }
  if (checkMode != Sub2ApiAdminChannelMonitorCheckMode.quota) {
    if (endpoint == null) {
      throw _validation('admin.channel_monitors.endpoint_required');
    }
    _endpoint(endpoint);
    if (!hasApiKey) {
      throw _validation('admin.channel_monitors.api_key_required');
    }
  }
  if (checkMode != Sub2ApiAdminChannelMonitorCheckMode.probe &&
      (accountId == null || accountId <= 0)) {
    throw _validation('admin.channel_monitors.account_required');
  }
  if (primaryModel.trim().isEmpty &&
      checkMode != Sub2ApiAdminChannelMonitorCheckMode.quota &&
      provider != Sub2ApiAdminChannelMonitorProvider.grok) {
    throw _validation('admin.channel_monitors.primary_model_required');
  }
  if (primaryModel.runes.length > 200) {
    throw _validation('admin.channel_monitors.primary_model_too_long');
  }
}

String _endpoint(Uri value) {
  if (value.scheme != 'https' ||
      !value.hasAuthority ||
      (value.path.isNotEmpty && value.path != '/') ||
      value.hasQuery ||
      value.hasFragment) {
    throw _validation('admin.channel_monitors.invalid_endpoint');
  }
  final result = value.toString().replaceFirst(RegExp(r'/$'), '');
  if (result.length > 500) {
    throw _validation('admin.channel_monitors.endpoint_too_long');
  }
  return result;
}

void _schedule(int interval, int jitter) {
  if (interval < 15 || interval > 3600) {
    throw _validation('admin.channel_monitors.invalid_interval');
  }
  if (jitter < 0 || interval - jitter < 15) {
    throw _validation('admin.channel_monitors.invalid_jitter');
  }
}

void _advanced(Sub2ApiAdminChannelMonitorBodyMode mode, Object? body) {
  if (mode != Sub2ApiAdminChannelMonitorBodyMode.off && body == null) {
    throw _validation('admin.channel_monitors.body_override_required');
  }
}

String _name(String value) {
  final result = value.trim();
  if (result.isEmpty || result.runes.length > 100) {
    throw _validation('admin.channel_monitors.invalid_name');
  }
  return result;
}

String _groupName(String value) {
  final result = value.trim();
  if (result.runes.length > 100) {
    throw _validation('admin.channel_monitors.group_name_too_long');
  }
  return result;
}

List<String> _models(List<String> values) => values
    .map((value) => value.trim())
    .where((value) => value.isNotEmpty)
    .toSet()
    .toList(growable: false);

void _page(int page, int pageSize) {
  if (page <= 0) throw _validation('admin.channel_monitors.invalid_page');
  if (pageSize <= 0 || pageSize > 100) {
    throw _validation('admin.channel_monitors.invalid_page_size');
  }
}

void _id(int id) {
  if (id <= 0) throw _validation('admin.channel_monitors.invalid_id');
}

void _optionalPositive(int? value, String field) {
  if (value != null && value <= 0) {
    throw _validation('admin.channel_monitors.invalid_$field');
  }
}

String _provider(Sub2ApiAdminChannelMonitorProvider value) =>
    value == Sub2ApiAdminChannelMonitorProvider.openAi ? 'openai' : value.name;

String _apiMode(Sub2ApiAdminChannelMonitorApiMode value) =>
    value == Sub2ApiAdminChannelMonitorApiMode.chatCompletions
    ? 'chat_completions'
    : 'responses';

String _bodyMode(Sub2ApiAdminChannelMonitorBodyMode value) => value.name;

String _checkMode(Sub2ApiAdminChannelMonitorCheckMode value) =>
    value == Sub2ApiAdminChannelMonitorCheckMode.quotaProbe
    ? 'quota_probe'
    : value.name;

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
