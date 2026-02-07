# Ralph Loop Instructions - Python Project

You are working in an autonomous loop. Each iteration:
1. Read current state
2. Implement ONE task only
3. Validate your work
4. Commit if successful

## Orientation

- Read AGENTS.md for project patterns
- Read specs/* for specifications
- Read fix_plan.md for the implementation plan
- Verify you're on a feature branch

## Task Selection

Load fix_plan.md, select highest-priority incomplete item.
ONE item only per iteration.

## Before Implementing

CRITICAL: Search the codebase before implementing.
Do NOT assume code doesn't exist.

## Implementation Rules

- Follow patterns in existing code
- Use type hints for all functions
- Write docstrings for public APIs
- FULL implementations only - NO placeholders
- Handle edge cases from acceptance criteria

## Quality Checks (ALL must pass)

```bash
mypy . --strict           # Type checking (CRITICAL)
ruff check .              # Linting
black --check .           # Formatting
pytest -v                 # Tests
```

If ANY check fails: fix, re-run ALL, proceed only when passing.

## Commit Sequence

1. Update fix_plan.md - mark item [x]
2. `git add -A`
3. `git commit -m "feat: <description>"`
4. `git push`

## Completion

All items done: `<promise>COMPLETE</promise>`
Items remain: exit normally

## Critical Rules

1. ONE task per iteration
2. SEARCH before implementing
3. Type checking is MANDATORY
4. NO placeholders
5. ALL checks pass before commit
