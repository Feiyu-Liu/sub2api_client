import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_announcement_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_announcement_wire_mapper.dart';
import 'wire/admin_announcement_wire_service.dart';

abstract interface class Sub2ApiAdminAnnouncementsClient {
  Future<Sub2ApiAdminAnnouncementPage> list({
    Sub2ApiAdminAnnouncementQuery query = const Sub2ApiAdminAnnouncementQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminAnnouncement> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminAnnouncement> create(
    Sub2ApiAdminCreateAnnouncementRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminAnnouncement> update(
    int id,
    Sub2ApiAdminUpdateAnnouncementRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDeleteAnnouncementResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminAnnouncementReadStatusPage> listReadStatus(
    int id, {
    Sub2ApiAdminAnnouncementReadStatusQuery query =
        const Sub2ApiAdminAnnouncementReadStatusQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminAnnouncementsClient createSub2ApiAdminAnnouncementsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminAnnouncementsClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminAnnouncementWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminAnnouncementWireService _service;

  @override
  Future<Sub2ApiAdminAnnouncementPage> list({
    Sub2ApiAdminAnnouncementQuery query = const Sub2ApiAdminAnnouncementQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.list(
        <String, Object?>{
          'page': ?query.page,
          'page_size': ?query.pageSize,
          'status': ?query.status == null ? null : _status(query.status!),
          'search': ?_optional(query.search),
          'sort_by': _sortBy(query.sortBy),
          'sort_order': _order(query.sortOrder),
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminAnnouncementPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAnnouncement> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.get(id, c, o, _auth(k), _key(k)),
      decode: mapAdminAnnouncement,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAnnouncement> create(
    Sub2ApiAdminCreateAnnouncementRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final title = _title(request.title);
    final content = _content(request.content);
    _schedule(request.startsAt, request.endsAt);
    final targeting = _targeting(request.targeting);
    final startsAt = request.startsAt == null
        ? null
        : request.startsAt!.toUtc().millisecondsSinceEpoch ~/ 1000;
    final endsAt = request.endsAt == null
        ? null
        : request.endsAt!.toUtc().millisecondsSinceEpoch ~/ 1000;
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.create(
        <String, Object?>{
          'title': title,
          'content': content,
          'status': _status(request.status),
          'notify_mode': _notify(request.notifyMode),
          'targeting': targeting,
          'starts_at': ?startsAt,
          'ends_at': ?endsAt,
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminAnnouncement,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAnnouncement> update(
    int id,
    Sub2ApiAdminUpdateAnnouncementRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final title = request.title == null ? null : _title(request.title!);
    final content = request.content == null ? null : _content(request.content!);
    final start = _timeUpdate(request.startsAt);
    final end = _timeUpdate(request.endsAt);
    if (start is int && start > 0 && end is int && end > 0 && start >= end) {
      throw _validation('admin.announcements.invalid_schedule');
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.update(
        id,
        <String, Object?>{
          'title': ?title,
          'content': ?content,
          'status': ?request.status == null ? null : _status(request.status!),
          'notify_mode': ?request.notifyMode == null
              ? null
              : _notify(request.notifyMode!),
          'targeting': ?request.targeting == null
              ? null
              : _targeting(request.targeting!),
          'starts_at': ?start,
          'ends_at': ?end,
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminAnnouncement,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDeleteAnnouncementResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.delete(id, c, o, _auth(k), _key(k)),
      decode: mapAdminDeleteAnnouncement,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAnnouncementReadStatusPage> listReadStatus(
    int id, {
    Sub2ApiAdminAnnouncementReadStatusQuery query =
        const Sub2ApiAdminAnnouncementReadStatusQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    _page(query.page, query.pageSize);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.readStatus(
        id,
        <String, Object?>{
          'page': ?query.page,
          'page_size': ?query.pageSize,
          'search': ?_optional(query.search),
          'sort_by': _readSortBy(query.sortBy),
          'sort_order': _order(query.sortOrder),
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminAnnouncementReadStatusPage,
      requestOptions: requestOptions,
    );
  }

  String? _auth(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? _key(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? v : null;
}

Map<String, Object?> _targeting(Sub2ApiAdminAnnouncementTargeting t) {
  return <String, Object?>{
    'any_of': t.anyOf.map((g) {
      if (g.allOf.isEmpty) {
        throw _validation('admin.announcements.empty_condition_group');
      }
      return <String, Object?>{
        'all_of': g.allOf
            .map(
              (c) => switch (c) {
                Sub2ApiAdminAnnouncementSubscriptionCondition(
                  :final groupIds,
                ) =>
                  <String, Object?>{
                    'type': 'subscription',
                    'operator': 'in',
                    'group_ids': _groups(groupIds),
                  },
                Sub2ApiAdminAnnouncementBalanceCondition(
                  :final operator,
                  :final value,
                ) =>
                  <String, Object?>{
                    'type': 'balance',
                    'operator': _balanceOperator(operator),
                    'value': value.toJson(),
                  },
              },
            )
            .toList(),
      };
    }).toList(),
  };
}

List<int> _groups(List<int> ids) {
  if (ids.isEmpty || ids.any((id) => id <= 0)) {
    throw _validation('admin.announcements.invalid_group_ids');
  }
  return ids;
}

Object? _timeUpdate(Sub2ApiAdminAnnouncementTimeUpdate v) => switch (v) {
  Sub2ApiAdminAnnouncementTimeUnchanged() => null,
  Sub2ApiAdminAnnouncementTimeClear() => 0,
  Sub2ApiAdminAnnouncementTimeSet(:final value) =>
    value.toUtc().millisecondsSinceEpoch ~/ 1000,
};
void _schedule(DateTime? s, DateTime? e) {
  if (s != null && e != null && !s.isBefore(e)) {
    throw _validation('admin.announcements.invalid_schedule');
  }
}

void _page(int? p, int? s) {
  if (p != null && p <= 0) {
    throw _validation('admin.announcements.invalid_page');
  }
  if (s != null && s <= 0) {
    throw _validation('admin.announcements.invalid_page_size');
  }
}

void _id(int id) {
  if (id <= 0) throw _validation('admin.announcements.invalid_id');
}

String _title(String v) {
  final t = v.trim();
  if (t.isEmpty || t.length > 200) {
    throw _validation('admin.announcements.invalid_title');
  }
  return t;
}

String _content(String v) {
  final t = v.trim();
  if (t.isEmpty) throw _validation('admin.announcements.content_required');
  return t;
}

String? _optional(String? v) {
  final t = v?.trim();
  return t == null || t.isEmpty
      ? null
      : t.length > 200
      ? t.substring(0, 200)
      : t;
}

String _status(Sub2ApiAdminAnnouncementStatus v) => v.name;
String _notify(Sub2ApiAdminAnnouncementNotifyMode v) => v.name;
String _order(Sub2ApiAdminAnnouncementSortOrder v) => v.name;
String _sortBy(Sub2ApiAdminAnnouncementSortBy v) => switch (v) {
  Sub2ApiAdminAnnouncementSortBy.createdAt => 'created_at',
  Sub2ApiAdminAnnouncementSortBy.title => 'title',
  Sub2ApiAdminAnnouncementSortBy.status => 'status',
  Sub2ApiAdminAnnouncementSortBy.startsAt => 'starts_at',
  Sub2ApiAdminAnnouncementSortBy.endsAt => 'ends_at',
};
String _readSortBy(Sub2ApiAdminAnnouncementReadSortBy v) => switch (v) {
  Sub2ApiAdminAnnouncementReadSortBy.email => 'email',
  Sub2ApiAdminAnnouncementReadSortBy.username => 'username',
  Sub2ApiAdminAnnouncementReadSortBy.balance => 'balance',
  Sub2ApiAdminAnnouncementReadSortBy.eligible => 'eligible',
  Sub2ApiAdminAnnouncementReadSortBy.readAt => 'read_at',
};
String _balanceOperator(Sub2ApiAdminAnnouncementBalanceOperator v) => v.name;
Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
