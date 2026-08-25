import '../models/sensitive_value.dart';

/// Persistable authenticated session for one server/account scope.
final class Sub2ApiSession {
  const Sub2ApiSession({
    required this.accessToken,
    required this.scope,
    this.refreshToken,
    this.expiresAt,
  });

  final Sub2ApiAccessToken accessToken;
  final DateTime? expiresAt;
  final Sub2ApiRefreshToken? refreshToken;
  final String scope;

  bool get isRefreshable => refreshToken != null;

  @override
  String toString() =>
      'Sub2ApiSession(accessToken: <redacted>, refreshToken: '
      '${refreshToken == null ? 'none' : '<redacted>'}, scope: $scope, '
      'expiresAt: $expiresAt)';
}

/// App-provided secure persistence seam.
abstract interface class Sub2ApiSessionStore {
  /// Atomically clears the current token pair.
  Future<void> clear();

  /// Reads the current token pair atomically.
  Future<Sub2ApiSession?> read();

  /// Atomically replaces the entire token pair.
  Future<void> write(Sub2ApiSession session);
}

/// In-memory store intended for tests, examples, and ephemeral processes only.
final class Sub2ApiMemorySessionStore implements Sub2ApiSessionStore {
  Sub2ApiSession? _session;

  @override
  Future<void> clear() async {
    _session = null;
  }

  @override
  Future<Sub2ApiSession?> read() async => _session;

  @override
  Future<void> write(Sub2ApiSession session) async {
    _session = session;
  }
}
