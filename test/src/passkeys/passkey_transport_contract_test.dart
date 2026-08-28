import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/client/sub2api_client.dart'
    show createSub2ApiClientForTesting;
import 'package:sub2api_client/sub2api_client.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  test(
    'begin login returns typed WebAuthn options and sends captcha once',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('passkeys/login_begin_success.json'),
        ),
      );
      final dio = Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter;
      final client = createSub2ApiClientForTesting(
        configuration: Sub2ApiConfiguration(
          origin: Uri.parse('https://sub2api.test'),
        ),
        sessionStore: RecordingSessionStore(),
        dio: dio,
      );
      addTearDown(client.close);

      final challenge = await client.passkeys.beginLogin(
        captcha: const Sub2ApiCaptchaProof(
          tencentCaptchaTicket: 'ticket-sentinel',
          tencentCaptchaRandstr: '@randstr-sentinel',
        ),
      );

      expect(challenge.sessionToken.reveal(), 'passkey-login-session-sentinel');
      expect(challenge.options.challenge, <int>[1, 2, 3]);
      expect(challenge.options.timeout, const Duration(minutes: 5));
      expect(challenge.options.relyingPartyId, 'sub2api.example.test');
      expect(challenge.options.userVerification, 'required');
      expect(challenge.options.allowedCredentials.single.id, <int>[4, 5, 6]);
      expect(challenge.options.allowedCredentials.single.transports, <String>[
        'internal',
        'hybrid',
      ]);
      expect(challenge.mediation, 'optional');

      final request = adapter.requests.single;
      expect(request.method, 'POST');
      expect(request.path, '/api/v1/auth/passkey/login/begin');
      expect(request.headers, isNot(contains('Authorization')));
      expect(request.data, <String, Object?>{
        'tencent_captcha_randstr': '@randstr-sentinel',
        'tencent_captcha_ticket': 'ticket-sentinel',
      });
    },
  );

  test('finish login serializes an assertion and persists tokens', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('auth/login_authenticated.json')),
    );
    final dio = Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
    final store = RecordingSessionStore();
    final client = createSub2ApiClientForTesting(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://sub2api.test'),
      ),
      sessionStore: store,
      dio: dio,
    );
    addTearDown(client.close);
    const sessionToken = Sub2ApiPasskeySessionToken(
      'passkey-finish-session-sentinel',
    );
    final request = Sub2ApiFinishPasskeyLoginRequest(
      sessionToken: sessionToken,
      credential: Sub2ApiPasskeyAssertionCredential(
        id: 'credential-id',
        rawId: Uint8List.fromList(<int>[1, 2, 3]),
        type: 'public-key',
        authenticatorAttachment: 'platform',
        response: Sub2ApiPasskeyAssertionResponse(
          authenticatorData: Uint8List.fromList(<int>[4, 5]),
          clientDataJson: Uint8List.fromList(<int>[6, 7]),
          signature: Uint8List.fromList(<int>[8, 9]),
          userHandle: Uint8List.fromList(<int>[10, 11]),
        ),
        clientExtensionResults: const Sub2ApiWebAuthnClientExtensionResults(),
      ),
    );

    final result = await client.passkeys.finishLogin(request);

    expect(result, isA<Sub2ApiAuthenticated>());
    expect(store.session?.accessToken.reveal(), contains('test-access-token'));
    expect(request.toString(), isNot(contains(sessionToken.reveal())));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/auth/passkey/login/finish');
    expect(sent.headers, isNot(contains('Authorization')));
    expect(sent.data, <String, Object?>{
      'session_token': 'passkey-finish-session-sentinel',
      'credential': <String, Object?>{
        'id': 'credential-id',
        'rawId': 'AQID',
        'type': 'public-key',
        'authenticatorAttachment': 'platform',
        'clientExtensionResults': <String, Object?>{},
        'response': <String, Object?>{
          'authenticatorData': 'BAU',
          'clientDataJSON': 'Bgc',
          'signature': 'CAk',
          'userHandle': 'Cgs',
        },
      },
    });
  });

  test('begin registration returns typed creation options', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('registration-access-sentinel'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('passkeys/registration_begin_success.json'),
      ),
    );
    final dio = Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
    final client = createSub2ApiClientForTesting(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://sub2api.test'),
      ),
      sessionStore: RecordingSessionStore(session),
      dio: dio,
    );
    addTearDown(client.close);
    const request = Sub2ApiBeginPasskeyRegistrationRequest(
      password: Sub2ApiPassword('registration-password-sentinel'),
    );

    final challenge = await client.passkeys.beginRegistration(request);

    expect(challenge.sessionToken.toString(), '<redacted>');
    expect(challenge.options.challenge, <int>[1, 2, 3]);
    expect(challenge.options.relyingParty.id, 'sub2api.example.test');
    expect(challenge.options.user.id, <int>[4, 5, 6]);
    expect(challenge.options.parameters.single.algorithm, -7);
    expect(challenge.options.excludeCredentials.single.id, <int>[7, 8, 9]);
    expect(challenge.options.authenticatorSelection?.residentKey, 'required');
    expect(challenge.options.extensions.credentialProperties, isTrue);
    expect(challenge.mediation, 'optional');
    expect(request.toString(), isNot(contains('password-sentinel')));

    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/user/passkeys/register/begin');
    expect(
      sent.headers,
      containsPair('Authorization', 'Bearer registration-access-sentinel'),
    );
    expect(sent.data, <String, Object?>{
      'password': 'registration-password-sentinel',
    });
  });

  test('finish registration creates a typed credential summary', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('registration-finish-access-sentinel'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('passkeys/registration_finish_success.json'),
      ),
    );
    final dio = Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
    final client = createSub2ApiClientForTesting(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://sub2api.test'),
      ),
      sessionStore: RecordingSessionStore(session),
      dio: dio,
    );
    addTearDown(client.close);
    final request = Sub2ApiFinishPasskeyRegistrationRequest(
      sessionToken: const Sub2ApiPasskeySessionToken(
        'registration-finish-session-sentinel',
      ),
      name: 'Laptop',
      credential: Sub2ApiPasskeyRegistrationCredential(
        id: 'credential-id',
        rawId: Uint8List.fromList(<int>[1, 2, 3]),
        type: 'public-key',
        authenticatorAttachment: 'platform',
        response: Sub2ApiPasskeyAttestationResponse(
          attestationObject: Uint8List.fromList(<int>[12, 13]),
          clientDataJson: Uint8List.fromList(<int>[6, 7]),
          transports: const <String>['internal'],
        ),
        clientExtensionResults: const Sub2ApiWebAuthnClientExtensionResults(
          credentialPropertiesResidentKey: true,
        ),
      ),
    );

    final summary = await client.passkeys.finishRegistration(request);

    expect(summary.id, 3);
    expect(summary.name, 'Laptop');
    expect(summary.backup, isFalse);
    expect(summary.createdAt, DateTime.utc(2026, 8, 27, 3, 4, 5));
    expect(request.toString(), isNot(contains('session-sentinel')));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/user/passkeys/register/finish');
    expect(
      sent.headers,
      containsPair(
        'Authorization',
        'Bearer registration-finish-access-sentinel',
      ),
    );
    expect(sent.data, <String, Object?>{
      'session_token': 'registration-finish-session-sentinel',
      'name': 'Laptop',
      'credential': <String, Object?>{
        'id': 'credential-id',
        'rawId': 'AQID',
        'type': 'public-key',
        'authenticatorAttachment': 'platform',
        'clientExtensionResults': <String, Object?>{
          'credProps': <String, Object?>{'rk': true},
        },
        'response': <String, Object?>{
          'attestationObject': 'DA0',
          'clientDataJSON': 'Bgc',
          'transports': <String>['internal'],
        },
      },
    });
  });

  test('list returns the current user passkey summaries', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('passkey-list-access-sentinel'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('passkeys/list_success.json')),
    );
    final dio = Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
    final client = createSub2ApiClientForTesting(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://sub2api.test'),
      ),
      sessionStore: RecordingSessionStore(session),
      dio: dio,
    );
    addTearDown(client.close);

    final credentials = await client.passkeys.list();

    expect(credentials, hasLength(2));
    expect(credentials.first.name, 'Laptop');
    expect(credentials.first.backup, isTrue);
    expect(credentials.last.lastUsedAt, isNull);
    final sent = adapter.requests.single;
    expect(sent.method, 'GET');
    expect(sent.path, '/api/v1/user/passkeys');
    expect(
      sent.headers,
      containsPair('Authorization', 'Bearer passkey-list-access-sentinel'),
    );
  });

  test('rename sends one non-replayable PATCH', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('passkey-rename-access-sentinel'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('passkeys/mutation_success.json')),
    );
    final dio = Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
    final client = createSub2ApiClientForTesting(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://sub2api.test'),
      ),
      sessionStore: RecordingSessionStore(session),
      dio: dio,
    );
    addTearDown(client.close);

    await client.passkeys.rename(3, 'Work Laptop');

    final sent = adapter.requests.single;
    expect(sent.method, 'PATCH');
    expect(sent.path, '/api/v1/user/passkeys/3');
    expect(
      sent.headers,
      containsPair('Authorization', 'Bearer passkey-rename-access-sentinel'),
    );
    expect(sent.data, <String, Object?>{'name': 'Work Laptop'});
  });

  test('delete sends a redacted password-gated DELETE', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('passkey-delete-access-sentinel'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('passkeys/mutation_success.json')),
    );
    final dio = Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
    final client = createSub2ApiClientForTesting(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://sub2api.test'),
      ),
      sessionStore: RecordingSessionStore(session),
      dio: dio,
    );
    addTearDown(client.close);
    const request = Sub2ApiDeletePasskeyRequest(
      password: Sub2ApiPassword('delete-password-sentinel'),
    );

    await client.passkeys.delete(3, request);

    expect(request.toString(), isNot(contains('delete-password-sentinel')));
    final sent = adapter.requests.single;
    expect(sent.method, 'DELETE');
    expect(sent.path, '/api/v1/user/passkeys/3');
    expect(
      sent.headers,
      containsPair('Authorization', 'Bearer passkey-delete-access-sentinel'),
    );
    expect(sent.data, <String, Object?>{
      'password': 'delete-password-sentinel',
    });
  });

  test('begin login rejects malformed Base64URL options', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{
            'session_token': 'malformed-options-session-sentinel',
            'options': <String, Object?>{
              'publicKey': <String, Object?>{'challenge': '%%%not-base64'},
            },
          },
        },
      ),
    );
    final dio = Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
    final client = createSub2ApiClientForTesting(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://sub2api.test'),
      ),
      sessionStore: RecordingSessionStore(),
      dio: dio,
    );
    addTearDown(client.close);

    await expectLater(
      client.passkeys.beginLogin(),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'protocol.invalid_passkey_login_options',
        ),
      ),
    );
  });

  test('invalid mutations fail before network I/O', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('validation-access-sentinel'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('network must not run'),
    );
    final dio = Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
    final client = createSub2ApiClientForTesting(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://sub2api.test'),
      ),
      sessionStore: RecordingSessionStore(session),
      dio: dio,
    );
    addTearDown(client.close);

    expect(
      () => client.passkeys.rename(3, '   '),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'passkey.name_required',
        ),
      ),
    );
    expect(
      () => client.passkeys.delete(
        3,
        const Sub2ApiDeletePasskeyRequest(password: Sub2ApiPassword('')),
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'passkey.password_required',
        ),
      ),
    );
    expect(adapter.requests, isEmpty);
  });
}
