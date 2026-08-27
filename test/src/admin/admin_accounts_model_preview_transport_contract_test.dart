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
    accessToken: Sub2ApiAccessToken('admin-model-preview-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );
  final request = Sub2ApiAdminUpstreamModelPreviewRequest(
    platform: Sub2ApiAdminAccountPlatform.openAi,
    type: Sub2ApiAdminAccountType.upstream,
    baseUrl: Uri.parse('https://upstream.example/v1'),
    apiKey: const Sub2ApiApiKeySecret('preview-api-key-sentinel'),
  );

  test(
    'Ops model preview sends a typed redacted credential contract',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: _success(<String, Object?>{
            'models': <String>['gpt-5.6', 'gpt-5-mini'],
          }),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final models = await client.accounts.previewUpstreamModels(request);

      expect(models, <String>['gpt-5.6', 'gpt-5-mini']);
      expect(request.apiKey.toString(), '<redacted>');
      final sent = adapter.requests.single;
      expect(sent.method, 'POST');
      expect(sent.path, '/api/v1/admin/accounts/models/sync-upstream-preview');
      expect(sent.data, <String, Object?>{
        'platform': 'openai',
        'type': 'upstream',
        'base_url': 'https://upstream.example/v1',
        'api_key': 'preview-api-key-sentinel',
      });
      expect(
        sent.headers,
        containsPair('x-api-key', 'admin-model-preview-key-sentinel'),
      );
      expect(sent.headers, isNot(contains('Authorization')));
    },
  );

  test('Admin JWT model preview runs after role checks', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(
        body: _success(<String, Object?>{
          'models': <String>['gpt-5.6'],
        }),
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.previewUpstreamModels(request);

    expect(
      adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
      <String>[
        'GET /api/v1/auth/me',
        'POST /api/v1/admin/accounts/models/sync-upstream-preview',
      ],
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair(
          'Authorization',
          'Bearer admin-model-preview-jwt-sentinel',
        ),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('model preview preserves business and key failures', () async {
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
        client.accounts.previewUpstreamModels(request),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('model preview rejects malformed success data', () async {
    for (final data in <Object?>[
      null,
      <String, Object?>{'models': <String>[]},
      <String, Object?>{
        'models': <String>['gpt-5.6', 'gpt-5.6'],
      },
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: _success(data)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await expectLater(
        client.accounts.previewUpstreamModels(request),
        throwsA(_code('protocol.invalid_admin_account_response')),
      );
    }
  });

  test('model preview validates secrets and URLs before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.previewUpstreamModels(
        const Sub2ApiAdminUpstreamModelPreviewRequest(
          platform: Sub2ApiAdminAccountPlatform.openAi,
          type: Sub2ApiAdminAccountType.upstream,
          apiKey: Sub2ApiApiKeySecret(' '),
        ),
      ),
      throwsA(_code('admin.accounts.api_key_required')),
    );
    expect(
      () => client.accounts.previewUpstreamModels(
        Sub2ApiAdminUpstreamModelPreviewRequest(
          platform: Sub2ApiAdminAccountPlatform.openAi,
          type: Sub2ApiAdminAccountType.upstream,
          baseUrl: Uri.parse('ftp://upstream.example/v1'),
          apiKey: const Sub2ApiApiKeySecret('key'),
        ),
      ),
      throwsA(_code('admin.accounts.invalid_base_url')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('model preview POST disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-model-preview-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-model-preview-jwt'),
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
      client.accounts.previewUpstreamModels(request),
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
            sent.path == '/api/v1/admin/accounts/models/sync-upstream-preview',
      ),
      hasLength(1),
    );
  });
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
    Sub2ApiAdminApiKey('admin-model-preview-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
