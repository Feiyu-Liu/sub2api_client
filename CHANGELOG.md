## 0.1.0-dev.4

- Add typed `/auth/me` current-user, identity-binding, role, and run-mode facts.
- Add fail-secure revocation of every user session without refresh or replay.
- Add a pure-Dart Passkey module for typed WebAuthn login and registration
  ceremonies plus credential listing, renaming, and password-gated deletion.
- Add a typed TOTP module for enrollment, verification policy, email codes,
  enable/disable, and non-replayable session-bound step-up grants.
- Add typed email/third-party identity and notification-email operations with
  shared complete account snapshots and fail-secure session clearing when the
  server revokes tokens after email binding or identity unbinding.
- Add all v0.1.183 user OAuth start, pending exchange/create/bind, provider
  compatibility, bind-cookie, and browser GET routes with typed state unions,
  explicit same-user-agent cookie requirements, and stable pending errors.
- Decode Base64URL WebAuthn options into byte arrays and serialize platform
  credential results without exposing raw wire maps or browser dependencies.
- Complete all 127 user-management target routes, including access resources,
  failed-request and Dashboard observability, promo and affiliate operations,
  announcements, redemption, subscriptions, model plaza, payment cancellation
  and refunds, public order recovery, and channel-monitor v1/v2.
- Add isolated `sub2api_admin_client.dart` and `sub2api_ops_client.dart`
  entrypoints with Admin JWT role bootstrap, a redacted Admin API Key provider,
  strict `Authorization` versus `x-api-key` separation, no credential fallback,
  stable step-up failures, and typed Admin Dashboard statistics.
- Complete all 19 typed Admin Users routes in both privileged credential modes,
  including lifecycle, identity binding, balance updates, API keys, usage,
  balance history, group replacement, RPM status, batch limits, platform
  quotas, quota-window reset, and user attribute values.
- Add 11 typed read-only Admin Groups routes for complete group facts,
  capacity and usage summaries, Live capability, model candidates, composite
  routes, statistics, per-user rates, and group API keys.
- Add 11 non-replayable Admin Groups actions for sort order, idempotent
  duplication, deletion, composite-route lifecycle and preview, per-user rate
  multipliers, and RPM overrides.
- Add the generated v0.1.183 management route manifest: 566 registered routes,
  552 target client routes, and explicit callback/webhook/static exclusions.
- Accept ADR-0008 to complete the User and Admin/Ops management surfaces with
  isolated JWT and Admin API Key facades.

## 0.1.0-dev.3

- Upgrade the immutable Sub2API contract baseline from `v0.1.155` to
  `v0.1.183` at commit `e8cb019fabf8b55199436229044cbf9aa7a82564`.
- Add v0.1.183 captcha and Passkey capability flags, Tencent captcha request
  fields for verification-code and password-reset flows, and a generalized
  captcha challenge token compatible with Turnstile and Aliyun.
- Add subscription-plan currency and Alipay mobile precreate/deep-link facts
  to the typed Billing contract.
- Enforce v0.1.183 API Key non-negative limit and positive expiry-day rules
  before network I/O while preserving omitted-versus-empty list updates.
- Keep the v0.1.155 fixtures as historical evidence and add a separate active
  v0.1.183 fixture set.

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
