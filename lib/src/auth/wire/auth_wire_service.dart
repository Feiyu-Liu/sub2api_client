import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_wire_service.g.dart';

/// Retrofit-only description of v0.1 authentication endpoints.
@RestApi()
abstract class AuthWireService {
  factory AuthWireService(Dio dio, {String? baseUrl}) = _AuthWireService;

  @POST('/api/v1/auth/login')
  Future<HttpResponse<Object?>> login(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/login/2fa')
  Future<HttpResponse<Object?>> completeTwoFactorLogin(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/logout')
  Future<HttpResponse<Object?>> logout(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/refresh')
  Future<HttpResponse<Object?>> refresh(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/register')
  Future<HttpResponse<Object?>> register(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
