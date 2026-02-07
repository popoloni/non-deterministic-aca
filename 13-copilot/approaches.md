# Choosing Your Copilot Ralph Loop Approach

## Comparison Matrix

| Criterion | Extensions | CLI | Subagents | Manual |
|-----------|-----------|-----|-----------|--------|
| Fresh context each iteration | Varies | ✓ | ✓ | If disciplined |
| True AFK operation | Partial | ✓ | ✓ | — |
| No extra installation | — | — | ✓ | ✓ |
| Visual progress tracking | aymenfurter | — | Via file | — |
| Granular permissions | — | ✓ | — | — |
| Premium request efficiency | Normal | Normal | Excellent | Normal |
| Production readiness | Low | High | Medium | Low |

## Approach 1: VS Code Extensions

Three community extensions:

### MWChapelCLA/Ralph-Wiggums-Copilot-Agent
- Adds `@ralph` chat participant with `/loop` command
- Context accumulates (stop-hook pattern)
- Best for quick experiments

### hehamalainen/Ralph
- Model-agnostic (uses VS Code's model picker)
- Human-in-the-loop by design (confirms each command)
- Conservative security with allowlists

### aymenfurter/ralph
- Visual control panel in Activity Bar
- PRD generation from natural language
- Fresh Chat Mode for context isolation
- Requires VS Code 1.93+

## Approach 2: GitHub Copilot CLI (Recommended)

True fresh context each iteration via `soderlind/ralph` wrapper.

## Approach 3: Subagent Orchestration

Uses `#runSubagent` in Copilot Chat. Excellent cost efficiency—subagent calls don't consume additional premium requests.

## Approach 4: Manual Loop

New chat session per task. No tooling needed but requires discipline.
