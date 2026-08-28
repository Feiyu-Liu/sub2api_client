import 'dart:convert';
import 'dart:io';

const _tag = 'v0.1.183';
const _commit = 'e8cb019fabf8b55199436229044cbf9aa7a82564';
const _outputPath = 'tool/contracts/v0_1_183_route_manifest.json';
const _routeFiles = <String>[
  'backend/internal/server/routes/auth.go',
  'backend/internal/server/routes/user.go',
  'backend/internal/server/routes/payment.go',
  'backend/internal/server/routes/admin.go',
  'backend/internal/server/routes/model_plaza.go',
];

void main(List<String> arguments) {
  final check = arguments.contains('--check');
  final upstreamArgument = arguments.where(
    (argument) => argument.startsWith('--upstream='),
  );
  final upstream = upstreamArgument.isEmpty
      ? 'github/sub2api'
      : upstreamArgument.single.substring('--upstream='.length);

  _verifyCommit(upstream);
  final modeled = _annotatedRoutes(Directory('lib'));
  final testedPaths = _testedPaths(Directory('test'));
  final routes = <_Route>[];
  for (final sourceFile in _routeFiles) {
    routes.addAll(_parseSource(upstream, sourceFile));
  }

  final unique = <String, _Route>{};
  for (final route in routes) {
    unique['${route.method} ${route.path}'] = route;
  }
  final entries = unique.values.toList()
    ..sort((left, right) {
      final pathOrder = left.path.compareTo(right.path);
      return pathOrder == 0 ? left.method.compareTo(right.method) : pathOrder;
    });

  final manifestEntries = entries.map((route) {
    final classification = _classify(route);
    final routeKey = '${route.method} ${route.path}';
    final transportTested = testedPaths.any(
      (testedPath) => _pathMatches(route.path, testedPath),
    );
    final status = !classification.target
        ? 'excluded'
        : transportTested && modeled.contains(routeKey)
        ? 'transport_tested'
        : modeled.contains(routeKey)
        ? 'modeled'
        : 'unsupported';
    return <String, Object?>{
      'method': route.method,
      'path': route.path,
      'surface': classification.surface,
      'authentication': classification.authentication,
      'target': classification.target,
      'status': status,
      'step_up': route.stepUp ? 'required_by_route' : 'none_at_route',
      if (classification.exclusionReason != null)
        'exclusion_reason': classification.exclusionReason,
      'source': '${route.sourceFile}:${route.line}',
    };
  }).toList();

  final targetEntries = manifestEntries.where(
    (entry) => entry['target'] == true,
  );
  final manifest = <String, Object?>{
    'sub2api_tag': _tag,
    'sub2api_commit': _commit,
    'generated_from': _routeFiles,
    'completion_definition':
        'All target entries must reach transport_tested; selected credential, permission, and step-up flows must additionally pass controlled E2E.',
    'counts': <String, Object?>{
      'all_routes': manifestEntries.length,
      'target_routes': targetEntries.length,
      'excluded_routes': manifestEntries.length - targetEntries.length,
      'by_status': _counts(manifestEntries, 'status'),
      'target_by_surface': _counts(targetEntries, 'surface'),
    },
    'routes': manifestEntries,
  };
  final rendered = '${const JsonEncoder.withIndent('  ').convert(manifest)}\n';

  final output = File(_outputPath);
  if (check) {
    if (!output.existsSync() ||
        _normalizeText(output.readAsStringSync()) != rendered) {
      stderr.writeln('Route manifest is stale. Run:');
      stderr.writeln('  dart run tool/generate_route_manifest.dart');
      exitCode = 1;
    }
    return;
  }
  output.parent.createSync(recursive: true);
  output.writeAsStringSync(rendered);
  stdout.writeln(
    'Wrote $_outputPath with ${manifestEntries.length} routes '
    '(${targetEntries.length} target).',
  );
}

String _normalizeText(String value) =>
    value.replaceAll('\r\n', '\n').replaceAll('\r', '\n');

void _verifyCommit(String upstream) {
  final result = Process.runSync('git', <String>[
    '-C',
    upstream,
    'rev-parse',
    '$_tag^{}',
  ]);
  if (result.exitCode != 0 || (result.stdout as String).trim() != _commit) {
    stderr.writeln('Expected $_tag to resolve to $_commit in $upstream.');
    exit(2);
  }
}

List<_Route> _parseSource(String upstream, String sourceFile) {
  final result = Process.runSync(
    'git',
    <String>['-C', upstream, 'cat-file', '-p', '$_tag:$sourceFile'],
    stdoutEncoding: utf8,
    stderrEncoding: utf8,
  );
  if (result.exitCode != 0) {
    throw StateError('Unable to read $sourceFile at $_tag: ${result.stderr}');
  }
  // Git for Windows can expose CRLF here even though the pinned Git blob is
  // identical. Normalize before using multiline route-registration regexes so
  // the manifest is deterministic across the three validation hosts.
  final source = (result.stdout as String).replaceAll('\r', '');
  final functionPattern = RegExp(
    r'^func\s+(\w+)\s*\(([\s\S]*?)\)\s*[^\{\n]*\{',
    multiLine: true,
  );
  final routes = <_Route>[];
  for (final functionMatch in functionPattern.allMatches(source)) {
    final openBrace = functionMatch.end - 1;
    final closeBrace = _matchingBrace(source, openBrace);
    final body = source.substring(openBrace + 1, closeBrace);
    final parameters = functionMatch.group(2)!;
    final groups = <String, String>{};
    if (RegExp(r'\bv1\s+\*gin\.RouterGroup\b').hasMatch(parameters)) {
      groups['v1'] = '/api/v1';
    }
    if (RegExp(r'\badmin\s+\*gin\.RouterGroup\b').hasMatch(parameters)) {
      groups['admin'] = '/api/v1/admin';
    }
    final events = <_Event>[];
    final groupPattern = RegExp(
      r'\b(\w+)\s*:?=\s*(\w+)\.Group\(\s*"([^"]*)"\s*\)',
    );
    for (final match in groupPattern.allMatches(body)) {
      events.add(
        _Event.group(
          offset: match.start,
          variable: match.group(1)!,
          parent: match.group(2)!,
          path: match.group(3)!,
        ),
      );
    }
    final routePattern = RegExp(
      r'\b(\w+)\.(GET|POST|PUT|DELETE|PATCH)\(\s*"([^"]*)"',
    );
    for (final match in routePattern.allMatches(body)) {
      events.add(
        _Event.route(
          offset: match.start,
          variable: match.group(1)!,
          method: match.group(2)!,
          path: match.group(3)!,
        ),
      );
    }
    events.sort((left, right) => left.offset.compareTo(right.offset));
    for (final event in events) {
      if (event.kind == _EventKind.group) {
        final parent = groups[event.parent];
        if (parent != null) {
          groups[event.variable] = _joinPath(parent, event.path);
        }
        continue;
      }
      final base = groups[event.variable];
      if (base == null) {
        throw StateError(
          'Unresolved route group ${event.variable} in $sourceFile '
          'function ${functionMatch.group(1)}.',
        );
      }
      final absoluteOffset = openBrace + 1 + event.offset;
      final line =
          '\n'.allMatches(source.substring(0, absoluteOffset)).length + 1;
      final lineEnd = source.indexOf('\n', absoluteOffset);
      final routeLine = source.substring(
        absoluteOffset,
        lineEnd == -1 ? source.length : lineEnd,
      );
      routes.add(
        _Route(
          method: event.method,
          path: _joinPath(base, event.path),
          sourceFile: sourceFile,
          line: line,
          stepUp: routeLine.contains('stepUpAuth'),
        ),
      );
    }
  }
  return routes;
}

int _matchingBrace(String source, int openBrace) {
  var depth = 0;
  var inString = false;
  var escaped = false;
  for (var index = openBrace; index < source.length; index++) {
    final character = source[index];
    if (inString) {
      if (escaped) {
        escaped = false;
      } else if (character == r'\') {
        escaped = true;
      } else if (character == '"') {
        inString = false;
      }
      continue;
    }
    if (character == '"') {
      inString = true;
    } else if (character == '{') {
      depth++;
    } else if (character == '}') {
      depth--;
      if (depth == 0) return index;
    }
  }
  throw FormatException('Unbalanced function body.');
}

Set<String> _annotatedRoutes(Directory root) {
  final routes = <String>{};
  final retrofitPattern = RegExp(
    r"@(GET|POST|PUT|DELETE|PATCH)\(\s*'([^']+)'\s*,?\s*\)",
    multiLine: true,
  );
  final browserPattern = RegExp(
    r"@Sub2ApiBrowserRoute\(\s*'([^']+)'\s*,\s*'([^']+)'\s*\)",
    multiLine: true,
  );
  final streamPattern = RegExp(
    r"@Sub2ApiStreamRoute\(\s*'([^']+)'\s*,\s*'([^']+)'\s*\)",
    multiLine: true,
  );
  for (final entity in root.listSync(recursive: true)) {
    if (entity is! File ||
        !entity.path.endsWith('.dart') ||
        entity.path.endsWith('.g.dart') ||
        entity.path.endsWith('.freezed.dart')) {
      continue;
    }
    final source = entity.readAsStringSync();
    for (final match in retrofitPattern.allMatches(source)) {
      routes.add('${match.group(1)} ${_normalizeTemplate(match.group(2)!)}');
    }
    for (final match in browserPattern.allMatches(source)) {
      routes.add('${match.group(1)} ${_normalizeTemplate(match.group(2)!)}');
    }
    for (final match in streamPattern.allMatches(source)) {
      routes.add('${match.group(1)} ${_normalizeTemplate(match.group(2)!)}');
    }
  }
  return routes;
}

Set<String> _testedPaths(Directory root) {
  final paths = <String>{};
  final pattern = RegExp(r'''['"](/api/v1/[^'"]+)['"]''');
  for (final entity in root.listSync(recursive: true)) {
    if (entity is! File || !entity.path.endsWith('_test.dart')) continue;
    for (final match in pattern.allMatches(entity.readAsStringSync())) {
      paths.add(match.group(1)!);
    }
  }
  return paths;
}

_Classification _classify(_Route route) {
  final path = route.path;
  if (path.startsWith('/api/v1/plugin-ui/')) {
    return const _Classification.excluded('server_ingress', 'static_asset');
  }
  if (path.contains('/callback')) {
    return const _Classification.excluded('server_ingress', 'oauth_callback');
  }
  if (path.startsWith('/api/v1/payment/webhook/')) {
    return const _Classification.excluded('server_ingress', 'payment_webhook');
  }
  if (path.startsWith('/api/v1/admin')) {
    return const _Classification(
      surface: 'admin',
      authentication: 'admin_jwt_or_admin_api_key',
      target: true,
    );
  }
  if (path == '/api/v1/model-plaza') {
    return const _Classification(
      surface: 'user',
      authentication: 'public_or_user_jwt',
      target: true,
    );
  }
  if (path.startsWith('/api/v1/payment/public/')) {
    return const _Classification(
      surface: 'user',
      authentication: 'public',
      target: true,
    );
  }
  if (path.startsWith('/api/v1/payment/')) {
    return const _Classification(
      surface: 'user',
      authentication: 'user_jwt',
      target: true,
    );
  }
  if (path == '/api/v1/auth/me' ||
      path == '/api/v1/auth/revoke-all-sessions' ||
      path == '/api/v1/auth/oauth/bind-token' ||
      path.startsWith('/api/v1/user/') ||
      path == '/api/v1/user' ||
      path.startsWith('/api/v1/keys') ||
      path.startsWith('/api/v1/groups') ||
      path.startsWith('/api/v1/channels') ||
      path.startsWith('/api/v1/usage') ||
      path.startsWith('/api/v1/announcements') ||
      path.startsWith('/api/v1/redeem') ||
      path.startsWith('/api/v1/subscriptions') ||
      path.startsWith('/api/v1/channel-monitor')) {
    return const _Classification(
      surface: 'user',
      authentication: 'user_jwt',
      target: true,
    );
  }
  return const _Classification(
    surface: 'user',
    authentication: 'public',
    target: true,
  );
}

Map<String, int> _counts(Iterable<Map<String, Object?>> entries, String key) {
  final counts = <String, int>{};
  for (final entry in entries) {
    final value = entry[key] as String;
    counts[value] = (counts[value] ?? 0) + 1;
  }
  return Map<String, int>.fromEntries(
    counts.entries.toList()
      ..sort((left, right) => left.key.compareTo(right.key)),
  );
}

String _joinPath(String base, String child) {
  final combined =
      '${base.endsWith('/') ? base.substring(0, base.length - 1) : base}'
      '${child.isEmpty
          ? ''
          : child.startsWith('/')
          ? child
          : '/$child'}';
  return combined.isEmpty ? '/' : combined;
}

String _normalizeTemplate(String path) => path.replaceAllMapped(
  RegExp(r'\{([^}]+)\}'),
  (match) => ':${match.group(1)}',
);

bool _pathMatches(String template, String concrete) {
  final templateSegments = template.split('/');
  final concreteSegments = concrete.split('/');
  if (templateSegments.length != concreteSegments.length) return false;
  for (var index = 0; index < templateSegments.length; index++) {
    final expected = templateSegments[index];
    if (expected.startsWith(':') || expected.startsWith('*')) continue;
    if (expected != concreteSegments[index]) return false;
  }
  return true;
}

final class _Route {
  const _Route({
    required this.method,
    required this.path,
    required this.sourceFile,
    required this.line,
    required this.stepUp,
  });

  final int line;
  final String method;
  final String path;
  final String sourceFile;
  final bool stepUp;
}

final class _Classification {
  const _Classification({
    required this.surface,
    required this.authentication,
    required this.target,
  }) : exclusionReason = null;

  const _Classification.excluded(this.surface, this.exclusionReason)
    : authentication = 'not_applicable',
      target = false;

  final String authentication;
  final String? exclusionReason;
  final String surface;
  final bool target;
}

enum _EventKind { group, route }

final class _Event {
  const _Event._({
    required this.kind,
    required this.offset,
    required this.variable,
    required this.path,
    this.parent = '',
    this.method = '',
  });

  factory _Event.group({
    required int offset,
    required String variable,
    required String parent,
    required String path,
  }) => _Event._(
    kind: _EventKind.group,
    offset: offset,
    variable: variable,
    parent: parent,
    path: path,
  );

  factory _Event.route({
    required int offset,
    required String variable,
    required String method,
    required String path,
  }) => _Event._(
    kind: _EventKind.route,
    offset: offset,
    variable: variable,
    method: method,
    path: path,
  );

  final _EventKind kind;
  final String method;
  final int offset;
  final String parent;
  final String path;
  final String variable;
}
