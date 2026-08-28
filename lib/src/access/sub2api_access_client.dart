import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_access_models.dart';
import 'wire/access_wire_dtos.dart';
import 'wire/access_wire_service.dart';

/// Provides current-user groups, channels, quotas, and per-key usage facts.
abstract interface class Sub2ApiAccessClient {
  /// Lists user-visible channels grouped by platform, group, and model.
  Future<List<Sub2ApiAvailableChannel>> getAvailableChannels({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Lists every group the current user may assign to an API key.
  Future<List<Sub2ApiAvailableGroup>> getAvailableGroups({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads the current user's group-specific exact rate multipliers.
  Future<Map<int, Sub2ApiDecimal>> getGroupRates({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads the current user's daily, weekly, and monthly platform quotas.
  Future<List<Sub2ApiPlatformQuota>> getPlatformQuotas({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads calendar-day usage for one API key owned by the current user.
  Future<Sub2ApiApiKeyDailyUsage> getApiKeyDailyUsage(
    Sub2ApiApiKeyDailyUsageRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal access-resource implementation.
Sub2ApiAccessClient createSub2ApiAccessClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
}) => _Sub2ApiAccessClient(dio: dio, requestExecutor: requestExecutor);

final class _Sub2ApiAccessClient implements Sub2ApiAccessClient {
  _Sub2ApiAccessClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
  }) : _requestExecutor = requestExecutor,
       _service = AccessWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final AccessWireService _service;

  @override
  Future<List<Sub2ApiAvailableChannel>> getAvailableChannels({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest<List<Sub2ApiAvailableChannel>>(
    send: (cancelToken, options, authorization) =>
        _service.getAvailableChannels(cancelToken, options, authorization),
    decode: _decodeAvailableChannels,
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiAvailableGroup>> getAvailableGroups({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest<List<Sub2ApiAvailableGroup>>(
    send: (cancelToken, options, authorization) =>
        _service.getAvailableGroups(cancelToken, options, authorization),
    decode: _decodeAvailableGroups,
    requestOptions: requestOptions,
  );

  @override
  Future<Map<int, Sub2ApiDecimal>> getGroupRates({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest<Map<int, Sub2ApiDecimal>>(
    send: (cancelToken, options, authorization) =>
        _service.getGroupRates(cancelToken, options, authorization),
    decode: _decodeGroupRates,
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiPlatformQuota>> getPlatformQuotas({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest<List<Sub2ApiPlatformQuota>>(
    send: (cancelToken, options, authorization) =>
        _service.getPlatformQuotas(cancelToken, options, authorization),
    decode: _decodePlatformQuotas,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiApiKeyDailyUsage> getApiKeyDailyUsage(
    Sub2ApiApiKeyDailyUsageRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (request.apiKeyId <= 0) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'access.invalid_api_key_id',
        retryable: false,
      );
    }
    if (request.days < 1 || request.days > 90) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'access.invalid_days',
        retryable: false,
      );
    }
    final timezone = request.timezone?.trim();
    return _requestExecutor.protectedRequest<Sub2ApiApiKeyDailyUsage>(
      send: (cancelToken, options, authorization) =>
          _service.getApiKeyDailyUsage(
            request.apiKeyId,
            request.days,
            timezone == null || timezone.isEmpty ? null : timezone,
            cancelToken,
            options,
            authorization,
          ),
      decode: _decodeDailyUsage,
      requestOptions: requestOptions,
    );
  }

  static Sub2ApiApiKeyDailyUsage _decodeDailyUsage(Object? data) {
    try {
      return ApiKeyDailyUsageWireDto.fromJson(_objectMap(data)).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidApiKeyDailyUsage;
    }
  }

  static List<Sub2ApiAvailableGroup> _decodeAvailableGroups(Object? data) {
    if (data is! List) throw invalidAvailableGroup;
    try {
      return List<Sub2ApiAvailableGroup>.unmodifiable(
        data.map(
          (item) => AvailableGroupWireDto.fromJson(
            _objectMap(item, invalidAvailableGroup),
          ).toPublicModel(),
        ),
      );
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidAvailableGroup;
    }
  }

  static List<Sub2ApiAvailableChannel> _decodeAvailableChannels(Object? data) {
    if (data is! List) throw invalidAvailableChannels;
    try {
      return List<Sub2ApiAvailableChannel>.unmodifiable(
        data.map(
          (item) => AvailableChannelWireDto.fromJson(
            _objectMap(item, invalidAvailableChannels),
          ).toPublicModel(),
        ),
      );
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidAvailableChannels;
    }
  }

  static Map<int, Sub2ApiDecimal> _decodeGroupRates(Object? data) {
    if (data == null) return const <int, Sub2ApiDecimal>{};
    final map = _objectMap(data, invalidGroupRates);
    try {
      final result = <int, Sub2ApiDecimal>{};
      for (final entry in map.entries) {
        final id = int.tryParse(entry.key);
        if (id == null || id <= 0 || entry.value is! num) {
          throw invalidGroupRates;
        }
        result[id] = Sub2ApiDecimal.fromJson(entry.value! as num);
      }
      return Map<int, Sub2ApiDecimal>.unmodifiable(result);
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidGroupRates;
    }
  }

  static List<Sub2ApiPlatformQuota> _decodePlatformQuotas(Object? data) {
    try {
      return PlatformQuotasWireDto.fromJson(
        _objectMap(data, invalidPlatformQuotas),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidPlatformQuotas;
    }
  }

  static Map<String, Object?> _objectMap(
    Object? value, [
    Sub2ApiException failure = invalidApiKeyDailyUsage,
  ]) {
    if (value is! Map) throw failure;
    final result = <String, Object?>{};
    for (final entry in value.entries) {
      if (entry.key is! String) throw failure;
      result[entry.key as String] = entry.value;
    }
    return result;
  }
}
