import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';
import 'sub2api_admin_account_models.dart';

typedef Sub2ApiAdminProxyPage = Sub2ApiPage<Sub2ApiAdminProxy>;

enum Sub2ApiAdminProxyProtocol { http, https, socks5, socks5h }

enum Sub2ApiAdminProxyStatus { active, inactive, expired }

enum Sub2ApiAdminProxyFallbackMode { none, proxy, direct }

enum Sub2ApiAdminProxyLatencyStatus { success, failed }

enum Sub2ApiAdminProxyQualityStatus { healthy, warn, challenge, failed }

enum Sub2ApiAdminProxySort {
  id,
  name,
  protocol,
  status,
  createdAt,
  expiry,
  accountCount,
}

final class Sub2ApiAdminProxyListQuery {
  const Sub2ApiAdminProxyListQuery({
    this.page,
    this.pageSize,
    this.protocol,
    this.status,
    this.search,
    this.sortBy = Sub2ApiAdminProxySort.id,
    this.sortDescending = true,
  });

  final int? page;
  final int? pageSize;
  final Sub2ApiAdminProxyProtocol? protocol;
  final Sub2ApiAdminProxyStatus? status;
  final String? search;
  final Sub2ApiAdminProxySort sortBy;
  final bool sortDescending;
}

final class Sub2ApiAdminProxy {
  const Sub2ApiAdminProxy({
    required this.id,
    required this.name,
    required this.protocol,
    required this.host,
    required this.port,
    required this.username,
    required this.password,
    required this.status,
    required this.expiresAt,
    required this.fallbackMode,
    required this.backupProxyId,
    required this.expiryWarnDays,
    required this.createdAt,
    required this.updatedAt,
    required this.accountCount,
    required this.latencyMs,
    required this.latencyStatus,
    required this.latencyMessage,
    required this.ipAddress,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.city,
    required this.qualityStatus,
    required this.qualityScore,
    required this.qualityGrade,
    required this.qualitySummary,
    required this.qualityCheckedAt,
  });

  final int id;
  final String name;
  final Sub2ApiAdminProxyProtocol protocol;
  final String host;
  final int port;
  final String username;
  final Sub2ApiAdminProxyPassword? password;
  final Sub2ApiAdminProxyStatus status;
  final DateTime? expiresAt;
  final Sub2ApiAdminProxyFallbackMode fallbackMode;
  final int? backupProxyId;
  final int expiryWarnDays;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? accountCount;
  final int? latencyMs;
  final Sub2ApiAdminProxyLatencyStatus? latencyStatus;
  final String latencyMessage;
  final String ipAddress;
  final String country;
  final String countryCode;
  final String region;
  final String city;
  final Sub2ApiAdminProxyQualityStatus? qualityStatus;
  final int? qualityScore;
  final String qualityGrade;
  final String qualitySummary;
  final DateTime? qualityCheckedAt;

  @override
  String toString() =>
      'Sub2ApiAdminProxy(id: $id, name: $name, protocol: $protocol, '
      'host: $host, port: $port, username: $username, password: <redacted>, '
      'status: $status, accountCount: $accountCount)';
}

final class Sub2ApiAdminProxyAccountSummary {
  const Sub2ApiAdminProxyAccountSummary({
    required this.id,
    required this.name,
    required this.platform,
    required this.type,
    required this.notes,
  });

  final int id;
  final String name;
  final Sub2ApiAdminAccountPlatform platform;
  final Sub2ApiAdminAccountType type;
  final String? notes;
}

final class Sub2ApiAdminProxyStats {
  const Sub2ApiAdminProxyStats({
    required this.totalAccounts,
    required this.activeAccounts,
    required this.totalRequests,
    required this.successRate,
    required this.averageLatency,
  });

  final int totalAccounts;
  final int activeAccounts;
  final int totalRequests;
  final Sub2ApiDecimal successRate;
  final Sub2ApiDecimal averageLatency;
}
