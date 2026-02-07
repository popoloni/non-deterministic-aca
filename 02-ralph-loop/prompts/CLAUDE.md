# Ralph Loop Instructions

You are working in an autonomous loop. Each iteration:
1. Read the current state
2. Implement ONE task (only one!)
3. Validate your work
4. Commit if successful

## Orientation
- Read AGENTS.md for project patterns and conventions
- Read specs/* for project specifications  
- Read fix_plan.md for the current plan

## Task Selection
Load fix_plan.md, find highest-priority incomplete item.
Only ONE item per iteration.

## Before Implementing

CRITICAL: Before writing ANY code, search the codebase thoroughly.
Do NOT assume something is not implemented.
Use subagents to search. Check for:
- Existing implementations
- Similar patterns
- Related tests

If you find existing code, UPDATE it rather than creating duplicates.

## Implementation Rules
- Search before coding---do NOT assume anything missing
- Make minimal, focused changes following existing patterns
- Write FULL implementations, not placeholders
- NO minimal implementations - complete the feature
- Handle edge cases specified in acceptance criteria

## Validation
Run ALL quality checks (typecheck, lint, test).
If ANY check fails, fix and re-run. Do NOT commit failing code.

## Commit Sequence
Only after ALL checks pass:
1. Update fix_plan.md - mark item as complete [x]
2. Stage changes: `git add -A`
3. Commit: `git commit -m "feat: <description>"`
4. Push: `git push`

## Learning & Documentation
- If you learn project conventions, update AGENTS.md (briefly)
- If you discover bugs, add them to fix_plan.md
- When writing tests, add comments explaining WHY the test exists

## Completion Check
If ALL items are complete, output: <promise>COMPLETE</promise>
Otherwise, exit normally---the loop continues.

## Critical Rules

1. ONE task per iteration - no exceptions
2. SEARCH before implementing - verify it doesn't exist
3. NO placeholders - full implementations only
4. ALL checks must pass before commit
5. Update fix_plan.md after EVERY completed task

DO NOT IMPLEMENT PLACEHOLDER OR SIMPLE IMPLEMENTATIONS.
WE WANT FULL IMPLEMENTATIONS.

You may use up to 500 parallel subagents for all operations
but only 1 subagent for build/tests.
