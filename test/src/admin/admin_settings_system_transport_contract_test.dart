import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_system_settings_models.dart';
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

  test(
    'Ops reads all generated fields and sends a typed partial patch',
    () async {
      final direct = mapAdminSystemSettings(_fixture()['data']);
      expect(
        direct.read(Sub2ApiAdminSystemSettingFields.registrationEnabled),
        isTrue,
      );
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: _fixture()),
      );
      final client = _ops(configuration, adapter);
      addTearDown(client.close);
      const secret = Sub2ApiAdminSettingSecret('smtp-setting-secret');

      final settings = await client.settings.getSystemSettings();
      final patch = Sub2ApiAdminSystemSettingsPatch.empty()
          .withValue(Sub2ApiAdminSystemSettingUpdates.siteName, 'Updated Site')
          .withValue(Sub2ApiAdminSystemSettingUpdates.smtpPassword, secret)
          .withValue(
            Sub2ApiAdminSystemSettingUpdates.defaultBalance,
            Sub2ApiDecimal.parse('12.5'),
          );
      final updated = await client.settings.updateSystemSettings(patch);

      expect(
        settings.read(Sub2ApiAdminSystemSettingFields.registrationEnabled),
        isTrue,
      );
      expect(
        settings.read(Sub2ApiAdminSystemSettingFields.siteName),
        'Sub2API Fixture',
      );
      expect(
        settings
            .read(Sub2ApiAdminSystemSettingFields.paymentMinAmount)
            .toString(),
        '1.25',
      );
      expect(
        updated.read(Sub2ApiAdminSystemSettingFields.registrationEnabled),
        isTrue,
      );
      expect(secret.toString(), '<redacted>');
      expect(adapter.requests.map((request) => request.path), <String>[
        '/api/v1/admin/settings',
        '/api/v1/admin/settings',
      ]);
      expect(adapter.requests.last.method, 'PUT');
      expect(
        adapter.requests.last.data,
        containsPair('site_name', 'Updated Site'),
      );
      expect(
        adapter.requests.last.data,
        containsPair('smtp_password', 'smtp-setting-secret'),
      );
      expect(adapter.requests.last.data, containsPair('default_balance', 12.5));
      expect(
        adapter.requests.last.data,
        isNot(contains('registration_enabled')),
      );
      expect(
        adapter.requests.every(
          (request) => request.headers['x-api-key'] == 'system-key-sentinel',
        ),
        isTrue,
      );
    },
  );

  test(
    'empty patch and malformed response fail before unsafe behavior',
    () async {
      final noIo = JsonResponseAdapter((_) => throw StateError('no io'));
      final client = _ops(configuration, noIo);
      addTearDown(client.close);
      expect(
        () => client.settings.updateSystemSettings(
          Sub2ApiAdminSystemSettingsPatch.empty(),
        ),
        throwsA(_code('admin.settings.empty_system_settings_patch')),
      );
      expect(noIo.requests, isEmpty);

      final malformedData = Map<String, Object?>.from(
        _fixture()['data']! as Map,
      )..remove('registration_enabled');
      final malformed = JsonResponseAdapter(
        (_) => JsonResponse(
          body: <String, Object?>{
            'code': 0,
            'message': 'success',
            'data': malformedData,
          },
        ),
      );
      final malformedClient = _ops(configuration, malformed);
      addTearDown(malformedClient.close);
      await expectLater(
        malformedClient.settings.getSystemSettings(),
        throwsA(_code('protocol.invalid_admin_system_settings_response')),
      );
    },
  );

  test(
    'Ops step-up enable preserves server denial and never replays',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => const JsonResponse(
          statusCode: 403,
          body: <String, Object?>{
            'code': 'STEP_UP_ADMIN_API_KEY_FORBIDDEN',
            'message': 'use an admin session',
          },
        ),
      );
      final client = _ops(configuration, adapter);
      addTearDown(client.close);
      final patch = Sub2ApiAdminSystemSettingsPatch.empty().withValue(
        Sub2ApiAdminSystemSettingUpdates.stepUpEnabled,
        true,
      );
      await expectLater(
        client.settings.updateSystemSettings(patch),
        throwsA(_code('auth.step_up_admin_api_key_forbidden')),
      );
      expect(adapter.requests, hasLength(1));
    },
  );

  test('Admin JWT system setting update runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('system-settings-admin-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _fixture());
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter,
    );
    addTearDown(client.close);
    final patch = Sub2ApiAdminSystemSettingsPatch.empty().withValue(
      Sub2ApiAdminSystemSettingUpdates.stepUpEnabled,
      true,
    );
    await client.settings.updateSystemSettings(patch);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer system-settings-admin-jwt'),
    );
    expect(adapter.requests.last.data, containsPair('step_up_enabled', true));
  });
}

Map<String, Object?> _fixture() =>
    readFixture('admin/system_settings_generated.json');
Sub2ApiOpsClient _ops(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('system-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
