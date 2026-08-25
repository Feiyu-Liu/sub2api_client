import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'sub2api_usage_service.g.dart';

@RestApi()
abstract class Sub2ApiUsageService {
  factory Sub2ApiUsageService(Dio dio, {String baseUrl}) = _Sub2ApiUsageService;

  @GET('/api/v1/usage')
  Future<HttpResponse<Object?>> list(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('api_key_id') int? apiKeyId,
    @Query('group_id') int? groupId,
    @Query('model') String? model,
    @Query('request_type') String? requestType,
    @Query('stream') bool? stream,
    @Query('billing_type') int? billingType,
    @Query('billing_mode') String? billingMode,
    @Query('start_date') String? startDate,
    @Query('end_date') String? endDate,
    @Query('timezone') String? timezone,
    @Query('sort_by') String sortBy,
    @Query('sort_order') String sortOrder,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/usage/{id}')
  Future<HttpResponse<Object?>> detail(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/usage/stats')
  Future<HttpResponse<Object?>> stats(
    @Query('api_key_id') int? apiKeyId,
    @Query('group_id') int? groupId,
    @Query('model') String? model,
    @Query('request_type') String? requestType,
    @Query('stream') bool? stream,
    @Query('billing_type') int? billingType,
    @Query('billing_mode') String? billingMode,
    @Query('start_date') String? startDate,
    @Query('end_date') String? endDate,
    @Query('timezone') String? timezone,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
