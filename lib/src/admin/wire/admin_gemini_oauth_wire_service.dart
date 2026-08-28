import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_gemini_oauth_wire_service.g.dart';

@RestApi()
abstract class AdminGeminiOAuthWireService {
  factory AdminGeminiOAuthWireService(Dio dio, {String? baseUrl}) =
      _AdminGeminiOAuthWireService;

  @GET('/api/v1/admin/gemini/oauth/capabilities')
  Future<HttpResponse<Object?>> getCapabilities(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/gemini/oauth/auth-url')
  Future<HttpResponse<Object?>> generateAuthorization(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/gemini/oauth/exchange-code')
  Future<HttpResponse<Object?>> exchangeCode(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
