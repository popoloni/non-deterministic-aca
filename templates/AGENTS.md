# Project Patterns and Conventions

## Overview

Brief description of the project and its purpose.

## Code Style

### General
- [Language-specific style guide reference]
- Prefer X over Y
- Always do Z

### Naming Conventions
- Files: kebab-case
- Functions: camelCase
- Classes: PascalCase
- Constants: SCREAMING_SNAKE_CASE

## Architecture

### Directory Structure
```
src/
  components/    # UI components
  utils/         # Utility functions
  services/      # External service integrations
  types/         # Type definitions
```

### Patterns
- [Pattern 1 description]
- [Pattern 2 description]

## Testing

### Framework
- Unit tests: [Jest/pytest/etc]
- Integration tests: [framework]

### Conventions
- Place tests adjacent to source (*.test.ts)
- Use descriptive test names
- Document test purpose in comments
- Aim for >80% coverage on new code

### Running Tests
```bash
npm test                    # All tests
npm test -- --watch         # Watch mode
npm test -- --coverage      # With coverage
```

## Build Commands

```bash
npm run typecheck    # Type checking
npm run lint         # Linting
npm run lint:fix     # Auto-fix lint issues
npm test             # Run tests
npm run build        # Production build
```

## Git Conventions

- Use conventional commits (feat:, fix:, docs:, etc.)
- Keep commits atomic and focused
- Reference issue numbers when applicable

## Discovered Learnings

(Ralph will add learnings here)

---
Last updated: [DATE]
