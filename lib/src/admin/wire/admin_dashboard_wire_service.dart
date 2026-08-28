import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'admin_dashboard_wire_dto.dart';

part 'admin_dashboard_wire_service.g.dart';

@RestApi()
abstract class AdminDashboardWireService {
  factory AdminDashboardWireService(Dio dio, {String? baseUrl}) =
      _AdminDashboardWireService;

  @GET('/api/v1/admin/dashboard/stats')
  Future<HttpResponse<Object?>> statsWithJwt(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/dashboard/stats')
  Future<HttpResponse<Object?>> statsWithApiKey(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/dashboard/realtime')
  Future<HttpResponse<Object?>> realtimeWithJwt(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/dashboard/realtime')
  Future<HttpResponse<Object?>> realtimeWithApiKey(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/dashboard/trend')
  Future<HttpResponse<Object?>> trendWithJwt(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/dashboard/trend')
  Future<HttpResponse<Object?>> trendWithApiKey(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/dashboard/models')
  Future<HttpResponse<Object?>> modelsWithJwt(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/dashboard/models')
  Future<HttpResponse<Object?>> modelsWithApiKey(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/dashboard/groups')
  Future<HttpResponse<Object?>> groupsWithJwt(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/dashboard/groups')
  Future<HttpResponse<Object?>> groupsWithApiKey(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/dashboard/api-keys-trend')
  Future<HttpResponse<Object?>> apiKeyTrendWithJwt(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/dashboard/api-keys-trend')
  Future<HttpResponse<Object?>> apiKeyTrendWithApiKey(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/dashboard/users-trend')
  Future<HttpResponse<Object?>> userTrendWithJwt(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/dashboard/users-trend')
  Future<HttpResponse<Object?>> userTrendWithApiKey(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/dashboard/users-ranking')
  Future<HttpResponse<Object?>> userRankingWithJwt(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/dashboard/users-ranking')
  Future<HttpResponse<Object?>> userRankingWithApiKey(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @POST('/api/v1/admin/dashboard/users-usage')
  Future<HttpResponse<Object?>> batchUsersWithJwt(
    @Body() AdminDashboardUserIdsWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @POST('/api/v1/admin/dashboard/users-usage')
  Future<HttpResponse<Object?>> batchUsersWithApiKey(
    @Body() AdminDashboardUserIdsWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @POST('/api/v1/admin/dashboard/api-keys-usage')
  Future<HttpResponse<Object?>> batchApiKeysWithJwt(
    @Body() AdminDashboardApiKeyIdsWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @POST('/api/v1/admin/dashboard/api-keys-usage')
  Future<HttpResponse<Object?>> batchApiKeysWithApiKey(
    @Body() AdminDashboardApiKeyIdsWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/dashboard/user-breakdown')
  Future<HttpResponse<Object?>> userBreakdownWithJwt(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/dashboard/user-breakdown')
  Future<HttpResponse<Object?>> userBreakdownWithApiKey(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/dashboard/snapshot-v2')
  Future<HttpResponse<Object?>> snapshotWithJwt(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/dashboard/snapshot-v2')
  Future<HttpResponse<Object?>> snapshotWithApiKey(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @POST('/api/v1/admin/dashboard/aggregation/backfill')
  Future<HttpResponse<Object?>> backfillWithJwt(
    @Body() AdminDashboardBackfillRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @POST('/api/v1/admin/dashboard/aggregation/backfill')
  Future<HttpResponse<Object?>> backfillWithApiKey(
    @Body() AdminDashboardBackfillRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );
}
