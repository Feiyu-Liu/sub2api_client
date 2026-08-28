import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_announcement_wire_service.g.dart';

@RestApi()
abstract class AdminAnnouncementWireService {
  factory AdminAnnouncementWireService(Dio dio, {String? baseUrl}) =
      _AdminAnnouncementWireService;

  @GET('/api/v1/admin/announcements')
  Future<HttpResponse<Object?>> list(
    @Queries() Map<String, Object?> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
  @GET('/api/v1/admin/announcements/{id}')
  Future<HttpResponse<Object?>> get(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
  @POST('/api/v1/admin/announcements')
  Future<HttpResponse<Object?>> create(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
  @PUT('/api/v1/admin/announcements/{id}')
  Future<HttpResponse<Object?>> update(
    @Path('id') int id,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
  @DELETE('/api/v1/admin/announcements/{id}')
  Future<HttpResponse<Object?>> delete(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
  @GET('/api/v1/admin/announcements/{id}/read-status')
  Future<HttpResponse<Object?>> readStatus(
    @Path('id') int id,
    @Queries() Map<String, Object?> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
