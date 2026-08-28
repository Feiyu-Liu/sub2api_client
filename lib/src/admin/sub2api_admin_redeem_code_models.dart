import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';

typedef Sub2ApiAdminRedeemCodePage = Sub2ApiPage<Sub2ApiAdminRedeemCode>;

enum Sub2ApiAdminRedeemCodeType {
  balance,
  concurrency,
  subscription,
  invitation,
  adminBalance,
  adminConcurrency,
}

enum Sub2ApiAdminRedeemCodeStatus { unused, used, expired, disabled }

enum Sub2ApiAdminRedeemCodeSortBy {
  id,
  code,
  type,
  value,
  status,
  usedAt,
  createdAt,
  expiresAt,
}

enum Sub2ApiAdminRedeemCodeSortOrder { ascending, descending }

final class Sub2ApiAdminRedeemCodeListQuery {
  const Sub2ApiAdminRedeemCodeListQuery({
    this.page = 1,
    this.pageSize = 20,
    this.type,
    this.status,
    this.search,
    this.sortBy = Sub2ApiAdminRedeemCodeSortBy.id,
    this.sortOrder = Sub2ApiAdminRedeemCodeSortOrder.descending,
  });

  final int page;
  final int pageSize;
  final Sub2ApiAdminRedeemCodeType? type;
  final Sub2ApiAdminRedeemCodeStatus? status;
  final String? search;
  final Sub2ApiAdminRedeemCodeSortBy sortBy;
  final Sub2ApiAdminRedeemCodeSortOrder sortOrder;
}

final class Sub2ApiAdminRedeemCodeExportQuery {
  const Sub2ApiAdminRedeemCodeExportQuery({
    this.type,
    this.status,
    this.search,
    this.sortBy = Sub2ApiAdminRedeemCodeSortBy.id,
    this.sortOrder = Sub2ApiAdminRedeemCodeSortOrder.descending,
  });

  final Sub2ApiAdminRedeemCodeType? type;
  final Sub2ApiAdminRedeemCodeStatus? status;
  final String? search;
  final Sub2ApiAdminRedeemCodeSortBy sortBy;
  final Sub2ApiAdminRedeemCodeSortOrder sortOrder;
}

final class Sub2ApiAdminRedeemUserSummary {
  const Sub2ApiAdminRedeemUserSummary({
    required this.id,
    required this.email,
    required this.username,
  });

  final int id;
  final String email;
  final String username;
}

final class Sub2ApiAdminRedeemGroupSummary {
  const Sub2ApiAdminRedeemGroupSummary({required this.id, required this.name});

  final int id;
  final String name;
}

final class Sub2ApiAdminRedeemCode {
  const Sub2ApiAdminRedeemCode({
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
  final Sub2ApiRedeemCodeSecret code;
  final Sub2ApiAdminRedeemCodeType type;
  final Sub2ApiDecimal value;
  final Sub2ApiAdminRedeemCodeStatus status;
  final int? usedBy;
  final DateTime? usedAt;
  final DateTime createdAt;
  final DateTime? expiresAt;
  final int? groupId;
  final int validityDays;
  final String notes;
  final Sub2ApiAdminRedeemUserSummary? user;
  final Sub2ApiAdminRedeemGroupSummary? group;
}

final class Sub2ApiAdminRedeemCodeStats {
  Sub2ApiAdminRedeemCodeStats({
    required this.totalCodes,
    required this.activeCodes,
    required this.usedCodes,
    required this.expiredCodes,
    required this.totalValueDistributed,
    required Map<String, int> byType,
  }) : byType = Map.unmodifiable(byType);

  final int totalCodes;
  final int activeCodes;
  final int usedCodes;
  final int expiredCodes;
  final Sub2ApiDecimal totalValueDistributed;
  final Map<String, int> byType;
}

final class Sub2ApiAdminGenerateRedeemCodesRequest {
  const Sub2ApiAdminGenerateRedeemCodesRequest({
    required this.idempotencyKey,
    required this.count,
    required this.type,
    required this.value,
    this.groupId,
    this.validityDays = 0,
    this.expiresAt,
    this.expiresInDays,
  });

  final String idempotencyKey;
  final int count;
  final Sub2ApiAdminRedeemCodeType type;
  final Sub2ApiDecimal value;
  final int? groupId;
  final int validityDays;
  final DateTime? expiresAt;
  final int? expiresInDays;
}

final class Sub2ApiAdminCreateAndRedeemRequest {
  const Sub2ApiAdminCreateAndRedeemRequest({
    required this.idempotencyKey,
    required this.code,
    this.type = Sub2ApiAdminRedeemCodeType.balance,
    required this.value,
    required this.userId,
    this.groupId,
    this.validityDays = 0,
    this.notes = '',
    this.expiresAt,
    this.expiresInDays,
  });

  final String idempotencyKey;
  final Sub2ApiRedeemCodeSecret code;
  final Sub2ApiAdminRedeemCodeType type;
  final Sub2ApiDecimal value;
  final int userId;
  final int? groupId;
  final int validityDays;
  final String notes;
  final DateTime? expiresAt;
  final int? expiresInDays;
}

final class Sub2ApiAdminBatchUpdateRedeemCodesRequest {
  Sub2ApiAdminBatchUpdateRedeemCodesRequest({
    required List<int> ids,
    this.status,
    this.expiresAt,
    this.clearExpiresAt = false,
    this.notes,
    this.groupId,
    this.clearGroupId = false,
  }) : ids = List.unmodifiable(ids);

  final List<int> ids;
  final Sub2ApiAdminRedeemCodeStatus? status;
  final DateTime? expiresAt;
  final bool clearExpiresAt;
  final String? notes;
  final int? groupId;
  final bool clearGroupId;
}

final class Sub2ApiAdminRedeemCodeActionResult {
  const Sub2ApiAdminRedeemCodeActionResult({required this.message});

  final String message;
}

final class Sub2ApiAdminRedeemCodeBatchResult {
  const Sub2ApiAdminRedeemCodeBatchResult({
    required this.affected,
    required this.message,
  });

  final int affected;
  final String message;
}
