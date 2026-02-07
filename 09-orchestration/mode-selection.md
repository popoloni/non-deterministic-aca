# Traditional vs Hat-Based Mode

| Criterion | Traditional Mode | Hat-Based Mode |
|-----------|-----------------|----------------|
| Task complexity | Single-focus tasks | Multi-phase workflows |
| Team familiarity | Getting started | Established patterns |
| Debugging ease | Simple (one agent) | Complex (multiple agents) |
| Customization | Limited | Extensive |
| Best for | Most work | Specialized workflows |

## When to Use Traditional Mode
- Starting out with Ralph
- Simple implementation tasks
- Debugging and fixing issues
- Quick prototyping

## When to Use Hat-Based Mode
- TDD workflows (Red-Green-Refactor)
- Spec-driven development with verification
- Multi-phase refactoring
- Quality-critical implementations

## Available Presets

### TDD Red-Green-Refactor
1. **Red**: Writes failing tests from specs
2. **Green**: Implements code to make tests pass
3. **Refactor**: Cleans up while maintaining green

### Spec-Driven
1. **Planner**: Decomposes PRD into atomic tasks
2. **Builder**: Implements each task
3. **Verifier**: Confirms acceptance criteria met
