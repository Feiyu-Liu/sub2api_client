import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'commerce_wire_service.g.dart';

@RestApi()
abstract class CommerceWireService {
  factory CommerceWireService(Dio dio, {String? baseUrl}) =
      _CommerceWireService;

  @GET('/api/v1/announcements')
  Future<HttpResponse<Object?>> listAnnouncements(
    @Query('unread_only') int? unreadOnly,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/announcements/{id}/read')
  Future<HttpResponse<Object?>> markAnnouncementRead(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @POST('/api/v1/redeem')
  Future<HttpResponse<Object?>> redeem(
    @Body() Map<String, Object?> body,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/redeem/history')
  Future<HttpResponse<Object?>> redeemHistory(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/subscriptions')
  Future<HttpResponse<Object?>> subscriptions(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/subscriptions/active')
  Future<HttpResponse<Object?>> activeSubscriptions(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/subscriptions/progress')
  Future<HttpResponse<Object?>> subscriptionProgress(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/subscriptions/summary')
  Future<HttpResponse<Object?>> subscriptionSummary(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/model-plaza')
  Future<HttpResponse<Object?>> modelPlaza(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/channel-monitors')
  Future<HttpResponse<Object?>> channelMonitors(
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/channel-monitors/{id}/status')
  Future<HttpResponse<Object?>> channelMonitorStatus(
    @Path('id') int id,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/channel-monitor-v2/dimensions')
  Future<HttpResponse<Object?>> monitorDimensions(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/channel-monitor-v2/snapshot')
  Future<HttpResponse<Object?>> monitorSnapshot(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/channel-monitor-v2/models')
  Future<HttpResponse<Object?>> monitorModels(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/channel-monitor-v2/matrix')
  Future<HttpResponse<Object?>> monitorMatrix(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/channel-monitor-v2/errors')
  Future<HttpResponse<Object?>> monitorErrors(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );

  @GET('/api/v1/channel-monitor-v2/users')
  Future<HttpResponse<Object?>> monitorUsers(
    @Queries() Map<String, dynamic> query,
    @CancelRequest() CancelToken cancelToken,
    @DioOptions() Options options,
    @Header('Authorization') String? authorization,
  );
}
