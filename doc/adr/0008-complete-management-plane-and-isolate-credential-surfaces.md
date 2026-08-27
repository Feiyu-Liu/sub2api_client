# ADR-0008：完成管理业务面并隔离 User、Admin 与 Ops 凭证入口

- **状态**：Accepted
- **日期**：2026-08-27
- **决策者**：Package 主理人
- **协议基线**：Sub2API `v0.1.183` / commit
  `e8cb019fabf8b55199436229044cbf9aa7a82564`
- **替代范围**：替代 ADR-0003 第 1 节“v0.1 不提供 Admin/Ops”的范围决定；ADR-0003
  的依赖、公共模型和 App/package 边界继续有效
- **关联**：ADR-0001、ADR-0004、ADR-0005、ADR-0006、ADR-0007

## 背景

当前 package 对固定 `v0.1.183` 合同提供 29 个 typed endpoint，覆盖 Capability、基础
Auth、User/Profile、API Key CRUD、Usage 基础查询以及 Billing 基础建单/查单。它能支撑
最小用户闭环，但尚未覆盖 Passkey、OAuth、TOTP、身份绑定、用户配额、Dashboard、公告、
兑换、订阅、渠道监控、支付取消/退款，也没有 Admin/Ops 公共入口。

ADR-0003 曾为了首版交付排除 Admin/Ops。Package 主理人现已明确后续范围必须包含 Admin
实现，因此需要用新 ADR 替代旧范围，而不能把该变化隐藏在普通 endpoint 增量中。

同时，“完整业务面”容易混淆四类不同协议：

1. 登录用户管理自己账号和消费状态的用户管理面；
2. 管理员管理部署、用户、渠道、计费和运维状态的管理面；
3. 使用 API Key 转发模型请求的 Gateway 数据面；
4. 由 OAuth 提供方、支付提供方或服务编排器调用的 callback、webhook 和 setup ingress。

这些协议具有不同的调用主体、凭证、失败模式和测试风险，不能由一个自动猜测认证方式的
万能客户端承载。

## 决策驱动因素

- 后续 package 必须覆盖完整的用户管理面和 Admin/Ops 管理面；
- 管理员 JWT、Admin API Key 和普通 Gateway API Key 必须保持凭证隔离；
- 固定源码合同仍是唯一协议权威，不使用漂移的上游默认分支；
- public interface 必须保持 typed，不暴露 Dio、raw JSON 或任意 path 请求；
- 高风险 Admin 操作必须能在一次性测试部署中验证权限、step-up 和审计错误；
- 不能用“路由已存在”或“DTO 已生成”代替可执行的 endpoint 合同证据。

## 决策

### 1. 固定管理业务面的含义与完成边界

本项目采用以下完成口径：

- **用户管理面**：用户直接发起的 Auth、账号安全、Profile、身份绑定、API Key、用户可用
  分组/渠道、配额、Usage、Dashboard、公告、兑换、订阅、渠道监控和 Billing 操作；
- **Admin 管理面**：管理员通过 JWT 调用的 `/api/v1/admin/*` HTTP、流式或 WebSocket
  操作，包括 Dashboard、用户、分组、账号、渠道、支付、配置、审计、备份、系统与 Ops；
- **Ops 凭证模式**：外部自动化通过 Admin API Key 调用服务端允许的同一 Admin 管理面；
  它是独立认证模式，不等于拥有比管理员 JWT 更高的权限；
- **Gateway 数据面**：模型转发、OpenAI/Anthropic/Gemini 兼容请求、图片、视频、语音、搜索
  和 Realtime；不计入“管理业务面完成”，实施前必须另写 Gateway wire/passthrough ADR；
- **服务端 ingress**：OAuth callback、支付 webhook、健康检查、安装 setup 和静态资源路由；
  它们不是调用方 SDK 操作，不进入 public client。

OAuth 登录或绑定的“开始、交换 pending token、完成注册/绑定”等客户端动作属于用户管理面；
由第三方浏览器重定向到服务端的 callback handler 不包装成可主动调用的 public endpoint。
支付建单、查单、取消、退款申请、公开恢复属于用户管理面；支付提供方 webhook 不属于。

只有固定合同清单中所有用户管理面和 Admin 管理面条目都达到本 ADR 第 7 节的完成标准时，
文档才可以声明“完整管理业务面”。在此之前必须使用“部分覆盖”并列出未实现模块。

### 2. 使用三个隔离的公共入口

公共入口固定为：

```dart
import 'package:sub2api_client/sub2api_client.dart';
import 'package:sub2api_client/sub2api_admin_client.dart';
import 'package:sub2api_client/sub2api_ops_client.dart';
```

- `Sub2ApiClient`：普通用户及管理员用户共有的用户管理面；
- `Sub2ApiAdminClient`：管理员 JWT 会话使用的 Admin 管理面；
- `Sub2ApiOpsClient`：Admin API Key 使用的无头运营/自动化入口。

`Sub2ApiClient` 不增加 `.admin` 或 `.ops` 属性。`Sub2ApiAdminClient` 与
`Sub2ApiOpsClient` 可以在内部复用 Admin feature contract、DTO、mapper、executor 和错误
解码，但不能复用彼此的凭证状态，也不能在认证失败后自动改用另一种凭证。

未来 Gateway 使用第四个入口 `sub2api_gateway_client.dart`，但其请求模型、流式响应、兼容
协议和 passthrough 边界必须由独立 ADR 决定；本 ADR 不授权公共 `request(path, body)`。

### 3. JWT Admin 与 Admin API Key 使用不同生命周期

`Sub2ApiAdminClient`：

- 使用调用方注入的 `Sub2ApiSessionStore` 和现有 refresh single-flight；
- 通过 `/api/v1/auth/me` 建立当前 session generation 的用户与角色事实；
- 角色不是 `admin` 时映射为稳定错误 `auth.admin_required`；
- session 被刷新、替换或清除后，旧的角色/step-up 事实同时失效；
- 服务端 `/admin/*` 鉴权始终是最终权限权威，客户端预检不能替代 401/403 处理。

`Sub2ApiOpsClient`：

- 通过独立的手写敏感类型和调用方提供的 credential provider 获取 Admin API Key；
- 只发送 `x-api-key`，不读取或写入 `Sub2ApiSessionStore`；
- 不执行 refresh、JWT replay、角色预检或 Bearer fallback；
- key 重新生成后由调用方原子替换 credential provider 中的值；package 不持久化 secret；
- `toString()`、错误、日志、测试描述和快照不得包含 key 原值。

上游 step-up 门控启用时，Admin API Key 会被拒绝访问需要真人 TOTP step-up 的敏感操作。
Package 必须保留并映射 `STEP_UP_ADMIN_API_KEY_FORBIDDEN`、`STEP_UP_TOTP_NOT_ENABLED`、
`STEP_UP_REQUIRED` 和 `STEP_UP_UNAVAILABLE`，不得自动改用 JWT 或绕过门控。调用方需要此类
操作时必须显式使用已完成 step-up 的 `Sub2ApiAdminClient`。

### 4. 按协议能力组织模块，不按页面复制上游前端

用户管理面按以下 feature 渐进扩展：

- `auth`：`me`、撤销全部会话、Passkey 登录、OAuth 登录与 pending flow；
- `user/security`：TOTP、Passkey 管理、身份绑定、通知邮箱；
- `access`：可用分组、费率、渠道、平台配额和每 Key 每日用量；
- `usage`：错误详情、Dashboard 聚合与趋势；
- `commerce`：公告、兑换、订阅、渠道监控、支付取消/退款/公开恢复；
- 现有 `keys`、`billing`、`capability` 保持独立 feature，并按合同扩展。

Admin 管理面按稳定服务端资源组织，至少包括：

- Dashboard、用户、分组、账号、API Key 和用户属性；
- 渠道、渠道监控、供应商 OAuth、代理、TLS fingerprint 与错误透传；
- 公告、兑换码、优惠码、订阅、affiliate、支付订单/套餐/提供方；
- 设置、审计日志、prompt audit、risk control、compliance；
- Usage、定时测试、插件、数据管理、备份、系统更新与 Ops 监控。

目录按首个 endpoint 实现时创建，不预建空模块。上游前端页面、store 或展示 DTO 不成为
package 分层；只复用其行为理解，wire contract 仍以固定后端源码和 fixture 为准。

### 5. 分阶段交付，先建立安全依赖再扩展广度

后续实施顺序固定为：

1. **用户会话与 Passkey**：`auth/me`、撤销全部会话、Passkey 登录和凭据管理；
2. **账号安全与身份**：TOTP、OAuth、邮箱/第三方身份和通知邮箱；
3. **用户资源与可观测性**：分组、渠道、配额、每日用量、Usage 错误与 Dashboard；
4. **用户商业闭环**：公告、兑换、订阅、渠道监控、支付取消/退款/公开订单恢复；
5. **Admin 基础**：JWT 角色 bootstrap、Admin facade、Dashboard、用户、分组、账号；
6. **Ops 凭证与高风险门控**：Admin API Key facade、step-up 错误、审计与权限负向测试；
7. **Admin 商业与资源管理**：渠道、供应商、代理、Billing、订阅、兑换和配置；
8. **Admin 运维完整性**：监控、数据管理、备份、系统、插件、定时测试及剩余路由；
9. **Gateway 决策**：在独立 ADR 通过后再实现，不阻塞管理业务面完成。

每个阶段可独立发布 dev 版本，但不得因某个 facade 已存在就宣称其所属管理面完整。

### 6. 建立固定、可审计的 route manifest

从 `v0.1.183` 固定源码生成或人工维护一份受审 route manifest。每个条目至少记录：

- method 与规范化 path；
- 所属 feature 和公共入口；
- 认证模式：public、user JWT、admin JWT、Admin API Key、Gateway API Key；
- 是否需要 TOTP step-up、feature flag、backend mode 或特殊 rate limit；
- 实施状态：unsupported、modeled、transport-tested、E2E-tested；
- 请求/响应/错误 fixture 的固定源码依据。

Callback、webhook、setup、静态资源和重复兼容 alias 必须明确标记为 excluded 及原因，不能
简单从清单删除。上游升级时先对 manifest 做 diff，再修改 public model。

### 7. endpoint 与阶段完成标准

单个 endpoint 只有同时满足以下条件才算完成：

1. 有 typed public request/result；敏感结果使用手写 redacted 类型；
2. 有独立 wire DTO/mapper 或经过评审的流式协议实现；
3. 使用共享 transport、deadline、取消、错误和 session/credential policy；
4. 有固定源码 fixture 的成功、业务失败、鉴权失败和 malformed-contract 测试；
5. 可选字段、分页、金额、时间和 unknown additive fields 按 ADR-0004/0005 处理；
6. public entrypoint 不导出 Dio、Retrofit、raw JSON 或 generated wire 类型；
7. route manifest 状态与实现、测试证据一致。

阶段完成还必须通过：

- macOS 当前设备的 format、analyze、unit/contract test、doc 和 publish dry-run；
- Linux 与 Windows 实机的同一提交 package gate；
- `linux-env` 上固定 `v0.1.183` 镜像/源码构建的一次性 Docker E2E；
- Admin 阶段同时验证管理员 JWT、非管理员 JWT、无效 Admin API Key、有效 Admin API Key、
  step-up required 和 step-up 禁止 API Key 的负向路径；
- 高风险 create/update/delete/backup/system 测试只操作一次性部署和专用 fixture，不接触生产。

旧 `v0.1.155` 三平台与 Docker E2E 只保留为历史证据，不能证明新增 endpoint 或当前合同。

### 8. 版本和兼容性

- 新增 feature client、方法和 model 默认是 additive minor/dev 版本变化；
- 修改现有必填构造参数、错误码语义、session/credential 生命周期属于 breaking change；
- 上游 tag 升级必须新增合同 ADR 和 fixture 目录，不覆盖 `v0.1.183` 证据；
- 文档中的 endpoint 数量从 route manifest 计算，不能手工估算后长期漂移；
- 未实现 endpoint 返回“不存在于 public interface”，不提供运行时
  `unsupportedEndpoint(path)` 逃生口。

## 后果

### 正向

- “完整业务面”获得可检查的边界，不再把 Gateway、webhook 和 Admin 混为一谈；
- 用户 App、管理员 UI 和无头自动化不会意外共享高权限凭证；
- Admin API Key 的真实能力限制和 step-up 行为成为 public error contract；
- 数百个管理路由可以按 feature 分批交付，同时保持最终覆盖率可审计；
- 上游升级可通过 route manifest diff 发现新增、删除和认证策略变化。

### 负向与成本

- 新增两个公共 facade、凭证 provider、Admin 模型和更大的测试矩阵；
- Admin 管理面很大，完整覆盖需要多个 dev 版本，不能一次性低风险完成；
- JWT 与 Admin API Key 对同一路由可能具有不同可用性，需要逐 endpoint 记录；
- WebSocket、流式导出/下载和大型备份接口需要额外跨平台验证；
- route manifest 本身成为需要随合同升级维护的工程制品。

## 被拒绝方案

- **继续永久排除 Admin/Ops**：与已确认的 package 范围冲突，拒绝。
- **把 Admin 挂到 `Sub2ApiClient.admin`**：扩大普通 App 的权限面并模糊凭证生命周期，拒绝。
- **一个 Admin 客户端自动选择 JWT 或 Admin API Key**：可能在权限失败后意外降级为机器凭证，
  也无法正确表达 step-up，拒绝。
- **用公共 raw request 快速覆盖数百条路由**：无法保证 typed contract、脱敏和错误稳定性，拒绝。
- **直接跟随上游 `main` 实现**：默认分支会漂移，测试证据不可复现，拒绝。
- **把 callback/webhook 也包装成“完整 SDK”**：这些是服务端 ingress，不是客户端主动业务操作，
  会制造错误的使用方式，拒绝。
- **在本 ADR 中同时决定 Gateway passthrough 模型**：Gateway 的动态请求、流式响应和兼容协议
  具有独立重大权衡，必须另写 ADR，拒绝捆绑决定。
