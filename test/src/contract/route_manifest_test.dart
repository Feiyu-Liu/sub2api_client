import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  test(
    'v0.1.183 route manifest is pinned, unique, and internally consistent',
    () {
      final manifest =
          jsonDecode(
                File(
                  'tool/contracts/v0_1_183_route_manifest.json',
                ).readAsStringSync(),
              )
              as Map<String, Object?>;
      expect(manifest['sub2api_tag'], 'v0.1.183');
      expect(
        manifest['sub2api_commit'],
        'e8cb019fabf8b55199436229044cbf9aa7a82564',
      );
      final routes = (manifest['routes'] as List).cast<Map<String, Object?>>();
      final keys = routes
          .map((route) => '${route['method']} ${route['path']}')
          .toSet();
      expect(routes, hasLength(566));
      expect(keys, hasLength(routes.length));

      final target = routes.where((route) => route['target'] == true).toList();
      final excluded = routes
          .where((route) => route['target'] == false)
          .toList();
      expect(target, hasLength(552));
      expect(excluded, hasLength(14));
      expect(excluded, everyElement(containsPair('status', 'excluded')));
      expect(
        target.where((route) => route['surface'] == 'admin'),
        hasLength(425),
      );
      expect(
        target.where((route) => route['surface'] == 'user'),
        hasLength(127),
      );
    },
  );

  test('ADR-0008 phase 1 routes all have fixed transport evidence', () {
    final manifest =
        jsonDecode(
              File(
                'tool/contracts/v0_1_183_route_manifest.json',
              ).readAsStringSync(),
            )
            as Map<String, Object?>;
    final routes = (manifest['routes'] as List).cast<Map<String, Object?>>();
    const phaseOne = <String>{
      'GET /api/v1/auth/me',
      'POST /api/v1/auth/revoke-all-sessions',
      'POST /api/v1/auth/passkey/login/begin',
      'POST /api/v1/auth/passkey/login/finish',
      'GET /api/v1/user/passkeys',
      'POST /api/v1/user/passkeys/register/begin',
      'POST /api/v1/user/passkeys/register/finish',
      'PATCH /api/v1/user/passkeys/:id',
      'DELETE /api/v1/user/passkeys/:id',
    };
    final indexed = <String, Map<String, Object?>>{
      for (final route in routes) '${route['method']} ${route['path']}': route,
    };
    for (final key in phaseOne) {
      expect(indexed[key], containsPair('status', 'transport_tested'));
    }
  });

  test('completed phase 2 security routes have fixed transport evidence', () {
    final manifest =
        jsonDecode(
              File(
                'tool/contracts/v0_1_183_route_manifest.json',
              ).readAsStringSync(),
            )
            as Map<String, Object?>;
    final routes = (manifest['routes'] as List).cast<Map<String, Object?>>();
    const completedSecurityRoutes = <String>{
      'GET /api/v1/user/totp/status',
      'GET /api/v1/user/totp/verification-method',
      'POST /api/v1/user/totp/send-code',
      'POST /api/v1/user/totp/setup',
      'POST /api/v1/user/totp/enable',
      'POST /api/v1/user/totp/disable',
      'POST /api/v1/user/totp/step-up',
      'POST /api/v1/user/auth-identities/bind/start',
      'POST /api/v1/user/account-bindings/email/send-code',
      'POST /api/v1/user/account-bindings/email',
      'DELETE /api/v1/user/account-bindings/:provider',
      'POST /api/v1/user/notify-email/send-code',
      'POST /api/v1/user/notify-email/verify',
      'PUT /api/v1/user/notify-email/toggle',
      'DELETE /api/v1/user/notify-email',
      'GET /api/v1/settings/email-unsubscribe',
    };
    final indexed = <String, Map<String, Object?>>{
      for (final route in routes) '${route['method']} ${route['path']}': route,
    };
    for (final key in completedSecurityRoutes) {
      expect(indexed[key], containsPair('status', 'transport_tested'));
    }
  });

  test(
    'every target user OAuth route has typed transport or browser evidence',
    () {
      final manifest =
          jsonDecode(
                File(
                  'tool/contracts/v0_1_183_route_manifest.json',
                ).readAsStringSync(),
              )
              as Map<String, Object?>;
      final routes = (manifest['routes'] as List).cast<Map<String, Object?>>();
      final oauthTargets = routes.where(
        (route) =>
            route['target'] == true &&
            route['surface'] == 'user' &&
            (route['path']! as String).contains('/auth/oauth/'),
      );

      expect(oauthTargets, isNotEmpty);
      expect(
        oauthTargets,
        everyElement(containsPair('status', 'transport_tested')),
      );
    },
  );

  test('completed phase 3 routes have fixed transport evidence', () {
    final manifest =
        jsonDecode(
              File(
                'tool/contracts/v0_1_183_route_manifest.json',
              ).readAsStringSync(),
            )
            as Map<String, Object?>;
    final routes = (manifest['routes'] as List).cast<Map<String, Object?>>();
    const completedAccessRoutes = <String>{
      'GET /api/v1/groups/available',
      'GET /api/v1/groups/rates',
      'GET /api/v1/channels/available',
      'GET /api/v1/user/platform-quotas',
      'GET /api/v1/user/api-keys/:id/usage/daily',
      'GET /api/v1/usage/errors',
      'GET /api/v1/usage/errors/:id',
      'GET /api/v1/usage/dashboard/stats',
      'GET /api/v1/usage/dashboard/trend',
      'GET /api/v1/usage/dashboard/models',
      'GET /api/v1/usage/dashboard/snapshot-v2',
      'POST /api/v1/usage/dashboard/api-keys-usage',
    };
    final indexed = <String, Map<String, Object?>>{
      for (final route in routes) '${route['method']} ${route['path']}': route,
    };
    for (final key in completedAccessRoutes) {
      expect(indexed[key], containsPair('status', 'transport_tested'));
    }
  });

  test('all phase 4 user routes have fixed transport evidence', () {
    final manifest =
        jsonDecode(
              File(
                'tool/contracts/v0_1_183_route_manifest.json',
              ).readAsStringSync(),
            )
            as Map<String, Object?>;
    final routes = (manifest['routes'] as List).cast<Map<String, Object?>>();
    const phaseFour = <String>{
      'POST /api/v1/auth/validate-promo-code',
      'GET /api/v1/user/aff',
      'POST /api/v1/user/aff/transfer',
      'GET /api/v1/announcements',
      'POST /api/v1/announcements/:id/read',
      'POST /api/v1/redeem',
      'GET /api/v1/redeem/history',
      'GET /api/v1/subscriptions',
      'GET /api/v1/subscriptions/active',
      'GET /api/v1/subscriptions/progress',
      'GET /api/v1/subscriptions/summary',
      'POST /api/v1/payment/orders/:id/cancel',
      'POST /api/v1/payment/orders/:id/refund-request',
      'GET /api/v1/payment/orders/refund-eligible-providers',
      'POST /api/v1/payment/public/orders/resolve',
      'POST /api/v1/payment/public/orders/verify',
      'GET /api/v1/model-plaza',
      'GET /api/v1/channel-monitors',
      'GET /api/v1/channel-monitors/:id/status',
      'GET /api/v1/channel-monitor-v2/dimensions',
      'GET /api/v1/channel-monitor-v2/snapshot',
      'GET /api/v1/channel-monitor-v2/models',
      'GET /api/v1/channel-monitor-v2/matrix',
      'GET /api/v1/channel-monitor-v2/errors',
      'GET /api/v1/channel-monitor-v2/users',
    };
    final indexed = <String, Map<String, Object?>>{
      for (final route in routes) '${route['method']} ${route['path']}': route,
    };
    for (final key in phaseFour) {
      expect(indexed[key], containsPair('status', 'transport_tested'));
    }
  });

  test('Admin dashboard foundation has fixed transport evidence', () {
    final manifest =
        jsonDecode(
              File(
                'tool/contracts/v0_1_183_route_manifest.json',
              ).readAsStringSync(),
            )
            as Map<String, Object?>;
    final routes = (manifest['routes'] as List).cast<Map<String, Object?>>();
    final route = routes.singleWhere(
      (route) =>
          route['method'] == 'GET' &&
          route['path'] == '/api/v1/admin/dashboard/stats',
    );
    expect(route, containsPair('status', 'transport_tested'));
  });
}
