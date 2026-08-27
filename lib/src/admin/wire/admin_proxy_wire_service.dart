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
}
