import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_channel_monitor_v2_wire_service.g.dart';

@RestApi()
abstract class AdminChannelMonitorV2WireService {
  factory AdminChannelMonitorV2WireService(Dio dio, {String? baseUrl}) =
      _AdminChannelMonitorV2WireService;

  @GET('/api/v1/admin/channel-monitor-v2/config')
  Future<HttpResponse<Object?>> config(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/channel-monitor-v2/config')
  Future<HttpResponse<Object?>> updateConfig(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/channel-monitor-v2/dimensions')
  Future<HttpResponse<Object?>> dimensions(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/channel-monitor-v2/snapshot')
  Future<HttpResponse<Object?>> snapshot(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/channel-monitor-v2/models')
  Future<HttpResponse<Object?>> models(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/channel-monitor-v2/matrix')
  Future<HttpResponse<Object?>> matrix(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/channel-monitor-v2/errors')
  Future<HttpResponse<Object?>> errors(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/channel-monitor-v2/users')
  Future<HttpResponse<Object?>> users(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
