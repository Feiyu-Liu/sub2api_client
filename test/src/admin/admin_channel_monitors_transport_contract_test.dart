import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_channel_monitor_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
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

  test('Ops executes every admin channel monitor route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    const secret = Sub2ApiAdminCredentialSecret('sk-fixture-monitor-secret');
    final override = Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
      'temperature': Sub2ApiAdminJsonNumber(Sub2ApiDecimal.parse('0.2')),
    });

    final page = await client.channelMonitors.list(
      query: const Sub2ApiAdminChannelMonitorListQuery(
        page: 2,
        pageSize: 25,
        provider: Sub2ApiAdminChannelMonitorProvider.openAi,
        enabled: true,
        search: ' primary ',
      ),
    );
    final created = await client.channelMonitors.create(
      Sub2ApiAdminCreateChannelMonitorRequest(
        name: ' OpenAI primary ',
        provider: Sub2ApiAdminChannelMonitorProvider.openAi,
        apiMode: Sub2ApiAdminChannelMonitorApiMode.responses,
        endpoint: Uri.parse('https://api.openai.com'),
        apiKey: secret,
        primaryModel: 'gpt-5.6',
        intervalSeconds: 60,
        jitterSeconds: 10,
        templateId: 4,
        bodyOverrideMode: Sub2ApiAdminChannelMonitorBodyMode.merge,
        bodyOverride: override,
        checkMode: Sub2ApiAdminChannelMonitorCheckMode.quotaProbe,
        accountId: 9,
      ),
    );
    final fetched = await client.channelMonitors.get(51);
    final duplicated = await client.channelMonitors.duplicate(
      51,
      const Sub2ApiAdminDuplicateChannelMonitorRequest(
        idempotencyKey: 'monitor-duplicate-51',
      ),
    );
    final updated = await client.channelMonitors.update(
      51,
      Sub2ApiAdminUpdateChannelMonitorRequest(
        enabled: false,
        clearTemplate: true,
      ),
    );
    await client.channelMonitors.delete(51);
    final run = await client.channelMonitors.run(51);
    final history = await client.channelMonitors.getHistory(
      51,
      model: ' gpt-5.6 ',
      limit: 50,
    );

    expect(page.items.single.id, 51);
    expect(created.latestQuota?.balance, Sub2ApiDecimal.parse('12.5'));
    expect(fetched.bodyOverride?.values['temperature'], isNotNull);
    expect(fetched.apiKeyMasked.toString(), '<redacted>');
    expect(fetched.apiKeyMasked.reveal(), 'sk-f***');
    expect(duplicated.id, 51);
    expect(updated.enabled, isTrue);
    expect(run.single.pingLatencyMs, 32);
    expect(history.single.id, 71);

    expect(adapter.requests, hasLength(8));
    expect(adapter.requests[0].path, '/api/v1/admin/channel-monitors');
    expect(adapter.requests[1].path, '/api/v1/admin/channel-monitors');
    expect(adapter.requests[1].method, 'POST');
    expect(
      (adapter.requests[1].data as Map<String, Object?>)['api_key'],
      secret.reveal(),
    );
    expect(adapter.requests[2].path, '/api/v1/admin/channel-monitors/51');
    expect(
      adapter.requests[3].path,
      '/api/v1/admin/channel-monitors/51/duplicate',
    );
    expect(
      adapter.requests[3].headers,
      containsPair('Idempotency-Key', 'monitor-duplicate-51'),
    );
    expect(adapter.requests[4].path, '/api/v1/admin/channel-monitors/51');
    expect(adapter.requests[4].method, 'PUT');
    expect(adapter.requests[5].method, 'DELETE');
    expect(adapter.requests[6].path, '/api/v1/admin/channel-monitors/51/run');
    expect(
      adapter.requests[7].path,
      '/api/v1/admin/channel-monitors/51/history',
    );
    expect(adapter.requests[7].queryParameters, containsPair('limit', 50));
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'monitor-key-sentinel',
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

  test('monitor validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.channelMonitors.create(
        Sub2ApiAdminCreateChannelMonitorRequest(
          name: 'invalid antigravity probe',
          provider: Sub2ApiAdminChannelMonitorProvider.antigravity,
          intervalSeconds: 60,
        ),
      ),
      throwsA(_code('admin.channel_monitors.invalid_check_mode')),
    );
    expect(validationAdapter.requests, isEmpty);

    final malformedAdapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'id': 0},
        },
      ),
    );
    final malformedClient = _client(configuration, malformedAdapter);
    addTearDown(malformedClient.close);
    await expectLater(
      malformedClient.channelMonitors.get(51),
      throwsA(_code('protocol.invalid_admin_channel_monitor_response')),
    );
  });

  test('monitor mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.channelMonitors.run(51),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT monitor read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('monitor-admin-jwt'),
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
    await client.channelMonitors.get(51);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer monitor-admin-jwt'),
    );
    expect(adapter.requests.last.headers['x-api-key'], isNull);
  });
}

Map<String, Object?> _fixture() => readFixture('admin/channel_monitor.json');

Object _response(RequestOptions request) {
  final Object? data;
  if (request.method == 'DELETE') {
    data = null;
  } else if (request.path.endsWith('/run')) {
    data = <String, Object?>{
      'results': <Object?>[_fixture()['check_result']],
    };
  } else if (request.path.endsWith('/history')) {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['history']],
    };
  } else if (request.method == 'GET' &&
      request.path == '/api/v1/admin/channel-monitors') {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['monitor']],
      'total': 26,
      'page': 2,
      'page_size': 25,
      'pages': 2,
    };
  } else {
    data = _fixture()['monitor'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('monitor-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
