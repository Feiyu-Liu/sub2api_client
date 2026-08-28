import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_ops_settings_models.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/models/sub2api_decimal.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );

  test('Ops executes every runtime and notification settings route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final email = await client.operationsSettings.getEmailNotification();
    final updatedEmail = await client.operationsSettings
        .updateEmailNotification(
          Sub2ApiAdminOpsEmailNotificationUpdate(
            alert: email.alert,
            report: email.report,
          ),
        );
    final alertRuntime = await client.operationsSettings.getAlertRuntime();
    final updatedAlertRuntime = await client.operationsSettings
        .updateAlertRuntime(alertRuntime);
    final logging = await client.operationsSettings.getRuntimeLogging();
    final updatedLogging = await client.operationsSettings.updateRuntimeLogging(
      Sub2ApiAdminOpsRuntimeLogInput(
        level: logging.level,
        enableSampling: logging.enableSampling,
        samplingInitial: logging.samplingInitial,
        samplingThereafter: logging.samplingThereafter,
        caller: logging.caller,
        stacktraceLevel: logging.stacktraceLevel,
        retentionDays: logging.retentionDays,
      ),
    );
    final resetLogging = await client.operationsSettings.resetRuntimeLogging();
    final advanced = await client.operationsSettings.getAdvanced();
    final updatedAdvanced = await client.operationsSettings.updateAdvanced(
      advanced,
    );
    final thresholds = await client.operationsSettings.getMetricThresholds();
    final updatedThresholds = await client.operationsSettings
        .updateMetricThresholds(thresholds);

    expect(
      email.alert.minSeverity,
      Sub2ApiAdminOpsEmailAlertMinSeverity.warning,
    );
    expect(
      updatedEmail.report.accountHealthErrorRateThreshold.toString(),
      '12.5',
    );
    expect(alertRuntime.silencing.entries.single.ruleId, 12);
    expect(updatedAlertRuntime.thresholds.slaPercentMin.toString(), '99.5');
    expect(logging.level, Sub2ApiAdminOpsRuntimeLogLevel.debug);
    expect(updatedLogging.samplingThereafter, 200);
    expect(resetLogging.source, 'runtime_setting');
    expect(
      advanced.openAIAccountQuotaAutoPause.defaultThreshold5h.toString(),
      '0.2',
    );
    expect(updatedAdvanced.dataRetention.hourlyMetricsRetentionDays, 90);
    expect(thresholds.upstreamErrorRatePercentMax.toString(), '4.5');
    expect(updatedThresholds.ttftP99MsMax.toString(), '500');
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/ops/email-notification/config',
      '/api/v1/admin/ops/email-notification/config',
      '/api/v1/admin/ops/runtime/alert',
      '/api/v1/admin/ops/runtime/alert',
      '/api/v1/admin/ops/runtime/logging',
      '/api/v1/admin/ops/runtime/logging',
      '/api/v1/admin/ops/runtime/logging/reset',
      '/api/v1/admin/ops/advanced-settings',
      '/api/v1/admin/ops/advanced-settings',
      '/api/v1/admin/ops/settings/metric-thresholds',
      '/api/v1/admin/ops/settings/metric-thresholds',
    ]);
    expect(
      adapter.requests[1].data,
      containsPair('alert', containsPair('min_severity', 'warning')),
    );
    expect(
      adapter.requests[3].data,
      containsPair('evaluation_interval_seconds', 30),
    );
    expect(adapter.requests[5].data, containsPair('level', 'debug'));
    expect(
      adapter.requests[8].data,
      containsPair('auto_refresh_interval_seconds', 30),
    );
    expect(
      adapter.requests[10].data,
      containsPair('upstream_error_rate_percent_max', 4.5),
    );
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'ops-settings-key',
      ),
      isTrue,
    );
  });

  test('Ops settings validation fails before network I/O', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.operationsSettings.updateEmailNotification(
        const Sub2ApiAdminOpsEmailNotificationUpdate(),
      ),
      throwsA(_code('admin.ops.empty_email_notification_update')),
    );
    expect(
      () => client.operationsSettings.updateRuntimeLogging(
        const Sub2ApiAdminOpsRuntimeLogInput(
          level: Sub2ApiAdminOpsRuntimeLogLevel.info,
          enableSampling: true,
          samplingInitial: 0,
          samplingThereafter: 100,
          caller: true,
          stacktraceLevel: Sub2ApiAdminOpsStacktraceLevel.error,
          retentionDays: 30,
        ),
      ),
      throwsA(_code('admin.ops.invalid_log_sampling')),
    );
    expect(
      () => client.operationsSettings.updateMetricThresholds(
        Sub2ApiAdminOpsMetricThresholds(
          slaPercentMin: Sub2ApiDecimal.parse('100.1'),
        ),
      ),
      throwsA(_code('admin.ops.invalid_metric_threshold')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('malformed Ops settings response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'level': 'trace'},
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.operationsSettings.getRuntimeLogging(),
      throwsA(_code('protocol.invalid_admin_ops_settings_response')),
    );
  });

  test('Ops settings mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.operationsSettings.resetRuntimeLogging(),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });
}

Map<String, Object?> _fixture() => readFixture('admin/ops_settings.json');

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.contains('/email-notification/')) {
    data = _fixture()['email'];
  } else if (request.path.endsWith('/runtime/alert')) {
    data = _fixture()['alert_runtime'];
  } else if (request.path.contains('/runtime/logging')) {
    data = _fixture()['logging'];
  } else if (request.path.endsWith('/advanced-settings')) {
    data = _fixture()['advanced'];
  } else {
    data = _fixture()['thresholds'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('ops-settings-key'),
  ),
  dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
    ..httpClientAdapter = adapter,
);

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
