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
    accessToken: Sub2ApiAccessToken('admin-crs-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );
  final previewRequest = Sub2ApiAdminCrsPreviewRequest(
    baseUrl: Uri.parse('https://crs.example/admin'),
    username: ' operator ',
    password: const Sub2ApiPassword('crs-password-sentinel'),
  );
  final syncRequest = Sub2ApiAdminCrsSyncRequest(
    baseUrl: Uri.parse('https://crs.example/admin'),
    username: ' operator ',
    password: const Sub2ApiPassword('crs-password-sentinel'),
    syncProxies: false,
    selectedAccountIds: const [' crs-new ', 'crs-failed', 'crs-new'],
  );

  test('Ops CRS preview and sync preserve complete typed contracts', () async {
    final adapter = JsonResponseAdapter(
      (sent) => JsonResponse(body: _fixtureForRequest(sent)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final preview = await client.accounts.previewCrs(previewRequest);
    final sync = await client.accounts.syncFromCrs(syncRequest);

    expect(preview.newAccounts.single.crsAccountId, 'crs-new');
    expect(
      preview.newAccounts.single.platform,
      Sub2ApiAdminAccountPlatform.openAi,
    );
    expect(
      preview.existingAccounts.single.type,
      Sub2ApiAdminAccountType.setupToken,
    );
    expect(sync.created, 1);
    expect(sync.updated, 1);
    expect(sync.skipped, 1);
    expect(sync.failed, 1);
    expect(sync.items, hasLength(4));
    expect(sync.items.last.error, 'missing access_token');
    expect(previewRequest.password.toString(), '<redacted>');

    expect(
      adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
      <String>[
        'POST /api/v1/admin/accounts/sync/crs/preview',
        'POST /api/v1/admin/accounts/sync/crs',
      ],
    );
    expect(adapter.requests[0].data, <String, Object?>{
      'base_url': 'https://crs.example/admin',
      'username': 'operator',
      'password': 'crs-password-sentinel',
    });
    expect(adapter.requests[1].data, <String, Object?>{
      'base_url': 'https://crs.example/admin',
      'username': 'operator',
      'password': 'crs-password-sentinel',
      'sync_proxies': false,
      'selected_account_ids': <String>['crs-new', 'crs-failed'],
    });
    for (final sent in adapter.requests) {
      expect(sent.headers, containsPair('x-api-key', 'admin-crs-key-sentinel'));
      expect(sent.headers, isNot(contains('Authorization')));
    }
  });

  test('CRS selection distinguishes omitted from explicitly empty', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(_syncData())),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await client.accounts.syncFromCrs(
      Sub2ApiAdminCrsSyncRequest(
        baseUrl: Uri.parse('http://127.0.0.1:3000'),
        username: 'operator',
        password: const Sub2ApiPassword('password'),
      ),
    );
    await client.accounts.syncFromCrs(
      Sub2ApiAdminCrsSyncRequest(
        baseUrl: Uri.parse('http://127.0.0.1:3000'),
        username: 'operator',
        password: const Sub2ApiPassword('password'),
        selectedAccountIds: const [],
      ),
    );

    expect(adapter.requests[0].data, isNot(contains('selected_account_ids')));
    expect(
      adapter.requests[1].data,
      containsPair('selected_account_ids', <String>[]),
    );
  });

  test('Admin JWT CRS operations run after role checks', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _fixtureForRequest(sent));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.previewCrs(previewRequest);
    await client.accounts.syncFromCrs(syncRequest);

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/me'),
      hasLength(2),
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair('Authorization', 'Bearer admin-crs-jwt-sentinel'),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('CRS operations preserve business and key failures', () async {
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
        client.accounts.previewCrs(previewRequest),
        throwsA(_code(failure.code)),
      );
      await expectLater(
        client.accounts.syncFromCrs(syncRequest),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('CRS operations reject malformed success data', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path.endsWith('/preview')) {
        return JsonResponse(
          body: _success(<String, Object?>{
            'new_accounts': <Object?>[_previewAccount('same')],
            'existing_accounts': <Object?>[_previewAccount('same')],
          }),
        );
      }
      final malformed = _syncData();
      malformed['created'] = 2;
      return JsonResponse(body: _success(malformed));
    });
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.accounts.previewCrs(previewRequest),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
    await expectLater(
      client.accounts.syncFromCrs(syncRequest),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
  });

  test('CRS operations validate connection input before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.previewCrs(
        Sub2ApiAdminCrsPreviewRequest(
          baseUrl: Uri.parse('ftp://crs.example'),
          username: 'operator',
          password: const Sub2ApiPassword('password'),
        ),
      ),
      throwsA(_code('admin.accounts.invalid_crs_base_url')),
    );
    expect(
      () => client.accounts.previewCrs(
        Sub2ApiAdminCrsPreviewRequest(
          baseUrl: Uri.parse('https://crs.example'),
          username: ' ',
          password: const Sub2ApiPassword('password'),
        ),
      ),
      throwsA(_code('admin.accounts.crs_username_required')),
    );
    expect(
      () => client.accounts.syncFromCrs(
        Sub2ApiAdminCrsSyncRequest(
          baseUrl: Uri.parse('https://crs.example'),
          username: 'operator',
          password: const Sub2ApiPassword(' '),
        ),
      ),
      throwsA(_code('admin.accounts.crs_password_required')),
    );
    expect(
      () => client.accounts.syncFromCrs(
        Sub2ApiAdminCrsSyncRequest(
          baseUrl: Uri.parse('https://crs.example'),
          username: 'operator',
          password: const Sub2ApiPassword('password'),
          selectedAccountIds: const [''],
        ),
      ),
      throwsA(_code('admin.accounts.invalid_crs_account_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('every CRS POST disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-crs-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-crs-jwt'),
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
      client.accounts.previewCrs(previewRequest),
      throwsA(isA<Sub2ApiException>()),
    );
    await expectLater(
      client.accounts.syncFromCrs(syncRequest),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/refresh'),
      isEmpty,
    );
    for (final path in <String>[
      '/api/v1/admin/accounts/sync/crs/preview',
      '/api/v1/admin/accounts/sync/crs',
    ]) {
      expect(adapter.requests.where((sent) => sent.path == path), hasLength(1));
    }
  });
}

Object? _fixtureForRequest(RequestOptions sent) => switch (sent.path) {
  '/api/v1/admin/accounts/sync/crs/preview' => _success(<String, Object?>{
    'new_accounts': <Object?>[
      _previewAccount('crs-new', platform: 'openai', type: 'oauth'),
    ],
    'existing_accounts': <Object?>[
      _previewAccount(
        'crs-existing',
        platform: 'anthropic',
        type: 'setup-token',
      ),
    ],
  }),
  '/api/v1/admin/accounts/sync/crs' => _success(_syncData()),
  _ => throw StateError('unexpected request ${sent.method} ${sent.path}'),
};

Map<String, Object?> _previewAccount(
  String id, {
  String platform = 'openai',
  String type = 'oauth',
}) => <String, Object?>{
  'crs_account_id': id,
  'kind': 'openai_oauth',
  'name': 'CRS $id',
  'platform': platform,
  'type': type,
};

Map<String, Object?> _syncData() => <String, Object?>{
  'created': 1,
  'updated': 1,
  'skipped': 1,
  'failed': 1,
  'items': <Object?>[
    _syncItem('crs-new', 'created'),
    _syncItem('crs-existing', 'updated'),
    _syncItem('crs-skipped', 'skipped', error: 'not selected'),
    _syncItem('crs-failed', 'failed', error: 'missing access_token'),
  ],
};

Map<String, Object?> _syncItem(String id, String action, {String? error}) =>
    <String, Object?>{
      'crs_account_id': id,
      'kind': 'openai_oauth',
      'name': 'CRS $id',
      'action': action,
      'error': ?error,
    };

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
    Sub2ApiAdminApiKey('admin-crs-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
