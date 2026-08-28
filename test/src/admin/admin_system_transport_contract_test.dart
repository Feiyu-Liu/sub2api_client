import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_system_models.dart';
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
  test(
    'Ops maps every system route without executing a real operation',
    () async {
      final adapter = JsonResponseAdapter(
        (r) => JsonResponse(body: _response(r)),
      );
      final client = _client(configuration, adapter);
      addTearDown(client.close);
      final version = await client.system.getVersion();
      final info = await client.system.checkUpdates(force: true);
      final versions = await client.system.listRollbackVersions();
      final update = await client.system.performUpdate(
        const Sub2ApiAdminSystemOperationRequest(idempotencyKey: 'update-1'),
      );
      final rollback = await client.system.rollback(
        const Sub2ApiAdminSystemRollbackRequest(
          idempotencyKey: 'rollback-1',
          version: '0.1.182',
        ),
      );
      final restart = await client.system.restart(
        const Sub2ApiAdminSystemOperationRequest(idempotencyKey: 'restart-1'),
      );
      expect(version.value, '0.1.183');
      expect(info.hasUpdate, isTrue);
      expect(info.releaseInfo?.assets.single.sizeBytes, 12345678);
      expect(versions.single.version, '0.1.182');
      expect(update, isA<Sub2ApiAdminSystemUpdated>());
      expect(rollback.version, '0.1.182');
      expect(restart.operationId, 'sysop-restart');
      expect(adapter.requests[0].path, '/api/v1/admin/system/version');
      expect(adapter.requests[1].path, '/api/v1/admin/system/check-updates');
      expect(
        adapter.requests[2].path,
        '/api/v1/admin/system/rollback-versions',
      );
      expect(adapter.requests[3].path, '/api/v1/admin/system/update');
      expect(adapter.requests[4].path, '/api/v1/admin/system/rollback');
      expect(adapter.requests[5].path, '/api/v1/admin/system/restart');
      expect(adapter.requests[1].queryParameters, containsPair('force', true));
      expect(
        adapter.requests[3].headers,
        containsPair('Idempotency-Key', 'update-1'),
      );
      expect(
        adapter.requests[4].headers,
        containsPair('Idempotency-Key', 'rollback-1'),
      );
      expect(
        adapter.requests[5].headers,
        containsPair('Idempotency-Key', 'restart-1'),
      );
      expect(adapter.requests[4].data, containsPair('version', '0.1.182'));
    },
  );
  test('system operation validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.system.restart(
        const Sub2ApiAdminSystemOperationRequest(idempotencyKey: ' '),
      ),
      throwsA(_code('admin.system.idempotency_key_required')),
    );
    expect(validationAdapter.requests, isEmpty);
    final malformedAdapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'version': ''},
        },
      ),
    );
    final malformedClient = _client(configuration, malformedAdapter);
    addTearDown(malformedClient.close);
    await expectLater(
      malformedClient.system.getVersion(),
      throwsA(_code('protocol.invalid_admin_system_response')),
    );
  });
  test('system mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.system.performUpdate(
        const Sub2ApiAdminSystemOperationRequest(idempotencyKey: 'update'),
      ),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT system update never refreshes or replays', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-system-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-system-jwt'),
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
      sessionStore: RecordingSessionStore(session),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter,
    );
    addTearDown(client.close);
    await expectLater(
      client.system.performUpdate(
        const Sub2ApiAdminSystemOperationRequest(
          idempotencyKey: 'system-update-test',
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

Map<String, Object?> _fixture() => readFixture('admin/system_management.json');
Object _response(RequestOptions r) {
  final Object? data;
  if (r.path.endsWith('/version')) {
    data = _fixture()['version'];
  } else if (r.path.endsWith('/check-updates')) {
    data = _fixture()['update_info'];
  } else if (r.path.endsWith('/rollback-versions')) {
    data = _fixture()['rollback_versions'];
  } else if (r.path.endsWith('/update')) {
    data = <String, Object?>{
      'message': 'Update completed. Please restart the service.',
      'need_restart': true,
      'operation_id': 'sysop-update',
    };
  } else if (r.path.endsWith('/rollback')) {
    data = <String, Object?>{
      'message': 'Rollback completed. Please restart the service.',
      'need_restart': true,
      'version': '0.1.182',
      'operation_id': 'sysop-rollback',
    };
  } else {
    data = <String, Object?>{
      'message': 'Service restart initiated',
      'operation_id': 'sysop-restart',
    };
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('system-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
