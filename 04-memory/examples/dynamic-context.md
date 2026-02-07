# Dynamic Context Discovery

> 📖 **Book Reference:** Chapter 6 — "Dynamic Context Discovery"

As agents improve, a counter-intuitive pattern emerges: providing **less**
static context upfront and letting the agent pull what it needs on demand
produces better results.

## The Problem with Static Injection

Injecting everything statically incurs two costs:

1. **Token waste** — context consumed by irrelevant information can't be used for reasoning
2. **Signal dilution** — contradictory or irrelevant content can confuse the agent

## Techniques

### 1. Files as Universal Interface

Write long outputs to files instead of injecting them into context.

```bash
# Instead of piping build output directly into prompt:
npm run build 2>&1 > /tmp/build-output.txt

# Agent reads selectively:
# - tail /tmp/build-output.txt     (check outcome)
# - grep "error" /tmp/build-output.txt  (find specific issues)
```

**Why:** Avoids truncating long outputs (which risks losing important info)
while keeping context window clean.

### 2. Chat History as Searchable Context

When context windows fill up and summarization compresses the conversation,
details are lost. Making history available as files lets the agent recover
specific details.

**Pattern:**
- Save conversation history to a file
- After summarization, agent can `grep` the history for specific details
- Only the relevant portions enter the new context window

### 3. Selective Tool Loading

When using multiple MCP servers with many tools:

| Approach | Context Cost | Quality |
|----------|-------------|---------|
| **Static:** inject all tool descriptions | High (often 10K+ tokens) | Low (noise) |
| **Dynamic:** inject only tool names; load descriptions on demand | Low (~500 tokens) | High (focused) |

**Implementation:** Sync tool descriptions to a folder structure.
Agent lists folders to see available servers, then reads specific
tool files when needed.

### 4. Task-Aware Context Injection

Instead of always injecting the same files, select based on current task:

```bash
# Pseudocode for dynamic context selection
current_task=$(jq -r '.userStories[] | select(.passes == false) | .title' prd.json | head -1)

case "$current_task" in
  *auth*|*login*|*session*)
    context_files="src/auth/ AGENTS.md#security tests/auth/"
    ;;
  *ui*|*component*|*style*)
    context_files="src/components/ AGENTS.md#patterns design-system.md"
    ;;
  *)
    context_files="AGENTS.md src/ tests/"
    ;;
esac
```

## Relationship to Smart Zone

Dynamic context discovery keeps initial context load within the
**40–60% smart zone** while giving the agent access to the full
knowledge base when specific situations demand it.

```
┌─────────────────────────────────────────┐
│             Context Window              │
├──────────┬──────────┬───────────────────┤
│  Static  │  Task +  │   Available for   │
│  Context │ Reasoning│  dynamic loading  │
│  ~30%    │  ~40%    │     ~30%          │
└──────────┴──────────┴───────────────────┘
     ↑                        ↑
  Always injected      Pulled on demand
  (essential only)     (AGENTS.md sections,
                        source files, logs)
```

## When to Use Each Approach

| Codebase Size | Recommended Approach |
|---------------|---------------------|
| Small (<10K LoC) | Static injection is fine; everything fits |
| Medium (10K–100K LoC) | Task-aware injection + selective AGENTS.md sections |
| Large (>100K LoC) | RAG + dynamic discovery + section-specific injection |
| Multi-project | Skills for shared knowledge + project-specific AGENTS.md |
