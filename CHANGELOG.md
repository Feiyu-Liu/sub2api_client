## 0.1.0-dev.2

- Add typed public Auth operations for email verification-code delivery,
  invitation-code validation, forgot-password, and reset-password flows from
  the fixed Sub2API `v0.1.155` contract.
- Add fixed-source success fixtures plus transport, response-mapping, and
  public API-surface coverage for those operations.
- Redact email verification codes and reset-link tokens by default, alongside
  password values.

## 0.1.0-dev.1

- Establish the pure-Dart package boundary, strict analysis, source generation,
  offline fixtures, and controlled integration-test gate.
- Add the typed Sub2API `v0.1.155` user contract for capability bootstrap,
  password auth/2FA/session refresh, profile, and Installation Keys.
- Add Usage list/detail/statistics and Billing config/limits/plans/checkout,
  balance or subscription order creation, own-order lookup, and verification.
- Model payment creation as `order_created`, `oauth_required`, or
  `jsapi_ready`; redact checkout authority values and prohibit automatic order
  replay.
- Exclude Admin/Ops APIs, refunds, payment UI/browser launch, secure storage,
  Flutter, and native plugins.
