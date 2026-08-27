import 'package:dio/dio.dart';
import 'package:sub2api_client/src/client/sub2api_client.dart'
    show createSub2ApiClientForTesting;
import 'package:sub2api_client/sub2api_client.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('totp-access-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('status returns feature and enrollment facts', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('totp/status_enabled.json')),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    final status = await client.totp.getStatus();

    expect(status.enabled, isTrue);
    expect(status.featureEnabled, isTrue);
    expect(
      status.enabledAt,
      DateTime.fromMillisecondsSinceEpoch(1787803200 * 1000, isUtc: true),
    );
    final request = adapter.requests.single;
    expect(request.method, 'GET');
    expect(request.path, '/api/v1/user/totp/status');
    expect(
      request.headers,
      containsPair('Authorization', 'Bearer totp-access-sentinel'),
    );
  });

  test('verification method maps the administrator password policy', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('totp/verification_method_password.json'),
      ),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    final method = await client.totp.getVerificationMethod();

    expect(method, Sub2ApiTotpVerificationMethod.password);
    final request = adapter.requests.single;
    expect(request.method, 'GET');
    expect(request.path, '/api/v1/user/totp/verification-method');
  });

  test(
    'send code is non-replayable and forwards the requested locale',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: readFixture('totp/success.json')),
      );
      final client = _client(adapter, session);
      addTearDown(client.close);

      await client.totp.sendEmailVerificationCode(locale: 'zh-CN');

      final request = adapter.requests.single;
      expect(request.method, 'POST');
      expect(request.path, '/api/v1/user/totp/send-code');
      expect(request.headers, containsPair('Accept-Language', 'zh-CN'));
      expect(request.data, isNull);
    },
  );

  test('begin setup returns redacted TOTP enrollment authority', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('totp/setup_success.json')),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);
    const proof = Sub2ApiTotpIdentityProof.password(
      Sub2ApiPassword('totp-password-sentinel'),
    );

    final setup = await client.totp.beginSetup(proof);

    expect(setup.secret.reveal(), 'JBSWY3DPEHPK3PXP');
    expect(setup.qrCodeUri.reveal(), startsWith('otpauth://totp/'));
    expect(setup.setupToken.reveal(), 'totp-setup-token-sentinel');
    expect(setup.expiresIn, const Duration(minutes: 5));
    expect(setup.toString(), isNot(contains('JBSWY3DPEHPK3PXP')));
    expect(proof.toString(), isNot(contains('totp-password-sentinel')));

    final request = adapter.requests.single;
    expect(request.method, 'POST');
    expect(request.path, '/api/v1/user/totp/setup');
    expect(request.data, <String, Object?>{
      'password': 'totp-password-sentinel',
    });
  });

  test('enable consumes the setup token and six-digit code once', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('totp/success.json')),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);
    const request = Sub2ApiEnableTotpRequest(
      code: Sub2ApiVerificationCode('123456'),
      setupToken: Sub2ApiTotpSetupToken('enable-setup-token-sentinel'),
    );

    await client.totp.enable(request);

    expect(request.toString(), isNot(contains('123456')));
    expect(request.toString(), isNot(contains('setup-token-sentinel')));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/user/totp/enable');
    expect(sent.data, <String, Object?>{
      'totp_code': '123456',
      'setup_token': 'enable-setup-token-sentinel',
    });
  });

  test('disable sends the selected email identity proof once', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('totp/success.json')),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);
    const proof = Sub2ApiTotpIdentityProof.email(
      Sub2ApiVerificationCode('654321'),
    );

    await client.totp.disable(proof);

    expect(proof.toString(), isNot(contains('654321')));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/user/totp/disable');
    expect(sent.data, <String, Object?>{'email_code': '654321'});
  });

  test('step-up grants a typed session-bound sudo window', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('totp/step_up_success.json')),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);
    const code = Sub2ApiVerificationCode('123456');

    final grant = await client.totp.stepUp(code);

    expect(grant.verified, isTrue);
    expect(grant.expiresIn, const Duration(minutes: 15));
    expect(code.toString(), isNot(contains('123456')));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/user/totp/step-up');
    expect(sent.data, <String, Object?>{'code': '123456'});
  });

  test('invalid TOTP codes fail before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('network must not run'),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    expect(
      () => client.totp.stepUp(const Sub2ApiVerificationCode('12345')),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'totp.invalid_code',
        ),
      ),
    );
    expect(adapter.requests, isEmpty);
  });

  test(
    'step-up does not refresh or replay after an unauthorized response',
    () async {
      const refreshableSession = Sub2ApiSession(
        accessToken: Sub2ApiAccessToken('step-up-access-sentinel'),
        refreshToken: Sub2ApiRefreshToken('step-up-refresh-sentinel'),
        scope: 'https://sub2api.test',
      );
      final adapter = JsonResponseAdapter(
        (_) => const JsonResponse(
          statusCode: 401,
          body: <String, Object?>{
            'code': 'TOKEN_EXPIRED',
            'message': 'expired',
          },
        ),
      );
      final client = _client(adapter, refreshableSession);
      addTearDown(client.close);

      await expectLater(
        client.totp.stepUp(const Sub2ApiVerificationCode('123456')),
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'auth.token_expired',
          ),
        ),
      );

      expect(adapter.requests, hasLength(1));
      expect(adapter.requests.single.path, '/api/v1/user/totp/step-up');
    },
  );

  test('setup fails closed when sensitive authority is missing', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{
            'secret': '',
            'qr_code_url': 'otpauth://totp/Sub2API:user',
            'setup_token': 'token',
            'countdown': 300,
          },
        },
      ),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    await expectLater(
      client.totp.beginSetup(
        const Sub2ApiTotpIdentityProof.password(Sub2ApiPassword('password')),
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'protocol.invalid_totp_setup_response',
        ),
      ),
    );
  });
}

Sub2ApiClient _client(JsonResponseAdapter adapter, Sub2ApiSession session) {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  final dio = Dio(BaseOptions(baseUrl: configuration.origin.toString()))
    ..httpClientAdapter = adapter;
  return createSub2ApiClientForTesting(
    configuration: configuration,
    sessionStore: RecordingSessionStore(session),
    dio: dio,
  );
}
