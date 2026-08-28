# ADR-0008 Linux Docker E2E evidence

- **Date**: 2026-08-28
- **Package commit**:
  `d300cb1ca69449237609c7a0487faf376c8fae62`
- **Sub2API version**: `v0.1.183`
- **Sub2API source commit**:
  `e8cb019fabf8b55199436229044cbf9aa7a82564`
- **Host**: `ssh linux-env` (Linux x64)

## Deployment method

The deployment was disposable and bound only to `127.0.0.1:18080` on
`linux-env`. It used the pinned source commit above, not a moving upstream
branch. The remote shell checked out that exact commit and verified `HEAD`
before building.

The upstream multi-stage Docker build could not be used because fetching its
Go base-image layer was unreliable on this host. To preserve source fidelity,
the remote host instead downloaded Go `1.27.0`, compiled
`backend/cmd/server` from the pinned source with `-tags embed` and
`CGO_ENABLED=0`, copied the pinned `backend/resources`, and imported that
root filesystem as a one-off Docker image. A minimal placeholder frontend
asset existed solely to satisfy the backend's `go:embed` build input; no
frontend behavior was part of this API test.

The stack used the host's cached `postgres:18-alpine` and `redis:8-alpine`
images on an isolated Docker network. PostgreSQL 18's data volume was mounted
at `/var/lib/postgresql`, which is the image's version-aware layout. The
static runtime was explicitly configured with `TZ=UTC`; the production
upstream runtime image normally installs timezone data, whereas this
one-off imported image intentionally did not.

All PostgreSQL, JWT, TOTP, Admin API Key, and disposable account credentials
were generated in the remote process, stored in a mode-`0600` temporary
environment file only for the test, and never printed or added to this
repository.

## Package test invocation

The package was tested from a clean Linux checkout at the package commit
above. Its opt-in integration environment named the exact server commit,
loopback origin, and disposable administrator credentials; the established
read-only integration variables reused that administrator only for this
isolated deployment.

```sh
SUB2API_INTEGRATION_ENABLED=true \
SUB2API_INTEGRATION_COMMIT=<pinned-sub2api-commit> \
SUB2API_INTEGRATION_ORIGIN=http://127.0.0.1:18080 \
# The four administrator/read-only credential variables are injected privately. \
dart test integration_test
```

Result:

```text
00:00 +2: All tests passed!
SUB2API_LINUX_DOCKER_E2E_OK
```

## Live behavior covered

`controlled_linux_admin_e2e_test.dart` exercised the following behavior
against the running service:

- administrator password login, Admin JWT bootstrap, and compliance
  acknowledgement when required;
- TOTP feature enablement, enrollment, and successful step-up verification;
- administrator dashboard access and normal-user creation, login, and profile
  read;
- rejection of an Admin facade call made with a normal-user session;
- Admin API Key regeneration, a successful Ops dashboard read, and rejection
  of an invalid Admin API Key;
- `step_up_required` for a sensitive Admin JWT operation before TOTP step-up;
- `step_up_admin_api_key_forbidden` for the same type of operation through
  Admin API Key credentials;
- access after an Admin JWT step-up reaches the downstream non-step-up error,
  proving the gate was passed rather than bypassed; and
- the stable `admin.data_management_deprecated` error mapping.

This is a controlled package-to-service integration check. It does not prove
Gateway data-plane behavior, payment-provider callbacks, a production
deployment, GUI acceptance, or a release.

## Cleanup

The uniquely named Sub2API, PostgreSQL, and Redis containers, isolated
network, PostgreSQL volume, imported image, temporary Go toolchain, pinned
source checkout, and the temporary credential directory were removed after
the passing test.

```text
E2E_CLEANUP_OK
```
