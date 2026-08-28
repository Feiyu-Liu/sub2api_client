import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_ops_alert_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_ops_dashboard_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
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
  final ruleInput = Sub2ApiAdminOpsAlertRuleInput(
    name: ' OpenAI upstream error rate ',
    description: ' Alert when upstream failures exceed the threshold ',
    metricType: Sub2ApiAdminOpsAlertMetricType.upstreamErrorRate,
    operator: Sub2ApiAdminOpsAlertOperator.greaterThanOrEqual,
    threshold: Sub2ApiDecimal.parse('85.5'),
    severity: Sub2ApiAdminOpsAlertSeverity.p1,
    windowMinutes: 5,
    sustainedMinutes: 2,
    cooldownMinutes: 15,
    filters: Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
      'platform': Sub2ApiAdminJsonString('openai'),
      'group_id': Sub2ApiAdminJsonNumber(Sub2ApiDecimal.parse('7')),
    }),
  );

  test('Ops executes every alert rule, event, and silence route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final rules = await client.operationsAlerts.listRules();
    final created = await client.operationsAlerts.createRule(ruleInput);
    final updated = await client.operationsAlerts.updateRule(12, ruleInput);
    final deleted = await client.operationsAlerts.deleteRule(12);
    final events = await client.operationsAlerts.listEvents(
      query: Sub2ApiAdminOpsAlertEventQuery(
        limit: 50,
        beforeFiredAt: DateTime.parse('2026-08-28T04:05:06.123Z'),
        beforeId: 81,
        status: Sub2ApiAdminOpsAlertEventStatus.firing,
        severity: Sub2ApiAdminOpsAlertSeverity.p1,
        emailSent: true,
        timeRange: Sub2ApiAdminOpsTimeRange.twentyFourHours,
        platform: ' openai ',
        groupId: 7,
      ),
    );
    final event = await client.operationsAlerts.getEvent(81);
    final resolved = await client.operationsAlerts.updateEventStatus(
      81,
      Sub2ApiAdminOpsAlertResolutionStatus.manualResolved,
    );
    final silence = await client.operationsAlerts.createSilence(
      Sub2ApiAdminOpsAlertSilenceInput(
        ruleId: 12,
        platform: ' openai ',
        groupId: 7,
        region: ' us-east ',
        until: DateTime.parse('2026-08-29T04:05:06Z'),
        reason: ' Planned provider maintenance ',
      ),
    );

    expect(rules.single.threshold.toString(), '85.5');
    expect(
      created.metricType,
      Sub2ApiAdminOpsAlertMetricType.upstreamErrorRate,
    );
    expect(updated.operator, Sub2ApiAdminOpsAlertOperator.greaterThanOrEqual);
    expect(deleted.ok, isTrue);
    expect(events.single.metricValue.toString(), '91.25');
    expect(
      events.single.dimensions.values['platform'],
      isA<Sub2ApiAdminJsonString>(),
    );
    expect(event.status, Sub2ApiAdminOpsAlertEventStatus.firing);
    expect(resolved.ok, isTrue);
    expect(silence.region, 'us-east');
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/ops/alert-rules',
      '/api/v1/admin/ops/alert-rules',
      '/api/v1/admin/ops/alert-rules/12',
      '/api/v1/admin/ops/alert-rules/12',
      '/api/v1/admin/ops/alert-events',
      '/api/v1/admin/ops/alert-events/81',
      '/api/v1/admin/ops/alert-events/81/status',
      '/api/v1/admin/ops/alert-silences',
    ]);
    expect(adapter.requests[1].data, containsPair('threshold', 85.5));
    expect(
      adapter.requests[1].data,
      containsPair('filters', <String, Object?>{
        'platform': 'openai',
        'group_id': 7,
      }),
    );
    expect(adapter.requests[4].queryParameters, containsPair('before_id', 81));
    expect(
      adapter.requests[4].queryParameters,
      containsPair('time_range', '24h'),
    );
    expect(adapter.requests[6].data, containsPair('status', 'manual_resolved'));
    expect(adapter.requests[7].data, containsPair('region', 'us-east'));
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'ops-alerts-key',
      ),
      isTrue,
    );
    expect(
      adapter.requests.every(
        (request) => request.headers['Authorization'] == null,
      ),
      isTrue,
    );
  });

  test('alert validation fails before network I/O', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.operationsAlerts.createRule(
        Sub2ApiAdminOpsAlertRuleInput(
          name: 'invalid',
          metricType: Sub2ApiAdminOpsAlertMetricType.errorRate,
          operator: Sub2ApiAdminOpsAlertOperator.greaterThan,
          threshold: Sub2ApiDecimal.parse('100.1'),
        ),
      ),
      throwsA(_code('admin.ops.invalid_alert_threshold')),
    );
    expect(
      () => client.operationsAlerts.listEvents(
        query: Sub2ApiAdminOpsAlertEventQuery(
          beforeFiredAt: DateTime.utc(2026, 8, 28),
        ),
      ),
      throwsA(_code('admin.ops.invalid_alert_event_cursor')),
    );
    expect(
      () => client.operationsAlerts.createSilence(
        Sub2ApiAdminOpsAlertSilenceInput(
          ruleId: 12,
          platform: ' ',
          until: DateTime.utc(2026, 8, 29),
        ),
      ),
      throwsA(_code('admin.ops.invalid_alert_silence_platform')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('malformed alert response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <Object?>[
            <String, Object?>{'id': 12, 'metric_type': 'unknown'},
          ],
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.operationsAlerts.listRules(),
      throwsA(_code('protocol.invalid_admin_ops_alert_response')),
    );
  });

  test('alert mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.operationsAlerts.updateEventStatus(
        81,
        Sub2ApiAdminOpsAlertResolutionStatus.resolved,
      ),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });
}

Map<String, Object?> _fixture() => readFixture('admin/ops_alerts.json');

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/status')) {
    data = <String, Object?>{'updated': true};
  } else if (request.path.endsWith('/alert-silences')) {
    data = _fixture()['silence'];
  } else if (request.path.endsWith('/alert-events/81')) {
    data = _fixture()['event'];
  } else if (request.path.endsWith('/alert-events')) {
    data = <Object?>[_fixture()['event']];
  } else if (request.method == 'DELETE') {
    data = <String, Object?>{'deleted': true};
  } else if (request.method == 'POST' || request.method == 'PUT') {
    data = _fixture()['rule'];
  } else {
    data = <Object?>[_fixture()['rule']];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('ops-alerts-key'),
  ),
  dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
    ..httpClientAdapter = adapter,
);

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
