import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'sub2api_billing_dto.dart';

part 'sub2api_billing_service.g.dart';

@RestApi()
abstract class Sub2ApiBillingService {
  factory Sub2ApiBillingService(Dio dio, {String baseUrl}) =
      _Sub2ApiBillingService;

  @GET('/api/v1/payment/config')
  Future<HttpResponse<Object?>> config(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/payment/limits')
  Future<HttpResponse<Object?>> limits(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/payment/plans')
  Future<HttpResponse<Object?>> plans(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/payment/checkout-info')
  Future<HttpResponse<Object?>> checkoutInfo(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/payment/orders')
  Future<HttpResponse<Object?>> createOrder(
    @Body() Sub2ApiCreateOrderDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/payment/orders/my')
  Future<HttpResponse<Object?>> listOrders(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('status') String? status,
    @Query('order_type') String? orderType,
    @Query('payment_type') String? paymentType,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/payment/orders/{id}')
  Future<HttpResponse<Object?>> order(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/payment/orders/verify')
  Future<HttpResponse<Object?>> verifyOrder(
    @Body() Sub2ApiVerifyOrderDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/payment/orders/{id}/cancel')
  Future<HttpResponse<Object?>> cancelOrder(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/payment/orders/{id}/refund-request')
  Future<HttpResponse<Object?>> requestRefund(
    @Path('id') int id,
    @Body() Sub2ApiRefundRequestDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/payment/orders/refund-eligible-providers')
  Future<HttpResponse<Object?>> refundEligibleProviders(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/payment/public/orders/verify')
  Future<HttpResponse<Object?>> verifyPublicOrder(
    @Body() Sub2ApiVerifyOrderDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/payment/public/orders/resolve')
  Future<HttpResponse<Object?>> resolvePublicOrder(
    @Body() Sub2ApiResolveOrderDto body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
