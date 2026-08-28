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

  @GET('/api/v1/admin/settings/overload-cooldown')
  Future<HttpResponse<Object?>> getOverloadCooldown(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/settings/overload-cooldown')
  Future<HttpResponse<Object?>> updateOverloadCooldown(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/settings/rate-limit-429-cooldown')
  Future<HttpResponse<Object?>> getRateLimit429Cooldown(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/settings/rate-limit-429-cooldown')
  Future<HttpResponse<Object?>> updateRateLimit429Cooldown(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/settings/panel-rate-limit')
  Future<HttpResponse<Object?>> getPanelRateLimit(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/settings/panel-rate-limit')
  Future<HttpResponse<Object?>> updatePanelRateLimit(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/settings/stream-timeout')
  Future<HttpResponse<Object?>> getStreamTimeout(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/settings/stream-timeout')
  Future<HttpResponse<Object?>> updateStreamTimeout(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/settings/rectifier')
  Future<HttpResponse<Object?>> getRectifier(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/settings/rectifier')
  Future<HttpResponse<Object?>> updateRectifier(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/settings/beta-policy')
  Future<HttpResponse<Object?>> getBetaPolicy(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/settings/beta-policy')
  Future<HttpResponse<Object?>> updateBetaPolicy(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/settings/web-search-emulation')
  Future<HttpResponse<Object?>> getWebSearch(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/settings/web-search-emulation')
  Future<HttpResponse<Object?>> updateWebSearch(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/settings/web-search-emulation/reset-usage')
  Future<HttpResponse<Object?>> resetWebSearchUsage(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/settings/web-search-emulation/test')
  Future<HttpResponse<Object?>> testWebSearch(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
}
