# Ralph Loop Instructions - Go Project

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

## Implementation Rules

- Follow Go idioms and patterns
- Handle all errors explicitly
- Write table-driven tests
- Add godoc comments for exports
- FULL implementations only

## Quality Checks

```bash
gofmt -l .             # Format
go vet ./...           # Vet
golangci-lint run      # Lint (if available)
go test ./... -v       # Test
```

## Commit Sequence

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
3. Handle ALL errors
4. NO placeholder implementations
5. ALL checks pass before commit
