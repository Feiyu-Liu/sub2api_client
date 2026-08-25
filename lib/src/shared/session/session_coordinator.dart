import 'dart:async';

import '../errors/sub2api_exception.dart';
import 'sub2api_session.dart';

final class Sub2ApiSessionSnapshot {
  const Sub2ApiSessionSnapshot({
    required this.generation,
    required this.session,
  });

  final int generation;
  final Sub2ApiSession session;
}

/// Serializes token-pair persistence and guards stale async commits.
final class Sub2ApiSessionCoordinator {
  Sub2ApiSessionCoordinator(this._store);

  final Sub2ApiSessionStore _store;
  final Map<String, Future<Sub2ApiSession>> _refreshes = {};

  bool _closed = false;
  int _generation = 0;
  bool _loaded = false;
  Future<void>? _loadFuture;
  Future<void> _mutationTail = Future<void>.value();
  Sub2ApiSession? _session;

  Future<Sub2ApiSessionSnapshot?> snapshot() async {
    _ensureOpen();
    await _load();
    final session = _session;
    return session == null
        ? null
        : Sub2ApiSessionSnapshot(generation: _generation, session: session);
  }

  bool isCurrent(Sub2ApiSessionSnapshot snapshot) =>
      !_closed &&
      snapshot.generation == _generation &&
      identical(snapshot.session, _session);

  Future<void> replace(Sub2ApiSession session) async {
    _ensureOpen();
    final generation = ++_generation;
    _loaded = true;
    await _enqueue(() async {
      if (_closed || generation != _generation) {
        return;
      }
      await _store.write(session);
      if (!_closed && generation == _generation) {
        _session = session;
      }
    });
  }

  Future<void> clear() async {
    _ensureOpen();
    final generation = ++_generation;
    _loaded = true;
    _session = null;
    await _enqueue(() async {
      if (_closed || generation != _generation) {
        return;
      }
      await _store.clear();
    });
  }

  Future<void> clearIfCurrent(Sub2ApiSessionSnapshot snapshot) async {
    if (!isCurrent(snapshot)) {
      return;
    }
    await clear();
  }

  Future<Sub2ApiSession> refresh(
    Sub2ApiSessionSnapshot snapshot,
    Future<Sub2ApiSession> Function() performRefresh,
  ) async {
    _ensureOpen();
    if (!isCurrent(snapshot)) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.unauthorized,
        code: 'auth.session_changed',
        retryable: false,
      );
    }
    final key = '${snapshot.session.scope}:${snapshot.generation}';
    final existing = _refreshes[key];
    if (existing != null) {
      return existing;
    }
    final future = _performRefresh(snapshot, performRefresh);
    _refreshes[key] = future;
    unawaited(
      future.then<void>(
        (_) {
          if (identical(_refreshes[key], future)) {
            _refreshes.remove(key);
          }
        },
        onError: (Object _, StackTrace _) {
          if (identical(_refreshes[key], future)) {
            _refreshes.remove(key);
          }
        },
      ),
    );
    return future;
  }

  void close() {
    if (_closed) {
      return;
    }
    _closed = true;
    _generation++;
    _session = null;
    _refreshes.clear();
  }

  Future<Sub2ApiSession> _performRefresh(
    Sub2ApiSessionSnapshot snapshot,
    Future<Sub2ApiSession> Function() performRefresh,
  ) async {
    final refreshed = await performRefresh();
    var committed = false;
    await _enqueue(() async {
      if (!isCurrent(snapshot)) {
        return;
      }
      await _store.write(refreshed);
      if (isCurrent(snapshot)) {
        _session = refreshed;
        committed = true;
      }
    });
    if (!committed) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.unauthorized,
        code: 'auth.session_changed',
        retryable: false,
      );
    }
    return refreshed;
  }

  Future<void> _load() {
    if (_loaded) {
      return Future<void>.value();
    }
    final existing = _loadFuture;
    if (existing != null) {
      return existing;
    }
    final generation = _generation;
    final future = () async {
      final stored = await _store.read();
      if (!_closed && generation == _generation) {
        _session = stored;
        _loaded = true;
      }
    }();
    _loadFuture = future;
    return future.whenComplete(() {
      if (identical(_loadFuture, future)) {
        _loadFuture = null;
      }
    });
  }

  Future<void> _enqueue(Future<void> Function() operation) {
    final result = _mutationTail.then((_) => operation());
    _mutationTail = result.catchError((Object _) {});
    return result;
  }

  void _ensureOpen() {
    if (_closed) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.unknown,
        code: 'client.closed',
        retryable: false,
      );
    }
  }
}
