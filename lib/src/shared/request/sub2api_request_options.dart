import 'dart:async';

/// Cancellation token independent of Dio and Flutter.
final class Sub2ApiCancellationToken {
  Sub2ApiCancellationToken._(this._cancelled);

  final Completer<void> _cancelled;

  /// Whether cancellation has already been requested.
  bool get isCancelled => _cancelled.isCompleted;

  /// Completes exactly once when cancellation is requested.
  Future<void> get whenCancelled => _cancelled.future;
}

/// Owner used to cancel one or more operations sharing a token.
final class Sub2ApiCancellationController {
  Sub2ApiCancellationController() : _cancelled = Completer<void>() {
    token = Sub2ApiCancellationToken._(_cancelled);
  }

  final Completer<void> _cancelled;

  /// Token passed to package operations.
  late final Sub2ApiCancellationToken token;

  /// Requests cancellation. Repeated calls are harmless.
  void cancel() {
    if (!_cancelled.isCompleted) {
      _cancelled.complete();
    }
  }
}

/// Per-operation controls that remain stable across refresh and replay.
final class Sub2ApiRequestOptions {
  const Sub2ApiRequestOptions({this.cancellationToken, this.timeout});

  final Sub2ApiCancellationToken? cancellationToken;
  final Duration? timeout;
}
