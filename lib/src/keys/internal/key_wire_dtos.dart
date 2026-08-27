import 'package:json_annotation/json_annotation.dart';

part 'key_wire_dtos.g.dart';

/// JSON payload used only at the fixed Sub2API v0.1.183 wire boundary.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class ApiKeyWireDto {
  const ApiKeyWireDto({
    required this.id,
    required this.userId,
    required this.key,
    required this.name,
    required this.status,
    required this.ipWhitelist,
    required this.ipBlacklist,
    required this.quota,
    required this.quotaUsed,
    required this.createdAt,
    required this.updatedAt,
    required this.currentConcurrency,
    required this.rateLimit5h,
    required this.rateLimit1d,
    required this.rateLimit7d,
    required this.usage5h,
    required this.usage1d,
    required this.usage7d,
    this.groupId,
    this.lastUsedAt,
    this.lastUsedIp,
    this.expiresAt,
    this.window5hStart,
    this.window1dStart,
    this.window7dStart,
    this.reset5hAt,
    this.reset1dAt,
    this.reset7dAt,
  });

  factory ApiKeyWireDto.fromJson(Map<String, Object?> json) =>
      _$ApiKeyWireDtoFromJson(json);

  final DateTime createdAt;
  final int currentConcurrency;
  final DateTime? expiresAt;
  final int? groupId;
  final int id;
  @JsonKey(defaultValue: <String>[])
  final List<String> ipBlacklist;
  @JsonKey(defaultValue: <String>[])
  final List<String> ipWhitelist;
  final String key;
  final DateTime? lastUsedAt;
  final String? lastUsedIp;
  final String name;
  final num quota;
  final num quotaUsed;
  @JsonKey(name: 'rate_limit_1d')
  final num rateLimit1d;
  @JsonKey(name: 'rate_limit_5h')
  final num rateLimit5h;
  @JsonKey(name: 'rate_limit_7d')
  final num rateLimit7d;
  @JsonKey(name: 'reset_1d_at')
  final DateTime? reset1dAt;
  @JsonKey(name: 'reset_5h_at')
  final DateTime? reset5hAt;
  @JsonKey(name: 'reset_7d_at')
  final DateTime? reset7dAt;
  final String status;
  final DateTime updatedAt;
  @JsonKey(name: 'usage_1d')
  final num usage1d;
  @JsonKey(name: 'usage_5h')
  final num usage5h;
  @JsonKey(name: 'usage_7d')
  final num usage7d;
  final int userId;
  @JsonKey(name: 'window_1d_start')
  final DateTime? window1dStart;
  @JsonKey(name: 'window_5h_start')
  final DateTime? window5hStart;
  @JsonKey(name: 'window_7d_start')
  final DateTime? window7dStart;
}

/// JSON payload used only at the fixed Sub2API v0.1.183 wire boundary.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class ApiKeyPageWireDto {
  const ApiKeyPageWireDto({
    required this.items,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.pages,
  });

  factory ApiKeyPageWireDto.fromJson(Map<String, Object?> json) =>
      _$ApiKeyPageWireDtoFromJson(json);

  final List<ApiKeyWireDto> items;
  final int page;
  final int pageSize;
  final int pages;
  final int total;
}
