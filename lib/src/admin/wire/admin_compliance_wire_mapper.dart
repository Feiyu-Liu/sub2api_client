import '../../shared/errors/sub2api_exception.dart';
import '../sub2api_admin_compliance_models.dart';

Sub2ApiAdminComplianceStatus mapAdminComplianceStatus(Object? data) => _map(() {
  final source = _object(data);
  final required = _boolean(source, 'required');
  final version = _nonEmptyString(source, 'version');
  final documentPathZh = _nonEmptyString(source, 'document_path_zh');
  final documentPathEn = _nonEmptyString(source, 'document_path_en');
  final acknowledgement = source['acknowledgement'] == null
      ? null
      : _acknowledgement(_object(source['acknowledgement']));
  if (required == (acknowledgement != null)) throw const FormatException();
  if (acknowledgement != null &&
      (acknowledgement.version != version ||
          acknowledgement.documentZh != documentPathZh ||
          acknowledgement.documentEn != documentPathEn)) {
    throw const FormatException();
  }
  return Sub2ApiAdminComplianceStatus(
    required: required,
    version: version,
    documentPathZh: documentPathZh,
    documentPathEn: documentPathEn,
    documentUrlZh: _httpsUri(source, 'document_url_zh'),
    documentUrlEn: _httpsUri(source, 'document_url_en'),
    ackPhraseZh: _nonEmptyString(source, 'ack_phrase_zh'),
    ackPhraseEn: _nonEmptyString(source, 'ack_phrase_en'),
    acknowledgement: acknowledgement,
  );
});

Sub2ApiAdminComplianceAcknowledgement _acknowledgement(
  Map<String, Object?> source,
) => Sub2ApiAdminComplianceAcknowledgement(
  version: _nonEmptyString(source, 'version'),
  documentZh: _nonEmptyString(source, 'document_zh'),
  documentEn: _nonEmptyString(source, 'document_en'),
  adminUserId: _positiveInteger(source, 'admin_user_id'),
  ipAddress: _optionalString(source, 'ip_address'),
  userAgent: _optionalString(source, 'user_agent'),
  acceptedAt: _dateTime(source, 'accepted_at'),
);

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw const FormatException();
    result[entry.key as String] = entry.value;
  }
  return result;
}

bool _boolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! bool) throw const FormatException();
  return value;
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return value;
}

String _optionalString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

int _positiveInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

DateTime _dateTime(Map<String, Object?> source, String key) {
  final parsed = DateTime.parse(_nonEmptyString(source, key)).toUtc();
  return parsed;
}

Uri _httpsUri(Map<String, Object?> source, String key) {
  final uri = Uri.parse(_nonEmptyString(source, key));
  if (uri.scheme != 'https' || uri.host.isEmpty) throw const FormatException();
  return uri;
}

T _map<T>(T Function() action) {
  try {
    return action();
  } on Sub2ApiException catch (error) {
    if (error.code == _invalidResponse.code) rethrow;
    throw _invalidResponse;
  } on Object {
    throw _invalidResponse;
  }
}

const _invalidResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_compliance_response',
  retryable: false,
);
