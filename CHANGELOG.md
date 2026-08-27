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
