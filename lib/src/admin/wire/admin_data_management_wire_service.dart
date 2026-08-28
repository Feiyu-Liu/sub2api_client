import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'admin_data_management_wire_service.g.dart';

@RestApi()
abstract class AdminDataManagementWireService {
  factory AdminDataManagementWireService(Dio dio, {String? baseUrl}) =
      _AdminDataManagementWireService;
  @GET('/api/v1/admin/data-management/agent/health')
  Future<HttpResponse<Object?>> health(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/data-management/config')
  Future<HttpResponse<Object?>> getConfig(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/data-management/config')
  Future<HttpResponse<Object?>> updateConfig(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/data-management/sources/{source_type}/profiles')
  Future<HttpResponse<Object?>> listSources(
    @Path('source_type') String t,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/data-management/sources/{source_type}/profiles')
  Future<HttpResponse<Object?>> createSource(
    @Path('source_type') String t,
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT(
    '/api/v1/admin/data-management/sources/{source_type}/profiles/{profile_id}',
  )
  Future<HttpResponse<Object?>> updateSource(
    @Path('source_type') String t,
    @Path('profile_id') String id,
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @DELETE(
    '/api/v1/admin/data-management/sources/{source_type}/profiles/{profile_id}',
  )
  Future<HttpResponse<Object?>> deleteSource(
    @Path('source_type') String t,
    @Path('profile_id') String id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST(
    '/api/v1/admin/data-management/sources/{source_type}/profiles/{profile_id}/activate',
  )
  Future<HttpResponse<Object?>> activateSource(
    @Path('source_type') String t,
    @Path('profile_id') String id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/data-management/s3/test')
  Future<HttpResponse<Object?>> testS3(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/data-management/s3/profiles')
  Future<HttpResponse<Object?>> listS3(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/data-management/s3/profiles')
  Future<HttpResponse<Object?>> createS3(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/data-management/s3/profiles/{profile_id}')
  Future<HttpResponse<Object?>> updateS3(
    @Path('profile_id') String id,
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @DELETE('/api/v1/admin/data-management/s3/profiles/{profile_id}')
  Future<HttpResponse<Object?>> deleteS3(
    @Path('profile_id') String id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/data-management/s3/profiles/{profile_id}/activate')
  Future<HttpResponse<Object?>> activateS3(
    @Path('profile_id') String id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/data-management/backups')
  Future<HttpResponse<Object?>> createBackup(
    @Header('X-Idempotency-Key') String key,
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/data-management/backups')
  Future<HttpResponse<Object?>> listBackups(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/data-management/backups/{job_id}')
  Future<HttpResponse<Object?>> getBackup(
    @Path('job_id') String id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
}
