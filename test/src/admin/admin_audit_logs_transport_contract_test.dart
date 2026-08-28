import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_audit_log_models.dart';
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
    accessToken: Sub2ApiAccessToken('admin-audit-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops lists and reads typed audit logs with exact filters', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _successForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final page = await client.auditLogs.list(
      query: Sub2ApiAdminAuditLogQuery(
        page: 2,
        pageSize: 25,
        startTime: DateTime.utc(2026, 8, 1),
        endTime: DateTime.utc(2026, 8, 27, 23, 59, 59),
        actorUserId: 7,
        actorEmail: ' admin@example.test ',
        authMethod: ' jwt ',
        action: ' users.update ',
        method: ' put ',
        clientIp: ' 203.0.113.41 ',
        success: true,
        search: ' user ',
      ),
    );
    final detail = await client.auditLogs.get(42);

    expect(page.items.single.id, 41);
    expect(page.items.single.requestBody, isNull);
    expect(page.items.single.succeeded, isTrue);
    expect(detail.requestBody?.value, '{"totp_code":"***"}');
    expect(detail.metadata.deletedRows, 12);
    expect(detail.toString(), isNot(contains('totp_code')));
    expect(adapter.requests.first.queryParameters, <String, Object?>{
      'page': 2,
      'page_size': 25,
      'start_time': '2026-08-01T00:00:00.000Z',
      'end_time': '2026-08-27T23:59:59.000Z',
      'actor_user_id': 7,
      'actor_email': 'admin@example.test',
      'auth_method': 'jwt',
      'action': 'users.update',
      'method': 'PUT',
      'client_ip': '203.0.113.41',
      'success': true,
      'q': 'user',
    });
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'admin-audit-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }
  });

  test('Admin clears audit logs with fresh TOTP and no replay', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'deleted': 12},
        },
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    final result = await client.auditLogs.clear(
      const Sub2ApiVerificationCode('123456'),
    );

    expect(result.deleted, 12);
    final clearRequest = adapter.requests.singleWhere(
      (request) => request.path == '/api/v1/admin/audit-logs/clear',
    );
    expect(clearRequest.method, 'POST');
    expect(clearRequest.data, <String, Object?>{'totp_code': '123456'});
    expect(
      clearRequest.headers,
      containsPair('Authorization', 'Bearer admin-audit-jwt-sentinel'),
    );
    expect(clearRequest.headers, isNot(contains('x-api-key')));
  });

  test('Ops rejects audit clear before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('step-up rejection must be local'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.auditLogs.clear(const Sub2ApiVerificationCode('123456')),
      throwsA(_code('auth.step_up_admin_api_key_forbidden')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('audit routes preserve auth and not-found failures', () async {
    for (final failure in <({int status, Object body, String code})>[
      (
        status: 401,
        body: readFixture('admin/account_auth_failure.json'),
        code: 'server.invalid_api_key',
      ),
      (
        status: 404,
        body: const <String, Object?>{
          'code': 'AUDIT_LOG_NOT_FOUND',
          'message': 'audit log not found',
        },
        code: 'server.audit_log_not_found',
      ),
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(statusCode: failure.status, body: failure.body),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);
      await expectLater(client.auditLogs.get(41), throwsA(_code(failure.code)));
    }
  });

  test('audit log mapper rejects malformed contracts', () async {
    final fixture = _fixture();
    final detail = Map<String, Object?>.from(fixture['detail']! as Map)
      ..['extra'] = <Object?>[];
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': detail,
        },
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.auditLogs.get(42),
      throwsA(_code('protocol.invalid_admin_audit_log_response')),
    );
  });

  test('audit queries and TOTP are validated before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    final admin = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);
    addTearDown(admin.close);

    expect(
      () => client.auditLogs.list(
        query: const Sub2ApiAdminAuditLogQuery(pageSize: 201),
      ),
      throwsA(_code('admin.audit_logs.invalid_page_size')),
    );
    expect(
      () => client.auditLogs.get(0),
      throwsA(_code('admin.audit_logs.invalid_id')),
    );
    expect(
      () => admin.auditLogs.clear(const Sub2ApiVerificationCode('12')),
      throwsA(_code('admin.audit_logs.invalid_totp_code')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('clear disables automatic refresh and replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-audit-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-audit-jwt'),
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
      client.auditLogs.clear(const Sub2ApiVerificationCode('123456')),
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

Map<String, Object?> _fixture() => readFixture('admin/audit_logs.json');

Object _successForRequest(RequestOptions request) {
  final fixture = _fixture();
  final Object? data = switch (request.path) {
    '/api/v1/admin/audit-logs' => fixture['list'],
    '/api/v1/admin/audit-logs/42' => fixture['detail'],
    _ => throw StateError('unexpected route: ${request.path}'),
  };
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-audit-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
