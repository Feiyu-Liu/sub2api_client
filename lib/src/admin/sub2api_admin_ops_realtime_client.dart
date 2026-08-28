import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_ops_realtime_models.dart';
import 'wire/admin_ops_realtime_wire_mapper.dart';
import 'wire/admin_ops_realtime_wire_service.dart';

abstract interface class Sub2ApiAdminOpsRealtimeClient {
  Future<Sub2ApiAdminOpsConcurrencySnapshot> getConcurrency({
    Sub2ApiAdminOpsRealtimeFilter filter =
        const Sub2ApiAdminOpsRealtimeFilter(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsUserConcurrencySnapshot> getUserConcurrency({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsAvailabilitySnapshot> getAccountAvailability({
    Sub2ApiAdminOpsRealtimeFilter filter =
        const Sub2ApiAdminOpsRealtimeFilter(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsRealtimeTraffic> getTraffic({
    Sub2ApiAdminOpsRealtimeTrafficQuery query =
        const Sub2ApiAdminOpsRealtimeTrafficQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminOpsRealtimeClient createSub2ApiAdminOpsRealtimeClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminOpsRealtimeClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminOpsRealtimeWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminOpsRealtimeWireService _service;
  @override
  Future<Sub2ApiAdminOpsConcurrencySnapshot> getConcurrency({
    Sub2ApiAdminOpsRealtimeFilter filter =
        const Sub2ApiAdminOpsRealtimeFilter(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final q = _filter(filter.platform, filter.groupId);
    return _executor.protectedRequest(
      send: (c, o, v) => _service.concurrency(q, c, o, _a(v), _k(v)),
      decode: mapAdminOpsConcurrency,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsUserConcurrencySnapshot> getUserConcurrency({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.userConcurrency(c, o, _a(v), _k(v)),
    decode: mapAdminOpsUserConcurrency,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminOpsAvailabilitySnapshot> getAccountAvailability({
    Sub2ApiAdminOpsRealtimeFilter filter =
        const Sub2ApiAdminOpsRealtimeFilter(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final q = _filter(filter.platform, filter.groupId);
    return _executor.protectedRequest(
      send: (c, o, v) => _service.availability(q, c, o, _a(v), _k(v)),
      decode: mapAdminOpsAvailability,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsRealtimeTraffic> getTraffic({
    Sub2ApiAdminOpsRealtimeTrafficQuery query =
        const Sub2ApiAdminOpsRealtimeTrafficQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final q = _filter(query.platform, query.groupId)
      ..['window'] = _window(query.window);
    return _executor.protectedRequest(
      send: (c, o, v) => _service.traffic(q, c, o, _a(v), _k(v)),
      decode: mapAdminOpsTraffic,
      requestOptions: requestOptions,
    );
  }

  Map<String, Object?> _filter(String? platform, int? groupId) {
    if (groupId != null && groupId <= 0) {
      throw _validation('admin.ops.invalid_group_id');
    }
    final p = platform?.trim();
    return <String, Object?>{
      'platform': ?p == null || p.isEmpty ? null : p,
      'group_id': ?groupId,
    };
  }

  String? _a(String? v) => _mode == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? _k(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? v : null;
}

String _window(Sub2ApiAdminOpsRealtimeWindow v) => switch (v) {
  Sub2ApiAdminOpsRealtimeWindow.oneMinute => '1min',
  Sub2ApiAdminOpsRealtimeWindow.fiveMinutes => '5min',
  Sub2ApiAdminOpsRealtimeWindow.thirtyMinutes => '30min',
  Sub2ApiAdminOpsRealtimeWindow.oneHour => '1h',
};
Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
