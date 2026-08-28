import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_wire_service.g.dart';

/// Retrofit-only description of the user endpoints.
@RestApi()
abstract class UserWireService {
  factory UserWireService(Dio dio, {String? baseUrl}) = _UserWireService;

  @PUT('/api/v1/user/password')
  Future<HttpResponse<Map<String, Object?>>> changePassword(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/user/profile')
  Future<HttpResponse<Map<String, Object?>>> getProfile(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/user/aff')
  Future<HttpResponse<Map<String, Object?>>> getAffiliate(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/user/aff/transfer')
  Future<HttpResponse<Map<String, Object?>>> transferAffiliateQuota(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @PUT('/api/v1/user')
  Future<HttpResponse<Map<String, Object?>>> updateProfile(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
