import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_commerce_models.dart';
import 'sub2api_monitor_models.dart';
import 'wire/commerce_wire_dtos.dart';
import 'wire/commerce_wire_service.dart';
import 'wire/monitor_wire_mapper.dart';

/// User-facing announcements, redemption, and subscription operations.
abstract interface class Sub2ApiCommerceClient {
  Future<List<Sub2ApiAnnouncement>> listAnnouncements({
    bool unreadOnly = false,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAnnouncementReadResult> markAnnouncementRead(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiRedeemRecord> redeem(
    Sub2ApiRedeemRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiRedeemRecord>> getRedeemHistory({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiUserSubscription>> getSubscriptions({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiUserSubscription>> getActiveSubscriptions({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiSubscriptionProgressInfo>> getSubscriptionProgress({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiSubscriptionSummary> getSubscriptionSummary({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads the public plaza, enriched with exclusive groups and user rates
  /// when a current JWT session exists.
  Future<Sub2ApiModelPlaza> getModelPlaza({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Lists current-user read-only v1 channel monitors.
  Future<List<Sub2ApiChannelMonitor>> getChannelMonitors({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads multi-window status for one v1 channel monitor.
  Future<Sub2ApiChannelMonitorDetail> getChannelMonitorStatus(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads passive-monitor v2 filter dimensions.
  Future<Sub2ApiMonitorDimensions> getMonitorDimensions(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads the passive-monitor v2 aggregate snapshot.
  Future<Sub2ApiMonitorSnapshot> getMonitorSnapshot(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Lists passive-monitor v2 model rows.
  Future<Sub2ApiMonitorList<Sub2ApiMonitorModelRow>> getMonitorModels(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads the passive-monitor v2 matrix for one aggregation mode.
  Future<Sub2ApiMonitorMatrix> getMonitorMatrix(
    Sub2ApiMonitorFilter filter,
    Sub2ApiMonitorGroupBy groupBy, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Lists passive-monitor v2 error-category aggregates.
  Future<Sub2ApiMonitorList<Sub2ApiMonitorErrorRow>> getMonitorErrors(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Lists privacy-redacted passive-monitor v2 user rows.
  Future<Sub2ApiMonitorList<Sub2ApiMonitorUserRow>> getMonitorUsers(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiCommerceClient createSub2ApiCommerceClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
}) => _Sub2ApiCommerceClient(dio: dio, requestExecutor: requestExecutor);

final class _Sub2ApiCommerceClient implements Sub2ApiCommerceClient {
  _Sub2ApiCommerceClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
  }) : _requestExecutor = requestExecutor,
       _service = CommerceWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final CommerceWireService _service;

  @override
  Future<List<Sub2ApiAnnouncement>> listAnnouncements({
    bool unreadOnly = false,
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) => _service.listAnnouncements(
      unreadOnly ? 1 : null,
      cancelToken,
      options,
      authorization,
    ),
    decode: (data) => _list(data, _announcement),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAnnouncementReadResult> markAnnouncementRead(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (id <= 0) throw _validation('commerce.invalid_announcement_id');
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, authorization) => _service
          .markAnnouncementRead(id, cancelToken, options, authorization),
      decode: (data) {
        try {
          final dto = CommerceMessageWireDto.fromJson(_map(data));
          if (dto.message.isEmpty) throw _invalidCommerce;
          return Sub2ApiAnnouncementReadResult(message: dto.message);
        } on Sub2ApiException {
          rethrow;
        } on Object {
          throw _invalidCommerce;
        }
      },
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiRedeemRecord> redeem(
    Sub2ApiRedeemRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final code = request.code.trim();
    if (code.isEmpty) throw _validation('commerce.invalid_redeem_code');
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, authorization) => _service.redeem(
        <String, Object?>{'code': code},
        cancelToken,
        options,
        authorization,
      ),
      decode: (data) => _redeemRecord(RedeemRecordWireDto.fromJson(_map(data))),
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiRedeemRecord>> getRedeemHistory({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) =>
        _service.redeemHistory(cancelToken, options, authorization),
    decode: (data) => _list(
      data,
      (item) => _redeemRecord(RedeemRecordWireDto.fromJson(_map(item))),
    ),
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiUserSubscription>> getSubscriptions({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) =>
        _service.subscriptions(cancelToken, options, authorization),
    decode: _subscriptionList,
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiUserSubscription>> getActiveSubscriptions({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) =>
        _service.activeSubscriptions(cancelToken, options, authorization),
    decode: _subscriptionList,
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiSubscriptionProgressInfo>> getSubscriptionProgress({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) =>
        _service.subscriptionProgress(cancelToken, options, authorization),
    decode: (data) => _list(data, (item) {
      final dto = SubscriptionProgressInfoWireDto.fromJson(_map(item));
      return Sub2ApiSubscriptionProgressInfo(
        subscription: _subscription(dto.subscription),
        progress: _progress(dto.progress),
      );
    }),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiSubscriptionSummary> getSubscriptionSummary({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) =>
        _service.subscriptionSummary(cancelToken, options, authorization),
    decode: (data) {
      try {
        final dto = SubscriptionSummaryWireDto.fromJson(_map(data));
        if (dto.activeCount < 0) throw _invalidCommerce;
        return Sub2ApiSubscriptionSummary(
          activeCount: dto.activeCount,
          totalUsedUsd: Sub2ApiDecimal.fromJson(dto.totalUsedUsd),
          subscriptions: dto.subscriptions
              .map(
                (item) => Sub2ApiSubscriptionSummaryItem(
                  id: item.id,
                  groupId: item.groupId,
                  groupName: item.groupName,
                  status: item.status,
                  dailyUsedUsd: Sub2ApiDecimal.fromJson(item.dailyUsedUsd),
                  dailyLimitUsd: Sub2ApiDecimal.fromJson(item.dailyLimitUsd),
                  weeklyUsedUsd: Sub2ApiDecimal.fromJson(item.weeklyUsedUsd),
                  weeklyLimitUsd: Sub2ApiDecimal.fromJson(item.weeklyLimitUsd),
                  monthlyUsedUsd: Sub2ApiDecimal.fromJson(item.monthlyUsedUsd),
                  monthlyLimitUsd: Sub2ApiDecimal.fromJson(
                    item.monthlyLimitUsd,
                  ),
                  expiresAt: item.expiresAt,
                ),
              )
              .toList(growable: false),
        );
      } on Sub2ApiException {
        rethrow;
      } on Object {
        throw _invalidCommerce;
      }
    },
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiModelPlaza> getModelPlaza({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.optionalAuthenticatedRequest(
    send: (cancelToken, options, authorization) =>
        _service.modelPlaza(cancelToken, options, authorization),
    decode: (data) {
      try {
        final dto = ModelPlazaWireDto.fromJson(_map(data));
        return Sub2ApiModelPlaza(
          description: dto.description,
          groups: dto.groups.map(_plazaGroup).toList(growable: false),
        );
      } on Sub2ApiException {
        rethrow;
      } on Object {
        throw _invalidCommerce;
      }
    },
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiChannelMonitor>> getChannelMonitors({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) =>
        _service.channelMonitors(cancelToken, options, authorization),
    decode: mapChannelMonitors,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiChannelMonitorDetail> getChannelMonitorStatus(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (id <= 0) throw _validation('commerce.invalid_channel_monitor_id');
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, authorization) => _service
          .channelMonitorStatus(id, cancelToken, options, authorization),
      decode: mapChannelMonitorDetail,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiMonitorDimensions> getMonitorDimensions(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _monitorRequest(
    filter,
    send: _service.monitorDimensions,
    decode: mapMonitorDimensions,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorSnapshot> getMonitorSnapshot(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _monitorRequest(
    filter,
    send: _service.monitorSnapshot,
    decode: mapMonitorSnapshot,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorList<Sub2ApiMonitorModelRow>> getMonitorModels(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _monitorRequest(
    filter,
    send: _service.monitorModels,
    decode: mapMonitorModels,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorMatrix> getMonitorMatrix(
    Sub2ApiMonitorFilter filter,
    Sub2ApiMonitorGroupBy groupBy, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _monitorRequest(
    filter,
    extraQuery: <String, dynamic>{'group_by': _groupByWire(groupBy)},
    send: _service.monitorMatrix,
    decode: mapMonitorMatrix,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorList<Sub2ApiMonitorErrorRow>> getMonitorErrors(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _monitorRequest(
    filter,
    send: _service.monitorErrors,
    decode: mapMonitorErrors,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiMonitorList<Sub2ApiMonitorUserRow>> getMonitorUsers(
    Sub2ApiMonitorFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _monitorRequest(
    filter,
    send: _service.monitorUsers,
    decode: mapMonitorUsers,
    requestOptions: requestOptions,
  );

  Future<T> _monitorRequest<T>(
    Sub2ApiMonitorFilter filter, {
    required Future<HttpResponse<Object?>> Function(
      Map<String, dynamic>,
      CancelToken,
      Options,
      String?,
    )
    send,
    required T Function(Object? data) decode,
    Map<String, dynamic> extraQuery = const <String, dynamic>{},
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateMonitorFilter(filter);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, authorization) => send(
        <String, dynamic>{..._monitorQuery(filter), ...extraQuery},
        cancelToken,
        options,
        authorization,
      ),
      decode: decode,
      requestOptions: requestOptions,
    );
  }

  static List<Sub2ApiUserSubscription> _subscriptionList(Object? data) =>
      _list(data, (item) {
        return _subscription(UserSubscriptionWireDto.fromJson(_map(item)));
      });

  static Sub2ApiAnnouncement _announcement(Object? item) {
    final dto = AnnouncementWireDto.fromJson(_map(item));
    if (dto.id <= 0 ||
        dto.title.isEmpty ||
        dto.content.isEmpty ||
        dto.notifyMode.isEmpty) {
      throw _invalidCommerce;
    }
    return Sub2ApiAnnouncement(
      id: dto.id,
      title: dto.title,
      content: dto.content,
      notifyMode: dto.notifyMode,
      startsAt: dto.startsAt,
      endsAt: dto.endsAt,
      readAt: dto.readAt,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static Sub2ApiRedeemRecord _redeemRecord(RedeemRecordWireDto dto) {
    if (dto.id <= 0 ||
        dto.code.isEmpty ||
        dto.type.isEmpty ||
        dto.status.isEmpty) {
      throw _invalidCommerce;
    }
    return Sub2ApiRedeemRecord(
      id: dto.id,
      code: dto.code,
      type: dto.type,
      value: Sub2ApiDecimal.fromJson(dto.value),
      status: dto.status,
      usedBy: dto.usedBy,
      usedAt: dto.usedAt,
      createdAt: dto.createdAt,
      expiresAt: dto.expiresAt,
      groupId: dto.groupId,
      validityDays: dto.validityDays,
      notes: dto.notes,
      group: _group(dto.group),
    );
  }

  static Sub2ApiUserSubscription _subscription(UserSubscriptionWireDto dto) {
    if (dto.id <= 0 ||
        dto.userId <= 0 ||
        dto.groupId <= 0 ||
        dto.status.isEmpty) {
      throw _invalidCommerce;
    }
    return Sub2ApiUserSubscription(
      id: dto.id,
      userId: dto.userId,
      groupId: dto.groupId,
      startsAt: dto.startsAt,
      expiresAt: dto.expiresAt,
      status: dto.status,
      dailyWindowStart: dto.dailyWindowStart,
      weeklyWindowStart: dto.weeklyWindowStart,
      monthlyWindowStart: dto.monthlyWindowStart,
      dailyUsageUsd: Sub2ApiDecimal.fromJson(dto.dailyUsageUsd),
      weeklyUsageUsd: Sub2ApiDecimal.fromJson(dto.weeklyUsageUsd),
      monthlyUsageUsd: Sub2ApiDecimal.fromJson(dto.monthlyUsageUsd),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      revokedAt: dto.revokedAt,
      group: _group(dto.group),
    );
  }

  static Sub2ApiSubscriptionProgress _progress(
    SubscriptionProgressWireDto dto,
  ) {
    if (dto.id <= 0 || dto.groupName.isEmpty || dto.expiresInDays < 0) {
      throw _invalidCommerce;
    }
    return Sub2ApiSubscriptionProgress(
      id: dto.id,
      groupName: dto.groupName,
      expiresAt: dto.expiresAt,
      expiresInDays: dto.expiresInDays,
      daily: _window(dto.daily),
      weekly: _window(dto.weekly),
      monthly: _window(dto.monthly),
    );
  }

  static Sub2ApiSubscriptionUsageWindow? _window(
    SubscriptionUsageWindowWireDto? dto,
  ) => dto == null
      ? null
      : Sub2ApiSubscriptionUsageWindow(
          limitUsd: Sub2ApiDecimal.fromJson(dto.limitUsd),
          usedUsd: Sub2ApiDecimal.fromJson(dto.usedUsd),
          remainingUsd: Sub2ApiDecimal.fromJson(dto.remainingUsd),
          percentage: Sub2ApiDecimal.fromJson(dto.percentage),
          windowStart: dto.windowStart,
          resetsAt: dto.resetsAt,
          resetsInSeconds: dto.resetsInSeconds,
        );

  static Sub2ApiCommerceGroupSummary? _group(CommerceGroupWireDto? dto) =>
      dto == null
      ? null
      : Sub2ApiCommerceGroupSummary(
          id: dto.id,
          name: dto.name,
          platform: dto.platform,
          subscriptionType: dto.subscriptionType,
        );

  static Sub2ApiModelPlazaGroup _plazaGroup(ModelPlazaGroupWireDto dto) {
    if (dto.id <= 0 ||
        dto.name.isEmpty ||
        dto.platform.isEmpty ||
        dto.subscriptionType.isEmpty) {
      throw _invalidCommerce;
    }
    return Sub2ApiModelPlazaGroup(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      platform: dto.platform,
      subscriptionType: dto.subscriptionType,
      rateMultiplier: Sub2ApiDecimal.fromJson(dto.rateMultiplier),
      userRateMultiplier: dto.userRateMultiplier == null
          ? null
          : Sub2ApiDecimal.fromJson(dto.userRateMultiplier!),
      peakRateEnabled: dto.peakRateEnabled,
      peakStart: dto.peakStart,
      peakEnd: dto.peakEnd,
      peakRateMultiplier: Sub2ApiDecimal.fromJson(dto.peakRateMultiplier),
      isExclusive: dto.isExclusive,
      imageRateIndependent: dto.imageRateIndependent,
      imageRateMultiplier: Sub2ApiDecimal.fromJson(dto.imageRateMultiplier),
      longContextPricingEnabled: dto.longContextPricingEnabled,
      models: dto.models
          .map(
            (model) => Sub2ApiModelPlazaModel(
              name: model.name,
              platform: model.platform,
              pricing: model.pricing?.toPublicModel(),
              officialPricing: _officialPricing(model.officialPricing),
              longContextBasis: model.longContextBasis,
              timePricing: _timePricing(model.timePricing),
            ),
          )
          .toList(growable: false),
    );
  }

  static Sub2ApiModelPlazaOfficialPricing? _officialPricing(
    ModelPlazaOfficialPricingWireDto? dto,
  ) => dto == null
      ? null
      : Sub2ApiModelPlazaOfficialPricing(
          inputPrice: _decimalOrNull(dto.inputPrice),
          outputPrice: _decimalOrNull(dto.outputPrice),
          cacheWritePrice: _decimalOrNull(dto.cacheWritePrice),
          cacheWrite1hPrice: _decimalOrNull(dto.cacheWrite1hPrice),
          cacheReadPrice: _decimalOrNull(dto.cacheReadPrice),
          intervals: dto.intervals
              .map((interval) => interval.toPublicModel())
              .toList(growable: false),
        );

  static Sub2ApiModelPlazaTimePricing? _timePricing(
    ModelPlazaTimePricingWireDto? dto,
  ) => dto == null
      ? null
      : Sub2ApiModelPlazaTimePricing(
          timezone: dto.timezone,
          weekdaysOnly: dto.weekdaysOnly,
          periods: dto.periods
              .map(
                (period) => Sub2ApiModelPlazaTimePeriod(
                  startTime: period.startTime,
                  endTime: period.endTime,
                  multiplier: Sub2ApiDecimal.fromJson(period.multiplier),
                ),
              )
              .toList(growable: false),
        );

  static Sub2ApiDecimal? _decimalOrNull(num? value) =>
      value == null ? null : Sub2ApiDecimal.fromJson(value);

  static void _validateMonitorFilter(Sub2ApiMonitorFilter filter) {
    if (filter.groupIds.any((id) => id <= 0)) {
      throw _validation('commerce.invalid_monitor_group_id');
    }
    if (filter.platforms.any((value) => value.trim().isEmpty) ||
        filter.models.any((value) => value.trim().isEmpty)) {
      throw _validation('commerce.invalid_monitor_filter');
    }
  }

  static Map<String, dynamic> _monitorQuery(Sub2ApiMonitorFilter filter) =>
      <String, dynamic>{
        'range': switch (filter.range) {
          Sub2ApiMonitorRange.ninetyMinutes => '90m',
          Sub2ApiMonitorRange.day => '24h',
          Sub2ApiMonitorRange.week => '7d',
          Sub2ApiMonitorRange.month => '30d',
        },
        if (filter.platforms.isNotEmpty) 'platform': filter.platforms,
        if (filter.groupIds.isNotEmpty) 'group_id': filter.groupIds,
        if (filter.models.isNotEmpty) 'model': filter.models,
      };

  static String _groupByWire(Sub2ApiMonitorGroupBy value) => switch (value) {
    Sub2ApiMonitorGroupBy.platform => 'platform',
    Sub2ApiMonitorGroupBy.platformGroup => 'platform_group',
    Sub2ApiMonitorGroupBy.platformModel => 'platform_model',
    Sub2ApiMonitorGroupBy.platformGroupModel => 'platform_group_model',
  };

  static List<T> _list<T>(Object? data, T Function(Object? item) map) {
    try {
      if (data is! List) throw _invalidCommerce;
      return List<T>.unmodifiable(data.map(map));
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw _invalidCommerce;
    }
  }

  static Map<String, Object?> _map(Object? data) {
    if (data is! Map) throw _invalidCommerce;
    final result = <String, Object?>{};
    for (final entry in data.entries) {
      if (entry.key is! String) throw _invalidCommerce;
      result[entry.key as String] = entry.value;
    }
    return result;
  }
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);

const _invalidCommerce = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_commerce_response',
  retryable: false,
);
