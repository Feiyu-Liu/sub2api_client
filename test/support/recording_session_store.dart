import 'dart:async';

import 'package:sub2api_client/src/shared/session/sub2api_session.dart';

final class RecordingSessionStore implements Sub2ApiSessionStore {
  RecordingSessionStore([this.session]);

  Completer<void>? writeGate;
  Completer<void>? writeStarted;
  int clearCount = 0;
  int readCount = 0;
  int writeCount = 0;
  Sub2ApiSession? session;

  @override
  Future<void> clear() async {
    clearCount++;
    session = null;
  }

  @override
  Future<Sub2ApiSession?> read() async {
    readCount++;
    return session;
  }

  @override
  Future<void> write(Sub2ApiSession value) async {
    writeCount++;
    final started = writeStarted;
    if (started != null && !started.isCompleted) {
      started.complete();
    }
    final gate = writeGate;
    if (gate != null) {
      await gate.future;
    }
    session = value;
  }
}
