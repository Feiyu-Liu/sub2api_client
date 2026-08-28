import '../../commerce/sub2api_monitor_models.dart';
import '../../commerce/wire/monitor_wire_mapper.dart';
import '../../shared/errors/sub2api_exception.dart';

Sub2ApiMonitorConfig mapAdminMonitorV2Config(Object? data) =>
    _map(() => mapMonitorConfig(data));

Sub2ApiMonitorDimensions mapAdminMonitorV2Dimensions(Object? data) =>
    _map(() => mapMonitorDimensions(data));

Sub2ApiMonitorSnapshot mapAdminMonitorV2Snapshot(Object? data) =>
    _map(() => mapMonitorSnapshot(data));

Sub2ApiMonitorList<Sub2ApiMonitorModelRow> mapAdminMonitorV2Models(
  Object? data,
) => _map(() => mapMonitorModels(data));

Sub2ApiMonitorMatrix mapAdminMonitorV2Matrix(Object? data) =>
    _map(() => mapMonitorMatrix(data));

Sub2ApiMonitorList<Sub2ApiMonitorErrorRow> mapAdminMonitorV2Errors(
  Object? data,
) => _map(() => mapMonitorErrors(data));

Sub2ApiMonitorList<Sub2ApiMonitorUserRow> mapAdminMonitorV2Users(
  Object? data,
) => _map(() => mapMonitorUsers(data));

T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_channel_monitor_v2_response',
  retryable: false,
);
