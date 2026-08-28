import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'identity_wire_service.g.dart';

@RestApi()
abstract class IdentityWireService {
  factory IdentityWireService(Dio dio, {String? baseUrl}) =
      _IdentityWireService;

  @POST('/api/v1/user/auth-identities/bind/start')
  Future<HttpResponse<Object?>> startBinding(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/user/account-bindings/email/send-code')
  Future<HttpResponse<Object?>> sendEmailBindingCode(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('Accept-Language') String? locale,
  );

  @POST('/api/v1/user/notify-email/send-code')
  Future<HttpResponse<Object?>> sendNotificationEmailCode(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('Accept-Language') String? locale,
  );

  @POST('/api/v1/user/account-bindings/email')
  Future<HttpResponse<Object?>> bindEmail(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @DELETE('/api/v1/user/account-bindings/{provider}')
  Future<HttpResponse<Object?>> unbind(
    @Path('provider') String provider,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/user/notify-email/verify')
  Future<HttpResponse<Object?>> verifyNotificationEmail(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @PUT('/api/v1/user/notify-email/toggle')
  Future<HttpResponse<Object?>> toggleNotificationEmail(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @DELETE('/api/v1/user/notify-email')
  Future<HttpResponse<Object?>> removeNotificationEmail(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
