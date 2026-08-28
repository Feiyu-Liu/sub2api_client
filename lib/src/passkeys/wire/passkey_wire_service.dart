import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'passkey_wire_service.g.dart';

@RestApi()
abstract class PasskeyWireService {
  factory PasskeyWireService(Dio dio, {String? baseUrl}) = _PasskeyWireService;

  @GET('/api/v1/user/passkeys')
  Future<HttpResponse<Object?>> list(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @PATCH('/api/v1/user/passkeys/{id}')
  Future<HttpResponse<Object?>> rename(
    @Path('id') int id,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @DELETE('/api/v1/user/passkeys/{id}')
  Future<HttpResponse<Object?>> delete(
    @Path('id') int id,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/passkey/login/begin')
  Future<HttpResponse<Object?>> beginLogin(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/passkey/login/finish')
  Future<HttpResponse<Object?>> finishLogin(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/user/passkeys/register/begin')
  Future<HttpResponse<Object?>> beginRegistration(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/user/passkeys/register/finish')
  Future<HttpResponse<Object?>> finishRegistration(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
