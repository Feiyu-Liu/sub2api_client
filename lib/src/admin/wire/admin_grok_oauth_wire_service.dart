import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_grok_oauth_wire_service.g.dart';

@RestApi()
abstract class AdminGrokOAuthWireService {
  factory AdminGrokOAuthWireService(Dio dio, {String? baseUrl}) =
      _AdminGrokOAuthWireService;

  @GET('/api/v1/admin/grok/oauth/capabilities')
  Future<HttpResponse<Object?>> capabilities(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/grok/oauth/auth-url')
  Future<HttpResponse<Object?>> authUrl(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/grok/oauth/exchange-code')
  Future<HttpResponse<Object?>> exchangeCode(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/grok/oauth/refresh-token')
  Future<HttpResponse<Object?>> refreshToken(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/grok/oauth/sso-token')
  Future<HttpResponse<Object?>> ssoToken(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/grok/oauth/password')
  Future<HttpResponse<Object?>> password(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/grok/oauth/create-from-oauth')
  Future<HttpResponse<Object?>> createFromOAuth(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/grok/sso-to-oauth')
  Future<HttpResponse<Object?>> ssoToOAuth(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/grok/oauth/reconcile')
  Future<HttpResponse<Object?>> reconcile(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/grok/accounts/{id}/refresh')
  Future<HttpResponse<Object?>> refreshAccount(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/grok/accounts/{id}/quota')
  Future<HttpResponse<Object?>> quota(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/grok/accounts/{id}/reset-quota')
  Future<HttpResponse<Object?>> resetQuota(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/grok/runtime-sanity')
  Future<HttpResponse<Object?>> runtimeSanity(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
}
