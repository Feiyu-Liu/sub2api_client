import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_redeem_code_wire_service.g.dart';

@RestApi()
abstract class AdminRedeemCodeWireService {
  factory AdminRedeemCodeWireService(Dio dio, {String? baseUrl}) =
      _AdminRedeemCodeWireService;

  @GET('/api/v1/admin/redeem-codes')
  Future<HttpResponse<Object?>> list(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/redeem-codes/stats')
  Future<HttpResponse<Object?>> stats(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/redeem-codes/export')
  Future<HttpResponse<Object?>> export(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/redeem-codes/{id}')
  Future<HttpResponse<Object?>> get(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/redeem-codes/generate')
  Future<HttpResponse<Object?>> generate(
    @Body() Map<String, Object?> body,
    @Header('Idempotency-Key') String idempotencyKey,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/redeem-codes/create-and-redeem')
  Future<HttpResponse<Object?>> createAndRedeem(
    @Body() Map<String, Object?> body,
    @Header('Idempotency-Key') String idempotencyKey,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/redeem-codes/{id}')
  Future<HttpResponse<Object?>> delete(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/redeem-codes/batch-delete')
  Future<HttpResponse<Object?>> batchDelete(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/redeem-codes/batch-update')
  Future<HttpResponse<Object?>> batchUpdate(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @POST('/api/v1/admin/redeem-codes/{id}/expire')
  Future<HttpResponse<Object?>> expire(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
