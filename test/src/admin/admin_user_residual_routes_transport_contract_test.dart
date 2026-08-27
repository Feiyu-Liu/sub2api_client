import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
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
    accessToken: Sub2ApiAccessToken('admin-user-residual-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops updates an API key and lists raw-array user subscriptions',
    () async {
      final adapter = JsonResponseAdapter(
        (request) => JsonResponse(body: _successForRequest(request)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final updated = await client.users.updateApiKey(
        31,
        const Sub2ApiAdminUpdateApiKeyRequest(
          group: Sub2ApiAdminApiKeyGroupUpdate.set(7),
          resetRateLimitUsage: true,
        ),
      );
      final subscriptions = await client.users.getSubscriptions(21);

      expect(updated.apiKey.summary.id, 31);
      expect(updated.apiKey.summary.groupId, 7);
      expect(updated.apiKey.secret.toString(), '<redacted>');
      expect(updated.autoGrantedGroupAccess, isTrue);
      expect(updated.grantedGroupId, 7);
      expect(updated.grantedGroupName, 'research');
      expect(subscriptions.single.subscription.id, 301);
      expect(subscriptions.single.assignedByUser?.email, 'admin@example.test');
      expect(
        adapter.requests.map((request) => '${request.method} ${request.path}'),
        <String>[
          'PUT /api/v1/admin/api-keys/31',
          'GET /api/v1/admin/users/21/subscriptions',
        ],
      );
      expect(adapter.requests.first.data, <String, Object?>{
        'group_id': 7,
        'reset_rate_limit_usage': true,
      });
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('x-api-key', 'admin-user-residual-key-sentinel'),
        );
        expect(request.headers, isNot(contains('Authorization')));
      }
    },
  );

  test('Admin JWT residual routes run after role bootstrap', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _successForRequest(request));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.users.updateApiKey(
      31,
      const Sub2ApiAdminUpdateApiKeyRequest(
        group: Sub2ApiAdminApiKeyGroupUpdate.clear(),
      ),
    );
    await client.users.getSubscriptions(21);

    expect(
      adapter.requests.where((request) => request.path == '/api/v1/auth/me'),
      hasLength(2),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair(
          'Authorization',
          'Bearer admin-user-residual-jwt-sentinel',
        ),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('residual routes preserve business and invalid key failures', () async {
    for (final failure in <({int status, Object body, String code})>[
      (
        status: 400,
        body: const <String, Object?>{
          'code': 'GROUP_NOT_ACTIVE',
          'message': 'group not active',
        },
        code: 'server.group_not_active',
      ),
      (
        status: 401,
        body: readFixture('admin/account_auth_failure.json'),
        code: 'server.invalid_api_key',
      ),
    ]) {
      for (final invoke in <Future<Object?> Function(Sub2ApiOpsClient)>[
        (client) => client.users.updateApiKey(
          31,
          const Sub2ApiAdminUpdateApiKeyRequest(
            group: Sub2ApiAdminApiKeyGroupUpdate.set(7),
          ),
        ),
        (client) => client.users.getSubscriptions(21),
      ]) {
        final adapter = JsonResponseAdapter(
          (_) => JsonResponse(statusCode: failure.status, body: failure.body),
        );
        final client = _opsClient(configuration, adapter);
        addTearDown(client.close);
        await expectLater(invoke(client), throwsA(_code(failure.code)));
      }
    }
  });

  test('residual routes reject malformed success contracts', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{'code': 0, 'message': 'success', 'data': null},
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.users.updateApiKey(
        31,
        const Sub2ApiAdminUpdateApiKeyRequest(
          group: Sub2ApiAdminApiKeyGroupUpdate.clear(),
        ),
      ),
      throwsA(_code('protocol.invalid_admin_user_response')),
    );
    await expectLater(
      client.users.getSubscriptions(21),
      throwsA(_code('protocol.invalid_admin_user_response')),
    );
  });

  test('residual route validation fails before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.users.updateApiKey(
        0,
        const Sub2ApiAdminUpdateApiKeyRequest(
          group: Sub2ApiAdminApiKeyGroupUpdate.clear(),
        ),
      ),
      throwsA(_code('admin.users.invalid_api_key_id')),
    );
    expect(
      () => client.users.updateApiKey(
        31,
        const Sub2ApiAdminUpdateApiKeyRequest(),
      ),
      throwsA(_code('admin.users.api_key_update_required')),
    );
    expect(
      () => client.users.updateApiKey(
        31,
        const Sub2ApiAdminUpdateApiKeyRequest(
          group: Sub2ApiAdminApiKeyGroupUpdate.set(0),
        ),
      ),
      throwsA(_code('admin.users.invalid_api_key_group_id')),
    );
    expect(
      () => client.users.getSubscriptions(0),
      throwsA(_code('admin.users.invalid_user_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('API key update disables automatic refresh and replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-api-key-update-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-api-key-update-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      if (request.path == '/api/v1/auth/refresh') {
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
      client.users.updateApiKey(
        31,
        const Sub2ApiAdminUpdateApiKeyRequest(
          group: Sub2ApiAdminApiKeyGroupUpdate.clear(),
        ),
      ),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(
      adapter.requests.where(
        (request) => request.path == '/api/v1/auth/refresh',
      ),
      isEmpty,
    );
  });
}

Object _successForRequest(RequestOptions request) {
  if (request.path == '/api/v1/admin/api-keys/31') {
    final page = readFixture('admin/user_api_keys.json')['data']! as Map;
    final apiKey = Map<String, Object?>.from(
      (page['items']! as List).single as Map,
    );
    apiKey['group_id'] =
        request.data is Map && (request.data as Map)['group_id'] == 0
        ? null
        : 7;
    return <String, Object?>{
      'code': 0,
      'message': 'success',
      'data': <String, Object?>{
        'api_key': apiKey,
        'auto_granted_group_access': true,
        'granted_group_id': 7,
        'granted_group_name': 'research',
      },
    };
  }
  if (request.path != '/api/v1/admin/users/21/subscriptions') {
    throw StateError('unexpected route: ${request.path}');
  }
  final page = readFixture('admin/group_subscriptions.json')['data']! as Map;
  return <String, Object?>{
    'code': 0,
    'message': 'success',
    'data': page['items'],
  };
}

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-user-residual-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
