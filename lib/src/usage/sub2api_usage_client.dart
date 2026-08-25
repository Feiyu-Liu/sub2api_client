import 'package:dio/dio.dart';

import '../shared/models/sub2api_page.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_usage_mapper.dart';
import 'sub2api_usage_models.dart';
import 'sub2api_usage_service.dart';

/// Typed authenticated Usage endpoints for the v0.1.155 user API.
abstract interface class Sub2ApiUsageClient {
  /// Lists authenticated usage records.
  Future<Sub2ApiPage<Sub2ApiUsageRecord>> list(
    Sub2ApiUsageQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads one authenticated usage record.
  Future<Sub2ApiUsageRecord> detail(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads aggregate authenticated usage statistics.
  Future<Sub2ApiUsageStats> stats(
    Sub2ApiUsageQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal Usage implementation.
///
/// This factory is deliberately not exported from `sub2api_client.dart`.
Sub2ApiUsageClient createSub2ApiUsageClient({
  required Sub2ApiRequestExecutor requestExecutor,
  required Dio dio,
}) => _Sub2ApiUsageClient(requestExecutor: requestExecutor, dio: dio);

final class _Sub2ApiUsageClient implements Sub2ApiUsageClient {
  _Sub2ApiUsageClient({
    required Sub2ApiRequestExecutor requestExecutor,
    required Dio dio,
  }) : _requestExecutor = requestExecutor,
       _service = Sub2ApiUsageService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiUsageService _service;

  @override
  Future<Sub2ApiPage<Sub2ApiUsageRecord>> list(
    Sub2ApiUsageQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) => _service.list(
      query.page,
      query.pageSize,
      query.apiKeyId,
      query.groupId,
      query.model,
      query.requestType,
      query.stream,
      query.billingType,
      query.billingMode,
      _date(query.startDate),
      _date(query.endDate),
      query.timezone,
      query.sortBy,
      query.sortOrder,
      cancelToken,
      options,
      authorization,
    ),
    decode: mapUsagePage,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiUsageRecord> detail(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) =>
        _service.detail(id, cancelToken, options, authorization),
    decode: mapUsageDetail,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiUsageStats> stats(
    Sub2ApiUsageQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) => _service.stats(
      query.apiKeyId,
      query.groupId,
      query.model,
      query.requestType,
      query.stream,
      query.billingType,
      query.billingMode,
      _date(query.startDate),
      _date(query.endDate),
      query.timezone,
      cancelToken,
      options,
      authorization,
    ),
    decode: mapUsageStatistics,
    requestOptions: requestOptions,
  );

  static String? _date(DateTime? value) =>
      value?.toIso8601String().split('T').first;
}
