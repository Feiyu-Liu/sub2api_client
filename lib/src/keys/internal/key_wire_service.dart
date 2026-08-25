import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'key_wire_service.g.dart';

/// Retrofit-only description of the API key endpoints.
@RestApi()
abstract class ApiKeyWireService {
  factory ApiKeyWireService(Dio dio, {String? baseUrl}) = _ApiKeyWireService;

  @POST('/api/v1/keys')
  Future<HttpResponse<Map<String, Object?>>> create(
    @Body() Map<String, Object?> body,
    @Header('Idempotency-Key') String idempotencyKey,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @DELETE('/api/v1/keys/{id}')
  Future<HttpResponse<Map<String, Object?>>> delete(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/keys/{id}')
  Future<HttpResponse<Map<String, Object?>>> getById(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/keys')
  Future<HttpResponse<Map<String, Object?>>> list(
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Query('sort_by') String? sortBy,
    @Query('sort_order') String? sortOrder,
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('group_id') int? groupId,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @PUT('/api/v1/keys/{id}')
  Future<HttpResponse<Map<String, Object?>>> update(
    @Path('id') int id,
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
