import 'dart:convert';
import 'dart:io';

const _tag = 'v0.1.183';
const _commit = 'e8cb019fabf8b55199436229044cbf9aa7a82564';
const _upstream = 'github/sub2api';
const _output = 'tool/contracts/v0_1_183_admin_settings_fields.json';
const _dartOutput =
    'lib/src/admin/sub2api_admin_system_settings_generated.dart';
const _fixtureOutput =
    'test/fixtures/v0_1_183/admin/system_settings_generated.json';

void main(List<String> arguments) {
  final check = arguments.contains('--check');
  _verifyCommit();
  final response = _fields(
    'backend/internal/handler/dto/settings.go',
    'type SystemSettings struct',
  );
  final update = _fields(
    'backend/internal/handler/admin/setting_handler_update.go',
    'type UpdateSettingsRequest struct',
  );
  final payload = <String, Object?>{
    'sub2api_tag': _tag,
    'source_revision': _commit,
    'response_struct': 'dto.SystemSettings',
    'update_struct': 'admin.UpdateSettingsRequest',
    'counts': <String, int>{
      'response_fields': response.length,
      'update_fields': update.length,
      'shared_fields': response
          .map((field) => field.jsonName)
          .toSet()
          .intersection(update.map((field) => field.jsonName).toSet())
          .length,
      'secret_update_fields': update.where((field) => field.secret).length,
    },
    'response_fields': response.map((field) => field.toJson()).toList(),
    'update_fields': update.map((field) => field.toJson()).toList(),
  };
  final rendered = '${const JsonEncoder.withIndent('  ').convert(payload)}\n';
  final dartRendered = _renderDart(response, update);
  final fixtureRendered =
      '${const JsonEncoder.withIndent('  ').convert(<String, Object?>{
        'code': 0,
        'message': 'success',
        'data': <String, Object?>{for (final field in response) field.jsonName: _sampleValue(field)},
      })}\n';
  final output = File(_output);
  if (check) {
    final dartOutput = File(_dartOutput);
    final fixtureOutput = File(_fixtureOutput);
    if (!output.existsSync() ||
        _normalizeText(output.readAsStringSync()) != rendered ||
        !dartOutput.existsSync() ||
        _normalizeText(dartOutput.readAsStringSync()) != dartRendered ||
        !fixtureOutput.existsSync() ||
        _normalizeText(fixtureOutput.readAsStringSync()) != fixtureRendered) {
      stderr.writeln('Admin settings field contract is stale. Run:');
      stderr.writeln('  dart run tool/generate_admin_settings_contract.dart');
      exitCode = 1;
    }
    return;
  }
  output.writeAsStringSync(rendered);
  File(_dartOutput).writeAsStringSync(dartRendered);
  File(_fixtureOutput).writeAsStringSync(fixtureRendered);
  stdout.writeln(
    'Wrote $_output with ${response.length} response and '
    '${update.length} update fields.',
  );
}

String _normalizeText(String value) =>
    value.replaceAll('\r\n', '\n').replaceAll('\r', '\n');

Object? _sampleValue(_Field field) {
  const overrides = <String, Object?>{
    'registration_enabled': true,
    'site_name': 'Sub2API Fixture',
    'step_up_enabled': false,
    'payment_min_amount': '1.25',
  };
  if (overrides.containsKey(field.jsonName)) return overrides[field.jsonName];
  final type = field.goType.startsWith('*')
      ? field.goType.substring(1)
      : field.goType;
  if (field.goType.startsWith('*')) return null;
  return switch (type) {
    'bool' => false,
    'string' => '',
    'int' || 'int64' => 0,
    'float64' => 0,
    '[]string' ||
    '[]int' ||
    '[]CustomMenuItem' ||
    '[]CustomEndpoint' ||
    '[]DefaultSubscriptionSetting' ||
    '[]LoginAgreementDocument' ||
    '[]NotifyEmailEntry' => <Object?>[],
    'map[string]*service.DefaultPlatformQuotaSetting' ||
    'map[string]int' => <String, Object?>{},
    _ => throw StateError('Unsupported sample type ${field.goType}'),
  };
}

List<_Field> _fields(String path, String marker) {
  final source = _show(path);
  final markerOffset = source.indexOf(marker);
  if (markerOffset < 0) throw StateError('Missing $marker in $path');
  final open = source.indexOf('{', markerOffset);
  final close = _matchingBrace(source, open);
  final body = source.substring(open + 1, close);
  final pattern = RegExp(
    r'^\s*([A-Z][A-Za-z0-9_]*)\s+([^`\n]+?)\s+`json:"([^",]+)([^"]*)"`',
    multiLine: true,
  );
  return pattern
      .allMatches(body)
      .map((match) {
        final jsonName = match.group(3)!;
        return _Field(
          goName: match.group(1)!,
          goType: match.group(2)!.trim(),
          jsonName: jsonName,
          omitEmpty: match.group(4)!.contains('omitempty'),
          secret: _isSecret(jsonName, match.group(2)!.trim()),
        );
      })
      .toList(growable: false);
}

bool _isSecret(String name, String goType) {
  if (goType != 'string' && goType != '*string') return false;
  if (name.endsWith('_configured')) return false;
  return name.contains('password') ||
      name.contains('secret') ||
      name == 'oidc_connect_client_assertion_private_key' ||
      name == 'claude_oauth_system_prompt' ||
      name == 'claude_oauth_system_prompt_blocks';
}

String _renderDart(List<_Field> response, List<_Field> update) {
  final out = StringBuffer()
    ..writeln('// GENERATED CODE - DO NOT MODIFY BY HAND')
    ..writeln('// Generated from Sub2API $_tag / $_commit.')
    ..writeln('// dart format off')
    ..writeln()
    ..writeln("part of 'sub2api_admin_system_settings_models.dart';")
    ..writeln()
    ..writeln('abstract final class Sub2ApiAdminSystemSettingFields {');
  for (final field in response) {
    out.writeln(
      "  static const ${_dartName(field)} = Sub2ApiAdminSystemSettingField<${_dartType(field, response: true)}>._('${field.jsonName}', _AdminSettingKind.${_kind(field)});",
    );
  }
  out
    ..writeln('}')
    ..writeln()
    ..writeln(
      'const _adminSystemSettingFields = <Sub2ApiAdminSystemSettingField<Object?>>[',
    );
  for (final field in response) {
    out.writeln('  Sub2ApiAdminSystemSettingFields.${_dartName(field)},');
  }
  out
    ..writeln('];')
    ..writeln()
    ..writeln('abstract final class Sub2ApiAdminSystemSettingUpdates {');
  for (final field in update) {
    out.writeln(
      "  static const ${_dartName(field)} = Sub2ApiAdminSystemSettingUpdate<${_dartType(field, response: false)}>._('${field.jsonName}', _AdminSettingKind.${_kind(field)});",
    );
  }
  out
    ..writeln('}')
    ..writeln('// dart format on');
  return out.toString();
}

String _dartName(_Field field) {
  final parts = field.jsonName.split('_');
  final buffer = StringBuffer(parts.first);
  for (final part in parts.skip(1)) {
    if (part.isEmpty) continue;
    buffer
      ..write(part[0].toUpperCase())
      ..write(part.substring(1));
  }
  final name = buffer.toString();
  return RegExp(r'^[0-9]').hasMatch(name) ? 'value$name' : name;
}

String _dartType(_Field field, {required bool response}) {
  if (field.secret) return 'Sub2ApiAdminSettingSecret';
  final type = field.goType.startsWith('*')
      ? field.goType.substring(1)
      : field.goType;
  final mapped = switch (type) {
    'bool' => 'bool',
    'string' => 'String',
    'int' || 'int64' => 'int',
    'float64' => 'Sub2ApiDecimal',
    '[]string' => 'List<String>',
    '[]int' => 'List<int>',
    '[]CustomMenuItem' ||
    '[]dto.CustomMenuItem' => 'List<Sub2ApiAdminCustomMenuItem>',
    '[]CustomEndpoint' ||
    '[]dto.CustomEndpoint' => 'List<Sub2ApiAdminCustomEndpoint>',
    '[]DefaultSubscriptionSetting' || '[]dto.DefaultSubscriptionSetting' =>
      'List<Sub2ApiAdminDefaultSubscriptionSetting>',
    '[]LoginAgreementDocument' || '[]dto.LoginAgreementDocument' =>
      'List<Sub2ApiAdminLoginAgreementDocument>',
    '[]NotifyEmailEntry' ||
    '[]dto.NotifyEmailEntry' => 'List<Sub2ApiAdminNotifyEmailEntry>',
    'OpenAIFastPolicySettings' ||
    'dto.OpenAIFastPolicySettings' => 'Sub2ApiAdminOpenAIFastPolicySettings',
    'map[string]*service.DefaultPlatformQuotaSetting' =>
      'Map<String, Sub2ApiAdminPlatformQuota>',
    'map[string]int' => 'Map<String, int>',
    _ => throw StateError('Unsupported Go settings type ${field.goType}'),
  };
  return response && field.goType.startsWith('*') ? '$mapped?' : mapped;
}

String _kind(_Field field) {
  if (field.secret) return 'secret';
  final type = field.goType.startsWith('*')
      ? field.goType.substring(1)
      : field.goType;
  return switch (type) {
    'bool' => 'boolean',
    'string' => 'string',
    'int' || 'int64' => 'integer',
    'float64' => 'decimal',
    '[]string' => 'stringList',
    '[]int' => 'intList',
    '[]CustomMenuItem' || '[]dto.CustomMenuItem' => 'customMenuList',
    '[]CustomEndpoint' || '[]dto.CustomEndpoint' => 'customEndpointList',
    '[]DefaultSubscriptionSetting' ||
    '[]dto.DefaultSubscriptionSetting' => 'defaultSubscriptionList',
    '[]LoginAgreementDocument' ||
    '[]dto.LoginAgreementDocument' => 'loginAgreementList',
    '[]NotifyEmailEntry' || '[]dto.NotifyEmailEntry' => 'notifyEmailList',
    'OpenAIFastPolicySettings' ||
    'dto.OpenAIFastPolicySettings' => 'openAIFastPolicy',
    'map[string]*service.DefaultPlatformQuotaSetting' => 'quotaMap',
    'map[string]int' => 'intMap',
    _ => throw StateError('Unsupported Go settings type ${field.goType}'),
  };
}

String _show(String path) {
  final result = Process.runSync(
    'git',
    <String>['-C', _upstream, 'cat-file', '-p', '$_tag:$path'],
    stdoutEncoding: utf8,
    stderrEncoding: utf8,
  );
  if (result.exitCode != 0) throw StateError('Unable to read $path');
  return (result.stdout as String).replaceAll('\r', '');
}

void _verifyCommit() {
  final result = Process.runSync('git', <String>[
    '-C',
    _upstream,
    'rev-parse',
    '$_tag^{}',
  ]);
  if (result.exitCode != 0 || (result.stdout as String).trim() != _commit) {
    throw StateError('Expected $_tag to resolve to $_commit.');
  }
}

int _matchingBrace(String source, int open) {
  var depth = 0;
  for (var index = open; index < source.length; index++) {
    if (source[index] == '{') depth++;
    if (source[index] == '}') {
      depth--;
      if (depth == 0) return index;
    }
  }
  throw StateError('Unclosed struct body.');
}

final class _Field {
  const _Field({
    required this.goName,
    required this.goType,
    required this.jsonName,
    required this.omitEmpty,
    required this.secret,
  });
  final String goName;
  final String goType;
  final String jsonName;
  final bool omitEmpty;
  final bool secret;

  Map<String, Object?> toJson() => <String, Object?>{
    'go_name': goName,
    'go_type': goType,
    'json_name': jsonName,
    'omitempty': omitEmpty,
    'secret': secret,
  };
}
