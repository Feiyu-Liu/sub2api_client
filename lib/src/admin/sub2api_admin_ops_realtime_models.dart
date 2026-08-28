import '../shared/models/sub2api_decimal.dart';
import 'sub2api_admin_ops_dashboard_models.dart';

final class Sub2ApiAdminOpsRealtimeFilter {
  const Sub2ApiAdminOpsRealtimeFilter({this.platform, this.groupId});
  final String? platform;
  final int? groupId;
}

enum Sub2ApiAdminOpsRealtimeWindow {
  oneMinute,
  fiveMinutes,
  thirtyMinutes,
  oneHour,
}

final class Sub2ApiAdminOpsRealtimeTrafficQuery {
  const Sub2ApiAdminOpsRealtimeTrafficQuery({
    this.window = Sub2ApiAdminOpsRealtimeWindow.oneMinute,
    this.platform,
    this.groupId,
  });
  final Sub2ApiAdminOpsRealtimeWindow window;
  final String? platform;
  final int? groupId;
}

final class Sub2ApiAdminOpsPlatformConcurrency {
  const Sub2ApiAdminOpsPlatformConcurrency({
    required this.platform,
    required this.currentInUse,
    required this.maxCapacity,
    required this.loadPercentage,
    required this.waitingInQueue,
  });
  final String platform;
  final int currentInUse;
  final int maxCapacity;
  final Sub2ApiDecimal loadPercentage;
  final int waitingInQueue;
}

final class Sub2ApiAdminOpsGroupConcurrency {
  const Sub2ApiAdminOpsGroupConcurrency({
    required this.groupId,
    required this.groupName,
    required this.platform,
    required this.currentInUse,
    required this.maxCapacity,
    required this.loadPercentage,
    required this.waitingInQueue,
  });
  final int groupId;
  final String groupName;
  final String platform;
  final int currentInUse;
  final int maxCapacity;
  final Sub2ApiDecimal loadPercentage;
  final int waitingInQueue;
}

final class Sub2ApiAdminOpsAccountConcurrency {
  const Sub2ApiAdminOpsAccountConcurrency({
    required this.accountId,
    required this.accountName,
    required this.platform,
    required this.groupId,
    required this.groupName,
    required this.currentInUse,
    required this.maxCapacity,
    required this.loadPercentage,
    required this.waitingInQueue,
  });
  final int accountId;
  final String accountName;
  final String platform;
  final int groupId;
  final String groupName;
  final int currentInUse;
  final int maxCapacity;
  final Sub2ApiDecimal loadPercentage;
  final int waitingInQueue;
}

final class Sub2ApiAdminOpsUserConcurrency {
  const Sub2ApiAdminOpsUserConcurrency({
    required this.userId,
    required this.userEmail,
    required this.username,
    required this.currentInUse,
    required this.maxCapacity,
    required this.loadPercentage,
    required this.waitingInQueue,
  });
  final int userId;
  final String userEmail;
  final String username;
  final int currentInUse;
  final int maxCapacity;
  final Sub2ApiDecimal loadPercentage;
  final int waitingInQueue;
}

final class Sub2ApiAdminOpsConcurrencySnapshot {
  Sub2ApiAdminOpsConcurrencySnapshot({
    required this.enabled,
    required Map<String, Sub2ApiAdminOpsPlatformConcurrency> platforms,
    required Map<int, Sub2ApiAdminOpsGroupConcurrency> groups,
    required Map<int, Sub2ApiAdminOpsAccountConcurrency> accounts,
    required this.timestamp,
  }) : platforms = Map.unmodifiable(platforms),
       groups = Map.unmodifiable(groups),
       accounts = Map.unmodifiable(accounts);
  final bool enabled;
  final Map<String, Sub2ApiAdminOpsPlatformConcurrency> platforms;
  final Map<int, Sub2ApiAdminOpsGroupConcurrency> groups;
  final Map<int, Sub2ApiAdminOpsAccountConcurrency> accounts;
  final DateTime timestamp;
}

final class Sub2ApiAdminOpsUserConcurrencySnapshot {
  Sub2ApiAdminOpsUserConcurrencySnapshot({
    required this.enabled,
    required Map<int, Sub2ApiAdminOpsUserConcurrency> users,
    required this.timestamp,
  }) : users = Map.unmodifiable(users);
  final bool enabled;
  final Map<int, Sub2ApiAdminOpsUserConcurrency> users;
  final DateTime timestamp;
}

final class Sub2ApiAdminOpsPlatformAvailability {
  const Sub2ApiAdminOpsPlatformAvailability({
    required this.platform,
    required this.totalAccounts,
    required this.availableCount,
    required this.rateLimitCount,
    required this.errorCount,
  });
  final String platform;
  final int totalAccounts;
  final int availableCount;
  final int rateLimitCount;
  final int errorCount;
}

final class Sub2ApiAdminOpsGroupAvailability {
  const Sub2ApiAdminOpsGroupAvailability({
    required this.groupId,
    required this.groupName,
    required this.platform,
    required this.totalAccounts,
    required this.availableCount,
    required this.rateLimitCount,
    required this.errorCount,
  });
  final int groupId;
  final String groupName;
  final String platform;
  final int totalAccounts;
  final int availableCount;
  final int rateLimitCount;
  final int errorCount;
}

final class Sub2ApiAdminOpsAccountAvailability {
  const Sub2ApiAdminOpsAccountAvailability({
    required this.accountId,
    required this.accountName,
    required this.platform,
    required this.groupId,
    required this.groupName,
    required this.status,
    required this.isAvailable,
    required this.isRateLimited,
    required this.isOverloaded,
    required this.hasError,
    this.rateLimitResetAt,
    this.rateLimitRemainingSeconds,
    this.overloadUntil,
    this.overloadRemainingSeconds,
    required this.errorMessage,
    this.tempUnschedulableUntil,
  });
  final int accountId;
  final String accountName;
  final String platform;
  final int groupId;
  final String groupName;
  final String status;
  final bool isAvailable;
  final bool isRateLimited;
  final bool isOverloaded;
  final bool hasError;
  final DateTime? rateLimitResetAt;
  final int? rateLimitRemainingSeconds;
  final DateTime? overloadUntil;
  final int? overloadRemainingSeconds;
  final String errorMessage;
  final DateTime? tempUnschedulableUntil;
}

final class Sub2ApiAdminOpsAvailabilitySnapshot {
  Sub2ApiAdminOpsAvailabilitySnapshot({
    required this.enabled,
    required Map<String, Sub2ApiAdminOpsPlatformAvailability> platforms,
    required Map<int, Sub2ApiAdminOpsGroupAvailability> groups,
    required Map<int, Sub2ApiAdminOpsAccountAvailability> accounts,
    required this.timestamp,
  }) : platforms = Map.unmodifiable(platforms),
       groups = Map.unmodifiable(groups),
       accounts = Map.unmodifiable(accounts);
  final bool enabled;
  final Map<String, Sub2ApiAdminOpsPlatformAvailability> platforms;
  final Map<int, Sub2ApiAdminOpsGroupAvailability> groups;
  final Map<int, Sub2ApiAdminOpsAccountAvailability> accounts;
  final DateTime timestamp;
}

final class Sub2ApiAdminOpsRealtimeTraffic {
  const Sub2ApiAdminOpsRealtimeTraffic({
    required this.enabled,
    required this.window,
    required this.startAt,
    required this.endAt,
    required this.platform,
    this.groupId,
    required this.qps,
    required this.tps,
    required this.timestamp,
  });
  final bool enabled;
  final String window;
  final DateTime startAt;
  final DateTime endAt;
  final String platform;
  final int? groupId;
  final Sub2ApiAdminOpsRateSummary qps;
  final Sub2ApiAdminOpsRateSummary tps;
  final DateTime timestamp;
}
