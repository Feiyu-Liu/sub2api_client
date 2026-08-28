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
}
