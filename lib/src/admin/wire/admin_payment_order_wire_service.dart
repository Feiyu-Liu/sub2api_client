import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_payment_order_wire_service.g.dart';

@RestApi()
abstract class AdminPaymentOrderWireService {
  factory AdminPaymentOrderWireService(Dio dio, {String? baseUrl}) =
      _AdminPaymentOrderWireService;

  @GET('/api/v1/admin/payment/dashboard')
  Future<HttpResponse<Object?>> dashboard(
    @Query('days') int days,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/payment/orders')
  Future<HttpResponse<Object?>> listOrders(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/payment/orders/{id}')
  Future<HttpResponse<Object?>> getOrder(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/payment/orders/{id}/cancel')
  Future<HttpResponse<Object?>> cancelOrder(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/payment/orders/{id}/retry')
  Future<HttpResponse<Object?>> retryOrder(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/payment/orders/{id}/refund')
  Future<HttpResponse<Object?>> refund(
    @Path('id') int id,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/payment/orders/{id}/refund/query')
  Future<HttpResponse<Object?>> queryRefund(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
