// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_wire_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiKeyWireDto _$ApiKeyWireDtoFromJson(Map<String, dynamic> json) =>
    ApiKeyWireDto(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      key: json['key'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      ipWhitelist:
          (json['ip_whitelist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      ipBlacklist:
          (json['ip_blacklist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      quota: json['quota'] as num,
      quotaUsed: json['quota_used'] as num,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      currentConcurrency: (json['current_concurrency'] as num).toInt(),
      rateLimit5h: json['rate_limit_5h'] as num,
      rateLimit1d: json['rate_limit_1d'] as num,
      rateLimit7d: json['rate_limit_7d'] as num,
      usage5h: json['usage_5h'] as num,
      usage1d: json['usage_1d'] as num,
      usage7d: json['usage_7d'] as num,
      groupId: (json['group_id'] as num?)?.toInt(),
      lastUsedAt: json['last_used_at'] == null
          ? null
          : DateTime.parse(json['last_used_at'] as String),
      lastUsedIp: json['last_used_ip'] as String?,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      window5hStart: json['window_5h_start'] == null
          ? null
          : DateTime.parse(json['window_5h_start'] as String),
      window1dStart: json['window_1d_start'] == null
          ? null
          : DateTime.parse(json['window_1d_start'] as String),
      window7dStart: json['window_7d_start'] == null
          ? null
          : DateTime.parse(json['window_7d_start'] as String),
      reset5hAt: json['reset_5h_at'] == null
          ? null
          : DateTime.parse(json['reset_5h_at'] as String),
      reset1dAt: json['reset_1d_at'] == null
          ? null
          : DateTime.parse(json['reset_1d_at'] as String),
      reset7dAt: json['reset_7d_at'] == null
          ? null
          : DateTime.parse(json['reset_7d_at'] as String),
    );

ApiKeyPageWireDto _$ApiKeyPageWireDtoFromJson(Map<String, dynamic> json) =>
    ApiKeyPageWireDto(
      items: (json['items'] as List<dynamic>)
          .map((e) => ApiKeyWireDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
    );
