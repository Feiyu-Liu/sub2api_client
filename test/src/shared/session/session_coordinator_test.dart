import 'dart:async';

import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/session/session_coordinator.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
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
  const replacement = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('access-other'),
    refreshToken: Sub2ApiRefreshToken('refresh-other'),
    scope: 'user:2',
  );

  test('shares one refresh for concurrent callers', () async {
    final store = RecordingSessionStore(original);
    final coordinator = Sub2ApiSessionCoordinator(store);
    final snapshot = (await coordinator.snapshot())!;
    final gate = Completer<Sub2ApiSession>();
    var refreshCount = 0;

    Future<Sub2ApiSession> refresh() {
      refreshCount++;
      return gate.future;
    }

    final first = coordinator.refresh(snapshot, refresh);
    final second = coordinator.refresh(snapshot, refresh);
    expect(refreshCount, 1);

    gate.complete(rotated);
    expect(await first, same(rotated));
    expect(await second, same(rotated));
    expect(store.session, same(rotated));
  });

  test('logout invalidates a refresh that completes later', () async {
    final store = RecordingSessionStore(original);
    final coordinator = Sub2ApiSessionCoordinator(store);
    final snapshot = (await coordinator.snapshot())!;
    final gate = Completer<Sub2ApiSession>();

    final refresh = coordinator.refresh(snapshot, () => gate.future);
    await coordinator.clear();
    gate.complete(rotated);

    await expectLater(
      refresh,
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'auth.session_changed',
        ),
      ),
    );
    expect(store.session, isNull);
  });

  test('account replacement prevents an old refresh commit', () async {
    final store = RecordingSessionStore(original);
    final coordinator = Sub2ApiSessionCoordinator(store);
    final snapshot = (await coordinator.snapshot())!;
    final gate = Completer<Sub2ApiSession>();

    final refresh = coordinator.refresh(snapshot, () => gate.future);
    await coordinator.replace(replacement);
    gate.complete(rotated);

    await expectLater(
      refresh,
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'auth.session_changed',
        ),
      ),
    );
    expect(store.session, same(replacement));
  });

  test('client close prevents an old refresh commit', () async {
    final store = RecordingSessionStore(original);
    final coordinator = Sub2ApiSessionCoordinator(store);
    final snapshot = (await coordinator.snapshot())!;
    final gate = Completer<Sub2ApiSession>();

    final refresh = coordinator.refresh(snapshot, () => gate.future);
    coordinator.close();
    gate.complete(rotated);

    await expectLater(refresh, throwsA(isA<Sub2ApiException>()));
    expect(store.session, same(original));
  });

  test('failed refresh releases the single-flight slot for a retry', () async {
    final store = RecordingSessionStore(original);
    final coordinator = Sub2ApiSessionCoordinator(store);
    final snapshot = (await coordinator.snapshot())!;
    var refreshCount = 0;

    await expectLater(
      coordinator.refresh(snapshot, () async {
        refreshCount++;
        throw const Sub2ApiException(
          kind: Sub2ApiFailureKind.network,
          code: 'network.unavailable',
          retryable: true,
        );
      }),
      throwsA(isA<Sub2ApiException>()),
    );

    final result = await coordinator.refresh(snapshot, () async {
      refreshCount++;
      return rotated;
    });

    expect(result, same(rotated));
    expect(refreshCount, 2);
    expect(store.session, same(rotated));
  });
}
