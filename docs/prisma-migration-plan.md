# Prisma Migration Plan (Implemented Foundation + Next Steps)

## Implemented in this change
- Added `prisma/schema.prisma` for core auth + analytics tables.
- Added npm scripts for Prisma (`prisma:generate`, `prisma:migrate`, `prisma:pull`).
- Hardened API runtime while migration is in progress: security headers, payload limits, health checks, graceful shutdown, and route-protection fixes.

## Migration sequence to complete full Prisma adoption
1. Install dependencies: `npm install`.
2. Set `DATABASE_URL` in `.env`.
3. Run `npx prisma db pull` to introspect full legacy schema.
4. Run `npx prisma generate`.
5. Replace each model sequentially with Prisma client repository functions.
6. Keep old SQL models behind feature flag until parity tests pass.
7. Remove legacy MariaDB pool-based queries after full cutover.

## Cutover checklist
- Contract tests green for all modules.
- No direct `conn.query` calls left.
- Database transaction coverage for user/order/payment flows.
- Readiness check uses Prisma health query.
