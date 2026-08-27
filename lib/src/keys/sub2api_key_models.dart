import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';

part 'sub2api_key_models.freezed.dart';

/// A non-secret snapshot of an API key.
@freezed
abstract class Sub2ApiKeySummary with _$Sub2ApiKeySummary {
  /// Creates an immutable API key summary without its secret value.
  const factory Sub2ApiKeySummary({
    required int id,
    required int userId,
    required String name,
    required String status,
    required List<String> ipWhitelist,
    required List<String> ipBlacklist,
    required Sub2ApiDecimal quota,
    required Sub2ApiDecimal quotaUsed,
    required int currentConcurrency,
    required Sub2ApiKeyUsageWindow fiveHourWindow,
    required Sub2ApiKeyUsageWindow oneDayWindow,
    required Sub2ApiKeyUsageWindow sevenDayWindow,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? groupId,
    DateTime? expiresAt,
    DateTime? lastUsedAt,
    String? lastUsedIp,
  }) = _Sub2ApiKeySummary;
}

/// A USD consumption window attached to one API key.
@freezed
abstract class Sub2ApiKeyUsageWindow with _$Sub2ApiKeyUsageWindow {
  /// Creates a window with a limit, accumulated usage, and optional boundaries.
  const factory Sub2ApiKeyUsageWindow({
    required Sub2ApiDecimal limit,
    required Sub2ApiDecimal used,
    DateTime? startedAt,
    DateTime? resetsAt,
  }) = _Sub2ApiKeyUsageWindow;
}

/// An API key result that deliberately exposes its secret only for detail/create.
@freezed
abstract class Sub2ApiKeyDetails with _$Sub2ApiKeyDetails {
  /// Creates a key detail result with its explicitly requested secret.
  const factory Sub2ApiKeyDetails({
    required Sub2ApiKeySummary summary,
    required Sub2ApiApiKeySecret secret,
  }) = _Sub2ApiKeyDetails;
}

/// Query options for paginating API key summaries.
@freezed
abstract class Sub2ApiKeyListRequest with _$Sub2ApiKeyListRequest {
  /// Creates API key list filters accepted by the v0.1.183 endpoint.
  const factory Sub2ApiKeyListRequest({
    int? page,
    int? pageSize,
    String? sortBy,
    String? sortOrder,
    String? search,
    String? status,
    int? groupId,
  }) = _Sub2ApiKeyListRequest;
}

/// A page of key summaries whose wire secrets have been discarded.
typedef Sub2ApiKeyPage = Sub2ApiPage<Sub2ApiKeySummary>;

/// Fields for creating an API key.
@freezed
abstract class Sub2ApiCreateKeyRequest with _$Sub2ApiCreateKeyRequest {
  /// Creates an idempotent API key creation request.
  const factory Sub2ApiCreateKeyRequest({
    required String name,
    required String idempotencyKey,
    int? groupId,
    Sub2ApiApiKeySecret? customKey,
    List<String>? ipWhitelist,
    List<String>? ipBlacklist,
    Sub2ApiDecimal? quota,
    int? expiresInDays,
    Sub2ApiDecimal? rateLimit5h,
    Sub2ApiDecimal? rateLimit1d,
    Sub2ApiDecimal? rateLimit7d,
  }) = _Sub2ApiCreateKeyRequest;
}

/// Fields for updating an existing API key.
@freezed
abstract class Sub2ApiUpdateKeyRequest with _$Sub2ApiUpdateKeyRequest {
  /// Creates a partial API key update request.
  const factory Sub2ApiUpdateKeyRequest({
    String? name,
    int? groupId,
    String? status,
    List<String>? ipWhitelist,
    List<String>? ipBlacklist,
    Sub2ApiDecimal? quota,
    DateTime? expiresAt,
    @Default(false) bool clearExpiration,
    bool? resetQuota,
    Sub2ApiDecimal? rateLimit5h,
    Sub2ApiDecimal? rateLimit1d,
    Sub2ApiDecimal? rateLimit7d,
    bool? resetRateLimitUsage,
  }) = _Sub2ApiUpdateKeyRequest;
}
