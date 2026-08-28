import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_antigravity_oauth_wire_service.g.dart';

@RestApi()
abstract class AdminAntigravityOAuthWireService {
  factory AdminAntigravityOAuthWireService(Dio dio, {String? baseUrl}) =
      _AdminAntigravityOAuthWireService;

  @POST('/api/v1/admin/antigravity/oauth/auth-url')
  Future<HttpResponse<Object?>> generateAuthorization(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/antigravity/oauth/exchange-code')
  Future<HttpResponse<Object?>> exchangeCode(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/antigravity/oauth/refresh-token')
  Future<HttpResponse<Object?>> validateRefreshToken(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
