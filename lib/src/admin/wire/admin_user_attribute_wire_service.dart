import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_user_attribute_wire_service.g.dart';

@RestApi()
abstract class AdminUserAttributeWireService {
  factory AdminUserAttributeWireService(Dio dio, {String? baseUrl}) =
      _AdminUserAttributeWireService;
  @GET('/api/v1/admin/user-attributes')
  Future<HttpResponse<Object?>> list(
    @Query('enabled') bool enabledOnly,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
  @POST('/api/v1/admin/user-attributes')
  Future<HttpResponse<Object?>> create(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
  @POST('/api/v1/admin/user-attributes/batch')
  Future<HttpResponse<Object?>> batch(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
  @PUT('/api/v1/admin/user-attributes/reorder')
  Future<HttpResponse<Object?>> reorder(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
  @PUT('/api/v1/admin/user-attributes/{id}')
  Future<HttpResponse<Object?>> update(
    @Path('id') int id,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
  @DELETE('/api/v1/admin/user-attributes/{id}')
  Future<HttpResponse<Object?>> delete(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
