import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_account_wire_service.g.dart';

@RestApi()
abstract class AdminAccountWireService {
  factory AdminAccountWireService(Dio dio, {String? baseUrl}) =
      _AdminAccountWireService;

  @GET('/api/v1/admin/accounts')
  Future<HttpResponse<Object?>> listAccounts(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/{id}')
  Future<HttpResponse<Object?>> getAccount(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/upstream-billing-probe/settings')
  Future<HttpResponse<Object?>> upstreamBillingProbeSettings(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/ollama-cloud-usage/settings')
  Future<HttpResponse<Object?>> ollamaCloudUsageSettings(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/{id}/ollama-cloud-usage')
  Future<HttpResponse<Object?>> ollamaCloudUsage(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/{id}/stats')
  Future<HttpResponse<Object?>> accountStats(
    @Path('id') int accountId,
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/{id}/usage')
  Future<HttpResponse<Object?>> accountUsage(
    @Path('id') int accountId,
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/{id}/temp-unschedulable')
  Future<HttpResponse<Object?>> tempUnschedulable(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/{id}/today-stats')
  Future<HttpResponse<Object?>> todayStats(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/{id}/models')
  Future<HttpResponse<Object?>> accountModels(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/antigravity/default-model-mapping')
  Future<HttpResponse<Object?>> antigravityDefaultModelMapping(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/accounts/{id}/scheduled-test-plans')
  Future<HttpResponse<Object?>> scheduledTestPlans(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
