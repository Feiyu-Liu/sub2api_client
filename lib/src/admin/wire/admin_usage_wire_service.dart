import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_usage_wire_service.g.dart';

@RestApi()
abstract class AdminUsageWireService {
  factory AdminUsageWireService(Dio dio, {String? baseUrl}) =
      _AdminUsageWireService;

  @GET('/api/v1/admin/usage')
  Future<HttpResponse<Object?>> list(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/usage/stats')
  Future<HttpResponse<Object?>> stats(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/usage/search-users')
  Future<HttpResponse<Object?>> searchUsers(
    @Query('q') String query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/usage/search-api-keys')
  Future<HttpResponse<Object?>> searchApiKeys(
    @Query('user_id') int? userId,
    @Query('q') String query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/usage/cleanup-tasks')
  Future<HttpResponse<Object?>> cleanupTasks(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/usage/cleanup-tasks')
  Future<HttpResponse<Object?>> createCleanupTask(
    @Body() Map<String, Object?> body,
    @Header('Idempotency-Key') String idempotencyKey,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/usage/cleanup-tasks/{id}/cancel')
  Future<HttpResponse<Object?>> cancelCleanupTask(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
