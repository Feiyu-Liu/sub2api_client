import '../errors/sub2api_exception.dart';

/// Immutable connection settings for a [Sub2ApiClient].
final class Sub2ApiConfiguration {
  Sub2ApiConfiguration({
    required Uri origin,
    this.allowInsecureHttp = false,
    this.connectTimeout = const Duration(seconds: 10),
    this.sendTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
    this.totalRequestTimeout = const Duration(seconds: 60),
  }) : origin = _validateOrigin(origin, allowInsecureHttp) {
    _validateTimeout(connectTimeout, 'connectTimeout');
    _validateTimeout(sendTimeout, 'sendTimeout');
    _validateTimeout(receiveTimeout, 'receiveTimeout');
    _validateTimeout(totalRequestTimeout, 'totalRequestTimeout');
  }

  /// Whether plain HTTP is allowed for a controlled development deployment.
  final bool allowInsecureHttp;

  /// Maximum time allowed to establish a connection.
  final Duration connectTimeout;

  /// Absolute server origin. Endpoint paths are resolved internally.
  final Uri origin;

  /// Maximum time allowed to receive an individual response.
  final Duration receiveTimeout;

  /// Maximum time allowed to send an individual request body.
  final Duration sendTimeout;

  /// End-to-end budget shared by the initial request, refresh, and replay.
  final Duration totalRequestTimeout;

  static Uri _validateOrigin(Uri origin, bool allowInsecureHttp) {
    final scheme = origin.scheme.toLowerCase();
    final secure = scheme == 'https';
    final insecureDevelopment = allowInsecureHttp && scheme == 'http';
    final rootPath = origin.path.isEmpty || origin.path == '/';
    if (!origin.isAbsolute ||
        origin.host.isEmpty ||
        (!secure && !insecureDevelopment) ||
        origin.userInfo.isNotEmpty ||
        !rootPath ||
        origin.hasQuery ||
        origin.hasFragment) {
      throw Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'configuration.invalid_origin',
        retryable: false,
      );
    }
    return origin.replace(
      scheme: scheme,
      path: '',
      query: null,
      fragment: null,
    );
  }

  static void _validateTimeout(Duration value, String field) {
    if (value <= Duration.zero) {
      throw Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'configuration.invalid_timeout.$field',
        retryable: false,
      );
    }
  }
}
