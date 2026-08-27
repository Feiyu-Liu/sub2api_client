# Architecture Decision Records

本目录记录 `sub2api_client` 的长期架构决策。实现代码、公共接口和依赖变化必须遵守
状态为 **Accepted** 的 ADR；若后续决策改变既有结论，应新增 ADR 并将旧 ADR 标记为
**Superseded**，而不是直接改写历史原因。

## 状态

- **Proposed**：等待决策，不授权实现。
- **Accepted**：已接受，是当前实现约束。
- **Rejected**：已评审但不采用。
- **Deprecated**：仍存在但不再推荐用于新代码。
- **Superseded**：已被后续 ADR 替代。

## 索引

| ADR | 状态 | 决策 |
| --- | --- | --- |
| [ADR-0001](0001-independent-pure-dart-client-architecture.md) | Accepted（部分由 0003/0005 替代） | 独立 MIT 纯 Dart package、feature-first 协议模块、User/Admin 分离接口与固定 Sub2API 合同 |
| [ADR-0002](0002-v0-1-155-wire-contract.md) | Superseded by 0007 | 固定 v0.1.155 wire contract，并在 `ssh linux-env` Docker 环境运行受控真实服务测试 |
| [ADR-0003](0003-v0-1-package-scope-and-dependencies.md) | Accepted（部分由 0005 替代） | v0.1 只实现用户端；采用 Dio、条件 Retrofit、json_serializable、Freezed 3.2.5、decimal 和手写敏感类型 |
| [ADR-0004](0004-http-json-and-concurrency-policy.md) | Accepted（由 0005 补充） | HTTP 异步 I/O、严格状态/JSON 解码、profile 驱动的短时 isolate 与 session single-flight 竞态策略 |
| [ADR-0005](0005-official-dart-package-engineering-gates.md) | Accepted | 官方 Dart library 目录、依赖上下界、JSON 兼容、refresh 生命周期、严格分析和测试分层 Gate |
| [ADR-0006](0006-adopt-retrofit-and-custom-session-coordinator.md) | Accepted | 采用内部 Retrofit endpoint 生成层和满足 generation/deadline 合同的自研 Session Coordinator |
| [ADR-0007](0007-upgrade-wire-contract-to-v0-1-183.md) | Accepted | 将活动 wire contract 升级到 v0.1.183，保留旧 fixtures，并明确新增字段与未实现业务面的边界 |

## 编写规则

1. 文件名使用 `NNNN-short-title.md`。
2. ADR 记录结构性选择、公共接口、安全 seam、外部集成和不可逆依赖；普通 DTO、测试
   fixture 和小型实现细节不单独写 ADR。
3. 每份 ADR 至少包含状态、背景、决策、后果、验证要求和被拒绝方案。
4. 外部协议必须记录精确版本或 commit，不能只引用可漂移的默认分支。
