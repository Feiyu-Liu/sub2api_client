import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_channel_monitor_wire_service.g.dart';

@RestApi()
abstract class AdminChannelMonitorWireService {
  factory AdminChannelMonitorWireService(Dio dio, {String? baseUrl}) =
      _AdminChannelMonitorWireService;

  @GET('/api/v1/admin/channel-monitors')
  Future<HttpResponse<Object?>> list(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/channel-monitors')
  Future<HttpResponse<Object?>> create(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/channel-monitors/{id}')
  Future<HttpResponse<Object?>> get(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/channel-monitors/{id}/duplicate')
  Future<HttpResponse<Object?>> duplicate(
    @Path('id') int id,
    @Header('Idempotency-Key') String idempotencyKey,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/channel-monitors/{id}')
  Future<HttpResponse<Object?>> update(
    @Path('id') int id,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/channel-monitors/{id}')
  Future<HttpResponse<Object?>> delete(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/channel-monitors/{id}/run')
  Future<HttpResponse<Object?>> run(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/channel-monitors/{id}/history')
  Future<HttpResponse<Object?>> history(
    @Path('id') int id,
    @Query('model') String? model,
    @Query('limit') int limit,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
