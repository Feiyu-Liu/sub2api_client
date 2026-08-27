import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_proxy_wire_service.g.dart';

@RestApi()
abstract class AdminProxyWireService {
  factory AdminProxyWireService(Dio dio, {String? baseUrl}) =
      _AdminProxyWireService;

  @GET('/api/v1/admin/proxies')
  Future<HttpResponse<Object?>> list(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/proxies/all')
  Future<HttpResponse<Object?>> getAll(
    @Query('with_count') bool? withCount,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/proxies/{id}')
  Future<HttpResponse<Object?>> getById(
    @Path('id') int proxyId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/proxies/{id}/accounts')
  Future<HttpResponse<Object?>> getAccounts(
    @Path('id') int proxyId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/proxies/{id}/stats')
  Future<HttpResponse<Object?>> getStats(
    @Path('id') int proxyId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/proxies')
  Future<HttpResponse<Object?>> create(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
    @Header('Idempotency-Key') String idempotencyKey,
  );

  @PUT('/api/v1/admin/proxies/{id}')
  Future<HttpResponse<Object?>> update(
    @Path('id') int proxyId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/proxies/{id}')
  Future<HttpResponse<Object?>> delete(
    @Path('id') int proxyId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/proxies/{id}/test')
  Future<HttpResponse<Object?>> test(
    @Path('id') int proxyId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/proxies/{id}/quality-check')
  Future<HttpResponse<Object?>> qualityCheck(
    @Path('id') int proxyId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/proxies/batch')
  Future<HttpResponse<Object?>> batchCreate(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/proxies/batch-delete')
  Future<HttpResponse<Object?>> batchDelete(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
