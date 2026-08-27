import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/models/sub2api_decimal.dart';

part 'sub2api_admin_user_models.freezed.dart';

/// Operation applied by a batch concurrency update.
enum Sub2ApiAdminBatchConcurrencyMode { set, add }

/// Platform keys accepted by the fixed user-platform-quota contract.
enum Sub2ApiAdminQuotaPlatform {
  anthropic,
  openAi,
  gemini,
  antigravity,
  grok,
  kimi,
  zhipu,
  deepseek,
}

/// Usage window that can be reset by an administrator.
enum Sub2ApiAdminQuotaWindow { daily, weekly, monthly }

/// Request to replace one exclusive group grant and migrate matching keys.
@freezed
abstract class Sub2ApiAdminReplaceUserGroupRequest
    with _$Sub2ApiAdminReplaceUserGroupRequest {
  const factory Sub2ApiAdminReplaceUserGroupRequest({
    required int oldGroupId,
    required int newGroupId,
  }) = _Sub2ApiAdminReplaceUserGroupRequest;
}

/// Request to set or add concurrency for selected users or all users.
@freezed
abstract class Sub2ApiAdminBatchConcurrencyRequest
    with _$Sub2ApiAdminBatchConcurrencyRequest {
  const factory Sub2ApiAdminBatchConcurrencyRequest({
    @Default(<int>[]) List<int> userIds,
    @Default(false) bool all,
    required int concurrency,
    required Sub2ApiAdminBatchConcurrencyMode mode,
  }) = _Sub2ApiAdminBatchConcurrencyRequest;
}

/// Request to overwrite concurrency and/or RPM limits in one batch.
@freezed
abstract class Sub2ApiAdminBatchLimitsRequest
    with _$Sub2ApiAdminBatchLimitsRequest {
  const factory Sub2ApiAdminBatchLimitsRequest({
    @Default(<int>[]) List<int> userIds,
    @Default(false) bool all,
    int? concurrency,
    int? rpmLimit,
  }) = _Sub2ApiAdminBatchLimitsRequest;
}

/// One platform limit in a full replacement quota request.
@freezed
abstract class Sub2ApiAdminPlatformQuotaInput
    with _$Sub2ApiAdminPlatformQuotaInput {
  const factory Sub2ApiAdminPlatformQuotaInput({
    required Sub2ApiAdminQuotaPlatform platform,
    Sub2ApiDecimal? dailyLimitUsd,
    Sub2ApiDecimal? weeklyLimitUsd,
    Sub2ApiDecimal? monthlyLimitUsd,
  }) = _Sub2ApiAdminPlatformQuotaInput;
}

/// Full replacement of a user's platform quota configuration.
@freezed
abstract class Sub2ApiAdminUpdatePlatformQuotasRequest
    with _$Sub2ApiAdminUpdatePlatformQuotasRequest {
  const factory Sub2ApiAdminUpdatePlatformQuotasRequest({
    required List<Sub2ApiAdminPlatformQuotaInput> quotas,
  }) = _Sub2ApiAdminUpdatePlatformQuotasRequest;
}

/// Request to reset one usage window for one platform.
@freezed
abstract class Sub2ApiAdminResetPlatformQuotaRequest
    with _$Sub2ApiAdminResetPlatformQuotaRequest {
  const factory Sub2ApiAdminResetPlatformQuotaRequest({
    required Sub2ApiAdminQuotaPlatform platform,
    required Sub2ApiAdminQuotaWindow window,
  }) = _Sub2ApiAdminResetPlatformQuotaRequest;
}

/// Full replacement of custom attribute values for a user.
@freezed
abstract class Sub2ApiAdminUpdateUserAttributesRequest
    with _$Sub2ApiAdminUpdateUserAttributesRequest {
  const factory Sub2ApiAdminUpdateUserAttributesRequest({
    required Map<int, String> values,
  }) = _Sub2ApiAdminUpdateUserAttributesRequest;
}

/// Number of API keys migrated by a group replacement.
@freezed
abstract class Sub2ApiAdminReplaceUserGroupResult
    with _$Sub2ApiAdminReplaceUserGroupResult {
  const factory Sub2ApiAdminReplaceUserGroupResult({
    required int migratedKeys,
  }) = _Sub2ApiAdminReplaceUserGroupResult;
}

/// Current RPM state for one user/group pair.
@freezed
abstract class Sub2ApiAdminUserGroupRpmStatus
    with _$Sub2ApiAdminUserGroupRpmStatus {
  const factory Sub2ApiAdminUserGroupRpmStatus({
    required int groupId,
    required String groupName,
    required int used,
    required int limit,
    required String source,
  }) = _Sub2ApiAdminUserGroupRpmStatus;
}

/// Current per-minute RPM state for a user.
@freezed
abstract class Sub2ApiAdminUserRpmStatus with _$Sub2ApiAdminUserRpmStatus {
  const factory Sub2ApiAdminUserRpmStatus({
    required int userRpmUsed,
    required int userRpmLimit,
    required List<Sub2ApiAdminUserGroupRpmStatus> perGroup,
  }) = _Sub2ApiAdminUserRpmStatus;
}

/// Number of users changed by a batch operation.
@freezed
abstract class Sub2ApiAdminAffectedUsersResult
    with _$Sub2ApiAdminAffectedUsersResult {
  const factory Sub2ApiAdminAffectedUsersResult({required int affected}) =
      _Sub2ApiAdminAffectedUsersResult;
}

/// One platform's usage and limit windows in the Admin quota view.
@freezed
abstract class Sub2ApiAdminUserPlatformQuota
    with _$Sub2ApiAdminUserPlatformQuota {
  const factory Sub2ApiAdminUserPlatformQuota({
    required Sub2ApiAdminQuotaPlatform platform,
    required Sub2ApiDecimal dailyUsageUsd,
    Sub2ApiDecimal? dailyLimitUsd,
    DateTime? dailyWindowResetsAt,
    DateTime? dailyWindowStart,
    required Sub2ApiDecimal weeklyUsageUsd,
    Sub2ApiDecimal? weeklyLimitUsd,
    DateTime? weeklyWindowResetsAt,
    DateTime? weeklyWindowStart,
    required Sub2ApiDecimal monthlyUsageUsd,
    Sub2ApiDecimal? monthlyLimitUsd,
    DateTime? monthlyWindowResetsAt,
    DateTime? monthlyWindowStart,
  }) = _Sub2ApiAdminUserPlatformQuota;
}

/// Complete quota view returned for a user.
@freezed
abstract class Sub2ApiAdminUserPlatformQuotas
    with _$Sub2ApiAdminUserPlatformQuotas {
  const factory Sub2ApiAdminUserPlatformQuotas({
    required List<Sub2ApiAdminUserPlatformQuota> quotas,
  }) = _Sub2ApiAdminUserPlatformQuotas;
}

/// One persisted custom attribute value for a user.
@freezed
abstract class Sub2ApiAdminUserAttributeValue
    with _$Sub2ApiAdminUserAttributeValue {
  const factory Sub2ApiAdminUserAttributeValue({
    required int id,
    required int userId,
    required int attributeId,
    required String value,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Sub2ApiAdminUserAttributeValue;
}
