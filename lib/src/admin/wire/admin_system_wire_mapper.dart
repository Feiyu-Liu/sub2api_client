import '../../shared/errors/sub2api_exception.dart';
import '../sub2api_admin_system_models.dart';

Sub2ApiAdminSystemVersion mapAdminSystemVersion(Object? data) =>
    _map(() => Sub2ApiAdminSystemVersion(_nonEmpty(_object(data), 'version')));
Sub2ApiAdminSystemUpdateInfo mapAdminSystemUpdateInfo(Object? data) => _map(() {
  final s = _object(data);
  return Sub2ApiAdminSystemUpdateInfo(
    currentVersion: _nonEmpty(s, 'current_version'),
    latestVersion: _nonEmpty(s, 'latest_version'),
    hasUpdate: _bool(s, 'has_update'),
    releaseInfo: s['release_info'] == null
        ? null
        : _release(_object(s['release_info'])),
    cached: _bool(s, 'cached'),
    warning: _optional(s, 'warning'),
    buildType: switch (_nonEmpty(s, 'build_type')) {
      'source' => Sub2ApiAdminSystemBuildType.source,
      'release' => Sub2ApiAdminSystemBuildType.release,
      _ => throw const FormatException(),
    },
  );
});
List<Sub2ApiAdminSystemRollbackVersion> mapAdminSystemRollbackVersions(
  Object? data,
) => _map(() {
  final s = _object(data);
  return _list(s, 'versions')
      .map(_object)
      .map(
        (v) => Sub2ApiAdminSystemRollbackVersion(
          version: _nonEmpty(v, 'version'),
          publishedAt: _date(v, 'published_at'),
          htmlUrl: _https(v, 'html_url'),
        ),
      )
      .toList(growable: false);
});
Sub2ApiAdminSystemUpdateResult mapAdminSystemUpdateResult(Object? data) =>
    _map(() {
      final s = _object(data);
      final message = _nonEmpty(s, 'message');
      final operationId = _nonEmpty(s, 'operation_id');
      final already = s['already_up_to_date'] == true;
      if (already) {
        return Sub2ApiAdminSystemAlreadyCurrent(
          message: message,
          operationId: operationId,
          currentVersion: _nonEmpty(s, 'current_version'),
          latestVersion: _nonEmpty(s, 'latest_version'),
        );
      }
      final need = _bool(s, 'need_restart');
      return Sub2ApiAdminSystemUpdated(
        message: message,
        operationId: operationId,
        needRestart: need,
      );
    });
Sub2ApiAdminSystemRollbackResult mapAdminSystemRollbackResult(Object? data) =>
    _map(() {
      final s = _object(data);
      final version = _optional(s, 'version').trim();
      return Sub2ApiAdminSystemRollbackResult(
        message: _nonEmpty(s, 'message'),
        needRestart: _bool(s, 'need_restart'),
        version: version.isEmpty ? null : version,
        operationId: _nonEmpty(s, 'operation_id'),
      );
    });
Sub2ApiAdminSystemRestartResult mapAdminSystemRestartResult(Object? data) =>
    _map(() {
      final s = _object(data);
      return Sub2ApiAdminSystemRestartResult(
        message: _nonEmpty(s, 'message'),
        operationId: _nonEmpty(s, 'operation_id'),
      );
    });

Sub2ApiAdminSystemReleaseInfo _release(Map<String, Object?> s) =>
    Sub2ApiAdminSystemReleaseInfo(
      name: _nonEmpty(s, 'name'),
      body: _optional(s, 'body'),
      publishedAt: _date(s, 'published_at'),
      htmlUrl: _https(s, 'html_url'),
      assets: _optionalList(s, 'assets')
          .map(_object)
          .map(
            (a) => Sub2ApiAdminSystemReleaseAsset(
              name: _nonEmpty(a, 'name'),
              downloadUrl: _https(a, 'download_url'),
              sizeBytes: _nonNegative(a, 'size'),
            ),
          )
          .toList(),
    );
Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
}

List<Object?> _list(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

List<Object?> _optionalList(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v == null) return const [];
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

String _nonEmpty(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! String || v.trim().isEmpty) throw const FormatException();
  return v;
}

String _optional(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v == null) return '';
  if (v is! String) throw const FormatException();
  return v;
}

bool _bool(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! bool) throw const FormatException();
  return v;
}

int _nonNegative(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! int || v < 0) throw const FormatException();
  return v;
}

DateTime _date(Map<String, Object?> s, String k) =>
    DateTime.parse(_nonEmpty(s, k)).toUtc();
Uri _https(Map<String, Object?> s, String k) {
  final u = Uri.parse(_nonEmpty(s, k));
  if (u.scheme != 'https' || u.host.isEmpty || u.userInfo.isNotEmpty) {
    throw const FormatException();
  }
  return u;
}

T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_system_response',
  retryable: false,
);
