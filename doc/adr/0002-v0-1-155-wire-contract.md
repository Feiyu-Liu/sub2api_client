# ADR-0002：固定 Sub2API v0.1.155 wire contract 与安全模型

- **状态**：Accepted
- **日期**：2026-08-25
- **决策者**：Package 主理人
- **关联**：ADR-0001
- **协议基线**：Sub2API `v0.1.155` / commit
  `41cec0db059ffb82d0efdcfcf07a24ab51fbfe97`

## 背景

ADR-0001 决定采用独立、纯 Dart、typed 的 Sub2API 客户端，但没有冻结每个关键 wire
contract。Sub2API 没有项目自有的权威 OpenAPI，且固定源码中同时存在两种错误结构、
可选 refresh token、完整 API Key 回传和多形态支付结果。若只参考前端类型或 handler
注释，容易把路径、敏感字段或业务状态建模错误。

本 ADR 以固定 tag 的路由、handler DTO、service 和中间件源码为依据，补充 ADR-0001。
后续升级不得用默认分支的行为倒灌本基线。

## 决策

### 1. 公开设置是能力引导入口

客户端在展示注册、登录辅助能力或支付入口前，先读取：

```text
GET /api/v1/settings/public
```

公开模型 `Sub2ApiCapabilities` 至少覆盖：

- `registration_enabled`、`email_verify_enabled`、`password_reset_enabled`；
- `invitation_code_enabled`、`totp_enabled`；
- `turnstile_enabled`、`turnstile_site_key`；
- 服务端实际开放的 OAuth 开关；
- `backend_mode_enabled`、`payment_enabled`；
- `version`、`server_timezone`、`server_utc_offset`。

调用方不得根据本地配置猜测服务端能力。未知新增字段可忽略；固定 fixture 中的必需字段
缺失或类型错误时返回 `protocol.*`，不能静默改成 `false`。

### 2. 同时支持两种错误结构

普通 handler 使用整数 envelope：

```json
{
  "code": 400,
  "message": "...",
  "reason": "INVALID_AMOUNT",
  "metadata": {}
}
```

其中稳定业务码优先取 `reason`，整数 `code` 主要表达 HTTP 状态。JWT、Admin Auth 和
其他 server middleware 可能直接返回字符串结构：

```json
{
  "code": "TOKEN_EXPIRED",
  "message": "..."
}
```

解码器必须按 `code` 的 JSON 类型和字段组合显式区分，不允许把所有错误强转为同一种
wire DTO。公共异常只暴露 package 的稳定 `code`、failure kind、HTTP status 和非敏感
追踪信息，不暴露后端文案或原始 body。

全局管理面响应可读取 `X-Request-ID`。`X-Client-Request-ID` 在本基线只由推理网关
`/v1/*` 的专用 middleware 注入；管理面若偶然返回则可读取，但不得作为 `/api/v1/*`
的必需合同。

### 3. 登录和刷新是显式状态机

登录结果使用 union：

- `authenticated`：含 access token、用户和可选 refresh token；
- `twoFactorRequired`：含临时 token 与脱敏邮箱，不建立已登录 session。

服务端在 refresh-token cache 不可用时会回退为只返回 access token。因此 authenticated
session 再分为：

- `refreshable`：同时持有 access/refresh token；
- `nonRefreshable`：只有 access token，过期后必须重新登录。

`POST /api/v1/auth/refresh` 每次成功都会返回新 access/refresh token，并使旧 refresh
token 立即失效。package 必须使用 single-flight，先原子保存新 token pair，再最多重放
原请求一次。

以下错误会使当前 session 失效并清除本地 token：

- `REFRESH_TOKEN_INVALID`；
- `REFRESH_TOKEN_EXPIRED`；
- `TOKEN_REVOKED`；
- 用户不存在、停用或 access token 被撤销的等价认证错误。

`REFRESH_TOKEN_REUSED` 在固定源码中有常量定义，但刷新执行路径没有发出该错误。package
可以将其作为向前兼容的 session-invalid 错误处理，但不得把它写入
`v0.1.155` 的已验证响应 fixture。

### 4. Installation Key 不等于 per-key RPM

用户 Key 的实际路由是：

```text
GET    /api/v1/keys
GET    /api/v1/keys/:id
POST   /api/v1/keys
PUT    /api/v1/keys/:id
DELETE /api/v1/keys/:id
```

handler 中残留的 `/api/v1/api-keys` 注释不是路由合同。

Key 的 `quota`、`quota_used`、`rate_limit_5h`、`rate_limit_1d`、
`rate_limit_7d` 及对应 usage 都以 USD 计价。5h/1d/7d 字段是消费窗口，不是每分钟
请求数。RPM 位于 user/group/user-group override 层，固定版本没有 per-key RPM 字段。

上游的 Key 列表、详情和创建响应都会包含完整 `key`。package 必须：

- 列表默认映射为不含 secret 的 `Sub2ApiKeySummary`，丢弃 wire 中的完整 key；
- 详情/创建结果使用 `Sub2ApiKeyDetails` + 不透明 `Sub2ApiApiKeySecret`；
- secret 类型禁止 JSON 通用导出，`toString()` 固定脱敏；
- logger、错误、trace metadata 和测试快照不得出现完整 key。

### 5. 余额充值与套餐购买使用不同金额合同

余额充值创建订单时，客户端提交 `amount`。服务端负责：

- 校验 `min_amount` / `max_amount` 和支付方式限额；
- 应用 `balance_recharge_multiplier` 计算实际入账余额；
- 计算手续费、支付金额和币种。

订阅订单由客户端提交 `plan_id`，服务端读取 plan price；客户端传入的 `amount` 不是套餐
价格权威源。

创建订单结果按 `result_type` 建模为 sealed union：

- `orderCreated`：已创建订单，并携带支付 URL、二维码、Stripe client secret 等适用的
  checkout instructions；
- `oauthRequired`：需要先完成微信 OAuth，此时不得假定已创建订单；
- `jsapiReady`：携带微信 JSAPI payload。

package 不负责打开浏览器、渲染二维码、调用 Stripe/微信 UI 或调度轮询。

固定版本的 `POST /api/v1/payment/orders` 没有接入通用 `Idempotency-Key` coordinator。
因此 package 不得自动重试建单，也不得宣称同一 idempotency key 会返回同一订单。网络
结果未知时，应先刷新订单列表并由调用方决定是否重新建单。

余额订单主阶段为：

```text
PENDING -> PAID -> RECHARGING -> COMPLETED
```

`PAID` 只表示支付已确认，`RECHARGING` 表示正在入账。只有 `COMPLETED` 表示服务端完成
fulfillment；“新余额已在客户端可见”仍需重新读取用户资料/余额确认。

### 6. 原版没有首充赠额合同

固定源码没有“仅第一次成功充值赠额”的资格、预计赠额、结算结果或已使用状态接口。
现有两个机制不能冒充首充：

- promo code 的 `bonus_amount` 是注册优惠码赠额；
- `balance_recharge_multiplier` 是所有余额充值的全局倍率。

因此 `v0.1.155` public API 不提供 `firstRechargeEligible` 或本地推断能力。若产品需要首充
赠额，必须先在服务端扩展权威合同，再用后续 ADR 和新 fixture 开放客户端模型。

### 7. 版本升级规则

升级 Sub2API 时新增独立版本 fixture 和兼容评审；不得直接修改 `v0_1_155` fixture 使旧
合同“自动通过”。

### 8. 受控真实服务测试环境

package 的真实服务集成测试使用 SSH 主机别名 `linux-env` 上的 Docker Sub2API 测试部署。
部署固定到 `v0.1.155` commit 或对应不可变 image digest，并使用测试专用数据库、Redis、
用户、Key、订单和支付配置。

package 通过 HTTP 访问该服务；SSH 只用于部署、重置、日志诊断和回收资源，不能进入
public API 或正常运行依赖。测试不得读取生产数据、使用生产凭证或产生真实扣款。所有测试
产生的 secret 必须脱敏且在完成后撤销，测试数据应可重复清理或重建。

该环境用于补充 fixture/transport 测试，不能替代 Windows/macOS App、secure storage、
支付外跳、GUI/E2E 或生产验收。

## 验证要求

首批 contract fixtures 至少覆盖：

- `/settings/public` 能力模型；
- 成功 envelope、整数错误 envelope、字符串 middleware 错误；
- 普通登录、2FA、access-only 登录、token pair refresh rotation；
- Key 列表 secret 丢弃、详情 secret 脱敏和 USD 窗口；
- 余额充值、套餐订单和三种 create-order result；
- `PENDING/PAID/RECHARGING/COMPLETED` 状态；
- 支付建单不自动重试。

受控集成测试还必须记录：

- 服务端 commit 或 image digest；
- 脱敏后的能力与支付配置摘要；
- 测试时间、运行命令和通过/失败域；
- 测试用户、Key、订单和容器数据的清理结果。

## 后果

**正向**：客户端模型与固定源码一致；认证、Key 和支付中的敏感/多态行为不会泄漏到
调用方；可通过离线 fixture 发现协议漂移。

**负向 / 成本**：需要两套错误解码、登录/payment union 和额外 mapping；列表丢弃完整
Key 后，确需 secret 的调用方必须显式请求详情。

**风险与缓解**：上游无 OpenAPI，升级仍需人工核对；用固定 commit、fixture、源文件清单
和 malformed-contract 测试降低风险。

## 被拒绝方案

- **只按前端 TypeScript 类型生成 Dart model**：无法覆盖 middleware 错误和后端回退
  行为，拒绝。
- **把所有 `code` 当整数或字符串**：会误解另一种错误结构，拒绝。
- **在 Key summary 中长期保存完整 secret**：扩大日志、状态和 crash report 泄漏面，
  拒绝。
- **用充值历史在客户端判断首充**：并发、多端和退款下不可靠，且固定服务端没有权威
  合同，拒绝。

## 参考源码

- `backend/internal/server/routes/{auth,user,payment,gateway}.go`
- `backend/internal/handler/{auth_handler,api_key_handler,payment_handler}.go`
- `backend/internal/handler/dto/{settings,types}.go`
- `backend/internal/server/middleware/{middleware,jwt_auth,request_logger,client_request_id}.go`
- `backend/internal/service/{auth_service,api_key,payment_order,payment_fulfillment}.go`
- `backend/internal/pkg/response/response.go`
