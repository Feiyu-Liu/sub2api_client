# Fixed contract artifacts

This directory contains the auditable generated inventories for the pinned
Sub2API `v0.1.183` management contract. The artifacts are generated from the
immutable source revision recorded in each file, not from the upstream default
branch.

Refresh or verify them with:

```sh
dart run tool/generate_route_manifest.dart
dart run tool/generate_route_manifest.dart --check
dart run tool/generate_admin_settings_contract.dart
dart run tool/generate_admin_settings_contract.dart --check
```

The route manifest records every target management route and each explicit
server-ingress exclusion. Management-surface completion requires every target
route to be `transport_tested`; controlled Docker E2E separately verifies
representative credential, permission, and step-up behavior.
