import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_prompt_audit_wire_service.g.dart';

@RestApi()
abstract class AdminPromptAuditWireService {
  factory AdminPromptAuditWireService(Dio dio, {String? baseUrl}) =
      _AdminPromptAuditWireService;

  @GET('/api/v1/admin/prompt-audit/config')
  Future<HttpResponse<Object?>> config(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/prompt-audit/config')
  Future<HttpResponse<Object?>> updateConfig(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/prompt-audit/endpoints/probe')
  Future<HttpResponse<Object?>> probe(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/prompt-audit/runtime')
  Future<HttpResponse<Object?>> runtime(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/prompt-audit/events')
  Future<HttpResponse<Object?>> events(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/prompt-audit/events/{id}')
  Future<HttpResponse<Object?>> event(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @DELETE('/api/v1/admin/prompt-audit/events/{id}')
  Future<HttpResponse<Object?>> deleteEvent(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/prompt-audit/events/batch-delete')
  Future<HttpResponse<Object?>> batchDelete(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/prompt-audit/events/delete-preview')
  Future<HttpResponse<Object?>> deletePreview(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/prompt-audit/events/delete-by-filter')
  Future<HttpResponse<Object?>> deleteByFilter(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
}
