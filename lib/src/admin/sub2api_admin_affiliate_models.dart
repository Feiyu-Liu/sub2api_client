import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';

typedef Sub2ApiAdminAffiliateUserPage = Sub2ApiPage<Sub2ApiAdminAffiliateUser>;
typedef Sub2ApiAdminAffiliateInvitePage =
    Sub2ApiPage<Sub2ApiAdminAffiliateInviteRecord>;
typedef Sub2ApiAdminAffiliateRebatePage =
    Sub2ApiPage<Sub2ApiAdminAffiliateRebateRecord>;
typedef Sub2ApiAdminAffiliateTransferPage =
    Sub2ApiPage<Sub2ApiAdminAffiliateTransferRecord>;

enum Sub2ApiAdminAffiliateSortOrder { ascending, descending }

enum Sub2ApiAdminAffiliateRecordSort {
  inviter,
  invitee,
  affiliateCode,
  totalRebate,
  order,
  orderAmount,
  payAmount,
  rebateAmount,
  paymentType,
  orderStatus,
  user,
  amount,
  createdAt,
}

final class Sub2ApiAdminAffiliateUserListQuery {
  const Sub2ApiAdminAffiliateUserListQuery({
    this.page = 1,
    this.pageSize = 20,
    this.search,
  });

  final int page;
  final int pageSize;
  final String? search;
}

final class Sub2ApiAdminAffiliateRecordQuery {
  const Sub2ApiAdminAffiliateRecordQuery({
    this.page = 1,
    this.pageSize = 20,
    this.search,
    this.startAt,
    this.endAt,
    this.sortBy = Sub2ApiAdminAffiliateRecordSort.createdAt,
    this.sortOrder = Sub2ApiAdminAffiliateSortOrder.descending,
  });

  final int page;
  final int pageSize;
  final String? search;
  final DateTime? startAt;
  final DateTime? endAt;
  final Sub2ApiAdminAffiliateRecordSort sortBy;
  final Sub2ApiAdminAffiliateSortOrder sortOrder;
}

final class Sub2ApiAdminAffiliateUser {
  const Sub2ApiAdminAffiliateUser({
    required this.userId,
    required this.email,
    required this.username,
    required this.affiliateCode,
    required this.affiliateCodeCustom,
    required this.affiliateCount,
    this.rebateRatePercent,
  });

  final int userId;
  final String email;
  final String username;
  final String affiliateCode;
  final bool affiliateCodeCustom;
  final Sub2ApiDecimal? rebateRatePercent;
  final int affiliateCount;
}

final class Sub2ApiAdminAffiliateUserSummary {
  const Sub2ApiAdminAffiliateUserSummary({
    required this.id,
    required this.email,
    required this.username,
  });
  final int id;
  final String email;
  final String username;
}

final class Sub2ApiAdminAffiliateUserOverview {
  const Sub2ApiAdminAffiliateUserOverview({
    required this.userId,
    required this.email,
    required this.username,
    required this.affiliateCode,
    required this.rebateRatePercent,
    required this.invitedCount,
    required this.rebatedInviteeCount,
    required this.availableQuota,
    required this.historyQuota,
  });

  final int userId;
  final String email;
  final String username;
  final String affiliateCode;
  final Sub2ApiDecimal rebateRatePercent;
  final int invitedCount;
  final int rebatedInviteeCount;
  final Sub2ApiDecimal availableQuota;
  final Sub2ApiDecimal historyQuota;
}

final class Sub2ApiAdminAffiliateInviteRecord {
  const Sub2ApiAdminAffiliateInviteRecord({
    required this.inviterId,
    required this.inviterEmail,
    required this.inviterUsername,
    required this.inviteeId,
    required this.inviteeEmail,
    required this.inviteeUsername,
    required this.affiliateCode,
    required this.totalRebate,
    required this.createdAt,
  });

  final int inviterId;
  final String inviterEmail;
  final String inviterUsername;
  final int inviteeId;
  final String inviteeEmail;
  final String inviteeUsername;
  final String affiliateCode;
  final Sub2ApiDecimal totalRebate;
  final DateTime createdAt;
}

final class Sub2ApiAdminAffiliateRebateRecord {
  const Sub2ApiAdminAffiliateRebateRecord({
    required this.orderId,
    required this.outTradeNo,
    required this.inviterId,
    required this.inviterEmail,
    required this.inviterUsername,
    required this.inviteeId,
    required this.inviteeEmail,
    required this.inviteeUsername,
    required this.orderAmount,
    required this.payAmount,
    required this.rebateAmount,
    required this.paymentType,
    required this.orderStatus,
    required this.createdAt,
  });

  final int orderId;
  final String outTradeNo;
  final int inviterId;
  final String inviterEmail;
  final String inviterUsername;
  final int inviteeId;
  final String inviteeEmail;
  final String inviteeUsername;
  final Sub2ApiDecimal orderAmount;
  final Sub2ApiDecimal payAmount;
  final Sub2ApiDecimal rebateAmount;
  final String paymentType;
  final String orderStatus;
  final DateTime createdAt;
}

final class Sub2ApiAdminAffiliateTransferRecord {
  const Sub2ApiAdminAffiliateTransferRecord({
    required this.ledgerId,
    required this.userId,
    required this.userEmail,
    required this.username,
    required this.amount,
    required this.snapshotAvailable,
    required this.createdAt,
    this.balanceAfter,
    this.availableQuotaAfter,
    this.frozenQuotaAfter,
    this.historyQuotaAfter,
  });

  final int ledgerId;
  final int userId;
  final String userEmail;
  final String username;
  final Sub2ApiDecimal amount;
  final Sub2ApiDecimal? balanceAfter;
  final Sub2ApiDecimal? availableQuotaAfter;
  final Sub2ApiDecimal? frozenQuotaAfter;
  final Sub2ApiDecimal? historyQuotaAfter;
  final bool snapshotAvailable;
  final DateTime createdAt;
}

final class Sub2ApiAdminUpdateAffiliateUserRequest {
  const Sub2ApiAdminUpdateAffiliateUserRequest({
    this.affiliateCode,
    this.rebateRatePercent,
    this.clearRebateRate = false,
  });

  final String? affiliateCode;
  final Sub2ApiDecimal? rebateRatePercent;
  final bool clearRebateRate;
}

final class Sub2ApiAdminBatchSetAffiliateRateRequest {
  Sub2ApiAdminBatchSetAffiliateRateRequest({
    required List<int> userIds,
    this.rebateRatePercent,
    this.clear = false,
  }) : userIds = List.unmodifiable(userIds);

  final List<int> userIds;
  final Sub2ApiDecimal? rebateRatePercent;
  final bool clear;
}

final class Sub2ApiAdminAffiliateUserActionResult {
  const Sub2ApiAdminAffiliateUserActionResult({required this.userId});
  final int userId;
}

final class Sub2ApiAdminAffiliateBatchResult {
  const Sub2ApiAdminAffiliateBatchResult({required this.affected});
  final int affected;
}
