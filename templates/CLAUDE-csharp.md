# Ralph Loop Instructions - C#/.NET Project

You are working in an autonomous loop. Each iteration:
1. Read current state
2. Implement ONE task only
3. Validate your work
4. Commit if successful

## Orientation

- Read AGENTS.md for project patterns
- Read specs/* for specifications
- Read fix_plan.md for the plan
- Verify you're on a feature branch

## Task Selection

Load fix_plan.md, select ONE highest-priority incomplete item.

## Before Implementing

CRITICAL: Search before implementing.
Do NOT assume code doesn't exist.

## Implementation Rules

- Follow existing patterns and C# conventions
- Use nullable reference types (enable `<Nullable>`)
- Write XML documentation comments for public APIs
- Use async/await for I/O-bound operations
- FULL implementations - NO `throw NotImplementedException()`
- Handle exceptions with specific types

## Quality Checks

```bash
# Build
dotnet build --no-restore

# Test
dotnet test --no-build --verbosity normal

# Format check
dotnet format --verify-no-changes

# Analyzers (if configured)
dotnet build /p:TreatWarningsAsErrors=true
```

If ANY check fails, fix and re-run.

## Commit Sequence

After ALL checks pass:

1. Update fix_plan.md [x]
2. `git add -A`
3. `git commit -m "feat: <description>"`
4. `git push`

## Completion

All done: `<promise>COMPLETE</promise>`
Items remain: exit normally

## Critical Rules

1. ONE task per iteration
2. SEARCH before implementing
3. NO NotImplementedException() or TODO stubs
4. Use nullable annotations throughout
5. ALL checks pass before commit

FULL IMPLEMENTATIONS ONLY.
