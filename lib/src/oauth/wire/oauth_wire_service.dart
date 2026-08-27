import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'oauth_wire_service.g.dart';

@RestApi()
abstract class OAuthWireService {
  factory OAuthWireService(Dio dio, {String? baseUrl}) = _OAuthWireService;

  @POST('/api/v1/auth/oauth/bind-token')
  Future<HttpResponse<Object?>> prepareBindingCookie(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/pending/exchange')
  Future<HttpResponse<Object?>> exchangePendingCompletion(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/pending/send-verify-code')
  Future<HttpResponse<Object?>> sendPendingEmailCode(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('Accept-Language') String? locale,
  );

  @POST('/api/v1/auth/oauth/pending/create-account')
  Future<HttpResponse<Object?>> createPendingAccount(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/pending/bind-login')
  Future<HttpResponse<Object?>> bindPendingLogin(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/github/complete-registration')
  Future<HttpResponse<Object?>> completeGitHubRegistration(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/google/complete-registration')
  Future<HttpResponse<Object?>> completeGoogleRegistration(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/linuxdo/complete-registration')
  Future<HttpResponse<Object?>> completeLinuxDoRegistration(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/oidc/complete-registration')
  Future<HttpResponse<Object?>> completeOidcRegistration(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/wechat/complete-registration')
  Future<HttpResponse<Object?>> completeWeChatRegistration(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/dingtalk/complete-registration')
  Future<HttpResponse<Object?>> completeDingTalkRegistration(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/linuxdo/create-account')
  Future<HttpResponse<Object?>> createLinuxDoAccount(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/oidc/create-account')
  Future<HttpResponse<Object?>> createOidcAccount(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/wechat/create-account')
  Future<HttpResponse<Object?>> createWeChatAccount(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/dingtalk/create-account')
  Future<HttpResponse<Object?>> createDingTalkAccount(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/linuxdo/bind-login')
  Future<HttpResponse<Object?>> bindLinuxDoLogin(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/oidc/bind-login')
  Future<HttpResponse<Object?>> bindOidcLogin(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/wechat/bind-login')
  Future<HttpResponse<Object?>> bindWeChatLogin(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/dingtalk/bind-login')
  Future<HttpResponse<Object?>> bindDingTalkLogin(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/github/start')
  Future<HttpResponse<Object?>> startGitHub(
    @Query('redirect') String redirect,
    @Query('intent') String intent,
    @Query('promo_code') String? promoCode,
    @Query('aff_code') String? affiliateCode,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/google/start')
  Future<HttpResponse<Object?>> startGoogle(
    @Query('redirect') String redirect,
    @Query('intent') String intent,
    @Query('promo_code') String? promoCode,
    @Query('aff_code') String? affiliateCode,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/linuxdo/start')
  Future<HttpResponse<Object?>> startLinuxDo(
    @Query('redirect') String redirect,
    @Query('intent') String intent,
    @Query('promo_code') String? promoCode,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/dingtalk/start')
  Future<HttpResponse<Object?>> startDingTalk(
    @Query('redirect') String redirect,
    @Query('intent') String intent,
    @Query('promo_code') String? promoCode,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/wechat/start')
  Future<HttpResponse<Object?>> startWeChat(
    @Query('redirect') String redirect,
    @Query('intent') String intent,
    @Query('mode') String? mode,
    @Query('promo_code') String? promoCode,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/auth/oauth/oidc/start')
  Future<HttpResponse<Object?>> startOidc(
    @Query('redirect') String redirect,
    @Query('intent') String intent,
    @Query('promo_code') String? promoCode,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
