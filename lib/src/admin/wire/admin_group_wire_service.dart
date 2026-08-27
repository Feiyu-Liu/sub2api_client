import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_group_wire_service.g.dart';

@RestApi()
abstract class AdminGroupWireService {
  factory AdminGroupWireService(Dio dio, {String? baseUrl}) =
      _AdminGroupWireService;

  @GET('/api/v1/admin/groups')
  Future<HttpResponse<Object?>> listGroups(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/groups/all')
  Future<HttpResponse<Object?>> allGroups(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/groups/usage-summary')
  Future<HttpResponse<Object?>> usageSummary(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/groups/capacity-summary')
  Future<HttpResponse<Object?>> capacitySummary(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/groups/live-capability')
  Future<HttpResponse<Object?>> liveCapability(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/groups/{id}/models-list-candidates')
  Future<HttpResponse<Object?>> modelsListCandidates(
    @Path('id') int groupId,
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/groups/{id}/composite-routes')
  Future<HttpResponse<Object?>> compositeRoutes(
    @Path('id') int groupId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/groups/{id}')
  Future<HttpResponse<Object?>> getGroup(
    @Path('id') int groupId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/groups/{id}/stats')
  Future<HttpResponse<Object?>> groupStats(
    @Path('id') int groupId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/groups/{id}/rate-multipliers')
  Future<HttpResponse<Object?>> rateMultipliers(
    @Path('id') int groupId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/groups/{id}/api-keys')
  Future<HttpResponse<Object?>> apiKeys(
    @Path('id') int groupId,
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/groups/sort-order')
  Future<HttpResponse<Object?>> updateSortOrder(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/groups/{id}/composite-routes')
  Future<HttpResponse<Object?>> createCompositeRoute(
    @Path('id') int groupId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/groups/{id}/composite-routes/preview')
  Future<HttpResponse<Object?>> previewCompositeRoute(
    @Path('id') int groupId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/groups/{id}/composite-routes/{route_id}')
  Future<HttpResponse<Object?>> updateCompositeRoute(
    @Path('id') int groupId,
    @Path('route_id') int routeId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/groups/{id}/composite-routes/{route_id}')
  Future<HttpResponse<Object?>> deleteCompositeRoute(
    @Path('id') int groupId,
    @Path('route_id') int routeId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/groups/{id}/duplicate')
  Future<HttpResponse<Object?>> duplicateGroup(
    @Path('id') int groupId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
    @Header('Idempotency-Key') String idempotencyKey,
  );

  @DELETE('/api/v1/admin/groups/{id}')
  Future<HttpResponse<Object?>> deleteGroup(
    @Path('id') int groupId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/groups/{id}/rate-multipliers')
  Future<HttpResponse<Object?>> setRateMultipliers(
    @Path('id') int groupId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/groups/{id}/rate-multipliers')
  Future<HttpResponse<Object?>> clearRateMultipliers(
    @Path('id') int groupId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/groups/{id}/rpm-overrides')
  Future<HttpResponse<Object?>> setRpmOverrides(
    @Path('id') int groupId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/groups/{id}/rpm-overrides')
  Future<HttpResponse<Object?>> clearRpmOverrides(
    @Path('id') int groupId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
