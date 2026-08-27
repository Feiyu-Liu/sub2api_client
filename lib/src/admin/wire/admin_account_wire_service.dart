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

  @POST('/api/v1/admin/accounts')
  Future<HttpResponse<Object?>> createAccount(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
    @Header('Idempotency-Key') String idempotencyKey,
  );

  @POST('/api/v1/admin/accounts/batch')
  Future<HttpResponse<Object?>> batchCreateAccounts(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
    @Header('Idempotency-Key') String idempotencyKey,
  );

  @POST('/api/v1/admin/accounts/{id}/duplicate')
  Future<HttpResponse<Object?>> duplicateAccount(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
    @Header('Idempotency-Key') String idempotencyKey,
  );

  @DELETE('/api/v1/admin/accounts/{id}')
  Future<HttpResponse<Object?>> deleteAccount(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/batch-delete')
  Future<HttpResponse<Object?>> batchDeleteAccounts(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/batch-clear-error')
  Future<HttpResponse<Object?>> batchClearAccountErrors(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/batch-refresh')
  Future<HttpResponse<Object?>> batchRefreshAccountCredentials(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/batch-refresh-tier')
  Future<HttpResponse<Object?>> batchRefreshAccountTiers(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/refresh')
  Future<HttpResponse<Object?>> refreshAccountCredentials(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/refresh-tier')
  Future<HttpResponse<Object?>> refreshAccountTier(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/models/sync-upstream-preview')
  Future<HttpResponse<Object?>> previewUpstreamModels(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/shadow')
  Future<HttpResponse<Object?>> createShadow(
    @Path('id') int parentAccountId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/sync/crs/preview')
  Future<HttpResponse<Object?>> previewCrs(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/sync/crs')
  Future<HttpResponse<Object?>> syncFromCrs(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/generate-auth-url')
  Future<HttpResponse<Object?>> generateOAuthAuthorization(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/generate-setup-token-url')
  Future<HttpResponse<Object?>> generateSetupTokenAuthorization(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/exchange-code')
  Future<HttpResponse<Object?>> exchangeOAuthCode(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/exchange-setup-token-code')
  Future<HttpResponse<Object?>> exchangeSetupTokenCode(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/cookie-auth')
  Future<HttpResponse<Object?>> authenticateOAuthCookie(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/setup-token-cookie-auth')
  Future<HttpResponse<Object?>> authenticateSetupTokenCookie(
    @Body() Map<String, Object?> body,
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

  @PUT('/api/v1/admin/accounts/upstream-billing-probe/settings')
  Future<HttpResponse<Object?>> updateUpstreamBillingProbeSettings(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/upstream-billing-probe/batch')
  Future<HttpResponse<Object?>> probeUpstreamBillingBatch(
    @Body() Map<String, Object?> body,
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

  @PUT('/api/v1/admin/accounts/ollama-cloud-usage/settings')
  Future<HttpResponse<Object?>> updateOllamaCloudUsageSettings(
    @Body() Map<String, Object?> body,
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

  @PUT('/api/v1/admin/accounts/{id}/upstream-billing-probe')
  Future<HttpResponse<Object?>> setUpstreamBillingProbeEnabled(
    @Path('id') int accountId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/upstream-billing-probe')
  Future<HttpResponse<Object?>> probeUpstreamBilling(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/accounts/{id}/ollama-cloud-usage/session')
  Future<HttpResponse<Object?>> saveOllamaCloudUsageSession(
    @Path('id') int accountId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/accounts/{id}/ollama-cloud-usage/session')
  Future<HttpResponse<Object?>> deleteOllamaCloudUsageSession(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/accounts/{id}/ollama-cloud-usage/auto-refresh')
  Future<HttpResponse<Object?>> setOllamaCloudUsageAutoRefresh(
    @Path('id') int accountId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/ollama-cloud-usage/refresh')
  Future<HttpResponse<Object?>> refreshOllamaCloudUsage(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/recover-state')
  Future<HttpResponse<Object?>> recoverAccountState(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/clear-error')
  Future<HttpResponse<Object?>> clearAccountError(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/revert-proxy-fallback')
  Future<HttpResponse<Object?>> revertAccountProxyFallback(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/clear-rate-limit')
  Future<HttpResponse<Object?>> clearAccountRateLimit(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/reset-quota')
  Future<HttpResponse<Object?>> resetAccountQuota(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/accounts/{id}/temp-unschedulable')
  Future<HttpResponse<Object?>> clearTempUnschedulable(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/schedulable')
  Future<HttpResponse<Object?>> setAccountSchedulable(
    @Path('id') int accountId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/set-privacy')
  Future<HttpResponse<Object?>> setAccountPrivacy(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/usage/batch')
  Future<HttpResponse<Object?>> batchAccountUsage(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/today-stats/batch')
  Future<HttpResponse<Object?>> batchAccountTodayStats(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/check-mixed-channel')
  Future<HttpResponse<Object?>> checkMixedChannel(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/accounts/{id}/models/sync-upstream')
  Future<HttpResponse<Object?>> syncUpstreamModels(
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
