import '../commerce/sub2api_monitor_models.dart';

enum Sub2ApiAdminMonitorV2ErrorCategory {
  contentPolicy,
  authentication,
  contextLimit,
  invalidRequest,
  modelUnsupported,
  groupAccess,
  quotaOrBalance,
  accountPoolUnavailable,
  rateOrCapacity,
  timeout,
  transportOrStream,
  upstreamForbidden,
  notFound,
  clientCancelled,
  upstream5xx,
  internal,
  other,
}

final class Sub2ApiAdminUpdateMonitorV2ConfigRequest {
  Sub2ApiAdminUpdateMonitorV2ConfigRequest({
    required this.version,
    required this.enabled,
    required this.refreshIntervalSeconds,
    required List<Sub2ApiMonitorPlatformConfig> platforms,
    required List<int> groupIds,
    required this.healthThresholds,
    required List<Sub2ApiAdminMonitorV2ErrorCategory> ignoredErrorCategories,
  }) : platforms = List.unmodifiable(platforms),
       groupIds = List.unmodifiable(groupIds),
       ignoredErrorCategories = List.unmodifiable(ignoredErrorCategories);

  final int version;
  final bool enabled;
  final int refreshIntervalSeconds;
  final List<Sub2ApiMonitorPlatformConfig> platforms;
  final List<int> groupIds;
  final Sub2ApiMonitorThresholds healthThresholds;
  final List<Sub2ApiAdminMonitorV2ErrorCategory> ignoredErrorCategories;
}
