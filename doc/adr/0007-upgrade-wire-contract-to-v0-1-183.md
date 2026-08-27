# ADR-0007：将活动 wire contract 升级到 Sub2API v0.1.183

- **状态**：Accepted
- **日期**：2026-08-27
- **替代**：ADR-0002 的活动协议基线；ADR-0002 与其 fixtures 继续作为历史证据保留
- **协议基线**：Sub2API `v0.1.183` / commit
  `e8cb019fabf8b55199436229044cbf9aa7a82564`

## 背景

package 原先固定到 `v0.1.155`。上游在 `v0.1.183` 保持当前已实现 endpoint 的路径稳定，
但扩展了认证验证码、公开能力、支付和 API Key 校验合同，并新增 Passkey、渠道监控等业务
接口。只修改 README 或版本字符串会导致 package 对真实请求字段和新增响应事实建模不完整。

## 决策

1. `v0.1.183` commit `e8cb019f...` 成为唯一活动源码合同。
2. 新建 `test/fixtures/v0_1_183`；`v0_1_155` 不修改、不删除，用于历史审计。
3. 保持现有 29 个 typed endpoint 的路径和公开 feature seam，不因升级基线自动宣称新增
   Passkey、OAuth、Subscription、Admin 或 Ops endpoint 已实现。
4. 对已有 endpoint 落实以下合同变化：
   - 注册、登录、发送邮箱验证码和忘记密码支持腾讯验证码 ticket/randstr；
   - 通用 challenge token 继续写入后端兼容字段 `turnstile_token`，该字段在
     `v0.1.183` 同时承载 Turnstile 或阿里云验证码 proof；
   - `/settings/public` 暴露 Passkey、腾讯验证码、阿里云验证码、优惠码、第三方注册邮箱和
     邮箱域配额能力；
   - 套餐响应保留可选 ISO 币种标签；checkout/config 与建单结果保留支付宝移动端
     precreate/deep-link 标志；
   - API Key quota、5h/1d/7d limit 必须非负，`expires_in_days` 必须大于零；更新请求继续
     区分列表字段“省略”与“传空数组”。
5. 未知新增响应字段仍按 additive-compatible 方式忽略；已建模必需字段类型变化继续
   fail closed。

## 后果

### 正向

- 当前 Auth、Capability、Key、Usage 与 Billing seam 与 `v0.1.183` 的固定源码一致。
- 新验证码提供方与支付宝移动端支付事实不会被静默丢失。
- 旧合同证据仍可复核，升级不会篡改既有测试历史。

### 负向与限制

- package 不再把 `v0.1.155` 声明为活动支持目标。
- Passkey、完整 OAuth、公告、兑换、订阅状态、渠道监控及 Admin/Ops 仍需独立功能批次；
  基线升级本身不等于完整业务面覆盖。
- `v0.1.183` 的 Linux Docker E2E 与三平台复验必须在实现完成后重新执行；旧 E2E 只证明
  `v0.1.155`。

## 源码依据

- `backend/internal/server/routes/{auth,user,payment}.go`
- `backend/internal/handler/{auth_handler,api_key_handler,payment_handler}.go`
- `backend/internal/handler/dto/settings.go`
- `backend/internal/service/{payment_service,payment_order}.go`
- `frontend/src/types/{index,payment}.ts`
