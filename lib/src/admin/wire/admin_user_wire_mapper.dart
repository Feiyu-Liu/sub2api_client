import '../../commerce/sub2api_commerce_models.dart';
import '../../keys/internal/key_wire_dtos.dart';
import '../../keys/sub2api_key_models.dart';
import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_user_models.dart';
import 'admin_user_wire_dto.dart';

Sub2ApiAdminReplaceUserGroupResult mapAdminReplaceUserGroup(
  Object? data,
) => _map(() {
  final source = AdminReplaceUserGroupResultWireDto.fromJson(_requireMap(data));
  return Sub2ApiAdminReplaceUserGroupResult(migratedKeys: source.migratedKeys);
});

Sub2ApiAdminUserRpmStatus mapAdminUserRpmStatus(Object? data) => _map(() {
  final source = AdminUserRpmStatusWireDto.fromJson(_requireMap(data));
  return Sub2ApiAdminUserRpmStatus(
    userRpmUsed: source.userRpmUsed,
    userRpmLimit: source.userRpmLimit,
    perGroup: source.perGroup
        .map(
          (group) => Sub2ApiAdminUserGroupRpmStatus(
            groupId: group.groupId,
            groupName: group.groupName,
            used: group.used,
            limit: group.limit,
            source: group.source,
          ),
        )
        .toList(growable: false),
  );
});

Sub2ApiAdminAffectedUsersResult mapAdminAffectedUsers(Object? data) => _map(() {
  final source = AdminAffectedUsersWireDto.fromJson(_requireMap(data));
  return Sub2ApiAdminAffectedUsersResult(affected: source.affected);
});

Sub2ApiAdminUserPlatformQuotas mapAdminUserPlatformQuotas(Object? data) =>
    _map(() {
      final source = AdminUserPlatformQuotasWireDto.fromJson(_requireMap(data));
      return Sub2ApiAdminUserPlatformQuotas(
        quotas: source.platformQuotas
            .map(
              (quota) => Sub2ApiAdminUserPlatformQuota(
                platform: _platform(quota.platform),
                dailyUsageUsd: Sub2ApiDecimal.fromJson(quota.dailyUsageUsd),
                dailyLimitUsd: _decimal(quota.dailyLimitUsd),
                dailyWindowResetsAt: _dateTime(quota.dailyWindowResetsAt),
                dailyWindowStart: _dateTime(quota.dailyWindowStart),
                weeklyUsageUsd: Sub2ApiDecimal.fromJson(quota.weeklyUsageUsd),
                weeklyLimitUsd: _decimal(quota.weeklyLimitUsd),
                weeklyWindowResetsAt: _dateTime(quota.weeklyWindowResetsAt),
                weeklyWindowStart: _dateTime(quota.weeklyWindowStart),
                monthlyUsageUsd: Sub2ApiDecimal.fromJson(quota.monthlyUsageUsd),
                monthlyLimitUsd: _decimal(quota.monthlyLimitUsd),
                monthlyWindowResetsAt: _dateTime(quota.monthlyWindowResetsAt),
                monthlyWindowStart: _dateTime(quota.monthlyWindowStart),
              ),
            )
            .toList(growable: false),
      );
    });

List<Sub2ApiAdminUserAttributeValue> mapAdminUserAttributes(Object? data) =>
    _map(() {
      if (data is! List<Object?>) throw _invalidAdminUser;
      return data
          .map(
            (item) =>
                AdminUserAttributeValueWireDto.fromJson(_requireMap(item)),
          )
          .map(
            (value) => Sub2ApiAdminUserAttributeValue(
              id: value.id,
              userId: value.userId,
              attributeId: value.attributeId,
              value: value.value,
              createdAt: _requiredDateTime(value.createdAt),
              updatedAt: _requiredDateTime(value.updatedAt),
            ),
          )
          .toList(growable: false);
    });

Sub2ApiAdminUserPage mapAdminUserPage(Object? data) => _map(() {
  final source = AdminUserPageWireDto.fromJson(_requireMap(data));
  return Sub2ApiPage<Sub2ApiAdminUser>(
    items: source.items.map(_adminUser).toList(growable: false),
    page: source.page,
    pageSize: source.pageSize,
    total: source.total,
    pages: source.pages,
  );
});

Sub2ApiAdminUser mapAdminUser(Object? data) =>
    _map(() => _adminUser(AdminUserWireDto.fromJson(_requireMap(data))));

Sub2ApiAdminBoundIdentity mapAdminBoundIdentity(Object? data) => _map(() {
  final source = AdminBoundIdentityWireDto.fromJson(_requireMap(data));
  if (source.userId <= 0 ||
      source.providerType.isEmpty ||
      source.providerKey.isEmpty ||
      source.providerSubject.isEmpty) {
    throw _invalidAdminUser;
  }
  final channel = source.channel;
  return Sub2ApiAdminBoundIdentity(
    userId: source.userId,
    providerType: source.providerType,
    providerKey: source.providerKey,
    providerSubject: source.providerSubject,
    verifiedAt: source.verifiedAt?.toUtc(),
    issuer: source.issuer,
    metadata: _jsonObject(source.metadata),
    createdAt: source.createdAt.toUtc(),
    updatedAt: source.updatedAt.toUtc(),
    channel: channel == null
        ? null
        : Sub2ApiAdminBoundIdentityChannel(
            channel: channel.channel,
            channelAppId: channel.channelAppId,
            channelSubject: channel.channelSubject,
            metadata: _jsonObject(channel.metadata),
            createdAt: channel.createdAt.toUtc(),
            updatedAt: channel.updatedAt.toUtc(),
          ),
  );
});

Sub2ApiAdminDeleteUserResult mapAdminDeleteUser(Object? data) => _map(() {
  final source = AdminDeleteUserResultWireDto.fromJson(_requireMap(data));
  if (source.message.isEmpty) throw _invalidAdminUser;
  return Sub2ApiAdminDeleteUserResult(message: source.message);
});

Sub2ApiAdminUserApiKeyPage mapAdminUserApiKeyPage(Object? data) => _map(() {
  final source = ApiKeyPageWireDto.fromJson(_requireMap(data));
  return Sub2ApiPage<Sub2ApiKeyDetails>(
    items: source.items.map(_apiKey).toList(growable: false),
    page: source.page,
    pageSize: source.pageSize,
    total: source.total,
    pages: source.pages,
  );
});

Sub2ApiAdminUserUsage mapAdminUserUsage(Object? data) => _map(() {
  final source = AdminUserUsageWireDto.fromJson(_requireMap(data));
  if (source.period.isEmpty ||
      source.totalRequests < 0 ||
      source.totalTokens < 0) {
    throw _invalidAdminUser;
  }
  return Sub2ApiAdminUserUsage(
    period: source.period,
    totalRequests: source.totalRequests,
    totalCost: Sub2ApiDecimal.fromJson(source.totalCost),
    totalTokens: source.totalTokens,
    averageDurationMs: Sub2ApiDecimal.fromJson(source.avgDurationMs),
  );
});

Sub2ApiAdminBalanceHistoryPage mapAdminBalanceHistory(Object? data) => _map(() {
  final source = AdminBalanceHistoryPageWireDto.fromJson(_requireMap(data));
  return Sub2ApiAdminBalanceHistoryPage(
    items: source.items
        .map(
          (item) => Sub2ApiAdminBalanceHistoryRecord(
            id: item.id,
            code: item.code,
            type: item.type,
            value: Sub2ApiDecimal.fromJson(item.value),
            status: item.status,
            usedBy: item.usedBy,
            usedAt: item.usedAt?.toUtc(),
            createdAt: item.createdAt.toUtc(),
            expiresAt: item.expiresAt?.toUtc(),
            groupId: item.groupId,
            validityDays: item.validityDays,
            notes: item.notes,
            user: item.user == null
                ? null
                : Sub2ApiAdminBalanceHistoryUser(
                    id: item.user!.id,
                    email: item.user!.email,
                  ),
            group: item.group == null
                ? null
                : Sub2ApiAdminBalanceHistoryGroup(
                    id: item.group!.id,
                    name: item.group!.name,
                  ),
          ),
        )
        .toList(growable: false),
    page: source.page,
    pageSize: source.pageSize,
    total: source.total,
    pages: source.pages,
    totalRecharged: Sub2ApiDecimal.fromJson(source.totalRecharged),
  );
});

Sub2ApiAdminUser _adminUser(AdminUserWireDto source) {
  if (source.id <= 0 ||
      source.email.isEmpty ||
      source.role.isEmpty ||
      source.status.isEmpty ||
      source.concurrency < 0 ||
      source.rpmLimit < 0) {
    throw _invalidAdminUser;
  }
  final groupRates = <int, Sub2ApiDecimal>{};
  for (final entry
      in source.groupRates?.entries ?? const <MapEntry<String, num>>[]) {
    final groupId = int.tryParse(entry.key);
    if (groupId == null || groupId <= 0 || groupRates.containsKey(groupId)) {
      throw _invalidAdminUser;
    }
    groupRates[groupId] = Sub2ApiDecimal.fromJson(entry.value);
  }
  return Sub2ApiAdminUser(
    id: source.id,
    email: source.email,
    username: source.username,
    role: source.role,
    balance: Sub2ApiDecimal.fromJson(source.balance),
    frozenBalance: Sub2ApiDecimal.fromJson(source.frozenBalance),
    concurrency: source.concurrency,
    rpmLimit: source.rpmLimit,
    status: source.status,
    allowedGroups: source.allowedGroups == null
        ? null
        : List<int>.unmodifiable(source.allowedGroups!),
    balanceNotifyEnabled: source.balanceNotifyEnabled,
    balanceNotifyThresholdType: source.balanceNotifyThresholdType,
    balanceNotifyThreshold: _decimal(source.balanceNotifyThreshold),
    balanceNotifyExtraEmails: source.balanceNotifyExtraEmails
        .map((entry) => entry.toPublicModel())
        .toList(growable: false),
    totalRecharged: Sub2ApiDecimal.fromJson(source.totalRecharged),
    notes: source.notes,
    groupRates: Map<int, Sub2ApiDecimal>.unmodifiable(groupRates),
    apiKeys: (source.apiKeys ?? const <ApiKeyWireDto>[])
        .map(_apiKey)
        .toList(growable: false),
    subscriptions:
        (source.subscriptions ?? const <AdminUserSubscriptionWireDto>[])
            .map(
              (subscription) => Sub2ApiUserSubscription(
                id: subscription.id,
                userId: subscription.userId,
                groupId: subscription.groupId,
                startsAt: subscription.startsAt.toUtc(),
                expiresAt: subscription.expiresAt.toUtc(),
                status: subscription.status,
                dailyWindowStart: subscription.dailyWindowStart?.toUtc(),
                weeklyWindowStart: subscription.weeklyWindowStart?.toUtc(),
                monthlyWindowStart: subscription.monthlyWindowStart?.toUtc(),
                dailyUsageUsd: Sub2ApiDecimal.fromJson(
                  subscription.dailyUsageUsd,
                ),
                weeklyUsageUsd: Sub2ApiDecimal.fromJson(
                  subscription.weeklyUsageUsd,
                ),
                monthlyUsageUsd: Sub2ApiDecimal.fromJson(
                  subscription.monthlyUsageUsd,
                ),
                createdAt: subscription.createdAt.toUtc(),
                updatedAt: subscription.updatedAt.toUtc(),
                revokedAt: subscription.revokedAt?.toUtc(),
              ),
            )
            .toList(growable: false),
    createdAt: source.createdAt.toUtc(),
    updatedAt: source.updatedAt.toUtc(),
    currentConcurrency: source.currentConcurrency,
    lastActiveAt: source.lastActiveAt?.toUtc(),
    lastUsedAt: source.lastUsedAt?.toUtc(),
    deletedAt: source.deletedAt?.toUtc(),
  );
}

Sub2ApiKeyDetails _apiKey(ApiKeyWireDto source) => Sub2ApiKeyDetails(
  summary: Sub2ApiKeySummary(
    id: source.id,
    userId: source.userId,
    name: source.name,
    status: source.status,
    ipWhitelist: List<String>.unmodifiable(source.ipWhitelist),
    ipBlacklist: List<String>.unmodifiable(source.ipBlacklist),
    quota: Sub2ApiDecimal.fromJson(source.quota),
    quotaUsed: Sub2ApiDecimal.fromJson(source.quotaUsed),
    currentConcurrency: source.currentConcurrency,
    fiveHourWindow: _keyWindow(
      source.rateLimit5h,
      source.usage5h,
      source.window5hStart,
      source.reset5hAt,
    ),
    oneDayWindow: _keyWindow(
      source.rateLimit1d,
      source.usage1d,
      source.window1dStart,
      source.reset1dAt,
    ),
    sevenDayWindow: _keyWindow(
      source.rateLimit7d,
      source.usage7d,
      source.window7dStart,
      source.reset7dAt,
    ),
    createdAt: source.createdAt.toUtc(),
    updatedAt: source.updatedAt.toUtc(),
    groupId: source.groupId,
    expiresAt: source.expiresAt?.toUtc(),
    lastUsedAt: source.lastUsedAt?.toUtc(),
    lastUsedIp: source.lastUsedIp,
  ),
  secret: Sub2ApiApiKeySecret(source.key),
);

Sub2ApiKeyUsageWindow _keyWindow(
  num limit,
  num used,
  DateTime? startedAt,
  DateTime? resetsAt,
) => Sub2ApiKeyUsageWindow(
  limit: Sub2ApiDecimal.fromJson(limit),
  used: Sub2ApiDecimal.fromJson(used),
  startedAt: startedAt?.toUtc(),
  resetsAt: resetsAt?.toUtc(),
);

Sub2ApiAdminJsonObject _jsonObject(Map<String, Object?>? source) =>
    Sub2ApiAdminJsonObject(
      Map<String, Sub2ApiAdminJsonValue>.unmodifiable(
        (source ?? const <String, Object?>{}).map(
          (key, value) => MapEntry(key, _jsonValue(value)),
        ),
      ),
    );

Sub2ApiAdminJsonValue _jsonValue(Object? source) {
  if (source == null) return const Sub2ApiAdminJsonNull();
  if (source is bool) return Sub2ApiAdminJsonBool(source);
  if (source is num) {
    return Sub2ApiAdminJsonNumber(Sub2ApiDecimal.fromJson(source));
  }
  if (source is String) return Sub2ApiAdminJsonString(source);
  if (source is List) {
    return Sub2ApiAdminJsonArray(
      source.map(_jsonValue).toList(growable: false),
    );
  }
  if (source is Map) {
    return _jsonObject(_requireMap(source));
  }
  throw _invalidAdminUser;
}

Sub2ApiDecimal? _decimal(num? value) =>
    value == null ? null : Sub2ApiDecimal.fromJson(value);

DateTime? _dateTime(String? value) =>
    value == null ? null : _requiredDateTime(value);

DateTime _requiredDateTime(String value) {
  final parsed = DateTime.tryParse(value);
  if (parsed == null) throw _invalidAdminUser;
  return parsed.toUtc();
}

Sub2ApiAdminQuotaPlatform _platform(String value) => switch (value) {
  'anthropic' => Sub2ApiAdminQuotaPlatform.anthropic,
  'openai' => Sub2ApiAdminQuotaPlatform.openAi,
  'gemini' => Sub2ApiAdminQuotaPlatform.gemini,
  'antigravity' => Sub2ApiAdminQuotaPlatform.antigravity,
  'grok' => Sub2ApiAdminQuotaPlatform.grok,
  'kimi' => Sub2ApiAdminQuotaPlatform.kimi,
  'zhipu' => Sub2ApiAdminQuotaPlatform.zhipu,
  'deepseek' => Sub2ApiAdminQuotaPlatform.deepseek,
  _ => throw _invalidAdminUser,
};

Map<String, Object?> _requireMap(Object? value) {
  if (value is! Map) throw _invalidAdminUser;
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw _invalidAdminUser;
    result[entry.key as String] = entry.value;
  }
  return result;
}

T _map<T>(T Function() convert) {
  try {
    return convert();
  } on Sub2ApiException {
    rethrow;
  } on Object {
    throw _invalidAdminUser;
  }
}

const _invalidAdminUser = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_user_response',
  retryable: false,
);
