import 'package:freezed_annotation/freezed_annotation.dart';

import '../commerce/sub2api_commerce_models.dart';
import '../keys/sub2api_key_models.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';
import '../shared/models/sub2api_user_account.dart';

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

/// User role accepted by Admin create and update operations.
enum Sub2ApiAdminUserRole { admin, user }

/// User lifecycle status accepted by Admin filters and updates.
enum Sub2ApiAdminUserStatus { active, disabled }

/// Balance mutation applied by the Admin user endpoint.
enum Sub2ApiAdminBalanceOperation { set, add, subtract }

/// Fixed period selector exposed by the Admin user-usage endpoint.
enum Sub2ApiAdminUserUsagePeriod { day, week, month }

/// Balance-history record filter accepted by the fixed contract.
enum Sub2ApiAdminBalanceHistoryType {
  balance,
  affiliateBalance,
  adminBalance,
  concurrency,
  adminConcurrency,
  subscription,
}

sealed class Sub2ApiAdminApiKeyGroupUpdate {
  const Sub2ApiAdminApiKeyGroupUpdate();

  const factory Sub2ApiAdminApiKeyGroupUpdate.unchanged() =
      Sub2ApiAdminApiKeyGroupUnchanged;
  const factory Sub2ApiAdminApiKeyGroupUpdate.clear() =
      Sub2ApiAdminApiKeyGroupClear;
  const factory Sub2ApiAdminApiKeyGroupUpdate.set(int groupId) =
      Sub2ApiAdminApiKeyGroupSet;
}

final class Sub2ApiAdminApiKeyGroupUnchanged
    extends Sub2ApiAdminApiKeyGroupUpdate {
  const Sub2ApiAdminApiKeyGroupUnchanged();
}

final class Sub2ApiAdminApiKeyGroupClear extends Sub2ApiAdminApiKeyGroupUpdate {
  const Sub2ApiAdminApiKeyGroupClear();
}

final class Sub2ApiAdminApiKeyGroupSet extends Sub2ApiAdminApiKeyGroupUpdate {
  const Sub2ApiAdminApiKeyGroupSet(this.groupId);

  final int groupId;
}

final class Sub2ApiAdminUpdateApiKeyRequest {
  const Sub2ApiAdminUpdateApiKeyRequest({
    this.group = const Sub2ApiAdminApiKeyGroupUpdate.unchanged(),
    this.resetRateLimitUsage = false,
  });

  final Sub2ApiAdminApiKeyGroupUpdate group;
  final bool resetRateLimitUsage;
}

final class Sub2ApiAdminUpdateApiKeyResult {
  const Sub2ApiAdminUpdateApiKeyResult({
    required this.apiKey,
    required this.autoGrantedGroupAccess,
    required this.grantedGroupId,
    required this.grantedGroupName,
  });

  final Sub2ApiKeyDetails apiKey;
  final bool autoGrantedGroupAccess;
  final int? grantedGroupId;
  final String grantedGroupName;
}

/// Typed recursive JSON value used for provider-owned identity metadata.
sealed class Sub2ApiAdminJsonValue {
  const Sub2ApiAdminJsonValue();

  /// Converts this typed value to the package-internal JSON wire shape.
  Object? toWire();
}

/// JSON null metadata value.
final class Sub2ApiAdminJsonNull extends Sub2ApiAdminJsonValue {
  const Sub2ApiAdminJsonNull();

  @override
  Object? toWire() => null;
}

/// JSON boolean metadata value.
final class Sub2ApiAdminJsonBool extends Sub2ApiAdminJsonValue {
  const Sub2ApiAdminJsonBool(this.value);

  final bool value;

  @override
  Object toWire() => value;
}

/// JSON number metadata value retained as an exact decimal.
final class Sub2ApiAdminJsonNumber extends Sub2ApiAdminJsonValue {
  const Sub2ApiAdminJsonNumber(this.value);

  final Sub2ApiDecimal value;

  @override
  Object toWire() => num.parse(value.toJson());
}

/// JSON string metadata value.
final class Sub2ApiAdminJsonString extends Sub2ApiAdminJsonValue {
  const Sub2ApiAdminJsonString(this.value);

  final String value;

  @override
  Object toWire() => value;
}

/// JSON array metadata value.
final class Sub2ApiAdminJsonArray extends Sub2ApiAdminJsonValue {
  const Sub2ApiAdminJsonArray(this.values);

  final List<Sub2ApiAdminJsonValue> values;

  @override
  Object toWire() => values.map((value) => value.toWire()).toList();
}

/// JSON object metadata value with recursively typed children.
final class Sub2ApiAdminJsonObject extends Sub2ApiAdminJsonValue {
  const Sub2ApiAdminJsonObject(this.values);

  final Map<String, Sub2ApiAdminJsonValue> values;

  @override
  Object toWire() => values.map((key, value) => MapEntry(key, value.toWire()));
}

/// Query for the paginated Admin user list.
final class Sub2ApiAdminUserListQuery {
  const Sub2ApiAdminUserListQuery({
    this.page,
    this.pageSize,
    this.status,
    this.role,
    this.search,
    this.groupName,
    this.apiKeyGroupId,
    this.attributes = const <int, String>{},
    this.includeSubscriptions,
    this.sortBy,
    this.sortOrder,
  });

  final int? page;
  final int? pageSize;
  final Sub2ApiAdminUserStatus? status;
  final Sub2ApiAdminUserRole? role;
  final String? search;
  final String? groupName;
  final int? apiKeyGroupId;
  final Map<int, String> attributes;
  final bool? includeSubscriptions;
  final String? sortBy;
  final String? sortOrder;
}

/// Request to create a user through the Admin management plane.
final class Sub2ApiAdminCreateUserRequest {
  const Sub2ApiAdminCreateUserRequest({
    required this.email,
    required this.password,
    this.username,
    this.notes,
    this.role,
    this.balance,
    this.concurrency = 0,
    this.rpmLimit = 0,
    this.allowedGroups = const <int>[],
  });

  final String email;
  final Sub2ApiPassword password;
  final String? username;
  final String? notes;
  final Sub2ApiAdminUserRole? role;
  final Sub2ApiDecimal? balance;
  final int concurrency;
  final int rpmLimit;
  final List<int> allowedGroups;
}

/// Partial Admin update for one user.
final class Sub2ApiAdminUpdateUserRequest {
  const Sub2ApiAdminUpdateUserRequest({
    this.email,
    this.password,
    this.username,
    this.notes,
    this.role,
    this.balance,
    this.concurrency,
    this.rpmLimit,
    this.status,
    this.allowedGroups,
    this.groupRates,
  });

  final String? email;
  final Sub2ApiPassword? password;
  final String? username;
  final String? notes;
  final Sub2ApiAdminUserRole? role;
  final Sub2ApiDecimal? balance;
  final int? concurrency;
  final int? rpmLimit;
  final Sub2ApiAdminUserStatus? status;
  final List<int>? allowedGroups;
  final Map<int, Sub2ApiDecimal?>? groupRates;
}

/// Idempotent Admin balance update.
final class Sub2ApiAdminUpdateBalanceRequest {
  const Sub2ApiAdminUpdateBalanceRequest({
    required this.amount,
    required this.operation,
    required this.idempotencyKey,
    this.notes = '',
  });

  final Sub2ApiDecimal amount;
  final Sub2ApiAdminBalanceOperation operation;
  final String idempotencyKey;
  final String notes;
}

/// Optional channel binding attached to an Admin identity bind request.
final class Sub2ApiAdminBindIdentityChannelRequest {
  const Sub2ApiAdminBindIdentityChannelRequest({
    required this.channel,
    required this.channelAppId,
    required this.channelSubject,
    this.metadata,
  });

  final String channel;
  final String channelAppId;
  final String channelSubject;
  final Sub2ApiAdminJsonObject? metadata;
}

/// Request to bind a canonical authentication identity to a user.
final class Sub2ApiAdminBindIdentityRequest {
  const Sub2ApiAdminBindIdentityRequest({
    required this.providerType,
    required this.providerKey,
    required this.providerSubject,
    this.issuer,
    this.metadata,
    this.channel,
  });

  final String providerType;
  final String providerKey;
  final String providerSubject;
  final String? issuer;
  final Sub2ApiAdminJsonObject? metadata;
  final Sub2ApiAdminBindIdentityChannelRequest? channel;
}

/// Channel identity returned after a manual Admin binding.
final class Sub2ApiAdminBoundIdentityChannel {
  const Sub2ApiAdminBoundIdentityChannel({
    required this.channel,
    required this.channelAppId,
    required this.channelSubject,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  final String channel;
  final String channelAppId;
  final String channelSubject;
  final Sub2ApiAdminJsonObject metadata;
  final DateTime createdAt;
  final DateTime updatedAt;
}

/// Canonical identity returned after a manual Admin binding.
final class Sub2ApiAdminBoundIdentity {
  const Sub2ApiAdminBoundIdentity({
    required this.userId,
    required this.providerType,
    required this.providerKey,
    required this.providerSubject,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
    this.verifiedAt,
    this.issuer,
    this.channel,
  });

  final int userId;
  final String providerType;
  final String providerKey;
  final String providerSubject;
  final DateTime? verifiedAt;
  final String? issuer;
  final Sub2ApiAdminJsonObject metadata;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Sub2ApiAdminBoundIdentityChannel? channel;
}

/// Admin-visible user snapshot, including internal notes and nested resources.
final class Sub2ApiAdminUser {
  const Sub2ApiAdminUser({
    required this.id,
    required this.email,
    required this.username,
    required this.role,
    required this.balance,
    required this.frozenBalance,
    required this.concurrency,
    required this.rpmLimit,
    required this.status,
    required this.allowedGroups,
    required this.balanceNotifyEnabled,
    required this.balanceNotifyThresholdType,
    required this.balanceNotifyThreshold,
    required this.balanceNotifyExtraEmails,
    required this.totalRecharged,
    required this.notes,
    required this.groupRates,
    required this.apiKeys,
    required this.subscriptions,
    required this.createdAt,
    required this.updatedAt,
    this.currentConcurrency,
    this.lastActiveAt,
    this.lastUsedAt,
    this.deletedAt,
  });

  final int id;
  final String email;
  final String username;
  final String role;
  final Sub2ApiDecimal balance;
  final Sub2ApiDecimal frozenBalance;
  final int concurrency;
  final int rpmLimit;
  final String status;
  final List<int>? allowedGroups;
  final bool balanceNotifyEnabled;
  final String balanceNotifyThresholdType;
  final Sub2ApiDecimal? balanceNotifyThreshold;
  final List<Sub2ApiNotifyEmailEntry> balanceNotifyExtraEmails;
  final Sub2ApiDecimal totalRecharged;
  final String notes;
  final Map<int, Sub2ApiDecimal> groupRates;
  final List<Sub2ApiKeyDetails> apiKeys;
  final List<Sub2ApiUserSubscription> subscriptions;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? currentConcurrency;
  final DateTime? lastActiveAt;
  final DateTime? lastUsedAt;
  final DateTime? deletedAt;
}

/// Page of Admin-visible users.
typedef Sub2ApiAdminUserPage = Sub2ApiPage<Sub2ApiAdminUser>;

/// Page of a user's API keys; each wire secret remains explicitly redacted.
typedef Sub2ApiAdminUserApiKeyPage = Sub2ApiPage<Sub2ApiKeyDetails>;

/// Aggregate usage returned for one user and fixed period.
final class Sub2ApiAdminUserUsage {
  const Sub2ApiAdminUserUsage({
    required this.period,
    required this.totalRequests,
    required this.totalCost,
    required this.totalTokens,
    required this.averageDurationMs,
  });

  final String period;
  final int totalRequests;
  final Sub2ApiDecimal totalCost;
  final int totalTokens;
  final Sub2ApiDecimal averageDurationMs;
}

/// Compact user relation embedded by a balance-history record.
final class Sub2ApiAdminBalanceHistoryUser {
  const Sub2ApiAdminBalanceHistoryUser({required this.id, required this.email});

  final int id;
  final String email;
}

/// Compact group relation embedded by a balance-history record.
final class Sub2ApiAdminBalanceHistoryGroup {
  const Sub2ApiAdminBalanceHistoryGroup({required this.id, required this.name});

  final int id;
  final String name;
}

/// One balance, concurrency, affiliate, or subscription history record.
final class Sub2ApiAdminBalanceHistoryRecord {
  const Sub2ApiAdminBalanceHistoryRecord({
    required this.id,
    required this.code,
    required this.type,
    required this.value,
    required this.status,
    required this.createdAt,
    required this.validityDays,
    required this.notes,
    this.usedBy,
    this.usedAt,
    this.expiresAt,
    this.groupId,
    this.user,
    this.group,
  });

  final int id;
  final String code;
  final String type;
  final Sub2ApiDecimal value;
  final String status;
  final int? usedBy;
  final DateTime? usedAt;
  final DateTime createdAt;
  final DateTime? expiresAt;
  final int? groupId;
  final int validityDays;
  final String notes;
  final Sub2ApiAdminBalanceHistoryUser? user;
  final Sub2ApiAdminBalanceHistoryGroup? group;
}

/// Paginated balance history with the user's all-time recharge total.
final class Sub2ApiAdminBalanceHistoryPage {
  const Sub2ApiAdminBalanceHistoryPage({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.total,
    required this.pages,
    required this.totalRecharged,
  });

  final List<Sub2ApiAdminBalanceHistoryRecord> items;
  final int page;
  final int pageSize;
  final int total;
  final int pages;
  final Sub2ApiDecimal totalRecharged;
}

/// Acknowledgement returned by Admin user deletion.
final class Sub2ApiAdminDeleteUserResult {
  const Sub2ApiAdminDeleteUserResult({required this.message});

  final String message;
}
