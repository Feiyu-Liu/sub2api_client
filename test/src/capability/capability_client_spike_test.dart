import 'package:dio/dio.dart';
import 'package:sub2api_client/src/capability/sub2api_capability_client.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/session/session_coordinator.dart';
import 'package:sub2api_client/src/shared/transport/request_executor_impl.dart';
import 'package:test/test.dart';

import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  test(
    'Retrofit spike issues the public settings request without auth',
    () async {
      late final JsonResponseAdapter adapter;
      adapter = JsonResponseAdapter(
        (request) => const JsonResponse(
          body: <String, Object?>{
            'code': 0,
            'message': 'success',
            'data': <String, Object?>{
              'aliyun_captcha_enabled': false,
              'aliyun_captcha_prefix': '',
              'aliyun_captcha_region': '',
              'aliyun_captcha_scene_id': '',
              'backend_mode_enabled': false,
              'dingtalk_oauth_enabled': false,
              'email_verify_enabled': false,
              'force_email_on_third_party_signup': false,
              'github_oauth_enabled': false,
              'google_oauth_enabled': false,
              'invitation_code_enabled': false,
              'linuxdo_oauth_enabled': false,
              'oidc_oauth_enabled': false,
              'passkey_enabled': false,
              'password_reset_enabled': true,
              'payment_enabled': true,
              'promo_code_enabled': false,
              'registration_email_domain_quota_enabled': false,
              'registration_enabled': true,
              'server_timezone': 'UTC',
              'server_utc_offset': '+00:00',
              'tencent_captcha_app_id': '',
              'tencent_captcha_enabled': false,
              'tencent_captcha_region': '',
              'totp_enabled': false,
              'turnstile_enabled': false,
              'turnstile_site_key': '',
              'version': '0.1.183',
              'wechat_oauth_enabled': false,
            },
          },
        ),
      );
      final configuration = Sub2ApiConfiguration(
        origin: Uri.parse('https://example.test'),
      );
      final dio = Dio(BaseOptions(baseUrl: configuration.origin.toString()))
        ..httpClientAdapter = adapter;
      final client = createSub2ApiCapabilityClient(
        dio: dio,
        requestExecutor: _executor(configuration),
      );

      final capabilities = await client.getCapabilities();

      expect(capabilities.version, '0.1.183');
      expect(adapter.requests, hasLength(1));
      expect(adapter.requests.single.method, 'GET');
      expect(adapter.requests.single.path, '/api/v1/settings/public');
      expect(adapter.requests.single.headers, isNot(contains('Authorization')));
    },
  );
}

Sub2ApiRequestExecutorImpl _executor(Sub2ApiConfiguration configuration) =>
    Sub2ApiRequestExecutorImpl(
      configuration: configuration,
      refreshSession: (_) => throw StateError('refresh should not run'),
      sessions: Sub2ApiSessionCoordinator(RecordingSessionStore()),
    );
