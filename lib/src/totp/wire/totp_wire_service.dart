import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'totp_wire_service.g.dart';

@RestApi()
abstract class TotpWireService {
  factory TotpWireService(Dio dio, {String? baseUrl}) = _TotpWireService;

  @GET('/api/v1/user/totp/status')
  Future<HttpResponse<Object?>> getStatus(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/user/totp/verification-method')
  Future<HttpResponse<Object?>> getVerificationMethod(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/user/totp/send-code')
  Future<HttpResponse<Object?>> sendEmailVerificationCode(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('Accept-Language') String? locale,
  );

  @POST('/api/v1/user/totp/setup')
  Future<HttpResponse<Object?>> beginSetup(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/user/totp/enable')
  Future<HttpResponse<Object?>> enable(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/user/totp/disable')
  Future<HttpResponse<Object?>> disable(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/user/totp/step-up')
  Future<HttpResponse<Object?>> stepUp(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
