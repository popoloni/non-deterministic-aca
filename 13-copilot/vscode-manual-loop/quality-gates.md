## Quality Gates
# Exact commands for this project. Use these and no others.
- Type check : npx tsc --noEmit
- Lint       : npx eslint src --ext .ts,.tsx --max-warnings 0
- Test       : pnpm test --run
- All three must pass before committing any change.
