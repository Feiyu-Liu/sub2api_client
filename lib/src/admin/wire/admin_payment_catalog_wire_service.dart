import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_payment_catalog_wire_service.g.dart';

@RestApi()
abstract class AdminPaymentCatalogWireService {
  factory AdminPaymentCatalogWireService(Dio dio, {String? baseUrl}) =
      _AdminPaymentCatalogWireService;

  @GET('/api/v1/admin/payment/config')
  Future<HttpResponse<Object?>> getConfig(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/payment/config')
  Future<HttpResponse<Object?>> updateConfig(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/payment/plans')
  Future<HttpResponse<Object?>> listPlans(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/payment/plans')
  Future<HttpResponse<Object?>> createPlan(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/payment/plans/{id}')
  Future<HttpResponse<Object?>> updatePlan(
    @Path('id') int id,
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @DELETE('/api/v1/admin/payment/plans/{id}')
  Future<HttpResponse<Object?>> deletePlan(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @GET('/api/v1/admin/payment/providers')
  Future<HttpResponse<Object?>> listProviders(
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @POST('/api/v1/admin/payment/providers')
  Future<HttpResponse<Object?>> createProvider(
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @PUT('/api/v1/admin/payment/providers/{id}')
  Future<HttpResponse<Object?>> updateProvider(
    @Path('id') int id,
    @Body() Map<String, Object?> b,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
  @DELETE('/api/v1/admin/payment/providers/{id}')
  Future<HttpResponse<Object?>> deleteProvider(
    @Path('id') int id,
    @CancelRequest() CancelToken c,
    @DioOptions() Options o,
    @Header('Authorization') String? a,
    @Header('x-api-key') String? k,
  );
}
