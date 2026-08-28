import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_ops_observability_wire_service.g.dart';

@RestApi()
abstract class AdminOpsObservabilityWireService {
  factory AdminOpsObservabilityWireService(Dio dio, {String? baseUrl}) =
      _AdminOpsObservabilityWireService;

  @GET('/api/v1/admin/ops/ingress-rejections')
  Future<HttpResponse<Object?>> listIngressRejects(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/ops/ingress-rejections/health')
  Future<HttpResponse<Object?>> getIngressHealth(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/ops/auth-cache-invalidation/health')
  Future<HttpResponse<Object?>> getAuthCacheHealth(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/ops/system-logs')
  Future<HttpResponse<Object?>> listSystemLogs(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/ops/system-logs/cleanup')
  Future<HttpResponse<Object?>> cleanupSystemLogs(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/ops/system-logs/health')
  Future<HttpResponse<Object?>> getSystemLogHealth(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
