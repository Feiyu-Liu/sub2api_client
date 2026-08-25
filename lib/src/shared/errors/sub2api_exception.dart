/// Stable categories callers can use without depending on an HTTP library.
enum Sub2ApiFailureKind {
  network,
  timeout,
  cancelled,
  unauthorized,
  forbidden,
  validation,
  conflict,
  rateLimited,
  server,
  protocol,
  unknown,
}

/// The only exception type exposed by the package public API.
final class Sub2ApiException implements Exception {
  const Sub2ApiException({
    required this.kind,
    required this.code,
    required this.retryable,
    this.statusCode,
    this.traceId,
  });

  /// Stable machine-readable error code.
  final String code;

  /// Broad failure category.
  final Sub2ApiFailureKind kind;

  /// Whether retrying a repeatable read may be reasonable.
  final bool retryable;

  /// HTTP status when one was available.
  final int? statusCode;

  /// Non-sensitive server request identifier when provided.
  final String? traceId;

  @override
  String toString() =>
      'Sub2ApiException(kind: ${kind.name}, code: $code, '
      'retryable: $retryable, statusCode: $statusCode, traceId: $traceId)';
}
