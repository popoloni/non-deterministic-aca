# 03 - Task Decomposition for Machines

> 📖 **Book Reference:** Chapter 5

## Overview

Task decomposition is the critical skill that separates autonomous systems that ship production code from those that spin endlessly. This chapter teaches how to break work into atomic, verifiable tasks that AI can execute reliably.

## Contents

| File | Description |
|------|-------------|
| [fix_plan.md](examples/fix_plan.md) | Markdown plan format template |
| [prd.json](examples/prd.json) | JSON plan format template |

## Key Principles

- **8-15 tasks per feature**, not 3-5
- **One meaningful change per iteration** — touch 1-3 files max
- **Boolean acceptance criteria** — pass or fail, no "mostly done"
- **Separate investigation from implementation** — research first, build second
- **Measurable outcomes, not process descriptions**

## Checking Progress

```bash
# Check task status (JSON format)
cat prd.json | jq '.userStories[] | {id, title, passes}'

# Count completion
cat prd.json | jq '[.userStories[] | select(.passes == true)] | length'
```

## Good vs Bad Task Specifications

| Problematic | Improved |
|------------|----------|
| "Build the login page" | "Add login form with email and password fields; form submits to /api/auth/login" |
| "Make it look good" | "Apply design system tokens from theme.css; page passes axe accessibility check" |
| "Handle errors" | "Display inline validation error under field; show toast with message on API error" |
| "Add tests" | "Unit tests exist for UserService; coverage ≥ 80% for auth module" |
