import 'package:json_annotation/json_annotation.dart';

part 'user_wire_dtos.g.dart';

/// JSON payload used only at the fixed Sub2API v0.1.183 wire boundary.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class UserProfileWireDto {
  const UserProfileWireDto({
    required this.id,
    required this.email,
    required this.username,
    required this.role,
    required this.balance,
    required this.frozenBalance,
    required this.concurrency,
    required this.status,
    required this.allowedGroups,
    required this.balanceNotifyEnabled,
    required this.balanceNotifyThresholdType,
    required this.balanceNotifyThreshold,
    required this.totalRecharged,
    required this.rpmLimit,
    required this.createdAt,
    required this.updatedAt,
    this.lastActiveAt,
    this.avatarUrl,
  });

  factory UserProfileWireDto.fromJson(Map<String, Object?> json) =>
      _$UserProfileWireDtoFromJson(json);

  @JsonKey(defaultValue: <int>[])
  final List<int> allowedGroups;
  final num balance;
  final bool balanceNotifyEnabled;
  final num? balanceNotifyThreshold;
  final String balanceNotifyThresholdType;
  final num frozenBalance;
  final int concurrency;
  final DateTime createdAt;
  final String email;
  final int id;
  final DateTime? lastActiveAt;
  final String role;
  final int rpmLimit;
  final String status;
  final num totalRecharged;
  final DateTime updatedAt;
  final String username;
  final String? avatarUrl;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class AffiliateInviteeWireDto {
  const AffiliateInviteeWireDto({
    required this.userId,
    required this.email,
    required this.username,
    required this.totalRebate,
    this.createdAt,
  });

  factory AffiliateInviteeWireDto.fromJson(Map<String, Object?> json) =>
      _$AffiliateInviteeWireDtoFromJson(json);

  final int userId;
  final String email;
  final String username;
  final DateTime? createdAt;
  final num totalRebate;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class AffiliateDetailWireDto {
  const AffiliateDetailWireDto({
    required this.userId,
    required this.affCode,
    required this.affCount,
    required this.affQuota,
    required this.affFrozenQuota,
    required this.affHistoryQuota,
    required this.effectiveRebateRatePercent,
    required this.invitees,
    this.inviterId,
  });

  factory AffiliateDetailWireDto.fromJson(Map<String, Object?> json) =>
      _$AffiliateDetailWireDtoFromJson(json);

  final int userId;
  final String affCode;
  final int? inviterId;
  final int affCount;
  final num affQuota;
  final num affFrozenQuota;
  final num affHistoryQuota;
  final num effectiveRebateRatePercent;
  final List<AffiliateInviteeWireDto> invitees;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class AffiliateTransferWireDto {
  const AffiliateTransferWireDto({
    required this.transferredQuota,
    required this.balance,
  });

  factory AffiliateTransferWireDto.fromJson(Map<String, Object?> json) =>
      _$AffiliateTransferWireDtoFromJson(json);

  final num transferredQuota;
  final num balance;
}
