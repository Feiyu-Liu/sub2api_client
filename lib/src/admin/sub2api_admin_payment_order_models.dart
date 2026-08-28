import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';

typedef Sub2ApiAdminPaymentOrderPage = Sub2ApiPage<Sub2ApiAdminPaymentOrder>;

final class Sub2ApiAdminPaymentOrderQuery {
  const Sub2ApiAdminPaymentOrderQuery({
    this.page = 1,
    this.pageSize = 20,
    this.userId,
    this.status,
    this.orderType,
    this.paymentType,
    this.keyword,
  });
  final int page;
  final int pageSize;
  final int? userId;
  final String? status;
  final String? orderType;
  final String? paymentType;
  final String? keyword;
}

final class Sub2ApiAdminPaymentOrder {
  const Sub2ApiAdminPaymentOrder({
    required this.id,
    required this.userId,
    required this.userEmail,
    required this.userName,
    required this.amount,
    required this.payAmount,
    required this.feeRate,
    required this.currency,
    required this.outTradeNo,
    required this.paymentType,
    required this.paymentTradeNo,
    required this.orderType,
    required this.status,
    required this.refundAmount,
    required this.forceRefund,
    required this.expiresAt,
    required this.clientIp,
    required this.srcHost,
    required this.createdAt,
    required this.updatedAt,
    this.userNotes,
    this.rechargeCode,
    this.payUrl,
    this.qrCode,
    this.qrCodeImage,
    this.planId,
    this.subscriptionGroupId,
    this.subscriptionDays,
    this.providerInstanceId,
    this.providerKey,
    this.refundReason,
    this.refundAt,
    this.refundRequestedAt,
    this.refundRequestReason,
    this.refundRequestedBy,
    this.paidAt,
    this.completedAt,
    this.failedAt,
    this.failedReason,
    this.srcUrl,
  });

  final int id;
  final int userId;
  final String userEmail;
  final String userName;
  final String? userNotes;
  final Sub2ApiDecimal amount;
  final Sub2ApiDecimal payAmount;
  final Sub2ApiDecimal feeRate;
  final String currency;
  final Sub2ApiRedeemCodeSecret? rechargeCode;
  final String outTradeNo;
  final String paymentType;
  final String paymentTradeNo;
  final Sub2ApiAdminPaymentCheckoutSecret? payUrl;
  final Sub2ApiAdminPaymentCheckoutSecret? qrCode;
  final Sub2ApiAdminPaymentCheckoutSecret? qrCodeImage;
  final String orderType;
  final int? planId;
  final int? subscriptionGroupId;
  final int? subscriptionDays;
  final String? providerInstanceId;
  final String? providerKey;
  final String status;
  final Sub2ApiDecimal refundAmount;
  final String? refundReason;
  final DateTime? refundAt;
  final bool forceRefund;
  final DateTime? refundRequestedAt;
  final String? refundRequestReason;
  final String? refundRequestedBy;
  final DateTime expiresAt;
  final DateTime? paidAt;
  final DateTime? completedAt;
  final DateTime? failedAt;
  final String? failedReason;
  final String clientIp;
  final String srcHost;
  final String? srcUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
}

final class Sub2ApiAdminPaymentAuditLog {
  const Sub2ApiAdminPaymentAuditLog({
    required this.id,
    required this.orderId,
    required this.action,
    required this.detail,
    required this.operatorName,
    required this.createdAt,
  });
  final int id;
  final String orderId;
  final String action;
  final Sub2ApiAdminPaymentAuditDetail detail;
  final String operatorName;
  final DateTime createdAt;
}

final class Sub2ApiAdminPaymentOrderDetail {
  Sub2ApiAdminPaymentOrderDetail({
    required this.order,
    required List<Sub2ApiAdminPaymentAuditLog> auditLogs,
  }) : auditLogs = List.unmodifiable(auditLogs);
  final Sub2ApiAdminPaymentOrder order;
  final List<Sub2ApiAdminPaymentAuditLog> auditLogs;
}

final class Sub2ApiAdminPaymentActionResult {
  const Sub2ApiAdminPaymentActionResult({required this.message});
  final String message;
}

final class Sub2ApiAdminProcessRefundRequest {
  const Sub2ApiAdminProcessRefundRequest({
    required this.amount,
    this.reason = '',
    this.force = false,
    this.deductBalance = false,
  });
  final Sub2ApiDecimal amount;
  final String reason;
  final bool force;
  final bool deductBalance;
}

final class Sub2ApiAdminPaymentRefundResult {
  const Sub2ApiAdminPaymentRefundResult({
    required this.success,
    required this.warning,
    required this.requireForce,
    required this.balanceDeducted,
    required this.subscriptionDaysDeducted,
  });
  final bool success;
  final String warning;
  final bool requireForce;
  final Sub2ApiDecimal balanceDeducted;
  final int subscriptionDaysDeducted;
}

final class Sub2ApiAdminPaymentDashboard {
  Sub2ApiAdminPaymentDashboard({
    required Map<String, Sub2ApiDecimal> todayAmount,
    required Map<String, Sub2ApiDecimal> totalAmount,
    required this.todayCount,
    required this.totalCount,
    required Map<String, Sub2ApiDecimal> averageAmount,
    required this.pendingOrders,
    required List<Sub2ApiAdminPaymentDailyStat> dailySeries,
    required List<Sub2ApiAdminPaymentMethodStat> paymentMethods,
    required Map<String, List<Sub2ApiAdminPaymentTopUser>> topUsers,
  }) : todayAmount = Map.unmodifiable(todayAmount),
       totalAmount = Map.unmodifiable(totalAmount),
       averageAmount = Map.unmodifiable(averageAmount),
       dailySeries = List.unmodifiable(dailySeries),
       paymentMethods = List.unmodifiable(paymentMethods),
       topUsers = Map.unmodifiable(
         topUsers.map(
           (key, value) => MapEntry(
             key,
             List<Sub2ApiAdminPaymentTopUser>.unmodifiable(value),
           ),
         ),
       );
  final Map<String, Sub2ApiDecimal> todayAmount;
  final Map<String, Sub2ApiDecimal> totalAmount;
  final int todayCount;
  final int totalCount;
  final Map<String, Sub2ApiDecimal> averageAmount;
  final int pendingOrders;
  final List<Sub2ApiAdminPaymentDailyStat> dailySeries;
  final List<Sub2ApiAdminPaymentMethodStat> paymentMethods;
  final Map<String, List<Sub2ApiAdminPaymentTopUser>> topUsers;
}

final class Sub2ApiAdminPaymentDailyStat {
  Sub2ApiAdminPaymentDailyStat({
    required this.date,
    required Map<String, Sub2ApiDecimal> amount,
    required this.count,
  }) : amount = Map.unmodifiable(amount);
  final DateTime date;
  final Map<String, Sub2ApiDecimal> amount;
  final int count;
}

final class Sub2ApiAdminPaymentMethodStat {
  Sub2ApiAdminPaymentMethodStat({
    required this.type,
    required Map<String, Sub2ApiDecimal> amount,
    required this.count,
  }) : amount = Map.unmodifiable(amount);
  final String type;
  final Map<String, Sub2ApiDecimal> amount;
  final int count;
}

final class Sub2ApiAdminPaymentTopUser {
  const Sub2ApiAdminPaymentTopUser({
    required this.userId,
    required this.email,
    required this.amount,
  });
  final int userId;
  final String email;
  final Sub2ApiDecimal amount;
}
