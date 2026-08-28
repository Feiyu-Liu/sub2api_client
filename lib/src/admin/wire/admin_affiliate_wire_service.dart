import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_affiliate_wire_service.g.dart';

@RestApi()
abstract class AdminAffiliateWireService {
  factory AdminAffiliateWireService(Dio dio, {String? baseUrl}) =
      _AdminAffiliateWireService;

  @GET('/api/v1/admin/affiliates/invites')
  Future<HttpResponse<Object?>> invites(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/affiliates/rebates')
  Future<HttpResponse<Object?>> rebates(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/affiliates/transfers')
  Future<HttpResponse<Object?>> transfers(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/affiliates/users')
  Future<HttpResponse<Object?>> users(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/affiliates/users/lookup')
  Future<HttpResponse<Object?>> lookupUsers(
    @Query('q') String query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/affiliates/users/batch-rate')
  Future<HttpResponse<Object?>> batchRate(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/affiliates/users/{user_id}/overview')
  Future<HttpResponse<Object?>> overview(
    @Path('user_id') int userId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/affiliates/users/{user_id}')
  Future<HttpResponse<Object?>> updateUser(
    @Path('user_id') int userId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/affiliates/users/{user_id}')
  Future<HttpResponse<Object?>> clearUser(
    @Path('user_id') int userId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
