import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';

enum Sub2ApiAdminAnnouncementStatus { draft, active, archived }

enum Sub2ApiAdminAnnouncementNotifyMode { silent, popup }

enum Sub2ApiAdminAnnouncementBalanceOperator { gt, gte, lt, lte, eq }

enum Sub2ApiAdminAnnouncementSortOrder { asc, desc }

enum Sub2ApiAdminAnnouncementSortBy {
  createdAt,
  title,
  status,
  startsAt,
  endsAt,
}

enum Sub2ApiAdminAnnouncementReadSortBy {
  email,
  username,
  balance,
  eligible,
  readAt,
}

sealed class Sub2ApiAdminAnnouncementCondition {
  const Sub2ApiAdminAnnouncementCondition();
}

final class Sub2ApiAdminAnnouncementSubscriptionCondition
    extends Sub2ApiAdminAnnouncementCondition {
  Sub2ApiAdminAnnouncementSubscriptionCondition(List<int> groupIds)
    : groupIds = List.unmodifiable(groupIds);
  final List<int> groupIds;
}

final class Sub2ApiAdminAnnouncementBalanceCondition
    extends Sub2ApiAdminAnnouncementCondition {
  const Sub2ApiAdminAnnouncementBalanceCondition({
    required this.operator,
    required this.value,
  });
  final Sub2ApiAdminAnnouncementBalanceOperator operator;
  final Sub2ApiDecimal value;
}

final class Sub2ApiAdminAnnouncementConditionGroup {
  Sub2ApiAdminAnnouncementConditionGroup(
    List<Sub2ApiAdminAnnouncementCondition> allOf,
  ) : allOf = List.unmodifiable(allOf);
  final List<Sub2ApiAdminAnnouncementCondition> allOf;
}

final class Sub2ApiAdminAnnouncementTargeting {
  Sub2ApiAdminAnnouncementTargeting({
    List<Sub2ApiAdminAnnouncementConditionGroup> anyOf =
        const <Sub2ApiAdminAnnouncementConditionGroup>[],
  }) : anyOf = List.unmodifiable(anyOf);
  final List<Sub2ApiAdminAnnouncementConditionGroup> anyOf;
}

final class Sub2ApiAdminAnnouncement {
  const Sub2ApiAdminAnnouncement({
    required this.id,
    required this.title,
    required this.content,
    required this.status,
    required this.notifyMode,
    required this.targeting,
    required this.startsAt,
    required this.endsAt,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });
  final int id;
  final String title;
  final String content;
  final Sub2ApiAdminAnnouncementStatus status;
  final Sub2ApiAdminAnnouncementNotifyMode notifyMode;
  final Sub2ApiAdminAnnouncementTargeting targeting;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final int? createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
}

typedef Sub2ApiAdminAnnouncementPage = Sub2ApiPage<Sub2ApiAdminAnnouncement>;

final class Sub2ApiAdminAnnouncementQuery {
  const Sub2ApiAdminAnnouncementQuery({
    this.page,
    this.pageSize,
    this.status,
    this.search,
    this.sortBy = Sub2ApiAdminAnnouncementSortBy.createdAt,
    this.sortOrder = Sub2ApiAdminAnnouncementSortOrder.desc,
  });
  final int? page;
  final int? pageSize;
  final Sub2ApiAdminAnnouncementStatus? status;
  final String? search;
  final Sub2ApiAdminAnnouncementSortBy sortBy;
  final Sub2ApiAdminAnnouncementSortOrder sortOrder;
}

final class Sub2ApiAdminCreateAnnouncementRequest {
  Sub2ApiAdminCreateAnnouncementRequest({
    required this.title,
    required this.content,
    this.status = Sub2ApiAdminAnnouncementStatus.draft,
    this.notifyMode = Sub2ApiAdminAnnouncementNotifyMode.silent,
    Sub2ApiAdminAnnouncementTargeting? targeting,
    this.startsAt,
    this.endsAt,
  }) : targeting = targeting ?? Sub2ApiAdminAnnouncementTargeting();
  final String title;
  final String content;
  final Sub2ApiAdminAnnouncementStatus status;
  final Sub2ApiAdminAnnouncementNotifyMode notifyMode;
  final Sub2ApiAdminAnnouncementTargeting targeting;
  final DateTime? startsAt;
  final DateTime? endsAt;
}

sealed class Sub2ApiAdminAnnouncementTimeUpdate {
  const Sub2ApiAdminAnnouncementTimeUpdate();
  const factory Sub2ApiAdminAnnouncementTimeUpdate.unchanged() =
      Sub2ApiAdminAnnouncementTimeUnchanged;
  const factory Sub2ApiAdminAnnouncementTimeUpdate.clear() =
      Sub2ApiAdminAnnouncementTimeClear;
  const factory Sub2ApiAdminAnnouncementTimeUpdate.set(DateTime value) =
      Sub2ApiAdminAnnouncementTimeSet;
}

final class Sub2ApiAdminAnnouncementTimeUnchanged
    extends Sub2ApiAdminAnnouncementTimeUpdate {
  const Sub2ApiAdminAnnouncementTimeUnchanged();
}

final class Sub2ApiAdminAnnouncementTimeClear
    extends Sub2ApiAdminAnnouncementTimeUpdate {
  const Sub2ApiAdminAnnouncementTimeClear();
}

final class Sub2ApiAdminAnnouncementTimeSet
    extends Sub2ApiAdminAnnouncementTimeUpdate {
  const Sub2ApiAdminAnnouncementTimeSet(this.value);
  final DateTime value;
}

final class Sub2ApiAdminUpdateAnnouncementRequest {
  const Sub2ApiAdminUpdateAnnouncementRequest({
    this.title,
    this.content,
    this.status,
    this.notifyMode,
    this.targeting,
    this.startsAt = const Sub2ApiAdminAnnouncementTimeUpdate.unchanged(),
    this.endsAt = const Sub2ApiAdminAnnouncementTimeUpdate.unchanged(),
  });
  final String? title;
  final String? content;
  final Sub2ApiAdminAnnouncementStatus? status;
  final Sub2ApiAdminAnnouncementNotifyMode? notifyMode;
  final Sub2ApiAdminAnnouncementTargeting? targeting;
  final Sub2ApiAdminAnnouncementTimeUpdate startsAt;
  final Sub2ApiAdminAnnouncementTimeUpdate endsAt;
}

final class Sub2ApiAdminAnnouncementReadStatus {
  const Sub2ApiAdminAnnouncementReadStatus({
    required this.userId,
    required this.email,
    required this.username,
    required this.balance,
    required this.eligible,
    required this.readAt,
  });
  final int userId;
  final String email;
  final String username;
  final Sub2ApiDecimal balance;
  final bool eligible;
  final DateTime? readAt;
}

typedef Sub2ApiAdminAnnouncementReadStatusPage =
    Sub2ApiPage<Sub2ApiAdminAnnouncementReadStatus>;

final class Sub2ApiAdminAnnouncementReadStatusQuery {
  const Sub2ApiAdminAnnouncementReadStatusQuery({
    this.page,
    this.pageSize,
    this.search,
    this.sortBy = Sub2ApiAdminAnnouncementReadSortBy.email,
    this.sortOrder = Sub2ApiAdminAnnouncementSortOrder.asc,
  });
  final int? page;
  final int? pageSize;
  final String? search;
  final Sub2ApiAdminAnnouncementReadSortBy sortBy;
  final Sub2ApiAdminAnnouncementSortOrder sortOrder;
}

final class Sub2ApiAdminDeleteAnnouncementResult {
  const Sub2ApiAdminDeleteAnnouncementResult(this.message);
  final String message;
}
