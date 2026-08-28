import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_audit_log_wire_service.g.dart';

@RestApi()
abstract class AdminAuditLogWireService {
  factory AdminAuditLogWireService(Dio dio, {String? baseUrl}) =
      _AdminAuditLogWireService;

  @GET('/api/v1/admin/audit-logs')
  Future<HttpResponse<Object?>> list(
    @Queries() Map<String, Object?> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/audit-logs/{id}')
  Future<HttpResponse<Object?>> get(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/audit-logs/clear')
  Future<HttpResponse<Object?>> clear(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
