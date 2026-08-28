import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/request/sub2api_request_options.dart';
import 'package:sub2api_client/src/shared/session/session_coordinator.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:sub2api_client/src/shared/transport/request_executor.dart';
import 'package:sub2api_client/src/shared/transport/request_executor_impl.dart';
import 'package:test/test.dart';

import '../../../support/recording_session_store.dart';

void main() {
  const original = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('access-old'),
    refreshToken: Sub2ApiRefreshToken('refresh-old'),
    scope: 'user:1',
  );
  const rotated = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('access-new'),
    refreshToken: Sub2ApiRefreshToken('refresh-new'),
    scope: 'user:1',
  );

  test('N concurrent 401 responses share one refresh and replay', () async {
    final store = RecordingSessionStore(original);
    final sessions = Sub2ApiSessionCoordinator(store);
    final refreshGate = Completer<Sub2ApiSession>();
    final refreshStarted = Completer<void>();
    var refreshCount = 0;
    final executor = _executor(
      sessions,
      refreshSession: (_) {
        refreshCount++;
        if (!refreshStarted.isCompleted) {
          refreshStarted.complete();
        }
        return refreshGate.future;
      },
    );
    var oldTokenCalls = 0;
    var replayCalls = 0;
    final allOldCalls = Completer<void>();
    final send = _wire((authorization) {
      if (authorization == 'Bearer access-old') {
        oldTokenCalls++;
        if (oldTokenCalls == 3) {
          allOldCalls.complete();
        }
        throw _unauthorized();
      }
      expect(authorization, 'Bearer access-new');
      replayCalls++;
      return _success(7);
    });

    final requests = List.generate(
      3,
      (_) => executor.protectedRequest<int>(
        send: send,
        decode: (data) => data! as int,
      ),
    );
    await allOldCalls.future;
    await refreshStarted.future;
    expect(refreshCount, 1);

    refreshGate.complete(rotated);
    expect(await Future.wait(requests), [7, 7, 7]);
    expect(replayCalls, 3);
    expect(store.session, same(rotated));
  });

  test('replay starts only after the rotated pair is persisted', () async {
    final store = RecordingSessionStore(original);
    final sessions = Sub2ApiSessionCoordinator(store);
    final refreshGate = Completer<Sub2ApiSession>();
    final writeGate = Completer<void>();
    final writeStarted = Completer<void>();
    store.writeGate = writeGate;
    store.writeStarted = writeStarted;
    var replayCalls = 0;
    final executor = _executor(
      sessions,
      refreshSession: (_) => refreshGate.future,
    );
    final send = _wire((authorization) {
      if (authorization == 'Bearer access-old') {
        throw _unauthorized();
      }
      replayCalls++;
      return _success(1);
    });

    final request = executor.protectedRequest<int>(
      send: send,
      decode: (data) => data! as int,
    );
    refreshGate.complete(rotated);
    await writeStarted.future;
    expect(replayCalls, 0);

    writeGate.complete();
    expect(await request, 1);
    expect(replayCalls, 1);
  });

  test('cancelling one waiter does not cancel shared refresh', () async {
    final store = RecordingSessionStore(original);
    final sessions = Sub2ApiSessionCoordinator(store);
    final refreshGate = Completer<Sub2ApiSession>();
    var refreshCount = 0;
    final executor = _executor(
      sessions,
      refreshSession: (_) {
        refreshCount++;
        return refreshGate.future;
      },
    );
    final send = _wire((authorization) {
      if (authorization == 'Bearer access-old') {
        throw _unauthorized();
      }
      return _success(9);
    });
    final cancellation = Sub2ApiCancellationController();

    final cancelled = executor.protectedRequest<int>(
      send: send,
      decode: (data) => data! as int,
      requestOptions: Sub2ApiRequestOptions(
        cancellationToken: cancellation.token,
      ),
    );
    final successful = executor.protectedRequest<int>(
      send: send,
      decode: (data) => data! as int,
    );
    cancellation.cancel();
    await expectLater(
      cancelled,
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'request.cancelled',
        ),
      ),
    );

    refreshGate.complete(rotated);
    expect(await successful, 9);
    expect(refreshCount, 1);
  });

  test(
    'deadline can expire while waiting without cancelling refresh',
    () async {
      final store = RecordingSessionStore(original);
      final sessions = Sub2ApiSessionCoordinator(store);
      final refreshGate = Completer<Sub2ApiSession>();
      final executor = _executor(
        sessions,
        refreshSession: (_) => refreshGate.future,
      );

      final request = executor.protectedRequest<int>(
        send: _wire((_) => throw _unauthorized()),
        decode: (data) => data! as int,
        requestOptions: const Sub2ApiRequestOptions(
          timeout: Duration(milliseconds: 20),
        ),
      );

      await expectLater(
        request,
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'request.timeout',
          ),
        ),
      );
      refreshGate.complete(rotated);
    },
  );

  test('non-replayable request never triggers refresh', () async {
    final store = RecordingSessionStore(original);
    final sessions = Sub2ApiSessionCoordinator(store);
    var refreshCount = 0;
    final executor = _executor(
      sessions,
      refreshSession: (_) async {
        refreshCount++;
        return rotated;
      },
    );

    await expectLater(
      executor.protectedNonReplayableRequest<int>(
        send: _wire((_) => throw _unauthorized()),
        decode: (data) => data! as int,
      ),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(refreshCount, 0);
  });

  test('account replacement after the first 401 never refreshes it', () async {
    const replacement = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('access-other'),
      refreshToken: Sub2ApiRefreshToken('refresh-other'),
      scope: 'user:2',
    );
    final store = RecordingSessionStore(original);
    final sessions = Sub2ApiSessionCoordinator(store);
    final firstAttempt = Completer<HttpResponse<Object?>>();
    var refreshCount = 0;
    final executor = _executor(
      sessions,
      refreshSession: (_) async {
        refreshCount++;
        return rotated;
      },
    );

    final request = executor.protectedRequest<int>(
      send: (_, _, _) => firstAttempt.future,
      decode: (data) => data! as int,
    );
    await Future<void>.delayed(Duration.zero);
    await sessions.replace(replacement);
    firstAttempt.completeError(_unauthorized());

    await expectLater(
      request,
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'auth.login_required',
        ),
      ),
    );
    expect(refreshCount, 0);
    expect(store.session, same(replacement));
  });

  test('cancellation during initial I/O maps without replay', () async {
    final store = RecordingSessionStore(original);
    final sessions = Sub2ApiSessionCoordinator(store);
    var refreshCount = 0;
    var wireCalls = 0;
    final executor = _executor(
      sessions,
      refreshSession: (_) async {
        refreshCount++;
        return rotated;
      },
    );
    final cancellation = Sub2ApiCancellationController();
    final wireStarted = Completer<void>();

    final request = executor.protectedRequest<int>(
      send: (cancelToken, _, _) async {
        wireCalls++;
        wireStarted.complete();
        throw await cancelToken.whenCancel;
      },
      decode: (data) => data! as int,
      requestOptions: Sub2ApiRequestOptions(
        cancellationToken: cancellation.token,
      ),
    );
    await wireStarted.future;
    cancellation.cancel();

    await expectLater(
      request,
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'request.cancelled',
        ),
      ),
    );
    expect(wireCalls, 1);
    expect(refreshCount, 0);
  });

  test('a replayed request is never replayed a second time', () async {
    final store = RecordingSessionStore(original);
    final sessions = Sub2ApiSessionCoordinator(store);
    var wireCalls = 0;
    var refreshCount = 0;
    final executor = _executor(
      sessions,
      refreshSession: (_) async {
        refreshCount++;
        return rotated;
      },
    );

    await expectLater(
      executor.protectedRequest<int>(
        send: _wire((_) {
          wireCalls++;
          throw _unauthorized();
        }),
        decode: (data) => data! as int,
      ),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(refreshCount, 1);
    expect(wireCalls, 2);
    expect(store.session, isNull);
  });

  test('invalid refresh clears only the matching session', () async {
    final store = RecordingSessionStore(original);
    final sessions = Sub2ApiSessionCoordinator(store);
    final executor = _executor(
      sessions,
      refreshSession: (_) => throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.unauthorized,
        code: 'auth.refresh_token_invalid',
        retryable: false,
      ),
    );

    await expectLater(
      executor.protectedRequest<int>(
        send: _wire((_) => throw _unauthorized()),
        decode: (data) => data! as int,
      ),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(store.session, isNull);
  });

  test('access-only session never attempts refresh', () async {
    const accessOnly = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('access-only'),
      scope: 'user:1',
    );
    final store = RecordingSessionStore(accessOnly);
    final sessions = Sub2ApiSessionCoordinator(store);
    var refreshCount = 0;
    final executor = _executor(
      sessions,
      refreshSession: (_) async {
        refreshCount++;
        return rotated;
      },
    );

    await expectLater(
      executor.protectedRequest<int>(
        send: _wire((_) => throw _unauthorized()),
        decode: (data) => data! as int,
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'auth.login_required',
        ),
      ),
    );
    expect(refreshCount, 0);
    expect(store.session, isNull);
  });

  test('closed executor rejects new calls before invoking wire code', () async {
    final sessions = Sub2ApiSessionCoordinator(RecordingSessionStore(original));
    final executor = _executor(sessions, refreshSession: (_) async => rotated)
      ..close();
    var called = false;

    await expectLater(
      executor.publicRequest<int>(
        send: _wire((_) {
          called = true;
          return _success(1);
        }),
        decode: (data) => data! as int,
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'client.closed',
        ),
      ),
    );
    expect(called, isFalse);
  });

  test('explicit public policy accepts a raw 200 success payload', () async {
    final sessions = Sub2ApiSessionCoordinator(RecordingSessionStore());
    final executor = _executor(
      sessions,
      refreshSession: (_) => throw StateError('refresh must not run'),
    );

    final value = await executor.publicRequestAllowingRawSuccess<String>(
      send: _wire((_) => _rawSuccess(<String, Object?>{'step': 'choice'})),
      decode: (data) => (data! as Map<String, Object?>)['step']! as String,
    );

    expect(value, 'choice');
  });
}

Sub2ApiRequestExecutorImpl _executor(
  Sub2ApiSessionCoordinator sessions, {
  required Sub2ApiRefreshSession refreshSession,
}) => Sub2ApiRequestExecutorImpl(
  configuration: Sub2ApiConfiguration(origin: Uri.parse('https://example.com')),
  sessions: sessions,
  refreshSession: refreshSession,
);

Sub2ApiWireCall _wire(
  HttpResponse<Object?> Function(String? authorization) body,
) =>
    (_, _, authorization) async => body(authorization);

HttpResponse<Object?> _success(Object? data) {
  final options = RequestOptions(path: '/api/v1/test');
  return HttpResponse<Object?>({
    'code': 0,
    'message': 'success',
    'data': data,
  }, Response<Object?>(requestOptions: options, statusCode: 200));
}

HttpResponse<Object?> _rawSuccess(Object? data) {
  final options = RequestOptions(path: '/api/v1/test');
  return HttpResponse<Object?>(
    data,
    Response<Object?>(requestOptions: options, statusCode: 200),
  );
}

DioException _unauthorized() {
  final options = RequestOptions(path: '/api/v1/test');
  return DioException(
    requestOptions: options,
    type: DioExceptionType.badResponse,
    response: Response<Object?>(
      requestOptions: options,
      statusCode: 401,
      data: {'code': 'TOKEN_EXPIRED', 'message': 'redacted'},
    ),
  );
}
