import 'dart:convert';
import 'dart:io';

const _tag = 'v0.1.183';
const _commit = 'e8cb019fabf8b55199436229044cbf9aa7a82564';
const _upstream = 'github/sub2api';
const _output = 'doc/contract/v0_1_183_admin_settings_fields.json';

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
  final output = File(_output);
  if (check) {
    if (!output.existsSync() || output.readAsStringSync() != rendered) {
      stderr.writeln('Admin settings field contract is stale. Run:');
      stderr.writeln('  dart run tool/generate_admin_settings_contract.dart');
      exitCode = 1;
    }
    return;
  }
  output.writeAsStringSync(rendered);
  stdout.writeln(
    'Wrote $_output with ${response.length} response and '
    '${update.length} update fields.',
  );
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
          secret: _isSecret(jsonName),
        );
      })
      .toList(growable: false);
}

bool _isSecret(String name) {
  if (name.endsWith('_configured')) return false;
  return name.contains('password') ||
      name.contains('secret') ||
      name == 'oidc_connect_client_assertion_private_key' ||
      name == 'claude_oauth_system_prompt' ||
      name == 'claude_oauth_system_prompt_blocks';
}

String _show(String path) {
  final result = Process.runSync('git', <String>[
    '-C',
    _upstream,
    'show',
    '$_tag:$path',
  ]);
  if (result.exitCode != 0) throw StateError('Unable to read $path');
  return result.stdout as String;
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
