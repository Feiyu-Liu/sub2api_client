# Fixed Contract Route Manifest

`v0_1_183_route_manifest.json` is the auditable coverage inventory for the
Sub2API `v0.1.183` management contract. It is generated from the immutable
source commit recorded in the manifest, not from the upstream default branch.

Generate or refresh it from the independent upstream checkout:

```sh
dart run tool/generate_route_manifest.dart
```

Verify that the checked-in manifest is current:

```sh
dart run tool/generate_route_manifest.dart --check
```

Status meanings:

- `unsupported`: no typed package endpoint exists.
- `modeled`: a typed wire endpoint exists but no fixed-path transport test was
  detected.
- `transport_tested`: the typed endpoint and its fixed path have test evidence.
- `excluded`: callback, webhook, static asset, setup, or other server ingress
  outside ADR-0008's client target.

Management-surface completion requires every target entry to reach at least
`transport_tested`. Controlled Docker E2E separately proves representative
user JWT, administrator JWT, Admin API Key, permission rejection, and step-up
flows; destructive endpoints are not individually exercised against a shared
or production deployment.
