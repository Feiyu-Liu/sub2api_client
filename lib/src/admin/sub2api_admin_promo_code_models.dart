import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';

enum Sub2ApiAdminPromoCodeStatus { active, disabled }

enum Sub2ApiAdminPromoCodeSortBy {
  id,
  code,
  bonusAmount,
  status,
  expiresAt,
  createdAt,
}

enum Sub2ApiAdminPromoCodeSortOrder { asc, desc }

final class Sub2ApiAdminPromoCodeRecord {
  const Sub2ApiAdminPromoCodeRecord({
    required this.id,
    required this.code,
    required this.bonusAmount,
    required this.maxUses,
    required this.usedCount,
    required this.status,
    required this.expiresAt,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  final int id;
  final Sub2ApiPromoCode code;
  final Sub2ApiDecimal bonusAmount;
  final int maxUses;
  final int usedCount;
  final Sub2ApiAdminPromoCodeStatus status;
  final DateTime? expiresAt;
  final String notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  String toString() =>
      'Sub2ApiAdminPromoCodeRecord(id: $id, code: <redacted>, '
      'bonusAmount: $bonusAmount, maxUses: $maxUses, usedCount: $usedCount, '
      'status: $status, expiresAt: $expiresAt, notes: $notes, '
      'createdAt: $createdAt, updatedAt: $updatedAt)';
}

typedef Sub2ApiAdminPromoCodePage = Sub2ApiPage<Sub2ApiAdminPromoCodeRecord>;

final class Sub2ApiAdminPromoCodeQuery {
  const Sub2ApiAdminPromoCodeQuery({
    this.page,
    this.pageSize,
    this.status,
    this.search,
    this.sortBy = Sub2ApiAdminPromoCodeSortBy.createdAt,
    this.sortOrder = Sub2ApiAdminPromoCodeSortOrder.desc,
  });
  final int? page;
  final int? pageSize;
  final Sub2ApiAdminPromoCodeStatus? status;
  final String? search;
  final Sub2ApiAdminPromoCodeSortBy sortBy;
  final Sub2ApiAdminPromoCodeSortOrder sortOrder;
}

final class Sub2ApiAdminCreatePromoCodeRequest {
  const Sub2ApiAdminCreatePromoCodeRequest({
    required this.bonusAmount,
    this.code,
    this.maxUses = 0,
    this.expiresAt,
    this.notes = '',
  });
  final Sub2ApiPromoCode? code;
  final Sub2ApiDecimal bonusAmount;
  final int maxUses;
  final DateTime? expiresAt;
  final String notes;
}

sealed class Sub2ApiAdminPromoExpirationUpdate {
  const Sub2ApiAdminPromoExpirationUpdate();
  const factory Sub2ApiAdminPromoExpirationUpdate.unchanged() =
      Sub2ApiAdminPromoExpirationUnchanged;
  const factory Sub2ApiAdminPromoExpirationUpdate.clear() =
      Sub2ApiAdminPromoExpirationClear;
  const factory Sub2ApiAdminPromoExpirationUpdate.set(DateTime value) =
      Sub2ApiAdminPromoExpirationSet;
}

final class Sub2ApiAdminPromoExpirationUnchanged
    extends Sub2ApiAdminPromoExpirationUpdate {
  const Sub2ApiAdminPromoExpirationUnchanged();
}

final class Sub2ApiAdminPromoExpirationClear
    extends Sub2ApiAdminPromoExpirationUpdate {
  const Sub2ApiAdminPromoExpirationClear();
}

final class Sub2ApiAdminPromoExpirationSet
    extends Sub2ApiAdminPromoExpirationUpdate {
  const Sub2ApiAdminPromoExpirationSet(this.value);
  final DateTime value;
}

final class Sub2ApiAdminUpdatePromoCodeRequest {
  const Sub2ApiAdminUpdatePromoCodeRequest({
    this.code,
    this.bonusAmount,
    this.maxUses,
    this.status,
    this.expiresAt = const Sub2ApiAdminPromoExpirationUpdate.unchanged(),
    this.notes,
  });
  final Sub2ApiPromoCode? code;
  final Sub2ApiDecimal? bonusAmount;
  final int? maxUses;
  final Sub2ApiAdminPromoCodeStatus? status;
  final Sub2ApiAdminPromoExpirationUpdate expiresAt;
  final String? notes;
}

final class Sub2ApiAdminPromoCodeUsageUser {
  const Sub2ApiAdminPromoCodeUsageUser({
    required this.id,
    required this.email,
    required this.username,
    required this.status,
  });
  final int id;
  final String email;
  final String username;
  final String status;
}

final class Sub2ApiAdminPromoCodeUsage {
  const Sub2ApiAdminPromoCodeUsage({
    required this.id,
    required this.promoCodeId,
    required this.userId,
    required this.bonusAmount,
    required this.usedAt,
    required this.user,
  });
  final int id;
  final int promoCodeId;
  final int userId;
  final Sub2ApiDecimal bonusAmount;
  final DateTime usedAt;
  final Sub2ApiAdminPromoCodeUsageUser? user;
}

typedef Sub2ApiAdminPromoCodeUsagePage =
    Sub2ApiPage<Sub2ApiAdminPromoCodeUsage>;

final class Sub2ApiAdminDeletePromoCodeResult {
  const Sub2ApiAdminDeletePromoCodeResult(this.message);
  final String message;
}
