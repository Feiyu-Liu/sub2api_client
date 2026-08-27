import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_account_models.dart';
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
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('admin-shadow-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );
  final request = Sub2ApiAdminCreateShadowRequest(
    name: ' research spark ',
    priority: 50,
    concurrency: 2,
    groupIds: const [10, 20, 10],
  );

  test('Ops creates a typed redacted Spark shadow account', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(_shadowAccount())),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final shadow = await client.accounts.createShadow(42, request);

    expect(shadow.id, 81);
    expect(shadow.name, 'research spark');
    expect(shadow.platform, Sub2ApiAdminAccountPlatform.openAi);
    expect(shadow.type, Sub2ApiAdminAccountType.oauth);
    expect(shadow.parentAccountId, 42);
    expect(shadow.quotaDimension, 'spark');
    expect(shadow.credentials.values.keys, <String>['model_mapping']);
    expect(shadow.groupIds, <int>[10, 20]);

    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/admin/accounts/42/shadow');
    expect(sent.data, <String, Object?>{
      'name': 'research spark',
      'priority': 50,
      'concurrency': 2,
      'group_ids': <int>[10, 20],
    });
    expect(
      sent.headers,
      containsPair('x-api-key', 'admin-shadow-key-sentinel'),
    );
    expect(sent.headers, isNot(contains('Authorization')));
  });

  test(
    'omitted shadow options preserve server inheritance semantics',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: _success(_shadowAccount())),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await client.accounts.createShadow(42, Sub2ApiAdminCreateShadowRequest());

      expect(adapter.requests.single.data, <String, Object?>{});
    },
  );

  test('Admin JWT shadow creation runs after role checks', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _success(_shadowAccount()));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.createShadow(42, request);

    expect(
      adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
      <String>['GET /api/v1/auth/me', 'POST /api/v1/admin/accounts/42/shadow'],
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair('Authorization', 'Bearer admin-shadow-jwt-sentinel'),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('shadow creation preserves business and key failures', () async {
    for (final failure in <({int status, String fixture, String code})>[
      (
        status: 404,
        fixture: 'admin/account_business_failure.json',
        code: 'server.account_not_found',
      ),
      (
        status: 401,
        fixture: 'admin/account_auth_failure.json',
        code: 'server.invalid_api_key',
      ),
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          statusCode: failure.status,
          body: readFixture(failure.fixture),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await expectLater(
        client.accounts.createShadow(42, request),
        throwsA(_code(failure.code)),
      );
    }
  });

  test(
    'shadow creation rejects malformed or credential-bearing data',
    () async {
      for (final data in <Object?>[
        null,
        <String, Object?>{
          ..._shadowAccount(),
          'credentials': <String, Object?>{'access_token': 'leaked'},
        },
        <String, Object?>{..._shadowAccount(), 'parent_account_id': null},
      ]) {
        final adapter = JsonResponseAdapter(
          (_) => JsonResponse(body: _success(data)),
        );
        final client = _opsClient(configuration, adapter);
        addTearDown(client.close);

        await expectLater(
          client.accounts.createShadow(42, request),
          throwsA(_code('protocol.invalid_admin_account_response')),
        );
      }
    },
  );

  test('shadow creation validates input before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.createShadow(0, request),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.createShadow(
        42,
        Sub2ApiAdminCreateShadowRequest(
          name: List<String>.filled(101, 'x').join(),
        ),
      ),
      throwsA(_code('admin.accounts.shadow_name_too_long')),
    );
    expect(
      () => client.accounts.createShadow(
        42,
        Sub2ApiAdminCreateShadowRequest(priority: 0),
      ),
      throwsA(_code('admin.accounts.invalid_shadow_priority')),
    );
    expect(
      () => client.accounts.createShadow(
        42,
        Sub2ApiAdminCreateShadowRequest(concurrency: -1),
      ),
      throwsA(_code('admin.accounts.invalid_shadow_concurrency')),
    );
    expect(
      () => client.accounts.createShadow(
        42,
        Sub2ApiAdminCreateShadowRequest(groupIds: const [10, 0]),
      ),
      throwsA(_code('admin.accounts.invalid_group_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('shadow creation POST disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-shadow-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-shadow-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      if (sent.path == '/api/v1/auth/refresh') {
        return JsonResponse(
          body: readFixture('auth/refresh_rotated_pair.json'),
        );
      }
      return JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(refreshableSession),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await expectLater(
      client.accounts.createShadow(42, request),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/refresh'),
      isEmpty,
    );
    expect(
      adapter.requests.where(
        (sent) =>
            sent.method == 'POST' &&
            sent.path == '/api/v1/admin/accounts/42/shadow',
      ),
      hasLength(1),
    );
  });
}

Map<String, Object?> _shadowAccount() {
  final source = readFixture('admin/account_read_surface.json');
  final raw = source['account'];
  if (raw is! Map) throw const FormatException();
  final account = raw.map<String, Object?>((key, value) {
    if (key is! String) throw const FormatException();
    return MapEntry(key, value);
  });
  account
    ..['id'] = 81
    ..['name'] = 'research spark'
    ..['platform'] = 'openai'
    ..['type'] = 'oauth'
    ..['credentials'] = <String, Object?>{
      'model_mapping': <String, Object?>{'gpt-5': 'gpt-5-spark'},
    }
    ..['credentials_status'] = <String, Object?>{}
    ..['priority'] = 50
    ..['concurrency'] = 2
    ..['parent_account_id'] = 42
    ..['quota_dimension'] = 'spark'
    ..['group_ids'] = <int>[10, 20]
    ..remove('ollama_cloud_usage');
  return account;
}

Map<String, Object?> _success(Object? data) => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': data,
};

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-shadow-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
