import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_ops_dashboard_wire_service.g.dart';

@RestApi()
abstract class AdminOpsDashboardWireService {
  factory AdminOpsDashboardWireService(Dio dio, {String? baseUrl}) =
      _AdminOpsDashboardWireService;
  @GET('/api/v1/admin/ops/dashboard/snapshot-v2')
  Future<HttpResponse<Object?>> snapshot(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/dashboard/overview')
  Future<HttpResponse<Object?>> overview(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/dashboard/throughput-trend')
  Future<HttpResponse<Object?>> throughput(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/dashboard/latency-histogram')
  Future<HttpResponse<Object?>> latency(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/dashboard/error-trend')
  Future<HttpResponse<Object?>> errorTrend(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/dashboard/error-distribution')
  Future<HttpResponse<Object?>> errorDistribution(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/ops/dashboard/openai-token-stats')
  Future<HttpResponse<Object?>> openAiTokenStats(
    @Queries() Map<String, dynamic> q,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
}
