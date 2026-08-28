import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_ops_error_wire_service.g.dart';

@RestApi()
abstract class AdminOpsErrorWireService {
  factory AdminOpsErrorWireService(Dio dio, {String? baseUrl}) =
      _AdminOpsErrorWireService;
  @GET('/api/v1/admin/ops/errors')
  Future<HttpResponse<Object?>> legacyList(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/errors/{id}')
  Future<HttpResponse<Object?>> legacyDetail(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/ops/errors/{id}/resolve')
  Future<HttpResponse<Object?>> legacyResolve(
    @Path('id') int id,
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/request-errors')
  Future<HttpResponse<Object?>> requestList(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/request-errors/{id}')
  Future<HttpResponse<Object?>> requestDetail(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/request-errors/{id}/upstream-errors')
  Future<HttpResponse<Object?>> correlated(
    @Path('id') int id,
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/ops/request-errors/{id}/resolve')
  Future<HttpResponse<Object?>> requestResolve(
    @Path('id') int id,
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/upstream-errors')
  Future<HttpResponse<Object?>> upstreamList(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/upstream-errors/{id}')
  Future<HttpResponse<Object?>> upstreamDetail(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/ops/upstream-errors/{id}/resolve')
  Future<HttpResponse<Object?>> upstreamResolve(
    @Path('id') int id,
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/requests')
  Future<HttpResponse<Object?>> requests(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
}
