# Tool Call Budget
# Add this section to your CLAUDE.md / prompt template to prevent
# wasteful over-exploration by the agent.

## Tool Call Budget

Per iteration, respect these limits:
- File reads:      max 30
- Grep/searches:   max 20
- Subagents:       max 5 for search, 1 for build/test
- Shell commands:  max 10

If you are approaching a limit, STOP searching and work
with what you have. Over-exploration wastes context.

## Subagent Rules

- Use MULTIPLE subagents (up to 5) for searching and reading files
- Use ONLY 1 subagent for build/test operations
- Never run parallel builds — they will interfere with each other
- Each subagent should have a clear, focused task
