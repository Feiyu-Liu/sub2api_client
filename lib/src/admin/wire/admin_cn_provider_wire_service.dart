import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_cn_provider_wire_service.g.dart';

@RestApi()
abstract class AdminCNProviderWireService {
  factory AdminCNProviderWireService(Dio dio, {String? baseUrl}) =
      _AdminCNProviderWireService;

  @GET('/api/v1/admin/cn-providers/accounts/{id}/quota')
  Future<HttpResponse<Object?>> getQuota(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/cn-providers/accounts/{id}/balance')
  Future<HttpResponse<Object?>> getBalance(
    @Path('id') int accountId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
