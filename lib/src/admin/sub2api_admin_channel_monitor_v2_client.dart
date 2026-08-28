import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../commerce/sub2api_monitor_models.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_channel_monitor_v2_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_channel_monitor_v2_wire_mapper.dart';
import 'wire/admin_channel_monitor_v2_wire_service.dart';

abstract interface class Sub2ApiAdminChannelMonitorV2Client {
  Future<Sub2ApiMonitorConfig> getConfig({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiMonitorConfig> updateConfig(
    Sub2ApiAdminUpdateMonitorV2ConfigRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiMonitorDimensions> getDimensions(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiMonitorSnapshot> getSnapshot(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiMonitorList<Sub2ApiMonitorModelRow>> getModels(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiMonitorMatrix> getMatrix(
    Sub2ApiMonitorFilter filter,
    Sub2ApiMonitorGroupBy groupBy, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiMonitorList<Sub2ApiMonitorErrorRow>> getErrors(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiMonitorList<Sub2ApiMonitorUserRow>> getUsers(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminChannelMonitorV2Client createSub2ApiAdminChannelMonitorV2Client({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminChannelMonitorV2Client {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminChannelMonitorV2WireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminChannelMonitorV2WireService _service;

  @override
  Future<Sub2ApiMonitorConfig> getConfig({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, credential) => _service.config(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminMonitorV2Config,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorConfig> updateConfig(
    Sub2ApiAdminUpdateMonitorV2ConfigRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _configBody(request);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.updateConfig(
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminMonitorV2Config,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiMonitorDimensions> getDimensions(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(
    filter,
    send: _service.dimensions,
    decode: mapAdminMonitorV2Dimensions,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorSnapshot> getSnapshot(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(
    filter,
    send: _service.snapshot,
    decode: mapAdminMonitorV2Snapshot,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorList<Sub2ApiMonitorModelRow>> getModels(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(
    filter,
    send: _service.models,
    decode: mapAdminMonitorV2Models,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorMatrix> getMatrix(
    Sub2ApiMonitorFilter filter,
    Sub2ApiMonitorGroupBy groupBy, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(
    filter,
    extraQuery: <String, dynamic>{'group_by': _groupBy(groupBy)},
    send: _service.matrix,
    decode: mapAdminMonitorV2Matrix,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorList<Sub2ApiMonitorErrorRow>> getErrors(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(
    filter,
    send: _service.errors,
    decode: mapAdminMonitorV2Errors,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorList<Sub2ApiMonitorUserRow>> getUsers(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(
    filter,
    send: _service.users,
    decode: mapAdminMonitorV2Users,
    requestOptions: requestOptions,
  );

  Future<T> _read<T>(
    Sub2ApiMonitorFilter filter, {
    required Future<HttpResponse<Object?>> Function(
      Map<String, dynamic>,
      CancelToken,
      Options,
      String?,
      String?,
    )
    send,
    required T Function(Object? data) decode,
    Map<String, dynamic> extraQuery = const <String, dynamic>{},
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateFilter(filter);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => send(
        <String, dynamic>{..._filterQuery(filter), ...extraQuery},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: decode,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

Map<String, Object?> _configBody(
  Sub2ApiAdminUpdateMonitorV2ConfigRequest request,
) {
  if (request.version <= 0) {
    throw _validation('admin.monitor_v2.invalid_version');
  }
  if (request.refreshIntervalSeconds != 60 &&
      request.refreshIntervalSeconds != 300) {
    throw _validation('admin.monitor_v2.invalid_refresh_interval');
  }
  if (request.groupIds.any((id) => id <= 0)) {
    throw _validation('admin.monitor_v2.invalid_group_id');
  }
  final platforms = <String>{};
  for (final platform in request.platforms) {
    final value = platform.platform.trim().toLowerCase();
    if (value.isEmpty || !platforms.add(value)) {
      throw _validation('admin.monitor_v2.invalid_platform');
    }
    if (platform.models.any((model) => model.trim().isEmpty)) {
      throw _validation('admin.monitor_v2.invalid_model');
    }
  }
  _validateThresholds(request.healthThresholds);
  return <String, Object?>{
    'version': request.version,
    'enabled': request.enabled,
    'refresh_interval_seconds': request.refreshIntervalSeconds,
    'platforms': request.platforms
        .map(
          (platform) => <String, Object?>{
            'platform': platform.platform.trim().toLowerCase(),
            'enabled': platform.enabled,
            'models': platform.models
                .map((model) => model.trim())
                .toSet()
                .toList(),
          },
        )
        .toList(),
    'group_ids': request.groupIds.toSet().toList()..sort(),
    'health_thresholds': _thresholdBody(request.healthThresholds),
    'ignored_error_categories':
        request.ignoredErrorCategories.map(_errorCategory).toSet().toList()
          ..sort(),
  };
}

void _validateThresholds(Sub2ApiMonitorThresholds value) {
  if (value.minimumSample <= 0 || value.minimumSample > 10000) {
    throw _validation('admin.monitor_v2.invalid_minimum_sample');
  }
  if (_negative(value.warningErrorRate) ||
      _negative(value.criticalErrorRate) ||
      _negative(value.warningCacheRate) ||
      _negative(value.criticalCacheRate) ||
      _negative(value.errorWeight) ||
      _negative(value.ttftWeight) ||
      _negative(value.cacheWeight) ||
      value.targetTtftMs <= 0 ||
      value.warningTtftMs < value.targetTtftMs ||
      value.criticalTtftMs < value.warningTtftMs) {
    throw _validation('admin.monitor_v2.invalid_thresholds');
  }
}

Map<String, Object?> _thresholdBody(Sub2ApiMonitorThresholds value) =>
    <String, Object?>{
      'minimum_sample': value.minimumSample,
      'warning_error_rate': _decimal(value.warningErrorRate),
      'critical_error_rate': _decimal(value.criticalErrorRate),
      'target_ttft_ms': value.targetTtftMs,
      'warning_ttft_ms': value.warningTtftMs,
      'critical_ttft_ms': value.criticalTtftMs,
      'warning_cache_rate': _decimal(value.warningCacheRate),
      'critical_cache_rate': _decimal(value.criticalCacheRate),
      'error_weight': _decimal(value.errorWeight),
      'ttft_weight': _decimal(value.ttftWeight),
      'cache_weight': _decimal(value.cacheWeight),
    };

void _validateFilter(Sub2ApiMonitorFilter filter) {
  if (filter.groupIds.any((id) => id <= 0)) {
    throw _validation('admin.monitor_v2.invalid_group_id');
  }
  if (filter.platforms.any((value) => value.trim().isEmpty) ||
      filter.models.any((value) => value.trim().isEmpty)) {
    throw _validation('admin.monitor_v2.invalid_filter');
  }
}

Map<String, dynamic> _filterQuery(Sub2ApiMonitorFilter filter) =>
    <String, dynamic>{
      'range': switch (filter.range) {
        Sub2ApiMonitorRange.ninetyMinutes => '90m',
        Sub2ApiMonitorRange.day => '24h',
        Sub2ApiMonitorRange.week => '7d',
        Sub2ApiMonitorRange.month => '30d',
      },
      if (filter.platforms.isNotEmpty)
        'platform': filter.platforms.map((value) => value.trim()).toList(),
      if (filter.groupIds.isNotEmpty) 'group_id': filter.groupIds,
      if (filter.models.isNotEmpty)
        'model': filter.models.map((value) => value.trim()).toList(),
    };

String _groupBy(Sub2ApiMonitorGroupBy value) => switch (value) {
  Sub2ApiMonitorGroupBy.platform => 'platform',
  Sub2ApiMonitorGroupBy.platformGroup => 'platform_group',
  Sub2ApiMonitorGroupBy.platformModel => 'platform_model',
  Sub2ApiMonitorGroupBy.platformGroupModel => 'platform_group_model',
};

String _errorCategory(Sub2ApiAdminMonitorV2ErrorCategory value) =>
    switch (value) {
      Sub2ApiAdminMonitorV2ErrorCategory.upstream5xx => 'upstream_5xx',
      _ => _camelToSnake(value.name),
    };

String _camelToSnake(String value) => value.replaceAllMapped(
  RegExp('([A-Z])'),
  (match) => '_${match.group(1)!.toLowerCase()}',
);

bool _negative(Sub2ApiDecimal value) =>
    value.compareTo(Sub2ApiDecimal.zero()) < 0;

num _decimal(Sub2ApiDecimal value) => num.parse(value.toJson());

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
