import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_openai_wire_service.g.dart';

@RestApi()
abstract class AdminOpenAIWireService {
  factory AdminOpenAIWireService(Dio dio, {String? baseUrl}) =
      _AdminOpenAIWireService;

  @POST('/api/v1/admin/openai/generate-auth-url')
  Future<HttpResponse<Object?>> generateAuthUrl(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/openai/exchange-code')
  Future<HttpResponse<Object?>> exchangeCode(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/openai/refresh-token')
  Future<HttpResponse<Object?>> refreshToken(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/openai/accounts/{id}/refresh')
  Future<HttpResponse<Object?>> refreshAccount(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/openai/create-from-oauth')
  Future<HttpResponse<Object?>> createFromOAuth(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/openai/create-from-codex-pat')
  Future<HttpResponse<Object?>> createFromCodexPat(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/openai/accounts/{id}/quota')
  Future<HttpResponse<Object?>> quota(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/openai/accounts/{id}/quota/refresh')
  Future<HttpResponse<Object?>> refreshQuota(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/openai/accounts/{id}/reset-quota')
  Future<HttpResponse<Object?>> resetQuota(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
