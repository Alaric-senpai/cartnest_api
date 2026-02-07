# CartNest API Production-Readiness Workplan (Execution Update)

This workplan is now split into **implemented now** and **next actions**.

## ✅ Implemented in this PR

### Phase 0 — Critical stabilization
- Enabled `helmet` security headers.
- Added request payload limits (`1mb`) for JSON/urlencoded bodies.
- Tightened global API rate limits.
- Added `/health` and `/ready` operational endpoints.
- Added centralized error middleware.
- Fixed route protection gaps for vendor order endpoints.
- Removed redundant auth route alias (`/me`) that duplicated `/user/me`.

### Phase 1 — Data integrity and consistency
- Added transaction handling in user registration (`beginTransaction`, `commit`, `rollback`).
- Fixed broken user deletion flow (wrong object shape usage).
- Improved DB connection release in high-risk paths.
- Fixed malformed SQL in `system_analytics_sales` insert.
- Fixed analytics controller/model response contract mismatch.

### Phase 2 — Prisma migration foundation
- Added Prisma schema for core user/auth + analytics tables.
- Added Prisma scripts in `package.json` (`prisma:generate`, `prisma:migrate`, `prisma:pull`).

## ⏭️ Remaining steps to complete production-grade state

### Phase 2 — Test + CI hardening
1. Add unit and integration tests for auth/orders/payments.
2. Add CI gates: lint, test, audit, build.
3. Add contract tests for authorization behaviors.

### Phase 3 — Observability
1. Replace console logging with structured logger library (pino/winston).
2. Add metrics endpoint and dashboard/alerts.
3. Add request correlation IDs.

### Phase 4 — Full Prisma cutover + payments
1. Introspect full DB and migrate all models/controllers to Prisma client.
2. Remove remaining direct `mariadb` pool calls.
3. Add payment orchestration module + webhook state machine.

## Suggested sprint order
1. Prisma full cutover for `auth`, `orders`, `carts`, `products`.
2. Payment module introduction (adapter + webhook + idempotency).
3. CI + test coverage gates.
4. Observability + release runbooks.
