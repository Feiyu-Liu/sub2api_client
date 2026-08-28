import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_risk_control_wire_service.g.dart';

@RestApi()
abstract class AdminRiskControlWireService {
  factory AdminRiskControlWireService(Dio dio, {String? baseUrl}) =
      _AdminRiskControlWireService;

  @GET('/api/v1/admin/risk-control/config')
  Future<HttpResponse<Object?>> config(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/risk-control/config')
  Future<HttpResponse<Object?>> updateConfig(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/risk-control/api-keys/test')
  Future<HttpResponse<Object?>> testApiKeys(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/risk-control/status')
  Future<HttpResponse<Object?>> status(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/risk-control/logs')
  Future<HttpResponse<Object?>> logs(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/risk-control/users/{user_id}/unban')
  Future<HttpResponse<Object?>> unbanUser(
    @Path('user_id') int userId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/risk-control/hashes')
  Future<HttpResponse<Object?>> deleteHash(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/risk-control/hashes/all')
  Future<HttpResponse<Object?>> clearHashes(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
