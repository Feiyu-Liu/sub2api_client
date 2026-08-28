import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_plugin_models.dart';
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

  test('Admin JWT executes every plugin route after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('plugin-admin-jwt'),
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
    final package = Sub2ApiAdminPluginPackage(
      filename: 'fixture.s2plugin',
      bytes: Uint8List.fromList(<int>[1, 2, 3, 4]),
    );
    final config = Sub2ApiAdminPluginConfig(
      Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
        'endpoint': const Sub2ApiAdminJsonString('https://plugin.example.test'),
        'retries': Sub2ApiAdminJsonNumber(Sub2ApiDecimal.parse('2')),
      }),
    );

    final listed = await client.plugins.list();
    final fetched = await client.plugins.get(31);
    final uploaded = await client.plugins.upload(package);
    final enabled = await client.plugins.enable(
      31,
      request: const Sub2ApiAdminEnablePluginRequest(
        acceptUntested: true,
        rolloutPercent: 50,
      ),
    );
    final disabled = await client.plugins.disable(31);
    final deleted = await client.plugins.delete(31);
    final loadedConfig = await client.plugins.getConfig(31);
    final savedConfig = await client.plugins.saveConfig(31, config);
    final tested = await client.plugins.test(31);
    final uiSession = await client.plugins.createUiSession(31);

    expect(listed.single.id, 31);
    expect(fetched.manifest.uiEntrypoint?.value, 'ui/index.html');
    expect(uploaded.signatureStatus, Sub2ApiAdminPluginSignatureStatus.trusted);
    expect(enabled.bindings.single.rolloutPercent, 50);
    expect(disabled.runtimeHealthy, isTrue);
    expect(deleted.message, '插件已卸载');
    expect(loadedConfig.toString(), '<redacted-plugin-config>');
    expect(
      savedConfig.reveal().values['retries'],
      isA<Sub2ApiAdminJsonNumber>(),
    );
    expect(tested.latency, const Duration(milliseconds: 125));
    expect(uiSession.bridgeToken.toString(), '<redacted>');
    expect(uiSession.url.toString(), '<redacted>');

    final businessRequests = adapter.requests
        .where((request) => request.path != '/api/v1/auth/me')
        .toList();
    expect(adapter.requests, hasLength(20));
    expect(businessRequests, hasLength(10));
    expect(businessRequests[0].path, '/api/v1/admin/plugins');
    expect(businessRequests[1].path, '/api/v1/admin/plugins/31');
    expect(businessRequests[2].path, '/api/v1/admin/plugins/upload');
    expect(businessRequests[2].data, isA<FormData>());
    expect(businessRequests[3].path, '/api/v1/admin/plugins/31/enable');
    expect(businessRequests[4].path, '/api/v1/admin/plugins/31/disable');
    expect(businessRequests[5].path, '/api/v1/admin/plugins/31');
    expect(businessRequests[5].method, 'DELETE');
    expect(businessRequests[6].path, '/api/v1/admin/plugins/31/config');
    expect(businessRequests[7].path, '/api/v1/admin/plugins/31/config');
    expect(businessRequests[7].method, 'PUT');
    expect(businessRequests[8].path, '/api/v1/admin/plugins/31/test');
    expect(businessRequests[9].path, '/api/v1/admin/plugins/31/ui-session');
    expect(
      businessRequests.every(
        (request) =>
            request.headers['Authorization'] == 'Bearer plugin-admin-jwt',
      ),
      isTrue,
    );
  });

  test('Ops reads plugin state but rejects step-up routes locally', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);
    final listed = await client.plugins.list();
    final session = await client.plugins.createUiSession(31);
    expect(listed.single.id, 31);
    expect(session.uiBridgeVersion, 1);
    expect(adapter.requests, hasLength(2));
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'plugin-key-sentinel',
      ),
      isTrue,
    );
    expect(
      () => client.plugins.enable(31),
      throwsA(_code('auth.step_up_admin_api_key_forbidden')),
    );
    expect(adapter.requests, hasLength(2));
  });

  test('plugin step-up rejection is preserved without replay', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('plugin-step-up-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return const JsonResponse(
        statusCode: 403,
        body: <String, Object?>{
          'code': 'STEP_UP_REQUIRED',
          'message': 'verification required',
        },
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter,
    );
    addTearDown(client.close);
    await expectLater(
      client.plugins.test(31),
      throwsA(_code('auth.step_up_required')),
    );
    expect(adapter.requests, hasLength(2));
  });

  test('plugin validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final client = _opsClient(configuration, validationAdapter);
    addTearDown(client.close);
    expect(
      () => client.plugins.get(0),
      throwsA(_code('admin.plugins.invalid_id')),
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
    final malformed = _opsClient(configuration, malformedAdapter);
    addTearDown(malformed.close);
    await expectLater(
      malformed.plugins.get(31),
      throwsA(_code('protocol.invalid_admin_plugin_response')),
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/plugin.json');

Object _response(RequestOptions request) {
  if (request.path.endsWith('/config')) return _fixture()['config']!;
  final Object? data;
  if (request.path == '/api/v1/admin/plugins') {
    data = <Object?>[_fixture()['plugin']];
  } else if (request.method == 'DELETE') {
    data = _fixture()['delete'];
  } else if (request.path.endsWith('/test')) {
    data = _fixture()['test'];
  } else if (request.path.endsWith('/ui-session')) {
    data = _fixture()['ui_session'];
  } else {
    data = _fixture()['plugin'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('plugin-key-sentinel'),
  ),
  dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
    ..httpClientAdapter = adapter,
);

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
