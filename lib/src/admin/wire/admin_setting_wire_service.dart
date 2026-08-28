import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_setting_wire_service.g.dart';

@RestApi()
abstract class AdminSettingWireService {
  factory AdminSettingWireService(Dio dio, {String? baseUrl}) =
      _AdminSettingWireService;

  @GET('/api/v1/admin/settings/admin-api-key')
  Future<HttpResponse<Object?>> getAdminApiKey(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/settings/admin-api-key/regenerate')
  Future<HttpResponse<Object?>> regenerateAdminApiKey(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/settings/admin-api-key')
  Future<HttpResponse<Object?>> deleteAdminApiKey(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
