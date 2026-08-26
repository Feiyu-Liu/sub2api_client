# Multiplatform and Linux Docker E2E evidence

- **Date**: 2026-08-25
- **Package commit**:
  `a84fca824db1bbaf3c3a81d44df780dc3af4368f`
- **Sub2API version**: `v0.1.155`
- **Sub2API commit**:
  `41cec0db059ffb82d0efdcfcf07a24ab51fbfe97`

## Package test matrix

Each remote host cloned the public repository and checked out the exact package
commit above in a unique temporary directory. The macOS run used the local Git
checkout at the same commit. No uncommitted source was copied into either
remote test environment.

| Platform | Host | Architecture | Dart | Result |
| --- | --- | --- | --- | --- |
| macOS | current device | ARM64 | 3.11.5 | PASS |
| Linux | `ssh linux-env` (`100.84.137.6`) | x64 | 3.11.5 | PASS |
| Windows | `ssh windows-env` (`100.123.250.88`) | x64 | 3.12.2 | PASS |

Every platform passed the following gates:

```sh
dart pub get
dart format --output=none --set-exit-if-changed lib test example integration_test
dart analyze --fatal-infos
dart test
```

Common results:

- 83 Dart files required no formatting changes.
- Static analysis reported no issues.
- All 73 offline tests passed.

The Linux and Windows hosts could not reach `pub.dev` directly during this
run. Dependency resolution was repeated successfully with:

```text
PUB_HOSTED_URL=https://pub.flutter-io.cn
FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

This was an environment networking constraint, not a package test failure.
The Windows OpenSSH client also warned that the connection did not negotiate a
post-quantum key exchange algorithm; the SSH connection remained authenticated
and all commands completed successfully.

## Linux Docker deployment

The E2E run used existing immutable images on `linux-env`:

```text
Sub2API image: codex-trans/sub2api:v0.1.155-41cec0d
Sub2API image ID: sha256:4f3923153df69a6a620832f21be67b1362ca6a66f0fb8af4d6a7a173b122a460
PostgreSQL image: postgres:18-alpine
PostgreSQL image ID: sha256:d3e1620b530c944afa6e887d22eb899824da68e19c52024bf98f5220c88a65b2
Redis image: redis:8-alpine
Redis image ID: sha256:becdda6c7f4b3fb42e42fd7f120bbf5c54c4caaaf16f26da24e4563d2c1f0576
```

Docker image labels independently reported:

```text
version=v0.1.155
revision=41cec0db059ffb82d0efdcfcf07a24ab51fbfe97
```

The stack used unique container, named-volume, and network names. Sub2API was
published only on a dynamically allocated remote loopback port. Database, JWT,
TOTP, and disposable account passwords were randomly generated in the remote
shell, were never printed, and were not written into the repository.

## Controlled E2E result

The package test was invoked with the opt-in environment contract documented
in `integration_test/controlled_linux_env_test.dart`:

```sh
SUB2API_INTEGRATION_ENABLED=true \
SUB2API_INTEGRATION_COMMIT=<pinned-sub2api-commit> \
SUB2API_INTEGRATION_ORIGIN=http://127.0.0.1:<dynamic-port> \
SUB2API_INTEGRATION_EMAIL=<disposable-account> \
SUB2API_INTEGRATION_PASSWORD=<process-local-password> \
dart test integration_test
```

Result:

```text
00:00 +1: All tests passed!
```

The live flow covered public capability bootstrap, password login, current
profile, Key list, Usage statistics, local-first logout, and session-store
cleanup. Payment was disabled in the disposable deployment, so no payment
provider or order-creation flow was exercised. Admin/Ops client behavior was
not tested because commit `a84fca8` exposes only the user API surface.

## Cleanup

After the passing E2E run, the unique Sub2API, PostgreSQL, and Redis containers,
their three named volumes, and the isolated Docker network were removed.

```text
containers=0 volumes=0 networks=0
```

The Linux and Windows temporary package checkouts were also removed after the
test evidence was captured. Existing unrelated containers and Docker resources
on `linux-env` were not modified.
