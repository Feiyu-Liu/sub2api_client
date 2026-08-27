import '../commerce/sub2api_commerce_models.dart';
import '../shared/models/sub2api_page.dart';

typedef Sub2ApiAdminSubscriptionPage = Sub2ApiPage<Sub2ApiAdminSubscription>;

final class Sub2ApiAdminSubscription {
  const Sub2ApiAdminSubscription({
    required this.subscription,
    required this.assignedAt,
    required this.notes,
    this.assignedBy,
    this.assignedByUser,
  });

  final Sub2ApiUserSubscription subscription;
  final int? assignedBy;
  final DateTime assignedAt;
  final String notes;
  final Sub2ApiAdminSubscriptionAssigner? assignedByUser;
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
