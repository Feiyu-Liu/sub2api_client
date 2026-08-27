import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
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
