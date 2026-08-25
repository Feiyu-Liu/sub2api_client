# sub2api_client

A typed, pure-Dart client for the Sub2API user API. Version `0.1.0-dev.1`
targets Sub2API `v0.1.155` at commit
`41cec0db059ffb82d0efdcfcf07a24ab51fbfe97`.

The package owns HTTP, JSON, error mapping, session rotation, and concurrent
refresh consistency. It has no Flutter SDK, UI state framework, secure-storage
plugin, browser launcher, or native dependency.

## Supported user API

- Capability bootstrap.
- Registration, login, two-factor login, refresh, and logout.
- User profile read/update and password change.
- API/Installation Key list, detail, create, update, and delete.
- Usage list, detail, and aggregate statistics.
- Payment configuration, limits, plans, checkout information, balance or
  subscription order creation, own-order lookup, and verification.

Admin/Ops endpoints, refund actions, payment UI, and local secure storage are
deliberately outside this package.

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
value cannot be represented by Sub2API v0.1.155's `float64` `amount` field.

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
