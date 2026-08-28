import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_setting_wire_service.g.dart';

@RestApi()
abstract class AdminSettingWireService {
  factory AdminSettingWireService(Dio dio, {String? baseUrl}) =
      _AdminSettingWireService;

  @GET('/api/v1/admin/settings/admin-api-key')
  Future<HttpResponse<Object?>> getAdminApiKey(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/settings/admin-api-key/regenerate')
  Future<HttpResponse<Object?>> regenerateAdminApiKey(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/settings/admin-api-key')
  Future<HttpResponse<Object?>> deleteAdminApiKey(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/settings/test-smtp')
  Future<HttpResponse<Object?>> testSmtp(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/settings/send-test-email')
  Future<HttpResponse<Object?>> sendTestEmail(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/settings/email-templates')
  Future<HttpResponse<Object?>> listEmailTemplates(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/settings/email-templates/{event}/{locale}')
  Future<HttpResponse<Object?>> getEmailTemplate(
    @Path('event') String event,
    @Path('locale') String locale,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/settings/email-templates/{event}/{locale}')
  Future<HttpResponse<Object?>> updateEmailTemplate(
    @Path('event') String event,
    @Path('locale') String locale,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST(
    '/api/v1/admin/settings/email-templates/{event}/{locale}/restore-official',
  )
  Future<HttpResponse<Object?>> restoreEmailTemplate(
    @Path('event') String event,
    @Path('locale') String locale,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/settings/email-template-preview')
  Future<HttpResponse<Object?>> previewEmailTemplate(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
}
