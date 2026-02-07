# Subagent Orchestration in VS Code Chat

## How It Works

A single Copilot Chat session (the "orchestrator") delegates work to subagents in a loop.

1. Orchestrator creates `PROGRESS.md` listing all tasks
2. Spawns subagent to pick one task, implement it, verify, commit
3. Reads `PROGRESS.md` to check remaining tasks
4. Repeats until all tasks complete

## Key Advantages

- **Cost efficiency:** Orchestrator uses one premium request. Subagent calls don't add premium requests.
- **Context isolation:** Each subagent starts fresh.
- **No tooling required:** Works with stock VS Code + Copilot Chat.
- **Model flexibility:** Use premium models for both orchestrator and subagents.

## The Orchestrator Prompt

Open a new Copilot Chat session (Agent Mode, capable model like Claude Opus):

```
<PLAN>/path/to/the/plan</PLAN>
<TASKS>/path/to/the/tasks</TASKS>
<PROGRESS>/path/to/PROGRESS.md</PROGRESS>

<ORCHESTRATOR_INSTRUCTIONS>
You are an orchestration agent. You will trigger subagents
that execute the complete implementation of a plan.

The master plan is in <PLAN>, and the tasks are in <TASKS>.

Create the progress file if it does not exist. It shall
list all tasks and will be updated by each subagent.

You MUST use the #runSubagent tool. If you do not have
this tool available, fail immediately.

Call each subagent sequentially until ALL tasks are
declared complete in the progress file.

You do not pick tasks yourself. You only trigger
subagents and verify progress.
</ORCHESTRATOR_INSTRUCTIONS>

<SUBAGENT_INSTRUCTIONS>
You are a senior software engineer. Pick the most
important unimplemented task from <PROGRESS>.

Implement it fully. Run `just preflight` (or your
project's test command) and fix issues until it passes.

Update the progress file. Commit with a concise
conventional commit message focused on user impact.

Once done, exit.
</SUBAGENT_INSTRUCTIONS>
```

## Limitations

- **Rate limits:** Long sessions hit Copilot's rate limiter. Wait and retry.
- **Sequential only:** As of early 2026, subagents run sequentially.
- **Max requests:** Set `chat.agent.maxRequests` to 100+ in VS Code settings.
- **Verification:** Consider adding a "reviewer" subagent after each implementation.

## Pause File Mechanism

Add a pause mechanism for long-running orchestrations:
- Orchestrator checks for a `PAUSE` file before each subagent
- When `PAUSE` exists, orchestrator sleeps
- Remove `PAUSE` to resume
- Allows adding/removing tasks mid-run
