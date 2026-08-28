import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';
import 'sub2api_usage_dto.dart';
import 'sub2api_usage_models.dart';

Sub2ApiUsageRecord mapUsageRecord(Sub2ApiUsageRecordDto source) =>
    Sub2ApiUsageRecord(
      id: source.id,
      userId: source.userId,
      apiKeyId: source.apiKeyId,
      accountId: source.accountId,
      requestId: source.requestId,
      model: source.model,
      serviceTier: source.serviceTier,
      reasoningEffort: source.reasoningEffort,
      inboundEndpoint: source.inboundEndpoint,
      upstreamEndpoint: source.upstreamEndpoint,
      groupId: source.groupId,
      subscriptionId: source.subscriptionId,
      inputTokens: source.inputTokens,
      outputTokens: source.outputTokens,
      cacheCreationTokens: source.cacheCreationTokens,
      cacheReadTokens: source.cacheReadTokens,
      cacheCreation5mTokens: source.cacheCreation5mTokens,
      cacheCreation1hTokens: source.cacheCreation1hTokens,
      inputCost: Sub2ApiDecimal.fromJson(source.inputCost),
      outputCost: Sub2ApiDecimal.fromJson(source.outputCost),
      cacheCreationCost: Sub2ApiDecimal.fromJson(source.cacheCreationCost),
      cacheReadCost: Sub2ApiDecimal.fromJson(source.cacheReadCost),
      totalCost: Sub2ApiDecimal.fromJson(source.totalCost),
      actualCost: Sub2ApiDecimal.fromJson(source.actualCost),
      rateMultiplier: Sub2ApiDecimal.fromJson(source.rateMultiplier),
      longContextBillingApplied: source.longContextBillingApplied,
      billingType: source.billingType,
      requestType: source.requestType,
      stream: source.stream,
      openAiWsMode: source.openAiWsMode,
      durationMs: source.durationMs,
      firstTokenMs: source.firstTokenMs,
      imageCount: source.imageCount,
      imageSize: source.imageSize,
      imageInputSize: source.imageInputSize,
      imageOutputSize: source.imageOutputSize,
      imageOutputTokens: source.imageOutputTokens,
      imageOutputCost: Sub2ApiDecimal.fromJson(source.imageOutputCost),
      imageSizeSource: source.imageSizeSource,
      imageSizeBreakdown: source.imageSizeBreakdown,
      mediaType: source.mediaType,
      userAgent: source.userAgent,
      ipAddress: source.ipAddress,
      cacheTtlOverridden: source.cacheTtlOverridden,
      billingMode: source.billingMode,
      createdAt: source.createdAt,
    );

Sub2ApiUsageStats mapUsageStats(Sub2ApiUsageStatsDto source) =>
    Sub2ApiUsageStats(
      totalRequests: source.totalRequests,
      totalInputTokens: source.totalInputTokens,
      totalOutputTokens: source.totalOutputTokens,
      totalCacheTokens: source.totalCacheTokens,
      totalCacheCreationTokens: source.totalCacheCreationTokens,
      totalCacheReadTokens: source.totalCacheReadTokens,
      totalTokens: source.totalTokens,
      totalCost: Sub2ApiDecimal.fromJson(source.totalCost),
      totalActualCost: Sub2ApiDecimal.fromJson(source.totalActualCost),
      averageDurationMs: Sub2ApiDecimal.fromJson(source.averageDurationMs),
    );

Sub2ApiPage<Sub2ApiUsageRecord> mapUsagePage(Object? data) {
  final map = _requireMap(data);
  final items = map['items'];
  if (items is! List<Object?>) {
    throw _protocolFailure();
  }
  return Sub2ApiPage(
    items: items
        .map(
          (item) =>
              mapUsageRecord(Sub2ApiUsageRecordDto.fromJson(_requireMap(item))),
        )
        .toList(growable: false),
    page: _requireInt(map['page']),
    pageSize: _requireInt(map['page_size']),
    total: _requireInt(map['total']),
    pages: _requireInt(map['pages']),
  );
}

Sub2ApiUsageRecord mapUsageDetail(Object? data) =>
    mapUsageRecord(Sub2ApiUsageRecordDto.fromJson(_requireMap(data)));

Sub2ApiUsageStats mapUsageStatistics(Object? data) =>
    mapUsageStats(Sub2ApiUsageStatsDto.fromJson(_requireMap(data)));

Sub2ApiPage<Sub2ApiUsageError> mapUsageErrorPage(
  Object? data,
) => _mapExtended(() {
  final map = _requireMap(data);
  final items = map['items'];
  if (items is! List<Object?>) throw _extendedProtocolFailure();
  return Sub2ApiPage(
    items: items
        .map(
          (item) =>
              mapUsageError(Sub2ApiUsageErrorDto.fromJson(_requireMap(item))),
        )
        .toList(growable: false),
    page: _requireInt(map['page']),
    pageSize: _requireInt(map['page_size']),
    total: _requireInt(map['total']),
    pages: _requireInt(map['pages']),
  );
});

Sub2ApiUsageError mapUsageError(Sub2ApiUsageErrorDto source) =>
    Sub2ApiUsageError(
      id: source.id,
      createdAt: source.createdAt,
      model: source.model,
      inboundEndpoint: source.inboundEndpoint,
      statusCode: source.statusCode,
      category: source.category,
      platform: source.platform,
      message: source.message,
      keyName: source.keyName,
      keyDeleted: source.keyDeleted,
      clientIp: _emptyToNull(source.clientIp),
      groupName: _emptyToNull(source.groupName),
      requestType: source.requestType,
      stream: source.stream,
      userAgent: _emptyToNull(source.userAgent),
    );

Sub2ApiUsageErrorDetail mapUsageErrorDetail(Object? data) => _mapExtended(() {
  final source = Sub2ApiUsageErrorDetailDto.fromJson(_requireMap(data));
  return Sub2ApiUsageErrorDetail(
    summary: mapUsageError(source.toSummary()),
    errorBody: source.errorBody,
    upstreamStatusCode: source.upstreamStatusCode,
  );
});

Sub2ApiUsageDashboardStats mapUsageDashboardStats(
  Object? data,
) => _mapExtended(() {
  final source = Sub2ApiUsageDashboardStatsDto.fromJson(_requireMap(data));
  return Sub2ApiUsageDashboardStats(
    totalApiKeys: source.totalApiKeys,
    activeApiKeys: source.activeApiKeys,
    totalRequests: source.totalRequests,
    totalInputTokens: source.totalInputTokens,
    totalOutputTokens: source.totalOutputTokens,
    totalCacheCreationTokens: source.totalCacheCreationTokens,
    totalCacheReadTokens: source.totalCacheReadTokens,
    totalTokens: source.totalTokens,
    totalCost: Sub2ApiDecimal.fromJson(source.totalCost),
    totalActualCost: Sub2ApiDecimal.fromJson(source.totalActualCost),
    todayRequests: source.todayRequests,
    todayInputTokens: source.todayInputTokens,
    todayOutputTokens: source.todayOutputTokens,
    todayCacheCreationTokens: source.todayCacheCreationTokens,
    todayCacheReadTokens: source.todayCacheReadTokens,
    todayTokens: source.todayTokens,
    todayCost: Sub2ApiDecimal.fromJson(source.todayCost),
    todayActualCost: Sub2ApiDecimal.fromJson(source.todayActualCost),
    averageDurationMs: Sub2ApiDecimal.fromJson(source.averageDurationMs),
    rpm: source.rpm,
    tpm: source.tpm,
    byPlatform: source.byPlatform
        .map(
          (platform) => Sub2ApiUsagePlatformStats(
            platform: platform.platform,
            totalRequests: platform.totalRequests,
            totalTokens: platform.totalTokens,
            totalActualCost: Sub2ApiDecimal.fromJson(platform.totalActualCost),
            todayRequests: platform.todayRequests,
            todayTokens: platform.todayTokens,
            todayActualCost: Sub2ApiDecimal.fromJson(platform.todayActualCost),
          ),
        )
        .toList(growable: false),
  );
});

Sub2ApiUsageTrend mapUsageDashboardTrend(Object? data) => _mapExtended(() {
  final source = Sub2ApiUsageTrendDto.fromJson(_requireMap(data));
  return Sub2ApiUsageTrend(
    points: source.trend.map(_mapTrendPoint).toList(growable: false),
    startDate: _dateOnly(source.startDate),
    endDate: _dateOnly(source.endDate),
    granularity: _granularity(source.granularity),
  );
});

Sub2ApiUsageModels mapUsageDashboardModels(Object? data) => _mapExtended(() {
  final source = Sub2ApiUsageModelsDto.fromJson(_requireMap(data));
  return Sub2ApiUsageModels(
    models: source.models.map(_mapModelStats).toList(growable: false),
    startDate: _dateOnly(source.startDate),
    endDate: _dateOnly(source.endDate),
  );
});

Sub2ApiUsageDashboardSnapshot mapUsageDashboardSnapshot(Object? data) =>
    _mapExtended(() {
      final source = Sub2ApiUsageDashboardSnapshotDto.fromJson(
        _requireMap(data),
      );
      return Sub2ApiUsageDashboardSnapshot(
        generatedAt: source.generatedAt,
        startDate: _dateOnly(source.startDate),
        endDate: _dateOnly(source.endDate),
        granularity: _granularity(source.granularity),
        trend: source.trend?.map(_mapTrendPoint).toList(growable: false),
        models: source.models?.map(_mapModelStats).toList(growable: false),
        groups: source.groups
            ?.map(
              (group) => Sub2ApiUsageGroupStats(
                groupId: group.groupId,
                groupName: group.groupName,
                requests: group.requests,
                totalTokens: group.totalTokens,
                cost: Sub2ApiDecimal.fromJson(group.cost),
                actualCost: Sub2ApiDecimal.fromJson(group.actualCost),
              ),
            )
            .toList(growable: false),
      );
    });

Map<int, Sub2ApiUsageApiKeyStats> mapUsageApiKeyStats(Object? data) =>
    _mapExtended(() {
      final root = _requireMap(data);
      final stats = _requireMap(root['stats']);
      final result = <int, Sub2ApiUsageApiKeyStats>{};
      for (final entry in stats.entries) {
        final id = int.tryParse(entry.key);
        if (id == null || id <= 0) throw _extendedProtocolFailure();
        final source = Sub2ApiUsageApiKeyStatsDto.fromJson(
          _requireMap(entry.value),
        );
        if (source.apiKeyId != id) throw _extendedProtocolFailure();
        result[id] = Sub2ApiUsageApiKeyStats(
          apiKeyId: source.apiKeyId,
          todayActualCost: Sub2ApiDecimal.fromJson(source.todayActualCost),
          totalActualCost: Sub2ApiDecimal.fromJson(source.totalActualCost),
        );
      }
      return Map<int, Sub2ApiUsageApiKeyStats>.unmodifiable(result);
    });

Sub2ApiUsageTrendPoint _mapTrendPoint(Sub2ApiUsageTrendPointDto source) =>
    Sub2ApiUsageTrendPoint(
      date: source.date,
      requests: source.requests,
      inputTokens: source.inputTokens,
      outputTokens: source.outputTokens,
      cacheCreationTokens: source.cacheCreationTokens,
      cacheReadTokens: source.cacheReadTokens,
      totalTokens: source.totalTokens,
      cost: Sub2ApiDecimal.fromJson(source.cost),
      actualCost: Sub2ApiDecimal.fromJson(source.actualCost),
    );

Sub2ApiUsageModelStats _mapModelStats(Sub2ApiUsageModelStatsDto source) =>
    Sub2ApiUsageModelStats(
      model: source.model,
      requests: source.requests,
      inputTokens: source.inputTokens,
      outputTokens: source.outputTokens,
      cacheCreationTokens: source.cacheCreationTokens,
      cacheReadTokens: source.cacheReadTokens,
      totalTokens: source.totalTokens,
      cost: Sub2ApiDecimal.fromJson(source.cost),
      actualCost: Sub2ApiDecimal.fromJson(source.actualCost),
    );

DateTime _dateOnly(String value) {
  final match = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$').firstMatch(value);
  if (match == null) throw _extendedProtocolFailure();
  return DateTime.utc(
    int.parse(match.group(1)!),
    int.parse(match.group(2)!),
    int.parse(match.group(3)!),
  );
}

Sub2ApiUsageGranularity _granularity(String value) => switch (value) {
  'day' => Sub2ApiUsageGranularity.day,
  'hour' => Sub2ApiUsageGranularity.hour,
  _ => throw _extendedProtocolFailure(),
};

String? _emptyToNull(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}

T _mapExtended<T>(T Function() map) {
  try {
    return map();
  } on Sub2ApiException {
    rethrow;
  } on Object {
    throw _extendedProtocolFailure();
  }
}

Map<String, Object?> _requireMap(Object? value) {
  if (value is Map<String, Object?>) {
    return value;
  }
  if (value is Map) {
    final cast = <String, Object?>{};
    for (final entry in value.entries) {
      if (entry.key is! String) throw _protocolFailure();
      cast[entry.key as String] = entry.value;
    }
    return cast;
  }
  throw _protocolFailure();
}

int _requireInt(Object? value) {
  if (value is int) return value;
  throw _protocolFailure();
}

Sub2ApiException _protocolFailure() => const Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_usage_payload',
  retryable: false,
);

Sub2ApiException _extendedProtocolFailure() => const Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_usage_management_payload',
  retryable: false,
);
