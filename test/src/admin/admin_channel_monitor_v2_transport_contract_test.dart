import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_channel_monitor_v2_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/commerce/sub2api_monitor_models.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/models/sub2api_decimal.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );

  test('Ops executes every admin channel monitor v2 route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final config = await client.channelMonitorV2.getConfig();
    final updated = await client.channelMonitorV2.updateConfig(
      Sub2ApiAdminUpdateMonitorV2ConfigRequest(
        version: config.version,
        enabled: config.enabled,
        refreshIntervalSeconds: config.refreshIntervalSeconds,
        platforms: config.platforms,
        groupIds: config.groupIds,
        healthThresholds: config.healthThresholds,
        ignoredErrorCategories: const <Sub2ApiAdminMonitorV2ErrorCategory>[
          Sub2ApiAdminMonitorV2ErrorCategory.clientCancelled,
        ],
      ),
    );
    const filter = Sub2ApiMonitorFilter(
      range: Sub2ApiMonitorRange.day,
      platforms: <String>['openai'],
      groupIds: <int>[7],
      models: <String>['gpt-5.6'],
    );
    final dimensions = await client.channelMonitorV2.getDimensions(filter);
    final snapshot = await client.channelMonitorV2.getSnapshot(filter);
    final models = await client.channelMonitorV2.getModels(filter);
    final matrix = await client.channelMonitorV2.getMatrix(
      filter,
      Sub2ApiMonitorGroupBy.platformGroupModel,
    );
    final errors = await client.channelMonitorV2.getErrors(filter);
    final users = await client.channelMonitorV2.getUsers(filter);

    expect(config.version, 3);
    expect(updated.ignoredErrorCategories, contains('client_cancelled'));
    expect(dimensions.platforms.single.requestCount, 100);
    expect(snapshot.metrics.upstreamAttemptCount, 102);
    expect(models.items.single.model, 'gpt-5.6');
    expect(matrix.items.single.groupId, 7);
    expect(errors.items.single.details.single.upstreamStatusCode, 429);
    expect(users.items.single.email, 'operator@example.test');

    expect(adapter.requests, hasLength(8));
    expect(adapter.requests[0].path, '/api/v1/admin/channel-monitor-v2/config');
    expect(adapter.requests[1].path, '/api/v1/admin/channel-monitor-v2/config');
    expect(adapter.requests[1].method, 'PUT');
    expect(
      adapter.requests[2].path,
      '/api/v1/admin/channel-monitor-v2/dimensions',
    );
    expect(
      adapter.requests[3].path,
      '/api/v1/admin/channel-monitor-v2/snapshot',
    );
    expect(adapter.requests[4].path, '/api/v1/admin/channel-monitor-v2/models');
    expect(adapter.requests[5].path, '/api/v1/admin/channel-monitor-v2/matrix');
    expect(adapter.requests[6].path, '/api/v1/admin/channel-monitor-v2/errors');
    expect(adapter.requests[7].path, '/api/v1/admin/channel-monitor-v2/users');
    expect(
      adapter.requests[5].queryParameters,
      containsPair('group_by', 'platform_group_model'),
    );
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'monitor-v2-key-sentinel',
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

  test('monitor v2 validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.channelMonitorV2.getSnapshot(
        const Sub2ApiMonitorFilter(groupIds: <int>[0]),
      ),
      throwsA(_code('admin.monitor_v2.invalid_group_id')),
    );
    expect(validationAdapter.requests, isEmpty);

    final malformedAdapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'version': 0},
        },
      ),
    );
    final malformedClient = _client(configuration, malformedAdapter);
    addTearDown(malformedClient.close);
    await expectLater(
      malformedClient.channelMonitorV2.getConfig(),
      throwsA(_code('protocol.invalid_admin_channel_monitor_v2_response')),
    );
  });

  test('monitor v2 config mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.channelMonitorV2.updateConfig(
        Sub2ApiAdminUpdateMonitorV2ConfigRequest(
          version: 3,
          enabled: true,
          refreshIntervalSeconds: 60,
          platforms: const <Sub2ApiMonitorPlatformConfig>[
            Sub2ApiMonitorPlatformConfig(
              platform: 'openai',
              enabled: true,
              models: <String>['gpt-5.6'],
            ),
          ],
          groupIds: const <int>[7],
          healthThresholds: _thresholds(),
          ignoredErrorCategories: const [],
        ),
      ),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT monitor v2 read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('monitor-v2-admin-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _response(request));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter,
    );
    addTearDown(client.close);
    await client.channelMonitorV2.getConfig();
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer monitor-v2-admin-jwt'),
    );
    expect(adapter.requests.last.headers['x-api-key'], isNull);
  });
}

Object _response(RequestOptions request) {
  final snapshot = _data('commerce/monitor_v2_snapshot.json');
  final coverage = snapshot['coverage'];
  final metrics = snapshot['metrics'];
  final health = snapshot['health'];
  final Object? data;
  if (request.path.endsWith('/config')) {
    data = snapshot['config'];
  } else if (request.path.endsWith('/dimensions')) {
    data = <String, Object?>{
      'platforms': <Object?>[
        <String, Object?>{
          'value': 'openai',
          'label': 'OpenAI',
          'request_count': 100,
        },
      ],
      'groups': <Object?>[
        <String, Object?>{
          'id': 7,
          'name': 'Pro',
          'platform': 'openai',
          'request_count': 100,
        },
      ],
      'models': <Object?>[
        <String, Object?>{
          'value': 'gpt-5.6',
          'label': 'gpt-5.6',
          'platform': 'openai',
          'request_count': 100,
        },
      ],
    };
  } else if (request.path.endsWith('/snapshot')) {
    data = snapshot;
  } else if (request.path.endsWith('/models')) {
    data = <String, Object?>{
      'coverage': coverage,
      'items': <Object?>[
        <String, Object?>{
          'platform': 'openai',
          'model': 'gpt-5.6',
          'metrics': metrics,
          'health': health,
        },
      ],
    };
  } else if (request.path.endsWith('/matrix')) {
    data = <String, Object?>{
      'group_by': 'platform_group_model',
      'coverage': coverage,
      'items': <Object?>[
        <String, Object?>{
          'platform': 'openai',
          'group_id': 7,
          'group_name': 'Pro',
          'model': 'gpt-5.6',
          'metrics': metrics,
          'health': health,
          'buckets': <Object?>[],
        },
      ],
    };
  } else if (request.path.endsWith('/errors')) {
    data = <String, Object?>{
      'coverage': coverage,
      'items': <Object?>[
        <String, Object?>{
          'category': 'rate_or_capacity',
          'count': 2,
          'rate': 0.02,
          'ignored': false,
          'details': <Object?>[
            <String, Object?>{
              'platform': 'openai',
              'model': 'gpt-5.6',
              'error_type': 'rate_limit',
              'status_code': 429,
              'upstream_status_code': 429,
              'message': 'rate limited',
              'count': 2,
            },
          ],
        },
      ],
    };
  } else {
    data = <String, Object?>{
      'coverage': coverage,
      'items': <Object?>[
        <String, Object?>{
          'user_id': 1,
          'rank': 1,
          'email': 'operator@example.test',
          'username': 'operator',
          'display_label': 'operator',
          'is_self': true,
          'can_drilldown': true,
          'metrics': metrics,
        },
      ],
    };
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Map<String, Object?> _data(String path) =>
    Map<String, Object?>.from(readFixture(path)['data']! as Map);

Sub2ApiMonitorThresholds _thresholds() => Sub2ApiMonitorThresholds(
  minimumSample: 10,
  warningErrorRate: Sub2ApiDecimal.parse('0.05'),
  criticalErrorRate: Sub2ApiDecimal.parse('0.2'),
  targetTtftMs: 500,
  warningTtftMs: 1000,
  criticalTtftMs: 2500,
  warningCacheRate: Sub2ApiDecimal.parse('0.2'),
  criticalCacheRate: Sub2ApiDecimal.parse('0.05'),
  errorWeight: Sub2ApiDecimal.parse('0.5'),
  ttftWeight: Sub2ApiDecimal.parse('0.3'),
  cacheWeight: Sub2ApiDecimal.parse('0.2'),
);

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('monitor-v2-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
