import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_system_wire_service.g.dart';

@RestApi()
abstract class AdminSystemWireService {
  factory AdminSystemWireService(Dio dio, {String? baseUrl}) =
      _AdminSystemWireService;
  @GET('/api/v1/admin/system/version')
  Future<HttpResponse<Object?>> version(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/system/check-updates')
  Future<HttpResponse<Object?>> check(
    @Query('force') bool force,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/system/rollback-versions')
  Future<HttpResponse<Object?>> rollbackVersions(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/system/update')
  Future<HttpResponse<Object?>> update(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
    @Header('Idempotency-Key') String idempotencyKey,
  );
  @POST('/api/v1/admin/system/rollback')
  Future<HttpResponse<Object?>> rollback(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
    @Header('Idempotency-Key') String idempotencyKey,
  );
  @POST('/api/v1/admin/system/restart')
  Future<HttpResponse<Object?>> restart(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
    @Header('Idempotency-Key') String idempotencyKey,
  );
}
