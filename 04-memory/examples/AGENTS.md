# Project: TaskFlow (Next.js 14 + Prisma + Tailwind)

> Example AGENTS.md after ~20 Ralph iterations. Demonstrates the recommended
> structure: most-used sections first, brief entries, "When X, then Y" format
> for gotchas, and a temporary Recent Learnings section reviewed weekly.

## Architecture

- App Router with Server Components by default; use `'use client'`
  only for interactive components
- Prisma ORM with PostgreSQL; schema in `prisma/schema.prisma`
- API routes in `app/api/`; server actions preferred over API calls
- Tailwind CSS; no CSS modules; design tokens in `tailwind.config.ts`

### Directory Structure

```
app/
  api/            # API routes
  (dashboard)/    # Dashboard route group
  (marketing)/    # Public pages
components/
  ui/             # Reusable UI primitives
  forms/          # Form components with validation
lib/
  validations/    # Zod schemas (shared client + server)
  db.ts           # Prisma client singleton
prisma/
  schema.prisma   # Database schema
  migrations/     # Migration history
```

## Commands

```bash
npm run dev          # Start dev server (port 3000)
npm run typecheck    # TypeScript strict mode check
npm test             # Vitest with coverage (min 80%)
npx prisma migrate dev    # Apply DB migrations
npx prisma generate       # Regenerate client after schema change
```

## Gotchas

- When adding a new model to `schema.prisma`, run `prisma generate`
  before typecheck or imports will fail
- When modifying `app/layout.tsx`, test both `/` and `/dashboard` routes;
  the root layout wraps everything
- The `/api/webhooks/stripe` route has special auth; do NOT add
  the standard auth middleware to it
- Date fields use UTC in the database; convert to user timezone
  only in display components, never in server actions
- When adding a new API route, register it in `middleware.ts`
  for CORS; forgetting this causes silent failures

## Patterns

- Use `getServerSession()` from next-auth for auth in Server
  Components; use `useSession()` only in client components
- Toast notifications: import from `@/components/ui/toast`;
  never use `window.alert`
- Form validation: zod schemas in `lib/validations/`; shared
  between client and server
- Database transactions: use `prisma.$transaction()` for
  multi-table updates (see `app/api/billing/route.ts`)

## Recent Learnings (review weekly)

- **Iteration 14:** Prisma transactions needed for multi-table
  updates in billing flow; see `app/api/billing/route.ts`
  → *Promoted to Patterns*
- **Iteration 18:** Search indexing runs async via queue; do not
  await in the request handler or it times out
- **Iteration 20:** The `[slug]` dynamic route in `app/projects` must
  validate slug exists before rendering; added 404 handling

---

*Last updated: 2025-01-16 (after iteration 20)*
*Next review: 2025-01-23*
