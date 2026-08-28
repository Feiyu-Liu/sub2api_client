import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'access_wire_service.g.dart';

@RestApi()
abstract class AccessWireService {
  factory AccessWireService(Dio dio, {String? baseUrl}) = _AccessWireService;

  @GET('/api/v1/groups/available')
  Future<HttpResponse<Object?>> getAvailableGroups(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/channels/available')
  Future<HttpResponse<Object?>> getAvailableChannels(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/groups/rates')
  Future<HttpResponse<Object?>> getGroupRates(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/user/platform-quotas')
  Future<HttpResponse<Object?>> getPlatformQuotas(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/user/api-keys/{id}/usage/daily')
  Future<HttpResponse<Object?>> getApiKeyDailyUsage(
    @Path('id') int id,
    @Query('days') int days,
    @Query('timezone') String? timezone,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
