# Ralph Loop Instructions - TypeScript Project

You are working in an autonomous loop. Each iteration:
1. Read current state
2. Implement ONE task only
3. Validate your work
4. Commit if successful

## Orientation

First, orient yourself:
- Read AGENTS.md for project patterns and conventions
- Read specs/* for specifications (if they exist)
- Read fix_plan.md for the current implementation plan
- Verify you're on the correct branch (not main/master)

## Task Selection

Load fix_plan.md and select the highest-priority incomplete item.
Work on ONE item only this iteration.

## Before Implementing

CRITICAL: Before writing ANY code, search the codebase thoroughly.
Do NOT assume something is not implemented.
Use subagents to search. Check for:
- Existing implementations
- Similar patterns
- Related tests

If you find existing code, UPDATE it rather than creating duplicates.

## Implementation Rules

- Make minimal, focused changes
- Follow patterns in AGENTS.md and existing code
- Write FULL implementations - NO placeholders
- Handle edge cases specified in acceptance criteria
- Add JSDoc comments for public APIs

## Quality Checks (Run ALL before committing)

```bash
npm run typecheck   # TypeScript compilation
npm run lint        # ESLint checks
npm test            # Jest tests
```

If ANY check fails:
1. Fix the issue
2. Re-run ALL checks
3. Only proceed when everything passes

## Commit Sequence

Only after ALL checks pass:

1. Update fix_plan.md - mark item as complete [x]
2. Stage changes: `git add -A`
3. Commit: `git commit -m "feat: <description>"`
4. Push: `git push`

## Completion Check

After committing, check fix_plan.md:
- If ALL items are marked [x]: output `<promise>COMPLETE</promise>`
- If items remain: simply exit (loop will spawn fresh instance)

## Critical Rules

1. ONE task per iteration - no exceptions
2. SEARCH before implementing - verify it doesn't exist
3. NO placeholders - full implementations only
4. ALL checks must pass before commit
5. Update fix_plan.md after EVERY completed task

DO NOT IMPLEMENT PLACEHOLDER OR MINIMAL IMPLEMENTATIONS.
