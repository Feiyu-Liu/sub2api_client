# sub2api_client

**English** | [简体中文](README.zh-CN.md)

A typed, pure-Dart client for the Sub2API management APIs. Version `0.1.0-dev.4`
targets Sub2API `v0.1.183` at commit
`e8cb019fabf8b55199436229044cbf9aa7a82564`.

The package owns HTTP, JSON, error mapping, session rotation, and concurrent
refresh consistency. It has no Flutter SDK, UI state framework, secure-storage
plugin, browser launcher, or native dependency.

## Supported user API

- Capability bootstrap.
- Registration, login, two-factor login, refresh, logout, email verification
  code delivery, invitation-code validation, and password reset requests,
  including Turnstile, Tencent, and Aliyun captcha proofs advertised by the
  server.
- Full current-user/role/identity bootstrap and fail-secure revocation of every
  user session.
- Typed Passkey login and registration ceremonies, credential listing,
  renaming, and password-gated deletion. The host supplies the browser or
  platform WebAuthn adapter; this package owns only protocol facts.
- TOTP status, identity-proof policy, setup, enable/disable, verification-code
  delivery, and session-bound step-up grants.
- Typed local-email and third-party identity binding instructions plus
  notification-email verification, toggle, and removal operations.
- Typed OAuth POST starts, cookie-bound pending account/login completion,
  provider compatibility routes, browser GET navigation builders, and stable
  pending-session errors. Browser callbacks remain server ingress.
- User profile read/update and password change.
- API/Installation Key list, detail, create, update, and delete.
- User-visible groups, rates, channels, platform quotas, and per-key daily
  usage.
- Usage list/detail/statistics, failed-request views, and all user Dashboard
  aggregates.
- Announcements, redemption history, subscriptions, model plaza, affiliate
  quota, and both channel-monitor generations.
- Payment configuration, limits, plans, checkout information, balance or
  subscription order creation, own-order lookup, cancellation, refund request,
  eligible-provider lookup, and signed or legacy public order recovery.

All 127 fixed user-management target routes and all 425 Admin-management target
routes are typed and transport-tested. The isolated `Sub2ApiAdminClient` and
`Sub2ApiOpsClient` entrypoints cover the complete pinned management plane with
Admin JWT role bootstrap, a redacted Admin API Key provider, strict credential
separation, and no credential fallback. Payment UI and local secure storage
remain caller-owned.

The pinned route inventory lives in
`tool/contracts/v0_1_183_route_manifest.json`. It currently distinguishes 552
target management routes from 14 server-ingress exclusions and records the
implementation/test state of every target route.

Privileged clients use separate imports:

```dart
import 'package:sub2api_client/sub2api_admin_client.dart';
import 'package:sub2api_client/sub2api_ops_client.dart';
```

The user client never exposes `.admin` or `.ops`. The Admin client uses only a
JWT session and verifies `role == admin`; the Ops client uses only `x-api-key`
and never reads, refreshes, or falls back to a JWT session.

## Installation

The package is currently published as a development release. Add it with an
explicit prerelease constraint:

```sh
dart pub add sub2api_client:^0.1.0-dev.4
```

## Usage

```dart
import 'package:sub2api_client/sub2api_client.dart';

final client = Sub2ApiClient(
  configuration: Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.example.com'),
  ),
  // Use an OS-backed implementation in production.
  sessionStore: Sub2ApiMemorySessionStore(),
);

try {
  final capabilities = await client.capabilities.getCapabilities();
  final login = await client.auth.login(
    const Sub2ApiLoginRequest(
      email: 'user@example.com',
      password: Sub2ApiPassword('obtained-interactively'),
    ),
  );
  if (login case Sub2ApiAuthenticated()) {
    final profile = await client.user.getProfile();
    print(profile.balance);
  }
} on Sub2ApiException catch (error) {
  print(error.code);
} finally {
  client.close();
}
```

`Sub2ApiSessionStore` is a pure-Dart seam. Flutter applications can implement
it with their chosen secure-storage adapter without making this package depend
on Flutter or a native plugin. Sensitive values require an explicit `reveal()`
call and are redacted by `toString()`.

## Checkout flow

The package returns checkout facts; the host application owns browser launch,
QR rendering, Stripe/WeChat SDK work, deep links, and UI state. A balance
recharge uses an exact `Sub2ApiDecimal`, but is rejected before sending if its
value cannot be represented by Sub2API v0.1.183's `float64` `amount` field.

```dart
final checkout = await client.billing.checkoutInfo();
final paymentType = checkout.limits.methods.keys.first;
final result = await client.billing.createBalanceOrder(
  Sub2ApiCreateBalanceOrderRequest(
    amount: Sub2ApiDecimal.parse('10.00'),
    paymentType: paymentType,
  ),
);

switch (result) {
  case Sub2ApiOrderCreated(:final payUrl):
    // The host app may deliberately consume payUrl?.reveal() here.
    // This package never launches a browser or renders payment UI.
  case Sub2ApiOrderOAuthRequired(:final oauth):
    // Continue through the host app's WeChat OAuth adapter using oauth.
  case Sub2ApiOrderJsapiReady(:final jsapi):
    // A host WeChat adapter explicitly consumes jsapi.packageValue.reveal()
    // and jsapi.paySign.reveal(); never log these values.
}
```

Order creation is never automatically retried or replayed. If a network
failure leaves the result unknown, call `client.billing.listOwnOrders(...)`
or `client.billing.verifyOrder(outTradeNo)` before deciding whether to create
another order. Key creation requires an explicit idempotency key. The 5h/1d/7d
Key limits model USD consumption windows, not per-key RPM.

## Development

```sh
dart pub get
dart run build_runner build
dart format --output=none --set-exit-if-changed lib test example integration_test
dart analyze --fatal-infos
dart test
dart doc
dart pub publish --dry-run
```

Default tests are offline. The controlled live suite must be invoked explicitly
with `dart test integration_test` and requires the opt-in environment variables
documented in `integration_test/controlled_linux_env_test.dart`.
