import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_scheduled_test_wire_service.g.dart';

@RestApi()
abstract class AdminScheduledTestWireService {
  factory AdminScheduledTestWireService(Dio dio, {String? baseUrl}) =
      _AdminScheduledTestWireService;

  @POST('/api/v1/admin/scheduled-test-plans')
  Future<HttpResponse<Object?>> create(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @PUT('/api/v1/admin/scheduled-test-plans/{id}')
  Future<HttpResponse<Object?>> update(
    @Path('id') int planId,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @DELETE('/api/v1/admin/scheduled-test-plans/{id}')
  Future<HttpResponse<Object?>> delete(
    @Path('id') int planId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );

  @GET('/api/v1/admin/scheduled-test-plans/{id}/results')
  Future<HttpResponse<Object?>> listResults(
    @Path('id') int planId,
    @Query('limit') int limit,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
    @Header('x-api-key') String? apiKey,
  );
}
