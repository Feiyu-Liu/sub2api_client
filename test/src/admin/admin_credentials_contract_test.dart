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
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('admin-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Admin JWT bootstrap precedes the typed dashboard request', () async {
    final adapter = JsonResponseAdapter((request) {
      final body = switch (request.path) {
        '/api/v1/auth/me' => readFixture('auth/current_user_success.json'),
        '/api/v1/admin/dashboard/stats' => readFixture(
          'admin/dashboard_stats.json',
        ),
        _ => throw StateError('unexpected path ${request.path}'),
      };
      return JsonResponse(body: body);
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    final stats = await client.dashboard.getStats();

    expect(stats.totalActualCost.toString(), '100.4');
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/auth/me',
      '/api/v1/admin/dashboard/stats',
    ]);
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer admin-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('non-admin JWT is rejected before an Admin route is sent', () async {
    final fixture = readFixture('auth/current_user_success.json');
    final data = Map<String, Object?>.from(fixture['data']! as Map)
      ..['role'] = 'user';
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: <String, Object?>{'code': 0, 'message': 'success', 'data': data},
      ),
    );
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await expectLater(
      client.dashboard.getStats(),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'auth.admin_required',
        ),
      ),
    );
    expect(adapter.requests.single.path, '/api/v1/auth/me');
  });

  test('Ops sends only x-api-key and never touches a JWT session', () async {
    const key = Sub2ApiAdminApiKey('admin-api-key-sentinel');
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('admin/dashboard_stats.json')),
    );
    final client = createSub2ApiOpsClientForTesting(
      configuration: configuration,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(key),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    final stats = await client.dashboard.getStats();

    expect(stats.uptime, 86400);
    final request = adapter.requests.single;
    expect(request.path, '/api/v1/admin/dashboard/stats');
    expect(
      request.headers,
      containsPair('x-api-key', 'admin-api-key-sentinel'),
    );
    expect(request.headers, isNot(contains('Authorization')));
    expect(key.toString(), isNot(contains('admin-api-key-sentinel')));
  });

  test('Ops preserves step-up rejection without JWT fallback', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        statusCode: 403,
        body: <String, Object?>{
          'code': 'STEP_UP_ADMIN_API_KEY_FORBIDDEN',
          'message': 'forbidden',
        },
      ),
    );
    final client = createSub2ApiOpsClientForTesting(
      configuration: configuration,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('step-up-key-sentinel'),
      ),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await expectLater(
      client.dashboard.getStats(),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'auth.step_up_admin_api_key_forbidden',
        ),
      ),
    );
    expect(adapter.requests, hasLength(1));
    expect(adapter.requests.single.headers, isNot(contains('Authorization')));
  });

  test('Ops rejects a missing credential before network I/O', () async {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('network must not be reached'),
    );
    final client = createSub2ApiOpsClientForTesting(
      configuration: configuration,
      credentialProvider: _MissingCredentialProvider(),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await expectLater(
      client.dashboard.getStats(),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'auth.admin_api_key_required',
        ),
      ),
    );
    expect(adapter.requests, isEmpty);
  });
}

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _MissingCredentialProvider implements Sub2ApiAdminApiKeyProvider {
  @override
  Future<Sub2ApiAdminApiKey?> load() async => null;
}
