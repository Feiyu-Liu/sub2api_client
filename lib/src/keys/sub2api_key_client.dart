import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'internal/key_wire_dtos.dart';
import 'internal/key_wire_service.dart';
import 'sub2api_key_models.dart';

/// Provides authenticated API key operations supported by v0.1.
abstract interface class Sub2ApiKeyClient {
  /// Creates a key using an explicit idempotency key without feature retry.
  Future<Sub2ApiKeyDetails> create(
    Sub2ApiCreateKeyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Deletes a key owned by the authenticated user.
  Future<void> delete(int id, {Sub2ApiRequestOptions? requestOptions});

  /// Reads one key and explicitly returns its secret.
  Future<Sub2ApiKeyDetails> getById(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Lists key summaries without retaining the wire secret.
  Future<Sub2ApiKeyPage> list({
    Sub2ApiKeyListRequest request = const Sub2ApiKeyListRequest(),
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Updates one key and discards the wire secret in its response.
  Future<Sub2ApiKeySummary> update(
    int id,
    Sub2ApiUpdateKeyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal Key implementation.
///
/// This factory is deliberately not exported from `sub2api_client.dart`.
Sub2ApiKeyClient createSub2ApiKeyClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
}) => _Sub2ApiKeyClient(dio: dio, requestExecutor: requestExecutor);

final class _Sub2ApiKeyClient implements Sub2ApiKeyClient {
  /// Creates an API key feature client backed by [dio] and [requestExecutor].
  _Sub2ApiKeyClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
  }) : _requestExecutor = requestExecutor,
       _service = ApiKeyWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final ApiKeyWireService _service;

  /// Creates a key using the caller-provided idempotency key.
  ///
  /// This method does not add a network retry policy. Any authenticated replay
  /// remains solely the shared session executor's responsibility.
  @override
  Future<Sub2ApiKeyDetails> create(
    Sub2ApiCreateKeyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    return _requestExecutor.protectedNonReplayableRequest<Sub2ApiKeyDetails>(
      send: (cancelToken, options, authorization) => _asObjectResponse(
        _service.create(
          _createRequestBody(request),
          request.idempotencyKey,
          cancelToken,
          options,
          authorization,
        ),
      ),
      decode: _decodeDetails,
      requestOptions: requestOptions,
    );
  }

  /// Deletes a key owned by the authenticated user.
  ///
  /// Deletion is deliberately non-replayable: an authentication refresh does
  /// not automatically issue the delete operation a second time.
  @override
  Future<void> delete(int id, {Sub2ApiRequestOptions? requestOptions}) {
    return _requestExecutor.protectedNonReplayableRequest<void>(
      send: (cancelToken, options, authorization) => _asObjectResponse(
        _service.delete(id, cancelToken, options, authorization),
      ),
      decode: (_) {},
      requestOptions: requestOptions,
    );
  }

  /// Reads one key and explicitly returns its secret.
  @override
  Future<Sub2ApiKeyDetails> getById(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    return _requestExecutor.protectedRequest<Sub2ApiKeyDetails>(
      send: (cancelToken, options, authorization) => _asObjectResponse(
        _service.getById(id, cancelToken, options, authorization),
      ),
      decode: _decodeDetails,
      requestOptions: requestOptions,
    );
  }

  /// Lists key summaries and always discards the wire secret.
  @override
  Future<Sub2ApiKeyPage> list({
    Sub2ApiKeyListRequest request = const Sub2ApiKeyListRequest(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    return _requestExecutor.protectedRequest<Sub2ApiKeyPage>(
      send: (cancelToken, options, authorization) => _asObjectResponse(
        _service.list(
          request.page,
          request.pageSize,
          request.sortBy,
          request.sortOrder,
          request.search,
          request.status,
          request.groupId,
          cancelToken,
          options,
          authorization,
        ),
      ),
      decode: _decodePage,
      requestOptions: requestOptions,
    );
  }

  /// Updates one key and discards the wire secret in its response.
  @override
  Future<Sub2ApiKeySummary> update(
    int id,
    Sub2ApiUpdateKeyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    return _requestExecutor.protectedRequest<Sub2ApiKeySummary>(
      send: (cancelToken, options, authorization) => _asObjectResponse(
        _service.update(
          id,
          _updateRequestBody(request),
          cancelToken,
          options,
          authorization,
        ),
      ),
      decode: _decodeSummary,
      requestOptions: requestOptions,
    );
  }

  static Future<HttpResponse<Object?>> _asObjectResponse(
    Future<HttpResponse<Map<String, Object?>>> response,
  ) async {
    final resolved = await response;
    return HttpResponse<Object?>(resolved.data, resolved.response);
  }

  static Map<String, Object?> _createRequestBody(
    Sub2ApiCreateKeyRequest request,
  ) {
    return <String, Object?>{
      'name': request.name,
      if (request.groupId != null) 'group_id': request.groupId,
      if (request.customKey != null) 'custom_key': request.customKey!.reveal(),
      if (request.ipWhitelist != null) 'ip_whitelist': request.ipWhitelist,
      if (request.ipBlacklist != null) 'ip_blacklist': request.ipBlacklist,
      if (request.quota != null) 'quota': num.parse(request.quota!.toJson()),
      if (request.expiresInDays != null)
        'expires_in_days': request.expiresInDays,
      if (request.rateLimit5h != null)
        'rate_limit_5h': num.parse(request.rateLimit5h!.toJson()),
      if (request.rateLimit1d != null)
        'rate_limit_1d': num.parse(request.rateLimit1d!.toJson()),
      if (request.rateLimit7d != null)
        'rate_limit_7d': num.parse(request.rateLimit7d!.toJson()),
    };
  }

  static Sub2ApiKeyDetails _decodeDetails(Object? data) {
    final wire = _decodeKey(data);
    return Sub2ApiKeyDetails(
      summary: _toSummary(wire),
      secret: Sub2ApiApiKeySecret(wire.key),
    );
  }

  static Sub2ApiKeySummary _decodeSummary(Object? data) =>
      _toSummary(_decodeKey(data));

  static Sub2ApiKeyPage _decodePage(Object? data) {
    try {
      if (data is! Map<String, Object?>) {
        throw const Sub2ApiException(
          kind: Sub2ApiFailureKind.protocol,
          code: 'protocol.invalid_key_page',
          retryable: false,
        );
      }
      final page = ApiKeyPageWireDto.fromJson(data);
      return Sub2ApiPage<Sub2ApiKeySummary>(
        items: List<Sub2ApiKeySummary>.unmodifiable(page.items.map(_toSummary)),
        page: page.page,
        pageSize: page.pageSize,
        total: page.total,
        pages: page.pages,
      );
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_key_page',
        retryable: false,
      );
    }
  }

  static ApiKeyWireDto _decodeKey(Object? data) {
    try {
      if (data is! Map<String, Object?>) {
        throw const Sub2ApiException(
          kind: Sub2ApiFailureKind.protocol,
          code: 'protocol.invalid_key',
          retryable: false,
        );
      }
      return ApiKeyWireDto.fromJson(data);
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_key',
        retryable: false,
      );
    }
  }

  static Sub2ApiKeySummary _toSummary(ApiKeyWireDto wire) {
    return Sub2ApiKeySummary(
      id: wire.id,
      userId: wire.userId,
      name: wire.name,
      status: wire.status,
      ipWhitelist: List<String>.unmodifiable(wire.ipWhitelist),
      ipBlacklist: List<String>.unmodifiable(wire.ipBlacklist),
      quota: Sub2ApiDecimal.fromJson(wire.quota),
      quotaUsed: Sub2ApiDecimal.fromJson(wire.quotaUsed),
      currentConcurrency: wire.currentConcurrency,
      fiveHourWindow: _toWindow(
        limit: wire.rateLimit5h,
        used: wire.usage5h,
        startedAt: wire.window5hStart,
        resetsAt: wire.reset5hAt,
      ),
      oneDayWindow: _toWindow(
        limit: wire.rateLimit1d,
        used: wire.usage1d,
        startedAt: wire.window1dStart,
        resetsAt: wire.reset1dAt,
      ),
      sevenDayWindow: _toWindow(
        limit: wire.rateLimit7d,
        used: wire.usage7d,
        startedAt: wire.window7dStart,
        resetsAt: wire.reset7dAt,
      ),
      createdAt: wire.createdAt,
      updatedAt: wire.updatedAt,
      groupId: wire.groupId,
      expiresAt: wire.expiresAt,
      lastUsedAt: wire.lastUsedAt,
      lastUsedIp: wire.lastUsedIp,
    );
  }

  static Sub2ApiKeyUsageWindow _toWindow({
    required Object? limit,
    required Object? used,
    required DateTime? startedAt,
    required DateTime? resetsAt,
  }) {
    return Sub2ApiKeyUsageWindow(
      limit: Sub2ApiDecimal.fromJson(limit),
      used: Sub2ApiDecimal.fromJson(used),
      startedAt: startedAt,
      resetsAt: resetsAt,
    );
  }

  static Map<String, Object?> _updateRequestBody(
    Sub2ApiUpdateKeyRequest request,
  ) {
    if (request.clearExpiration && request.expiresAt != null) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'keys.expires_at_conflict',
        retryable: false,
      );
    }
    return <String, Object?>{
      if (request.name != null) 'name': request.name,
      if (request.groupId != null) 'group_id': request.groupId,
      if (request.status != null) 'status': request.status,
      if (request.ipWhitelist != null) 'ip_whitelist': request.ipWhitelist,
      if (request.ipBlacklist != null) 'ip_blacklist': request.ipBlacklist,
      if (request.quota != null) 'quota': num.parse(request.quota!.toJson()),
      if (request.expiresAt != null)
        'expires_at': request.expiresAt!.toUtc().toIso8601String(),
      if (request.clearExpiration) 'expires_at': '',
      if (request.resetQuota != null) 'reset_quota': request.resetQuota,
      if (request.rateLimit5h != null)
        'rate_limit_5h': num.parse(request.rateLimit5h!.toJson()),
      if (request.rateLimit1d != null)
        'rate_limit_1d': num.parse(request.rateLimit1d!.toJson()),
      if (request.rateLimit7d != null)
        'rate_limit_7d': num.parse(request.rateLimit7d!.toJson()),
      if (request.resetRateLimitUsage != null)
        'reset_rate_limit_usage': request.resetRateLimitUsage,
    };
  }
}
