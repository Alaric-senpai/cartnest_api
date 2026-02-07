# Payment Alternatives for CartNest API

## Recommended approach
Use a **Payment Orchestration** pattern:
- Provider adapters (`flutterwave`, `paystack`, `stripe`, `mobile-money`) behind one internal interface.
- Store payment attempts and webhook states in a local `payments` table.
- Trust **webhook verification** as source of truth for order completion.

## Option A: Stripe (global cards + wallets)
- Best for global markets, cards, Apple Pay, Google Pay.
- Strong fraud tooling and mature webhook ecosystem.
- Tradeoff: fewer region-specific rails in parts of Africa.

## Option B: Paystack (Nigeria/West Africa)
- Better local payment methods and local settlement.
- Good dashboard and merchant ops UX.
- Tradeoff: regional concentration.

## Option C: Flutterwave (multi-country Africa)
- Broader African rails and mobile money coverage.
- Good for cross-country African merchants.
- Tradeoff: provider behavior can vary by corridor.

## Option D: DPO/Pesapal (East Africa focus)
- Useful for Uganda/Kenya/Tanzania-focused businesses.
- Better local operational familiarity.

## Core production requirements (regardless of provider)
1. Verify webhook signatures (HMAC/public key).
2. Idempotency key on payment initiation.
3. Payment state machine (`pending`, `authorized`, `paid`, `failed`, `refunded`).
4. Reconciliation job (provider reports vs local ledger).
5. Separate order placement from payment capture (saga pattern).
6. Retry-safe webhook handlers.

## Suggested DB entities
- `payments`
- `payment_events`
- `refunds`
- `provider_accounts`

## Suggested next implementation step
Start with Flutterwave + Stripe adapters behind one interface, then add Paystack as second regional adapter.
