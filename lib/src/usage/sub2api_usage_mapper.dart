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
