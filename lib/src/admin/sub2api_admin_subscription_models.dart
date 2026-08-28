import '../commerce/sub2api_commerce_models.dart';
import '../shared/models/sub2api_page.dart';

typedef Sub2ApiAdminSubscriptionPage = Sub2ApiPage<Sub2ApiAdminSubscription>;

enum Sub2ApiAdminSubscriptionStatus { active, expired, suspended, revoked }

enum Sub2ApiAdminSubscriptionSortBy { createdAt, expiresAt, status }

enum Sub2ApiAdminSubscriptionSortOrder { ascending, descending }

final class Sub2ApiAdminSubscriptionListQuery {
  const Sub2ApiAdminSubscriptionListQuery({
    this.page = 1,
    this.pageSize = 20,
    this.userId,
    this.groupId,
    this.status,
    this.platform,
    this.sortBy = Sub2ApiAdminSubscriptionSortBy.createdAt,
    this.sortOrder = Sub2ApiAdminSubscriptionSortOrder.descending,
  });

  final int page;
  final int pageSize;
  final int? userId;
  final int? groupId;
  final Sub2ApiAdminSubscriptionStatus? status;
  final String? platform;
  final Sub2ApiAdminSubscriptionSortBy sortBy;
  final Sub2ApiAdminSubscriptionSortOrder sortOrder;
}

final class Sub2ApiAdminAssignSubscriptionRequest {
  const Sub2ApiAdminAssignSubscriptionRequest({
    required this.userId,
    required this.groupId,
    this.validityDays = 0,
    this.notes = '',
  });

  final int userId;
  final int groupId;
  final int validityDays;
  final String notes;
}

final class Sub2ApiAdminBulkAssignSubscriptionsRequest {
  Sub2ApiAdminBulkAssignSubscriptionsRequest({
    required List<int> userIds,
    required this.groupId,
    this.validityDays = 0,
    this.notes = '',
  }) : userIds = List.unmodifiable(userIds);

  final List<int> userIds;
  final int groupId;
  final int validityDays;
  final String notes;
}

final class Sub2ApiAdminAdjustSubscriptionRequest {
  const Sub2ApiAdminAdjustSubscriptionRequest({
    required this.idempotencyKey,
    required this.days,
  });

  final String idempotencyKey;
  final int days;
}

final class Sub2ApiAdminResetSubscriptionQuotaRequest {
  const Sub2ApiAdminResetSubscriptionQuotaRequest({
    this.daily = false,
    this.weekly = false,
    this.monthly = false,
  });

  final bool daily;
  final bool weekly;
  final bool monthly;
}

final class Sub2ApiAdminBulkAssignSubscriptionsResult {
  Sub2ApiAdminBulkAssignSubscriptionsResult({
    required this.successCount,
    required this.createdCount,
    required this.reusedCount,
    required this.failedCount,
    required List<Sub2ApiAdminSubscription> subscriptions,
    required List<String> errors,
    required Map<int, String> statuses,
  }) : subscriptions = List.unmodifiable(subscriptions),
       errors = List.unmodifiable(errors),
       statuses = Map.unmodifiable(statuses);

  final int successCount;
  final int createdCount;
  final int reusedCount;
  final int failedCount;
  final List<Sub2ApiAdminSubscription> subscriptions;
  final List<String> errors;
  final Map<int, String> statuses;
}

final class Sub2ApiAdminSubscriptionActionResult {
  const Sub2ApiAdminSubscriptionActionResult({required this.message});

  final String message;
}

final class Sub2ApiAdminSubscription {
  const Sub2ApiAdminSubscription({
    required this.subscription,
    required this.assignedAt,
    required this.notes,
    this.assignedBy,
    this.assignedByUser,
    this.user,
  });

  final Sub2ApiUserSubscription subscription;
  final int? assignedBy;
  final DateTime assignedAt;
  final String notes;
  final Sub2ApiAdminSubscriptionAssigner? assignedByUser;
  final Sub2ApiAdminSubscriptionUserSummary? user;
}

final class Sub2ApiAdminSubscriptionUserSummary {
  const Sub2ApiAdminSubscriptionUserSummary({
    required this.id,
    required this.email,
    required this.username,
    required this.role,
    required this.status,
  });

  final int id;
  final String email;
  final String username;
  final String role;
  final String status;
}

final class Sub2ApiAdminSubscriptionAssigner {
  const Sub2ApiAdminSubscriptionAssigner({
    required this.id,
    required this.email,
    required this.username,
    required this.role,
    required this.status,
  });

  final int id;
  final String email;
  final String username;
  final String role;
  final String status;
}
