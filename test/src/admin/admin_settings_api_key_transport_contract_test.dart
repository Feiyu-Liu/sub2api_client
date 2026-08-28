import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );

  test('Ops manages the Admin API Key without credential fallback', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final status = await client.settings.getAdminApiKeyStatus();
    final regenerated = await client.settings.regenerateAdminApiKey();
    final deleted = await client.settings.deleteAdminApiKey();

    expect(status.exists, isTrue);
    expect(status.maskedKey.toString(), '<redacted>');
    expect(regenerated.key.toString(), '<redacted>');
    expect(regenerated.key.reveal(), startsWith('admin-'));
    expect(deleted.message, 'Admin API key deleted');
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/settings/admin-api-key',
      '/api/v1/admin/settings/admin-api-key/regenerate',
      '/api/v1/admin/settings/admin-api-key',
    ]);
    expect(adapter.requests[1].method, 'POST');
    expect(adapter.requests[2].method, 'DELETE');
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'settings-key-sentinel',
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

  test('malformed Admin API Key response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'exists': true, 'masked_key': ''},
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.settings.getAdminApiKeyStatus(),
      throwsA(_code('protocol.invalid_admin_setting_response')),
    );
  });

  test('Admin API Key mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.settings.regenerateAdminApiKey(),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT settings read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('settings-admin-jwt'),
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
    await client.settings.getAdminApiKeyStatus();
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer settings-admin-jwt'),
    );
  });
}

Map<String, Object?> _fixture() =>
    readFixture('admin/settings_admin_api_key.json');

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/regenerate')) {
    data = _fixture()['regenerated'];
  } else if (request.method == 'DELETE') {
    data = _fixture()['deleted'];
  } else {
    data = _fixture()['status'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('settings-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
