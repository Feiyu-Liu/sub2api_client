import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_channel_monitor_template_wire_service.g.dart';

@RestApi()
abstract class AdminChannelMonitorTemplateWireService {
  factory AdminChannelMonitorTemplateWireService(Dio dio, {String? baseUrl}) =
      _AdminChannelMonitorTemplateWireService;
  @GET('/api/v1/admin/channel-monitor-templates')
  Future<HttpResponse<Object?>> list(
    @Query('provider') String? provider,
    @Query('api_mode') String? apiMode,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/channel-monitor-templates/{id}')
  Future<HttpResponse<Object?>> get(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/channel-monitor-templates')
  Future<HttpResponse<Object?>> create(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/channel-monitor-templates/{id}')
  Future<HttpResponse<Object?>> update(
    @Path('id') int id,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @DELETE('/api/v1/admin/channel-monitor-templates/{id}')
  Future<HttpResponse<Object?>> delete(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/channel-monitor-templates/{id}/apply')
  Future<HttpResponse<Object?>> apply(
    @Path('id') int id,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/channel-monitor-templates/{id}/monitors')
  Future<HttpResponse<Object?>> monitors(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
}
