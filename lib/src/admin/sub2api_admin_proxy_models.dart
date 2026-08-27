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

final class Sub2ApiAdminCreateProxyRequest {
  const Sub2ApiAdminCreateProxyRequest({
    required this.idempotencyKey,
    required this.name,
    required this.protocol,
    required this.host,
    required this.port,
    this.username,
    this.password,
    this.expiresAt,
    this.fallbackMode = Sub2ApiAdminProxyFallbackMode.none,
    this.backupProxyId,
    this.expiryWarnDays = 0,
  });

  final String idempotencyKey;
  final String name;
  final Sub2ApiAdminProxyProtocol protocol;
  final String host;
  final int port;
  final String? username;
  final Sub2ApiAdminProxyPassword? password;
  final DateTime? expiresAt;
  final Sub2ApiAdminProxyFallbackMode fallbackMode;
  final int? backupProxyId;
  final int expiryWarnDays;

  @override
  String toString() =>
      'Sub2ApiAdminCreateProxyRequest(idempotencyKey: '
      '${idempotencyKey.isEmpty ? '<empty>' : '<provided>'}, name: $name, '
      'protocol: $protocol, host: $host, port: $port, username: $username, '
      'password: <redacted>, expiresAt: $expiresAt, fallbackMode: '
      '$fallbackMode, backupProxyId: $backupProxyId, expiryWarnDays: '
      '$expiryWarnDays)';
}

/// Proxy update with explicit replacement state for server-replaced fields.
final class Sub2ApiAdminUpdateProxyRequest {
  const Sub2ApiAdminUpdateProxyRequest({
    required this.expiresAt,
    required this.fallbackMode,
    required this.backupProxyId,
    required this.expiryWarnDays,
    this.name,
    this.protocol,
    this.host,
    this.port,
    this.username,
    this.password,
    this.status,
  });

  final String? name;
  final Sub2ApiAdminProxyProtocol? protocol;
  final String? host;
  final int? port;
  final String? username;
  final Sub2ApiAdminProxyPassword? password;
  final Sub2ApiAdminProxyStatus? status;
  final DateTime? expiresAt;
  final Sub2ApiAdminProxyFallbackMode fallbackMode;
  final int? backupProxyId;
  final int expiryWarnDays;

  @override
  String toString() =>
      'Sub2ApiAdminUpdateProxyRequest(name: $name, protocol: $protocol, '
      'host: $host, port: $port, username: $username, password: <redacted>, '
      'status: $status, expiresAt: $expiresAt, fallbackMode: $fallbackMode, '
      'backupProxyId: $backupProxyId, expiryWarnDays: $expiryWarnDays)';
}

final class Sub2ApiAdminBatchCreateProxyInput {
  const Sub2ApiAdminBatchCreateProxyInput({
    required this.protocol,
    required this.host,
    required this.port,
    this.username,
    this.password,
  });

  final Sub2ApiAdminProxyProtocol protocol;
  final String host;
  final int port;
  final String? username;
  final Sub2ApiAdminProxyPassword? password;
}

final class Sub2ApiAdminBatchCreateProxiesResult {
  const Sub2ApiAdminBatchCreateProxiesResult({
    required this.created,
    required this.skipped,
  });

  final int created;
  final int skipped;
}

final class Sub2ApiAdminProxyActionResult {
  const Sub2ApiAdminProxyActionResult(this.message);

  final String message;
}

final class Sub2ApiAdminProxyBatchDeleteSkipped {
  const Sub2ApiAdminProxyBatchDeleteSkipped({
    required this.proxyId,
    required this.reason,
  });

  final int proxyId;
  final String reason;
}

final class Sub2ApiAdminProxyBatchDeleteResult {
  Sub2ApiAdminProxyBatchDeleteResult({
    required List<int> deletedIds,
    required List<Sub2ApiAdminProxyBatchDeleteSkipped> skipped,
  }) : deletedIds = List.unmodifiable(deletedIds),
       skipped = List.unmodifiable(skipped);

  final List<int> deletedIds;
  final List<Sub2ApiAdminProxyBatchDeleteSkipped> skipped;
}

final class Sub2ApiAdminProxyTestResult {
  const Sub2ApiAdminProxyTestResult({
    required this.success,
    required this.message,
    required this.latencyMs,
    required this.ipAddress,
    required this.city,
    required this.region,
    required this.country,
    required this.countryCode,
  });

  final bool success;
  final String message;
  final int? latencyMs;
  final String ipAddress;
  final String city;
  final String region;
  final String country;
  final String countryCode;
}

enum Sub2ApiAdminProxyQualityItemStatus { pass, warn, fail, challenge }

final class Sub2ApiAdminProxyQualityItem {
  const Sub2ApiAdminProxyQualityItem({
    required this.target,
    required this.status,
    required this.httpStatus,
    required this.latencyMs,
    required this.message,
    required this.cfRay,
  });

  final String target;
  final Sub2ApiAdminProxyQualityItemStatus status;
  final int? httpStatus;
  final int? latencyMs;
  final String message;
  final String cfRay;
}

final class Sub2ApiAdminProxyQualityResult {
  Sub2ApiAdminProxyQualityResult({
    required this.proxyId,
    required this.score,
    required this.grade,
    required this.summary,
    required this.exitIp,
    required this.country,
    required this.countryCode,
    required this.baseLatencyMs,
    required this.passedCount,
    required this.warnCount,
    required this.failedCount,
    required this.challengeCount,
    required this.checkedAt,
    required List<Sub2ApiAdminProxyQualityItem> items,
  }) : items = List.unmodifiable(items);

  final int proxyId;
  final int score;
  final String grade;
  final String summary;
  final String exitIp;
  final String country;
  final String countryCode;
  final int? baseLatencyMs;
  final int passedCount;
  final int warnCount;
  final int failedCount;
  final int challengeCount;
  final DateTime checkedAt;
  final List<Sub2ApiAdminProxyQualityItem> items;
}

sealed class Sub2ApiAdminProxyDataSelector {
  const Sub2ApiAdminProxyDataSelector();

  factory Sub2ApiAdminProxyDataSelector.ids(List<int> proxyIds) =
      Sub2ApiAdminProxyDataIdsSelector;
  const factory Sub2ApiAdminProxyDataSelector.filters(
    Sub2ApiAdminProxyDataFilters filters,
  ) = Sub2ApiAdminProxyDataFiltersSelector;
  const factory Sub2ApiAdminProxyDataSelector.all() =
      Sub2ApiAdminProxyDataAllSelector;
}

final class Sub2ApiAdminProxyDataIdsSelector
    extends Sub2ApiAdminProxyDataSelector {
  Sub2ApiAdminProxyDataIdsSelector(List<int> proxyIds)
    : proxyIds = List.unmodifiable(proxyIds);

  final List<int> proxyIds;
}

final class Sub2ApiAdminProxyDataFiltersSelector
    extends Sub2ApiAdminProxyDataSelector {
  const Sub2ApiAdminProxyDataFiltersSelector(this.filters);

  final Sub2ApiAdminProxyDataFilters filters;
}

final class Sub2ApiAdminProxyDataAllSelector
    extends Sub2ApiAdminProxyDataSelector {
  const Sub2ApiAdminProxyDataAllSelector();
}

final class Sub2ApiAdminProxyDataFilters {
  const Sub2ApiAdminProxyDataFilters({this.protocol, this.status, this.search});

  final Sub2ApiAdminProxyProtocol? protocol;
  final Sub2ApiAdminProxyStatus? status;
  final String? search;
}

final class Sub2ApiAdminProxyDataExportQuery {
  const Sub2ApiAdminProxyDataExportQuery({
    this.selector = const Sub2ApiAdminProxyDataSelector.all(),
    this.sortBy = Sub2ApiAdminProxySort.id,
    this.sortDescending = true,
  });

  final Sub2ApiAdminProxyDataSelector selector;
  final Sub2ApiAdminProxySort sortBy;
  final bool sortDescending;
}

final class Sub2ApiAdminProxyDataExport {
  const Sub2ApiAdminProxyDataExport({
    required this.exportedAt,
    required this.proxyCount,
    required this.archive,
  });

  final DateTime exportedAt;
  final int proxyCount;
  final Sub2ApiAdminProxyDataArchive archive;

  @override
  String toString() =>
      'Sub2ApiAdminProxyDataExport(exportedAt: $exportedAt, '
      'proxyCount: $proxyCount, archive: <redacted>)';
}

final class Sub2ApiAdminProxyDataImportError {
  const Sub2ApiAdminProxyDataImportError({
    required this.name,
    required this.proxyKey,
    required this.message,
  });

  final String name;
  final String proxyKey;
  final String message;
}

final class Sub2ApiAdminProxyDataImportResult {
  Sub2ApiAdminProxyDataImportResult({
    required this.created,
    required this.reused,
    required this.failed,
    required List<Sub2ApiAdminProxyDataImportError> errors,
  }) : errors = List.unmodifiable(errors);

  final int created;
  final int reused;
  final int failed;
  final List<Sub2ApiAdminProxyDataImportError> errors;
}
