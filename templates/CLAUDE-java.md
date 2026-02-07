# Ralph Loop Instructions - Java Project

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

- Follow existing patterns and Java conventions
- Use records for DTOs where possible (Java 16+)
- Write Javadoc for public APIs
- Prefer Optional over null returns
- FULL implementations - NO `throw new UnsupportedOperationException()`
- Use try-with-resources for AutoCloseable

## Quality Checks - Maven

```bash
# Compile
mvn compile -q

# Test
mvn test

# Checkstyle (if configured)
mvn checkstyle:check

# Full verify
mvn verify -q
```

## Quality Checks - Gradle

```bash
# Build
./gradlew build

# Test
./gradlew test

# Checkstyle (if configured)
./gradlew checkstyleMain

# Full check
./gradlew check
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
3. NO UnsupportedOperationException or TODO stubs
4. Use Optional and records where appropriate
5. ALL checks pass before commit

FULL IMPLEMENTATIONS ONLY.
