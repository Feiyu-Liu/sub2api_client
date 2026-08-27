import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'admin_user_wire_dto.dart';

part 'admin_user_wire_service.g.dart';

@RestApi()
abstract class AdminUserWireService {
  factory AdminUserWireService(Dio dio, {String? baseUrl}) =
      _AdminUserWireService;

  @POST('/api/v1/admin/users/{id}/replace-group')
  Future<HttpResponse<Object?>> replaceGroupWithJwt(
    @Path('id') int userId,
    @Body() AdminReplaceUserGroupRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @POST('/api/v1/admin/users/{id}/replace-group')
  Future<HttpResponse<Object?>> replaceGroupWithApiKey(
    @Path('id') int userId,
    @Body() AdminReplaceUserGroupRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/users/{id}/rpm-status')
  Future<HttpResponse<Object?>> rpmStatusWithJwt(
    @Path('id') int userId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/users/{id}/rpm-status')
  Future<HttpResponse<Object?>> rpmStatusWithApiKey(
    @Path('id') int userId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @POST('/api/v1/admin/users/batch-concurrency')
  Future<HttpResponse<Object?>> batchConcurrencyWithJwt(
    @Body() AdminBatchConcurrencyRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @POST('/api/v1/admin/users/batch-concurrency')
  Future<HttpResponse<Object?>> batchConcurrencyWithApiKey(
    @Body() AdminBatchConcurrencyRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @POST('/api/v1/admin/users/batch-limits')
  Future<HttpResponse<Object?>> batchLimitsWithJwt(
    @Body() AdminBatchLimitsRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @POST('/api/v1/admin/users/batch-limits')
  Future<HttpResponse<Object?>> batchLimitsWithApiKey(
    @Body() AdminBatchLimitsRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/users/{id}/platform-quotas')
  Future<HttpResponse<Object?>> platformQuotasWithJwt(
    @Path('id') int userId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/users/{id}/platform-quotas')
  Future<HttpResponse<Object?>> platformQuotasWithApiKey(
    @Path('id') int userId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @PUT('/api/v1/admin/users/{id}/platform-quotas')
  Future<HttpResponse<Object?>> updatePlatformQuotasWithJwt(
    @Path('id') int userId,
    @Body() AdminUpdatePlatformQuotasRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @PUT('/api/v1/admin/users/{id}/platform-quotas')
  Future<HttpResponse<Object?>> updatePlatformQuotasWithApiKey(
    @Path('id') int userId,
    @Body() AdminUpdatePlatformQuotasRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @POST('/api/v1/admin/users/{id}/platform-quotas/reset')
  Future<HttpResponse<Object?>> resetPlatformQuotaWithJwt(
    @Path('id') int userId,
    @Body() AdminResetPlatformQuotaRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @POST('/api/v1/admin/users/{id}/platform-quotas/reset')
  Future<HttpResponse<Object?>> resetPlatformQuotaWithApiKey(
    @Path('id') int userId,
    @Body() AdminResetPlatformQuotaRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @GET('/api/v1/admin/users/{id}/attributes')
  Future<HttpResponse<Object?>> attributesWithJwt(
    @Path('id') int userId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @GET('/api/v1/admin/users/{id}/attributes')
  Future<HttpResponse<Object?>> attributesWithApiKey(
    @Path('id') int userId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );

  @PUT('/api/v1/admin/users/{id}/attributes')
  Future<HttpResponse<Object?>> updateAttributesWithJwt(
    @Path('id') int userId,
    @Body() AdminUpdateUserAttributesRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? credential,
  );

  @PUT('/api/v1/admin/users/{id}/attributes')
  Future<HttpResponse<Object?>> updateAttributesWithApiKey(
    @Path('id') int userId,
    @Body() AdminUpdateUserAttributesRequestWireDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('x-api-key') String? credential,
  );
}
