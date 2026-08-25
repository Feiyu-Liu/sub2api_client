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
