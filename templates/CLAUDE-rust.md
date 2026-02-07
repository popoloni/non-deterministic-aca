# Ralph Loop Instructions - Rust Project

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

CRITICAL: Search codebase before implementing.
Rust compilation is slow - avoid duplicate work.

## Implementation Rules

- Follow existing patterns
- Write documentation comments (///)
- Handle all Result/Option properly
- NO unwrap() in production code
- NO todo!() macros
- FULL implementations only

## Quality Checks

```bash
cargo fmt --check            # Format
cargo clippy -- -D warnings  # Lint
cargo build                  # Build
cargo test                   # Test
```

Note: Rust compilation is slow. Be patient.

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
3. NO todo!() or unimplemented!()
4. NO unwrap() in production paths
5. ALL checks pass before commit
