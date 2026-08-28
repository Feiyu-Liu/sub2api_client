import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_ops_realtime_wire_service.g.dart';

@RestApi()
abstract class AdminOpsRealtimeWireService {
  factory AdminOpsRealtimeWireService(Dio dio, {String? baseUrl}) =
      _AdminOpsRealtimeWireService;
  @GET('/api/v1/admin/ops/concurrency')
  Future<HttpResponse<Object?>> concurrency(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/user-concurrency')
  Future<HttpResponse<Object?>> userConcurrency(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/account-availability')
  Future<HttpResponse<Object?>> availability(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/realtime-traffic')
  Future<HttpResponse<Object?>> traffic(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
}
