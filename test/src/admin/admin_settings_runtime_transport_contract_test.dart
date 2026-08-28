import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_setting_models.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );

  test('Ops executes every core runtime setting route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final overload = await client.settings.getOverloadCooldown();
    await client.settings.updateOverloadCooldown(overload);
    final rate429 = await client.settings.getRateLimit429Cooldown();
    await client.settings.updateRateLimit429Cooldown(rate429);
    final panel = await client.settings.getPanelRateLimit();
    await client.settings.updatePanelRateLimit(panel);
    final stream = await client.settings.getStreamTimeout();
    await client.settings.updateStreamTimeout(stream);
    final rectifier = await client.settings.getRectifier();
    await client.settings.updateRectifier(rectifier);
    final beta = await client.settings.getBetaPolicy();
    await client.settings.updateBetaPolicy(beta);

    expect(overload.cooldownMinutes, 15);
    expect(rate429.cooldownSeconds, 60);
    expect(panel.heavyRpm, 60);
    expect(stream.action, Sub2ApiAdminStreamTimeoutAction.tempUnsched);
    expect(rectifier.apiKeySignaturePatterns, <String>['x-api-key']);
    expect(
      beta.rules.single.fallbackAction,
      Sub2ApiAdminBetaPolicyAction.block,
    );
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/settings/overload-cooldown',
      '/api/v1/admin/settings/overload-cooldown',
      '/api/v1/admin/settings/rate-limit-429-cooldown',
      '/api/v1/admin/settings/rate-limit-429-cooldown',
      '/api/v1/admin/settings/panel-rate-limit',
      '/api/v1/admin/settings/panel-rate-limit',
      '/api/v1/admin/settings/stream-timeout',
      '/api/v1/admin/settings/stream-timeout',
      '/api/v1/admin/settings/rectifier',
      '/api/v1/admin/settings/rectifier',
      '/api/v1/admin/settings/beta-policy',
      '/api/v1/admin/settings/beta-policy',
    ]);
    expect(adapter.requests[1].method, 'PUT');
    expect(adapter.requests[7].data, containsPair('action', 'temp_unsched'));
    final betaBody = adapter.requests[11].data as Map;
    expect((betaBody['rules'] as List).single, containsPair('scope', 'oauth'));
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'runtime-key-sentinel',
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

  test('runtime setting validation fails without I/O', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.settings.updateOverloadCooldown(
        const Sub2ApiAdminOverloadCooldownSettings(
          enabled: true,
          cooldownMinutes: 0,
        ),
      ),
      throwsA(_code('admin.settings.invalid_overload_cooldown')),
    );
    expect(
      () => client.settings.updateStreamTimeout(
        const Sub2ApiAdminStreamTimeoutSettings(
          enabled: true,
          action: Sub2ApiAdminStreamTimeoutAction.error,
          tempUnschedMinutes: 0,
          thresholdCount: 3,
          thresholdWindowMinutes: 10,
        ),
      ),
      throwsA(_code('admin.settings.invalid_stream_timeout')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('malformed runtime setting fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'enabled': true, 'action': 'unknown'},
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.settings.getStreamTimeout(),
      throwsA(_code('protocol.invalid_admin_setting_response')),
    );
  });

  test('runtime mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.settings.updatePanelRateLimit(
        const Sub2ApiAdminPanelRateLimitSettings(
          enabled: true,
          userRpm: 240,
          heavyRpm: 60,
          exemptAdmin: true,
          publicIpRpm: 300,
        ),
      ),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });
}

Map<String, Object?> _fixture() => readFixture('admin/settings_runtime.json');
Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/overload-cooldown')) {
    data = _fixture()['overload'];
  } else if (request.path.endsWith('/rate-limit-429-cooldown')) {
    data = _fixture()['rate429'];
  } else if (request.path.endsWith('/panel-rate-limit')) {
    data = _fixture()['panel'];
  } else if (request.path.endsWith('/stream-timeout')) {
    data = _fixture()['stream'];
  } else if (request.path.endsWith('/rectifier')) {
    data = _fixture()['rectifier'];
  } else {
    data = _fixture()['beta'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('runtime-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
