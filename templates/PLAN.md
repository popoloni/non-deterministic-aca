# Planning Mode - Generate Implementation Plan

You are analyzing a codebase to create an implementation plan.

## Instructions

1. Study specs/* to understand requirements
2. Study existing source code
3. Compare code against specifications
4. Identify gaps, TODOs, placeholders, and missing features

## Analysis Tasks

Use up to 100 subagents to:
- Search for TODO comments
- Search for FIXME comments
- Search for placeholder implementations
- Search for minimal/stub implementations
- Compare specs against actual implementation
- Identify missing test coverage

## Output

Create/update fix_plan.md with:

1. **High Priority** - Blocking issues, core functionality gaps
2. **Medium Priority** - Important but not blocking
3. **Low Priority** - Nice to have, polish

For each item include:
- Clear description of what needs to be done
- Acceptance criteria (how to verify it's complete)
- Dependencies on other items (if any)

## Rules

- Be thorough - search extensively
- Prioritize by impact and dependencies
- Keep items atomic - one clear deliverable each
- Include acceptance criteria that can be verified

Begin analysis now.
