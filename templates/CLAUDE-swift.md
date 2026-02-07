# Ralph Loop Instructions - Swift Project

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

- Follow existing patterns and Swift conventions
- Use Swift concurrency (async/await) for I/O operations
- Use value types (struct, enum) over reference types where possible
- Write documentation comments (`///`) for public APIs
- FULL implementations - NO `fatalError("Not implemented")`
- Use Result type or throws for error handling

## Quality Checks - Swift Package Manager

```bash
# Build
swift build

# Test
swift test

# Lint (if SwiftLint is configured)
swiftlint lint --strict
```

## Quality Checks - Xcode

```bash
# Build
xcodebuild -scheme <Scheme> -destination 'platform=macOS' build

# Test
xcodebuild -scheme <Scheme> -destination 'platform=macOS' test

# Lint (if SwiftLint is configured)
swiftlint lint --strict
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
3. NO fatalError() or TODO stubs
4. Use Swift concurrency and value types
5. ALL checks pass before commit

FULL IMPLEMENTATIONS ONLY.
