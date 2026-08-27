import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_compliance_wire_service.g.dart';

@RestApi()
abstract class AdminComplianceWireService {
  factory AdminComplianceWireService(Dio dio, {String? baseUrl}) =
      _AdminComplianceWireService;

  @GET('/api/v1/admin/compliance')
  Future<HttpResponse<Object?>> getStatus(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/compliance/accept')
  Future<HttpResponse<Object?>> accept(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
