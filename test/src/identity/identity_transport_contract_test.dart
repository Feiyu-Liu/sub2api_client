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
    accessToken: Sub2ApiAccessToken('identity-access-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'start binding returns a typed browser authorization instruction',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('identity/binding_start_success.json'),
        ),
      );
      final client = _client(adapter, session);
      addTearDown(client.close);
      const request = Sub2ApiStartIdentityBindingRequest(
        provider: Sub2ApiIdentityProvider.linuxDo,
        redirectTo: '/security',
      );

      final instruction = await client.identities.startBinding(request);

      expect(instruction.provider, Sub2ApiIdentityProvider.linuxDo);
      expect(
        instruction.authorizeUri.path,
        '/api/v1/auth/oauth/linuxdo/bind/start',
      );
      expect(instruction.authorizeUri.queryParameters['redirect'], '/security');
      expect(instruction.method, 'GET');
      expect(instruction.useBrowserRedirect, isTrue);
      final sent = adapter.requests.single;
      expect(sent.method, 'POST');
      expect(sent.path, '/api/v1/user/auth-identities/bind/start');
      expect(sent.data, <String, Object?>{
        'provider': 'linuxdo',
        'redirect_to': '/security',
      });
    },
  );

  test('send email-binding code is non-replayable and localized', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('identity/code_sent.json')),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    final sent = await client.identities.sendEmailBindingCode(
      'new@example.test',
      locale: 'en-US',
    );

    expect(sent.message, 'Verification code sent successfully');
    final request = adapter.requests.single;
    expect(request.method, 'POST');
    expect(request.path, '/api/v1/user/account-bindings/email/send-code');
    expect(request.headers, containsPair('Accept-Language', 'en-US'));
    expect(request.data, <String, Object?>{'email': 'new@example.test'});
  });

  test('send notification-email code uses its dedicated route', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('identity/code_sent.json')),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    final sent = await client.identities.sendNotificationEmailCode(
      'alerts@example.test',
      locale: 'zh-CN',
    );

    expect(sent.message, isNotEmpty);
    final request = adapter.requests.single;
    expect(request.method, 'POST');
    expect(request.path, '/api/v1/user/notify-email/send-code');
    expect(request.headers, containsPair('Accept-Language', 'zh-CN'));
    expect(request.data, <String, Object?>{'email': 'alerts@example.test'});
  });

  test('bind email returns the complete updated account snapshot', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('identity/account_snapshot_success.json'),
      ),
    );
    final store = RecordingSessionStore(session);
    final client = _client(adapter, session, store: store);
    addTearDown(client.close);
    const request = Sub2ApiBindEmailIdentityRequest(
      email: 'new@example.test',
      verificationCode: Sub2ApiVerificationCode('123456'),
      password: Sub2ApiPassword('identity-password-sentinel'),
    );

    final account = await client.identities.bindEmail(request);

    expect(account.email, 'new@example.test');
    expect(account.emailBound, isTrue);
    expect(account.identities.email.canUnbind, isTrue);
    expect(
      account.balanceNotifyExtraEmails.single.email,
      'alerts@example.test',
    );
    expect(store.session, isNull);
    expect(store.clearCount, 1);
    expect(request.toString(), isNot(contains('123456')));
    expect(request.toString(), isNot(contains('password-sentinel')));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/user/account-bindings/email');
    expect(sent.data, <String, Object?>{
      'email': 'new@example.test',
      'verify_code': '123456',
      'password': 'identity-password-sentinel',
    });
  });

  test('unbind clears the locally invalidated session after success', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('identity/account_snapshot_success.json'),
      ),
    );
    final store = RecordingSessionStore(session);
    final client = _client(adapter, session, store: store);
    addTearDown(client.close);

    final account = await client.identities.unbind(
      Sub2ApiIdentityProvider.oidc,
    );

    expect(account.id, 42);
    expect(store.session, isNull);
    expect(store.clearCount, 1);
    final sent = adapter.requests.single;
    expect(sent.method, 'DELETE');
    expect(sent.path, '/api/v1/user/account-bindings/oidc');
  });

  test('verify notification email returns the updated account', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('identity/account_snapshot_success.json'),
      ),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);
    const request = Sub2ApiVerifyNotificationEmailRequest(
      email: 'alerts@example.test',
      code: Sub2ApiVerificationCode('123456'),
    );

    final account = await client.identities.verifyNotificationEmail(request);

    expect(account.balanceNotifyExtraEmails.single.verified, isTrue);
    expect(request.toString(), isNot(contains('123456')));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/user/notify-email/verify');
    expect(sent.data, <String, Object?>{
      'email': 'alerts@example.test',
      'code': '123456',
    });
  });

  test('toggle notification email returns the updated account', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('identity/account_snapshot_success.json'),
      ),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    final account = await client.identities.toggleNotificationEmail(
      'alerts@example.test',
      disabled: true,
    );

    expect(account.id, 42);
    final sent = adapter.requests.single;
    expect(sent.method, 'PUT');
    expect(sent.path, '/api/v1/user/notify-email/toggle');
    expect(sent.data, <String, Object?>{
      'email': 'alerts@example.test',
      'disabled': true,
    });
  });

  test(
    'remove notification email uses a DELETE body and returns account',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('identity/account_snapshot_success.json'),
        ),
      );
      final client = _client(adapter, session);
      addTearDown(client.close);

      final account = await client.identities.removeNotificationEmail(
        'alerts@example.test',
      );

      expect(account.id, 42);
      final sent = adapter.requests.single;
      expect(sent.method, 'DELETE');
      expect(sent.path, '/api/v1/user/notify-email');
      expect(sent.data, <String, Object?>{'email': 'alerts@example.test'});
    },
  );

  test('invalid identity inputs fail before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('network must not run'),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    expect(
      () => client.identities.startBinding(
        const Sub2ApiStartIdentityBindingRequest(
          provider: Sub2ApiIdentityProvider.oidc,
          redirectTo: 'https://evil.example/steal',
        ),
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'identity.invalid_redirect',
        ),
      ),
    );
    expect(
      () => client.identities.sendEmailBindingCode('not-an-email'),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(
      () => client.identities.bindEmail(
        const Sub2ApiBindEmailIdentityRequest(
          email: 'user@example.test',
          verificationCode: Sub2ApiVerificationCode('12345'),
          password: Sub2ApiPassword('password'),
        ),
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'identity.invalid_verification_code',
        ),
      ),
    );
    expect(adapter.requests, isEmpty);
  });

  test('failed unbind preserves the current session', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        statusCode: 409,
        body: <String, Object?>{
          'code': 409,
          'message': 'bind another method first',
          'reason': 'IDENTITY_UNBIND_LAST_METHOD',
        },
      ),
    );
    final store = RecordingSessionStore(session);
    final client = _client(adapter, session, store: store);
    addTearDown(client.close);

    await expectLater(
      client.identities.unbind(Sub2ApiIdentityProvider.linuxDo),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'identity.unbind_last_method',
        ),
      ),
    );

    expect(store.session, same(session));
    expect(store.clearCount, 0);
    expect(adapter.requests, hasLength(1));
  });

  test('unsubscribe builder returns the fixed HTML browser route', () {
    final client = _client(
      JsonResponseAdapter((_) => throw StateError('no I/O')),
      session,
    );
    addTearDown(client.close);
    const token = Sub2ApiNotificationUnsubscribeToken(
      'unsubscribe-token-sentinel',
    );

    final instruction = client.identities.buildNotificationEmailUnsubscribe(
      token,
    );

    expect(instruction.uri.path, '/api/v1/settings/email-unsubscribe');
    expect(
      instruction.uri.queryParameters['token'],
      'unsubscribe-token-sentinel',
    );
    expect(token.toString(), '<redacted>');
    expect(instruction.toString(), isNot(contains('token-sentinel')));
  });
}

Sub2ApiClient _client(
  JsonResponseAdapter adapter,
  Sub2ApiSession session, {
  RecordingSessionStore? store,
}) {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  final dio = Dio(BaseOptions(baseUrl: configuration.origin.toString()))
    ..httpClientAdapter = adapter;
  return createSub2ApiClientForTesting(
    configuration: configuration,
    sessionStore: store ?? RecordingSessionStore(session),
    dio: dio,
  );
}
