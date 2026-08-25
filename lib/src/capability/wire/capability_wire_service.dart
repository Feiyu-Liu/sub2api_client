import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'capability_wire_service.g.dart';

/// Retrofit-only description of public capability bootstrap.
@RestApi()
abstract class CapabilityWireService {
  factory CapabilityWireService(Dio dio, {String? baseUrl}) =
      _CapabilityWireService;

  @GET('/api/v1/settings/public')
  Future<HttpResponse<Object?>> getCapabilities(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
