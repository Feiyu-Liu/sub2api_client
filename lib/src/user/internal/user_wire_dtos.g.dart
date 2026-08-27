// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_wire_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileWireDto _$UserProfileWireDtoFromJson(Map<String, dynamic> json) =>
    UserProfileWireDto(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      username: json['username'] as String,
      role: json['role'] as String,
      balance: json['balance'] as num,
      frozenBalance: json['frozen_balance'] as num,
      concurrency: (json['concurrency'] as num).toInt(),
      status: json['status'] as String,
      allowedGroups:
          (json['allowed_groups'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      balanceNotifyEnabled: json['balance_notify_enabled'] as bool,
      balanceNotifyThresholdType:
          json['balance_notify_threshold_type'] as String,
      balanceNotifyThreshold: json['balance_notify_threshold'] as num?,
      totalRecharged: json['total_recharged'] as num,
      rpmLimit: (json['rpm_limit'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      lastActiveAt: json['last_active_at'] == null
          ? null
          : DateTime.parse(json['last_active_at'] as String),
      avatarUrl: json['avatar_url'] as String?,
    );

AffiliateInviteeWireDto _$AffiliateInviteeWireDtoFromJson(
  Map<String, dynamic> json,
) => AffiliateInviteeWireDto(
  userId: (json['user_id'] as num).toInt(),
  email: json['email'] as String,
  username: json['username'] as String,
  totalRebate: json['total_rebate'] as num,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

AffiliateDetailWireDto _$AffiliateDetailWireDtoFromJson(
  Map<String, dynamic> json,
) => AffiliateDetailWireDto(
  userId: (json['user_id'] as num).toInt(),
  affCode: json['aff_code'] as String,
  affCount: (json['aff_count'] as num).toInt(),
  affQuota: json['aff_quota'] as num,
  affFrozenQuota: json['aff_frozen_quota'] as num,
  affHistoryQuota: json['aff_history_quota'] as num,
  effectiveRebateRatePercent: json['effective_rebate_rate_percent'] as num,
  invitees: (json['invitees'] as List<dynamic>)
      .map((e) => AffiliateInviteeWireDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  inviterId: (json['inviter_id'] as num?)?.toInt(),
);

AffiliateTransferWireDto _$AffiliateTransferWireDtoFromJson(
  Map<String, dynamic> json,
) => AffiliateTransferWireDto(
  transferredQuota: json['transferred_quota'] as num,
  balance: json['balance'] as num,
);
