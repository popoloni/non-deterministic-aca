# 09 - Multi-Agent Orchestration

> 📖 **Book Reference:** Chapter 10

## Overview

Multi-agent orchestration for readers ready to scale beyond single loops. Hat-based orchestration, human-in-the-loop patterns, and the planner-worker model.

> ⚠️ **Warning:** This is advanced material for Stage 7-8 developers. Master single-agent loops first.

## Contents

| File | Description |
|------|-------------|
| [hats.yml](examples/hats.yml) | Hat-based orchestration config |
| [telegram-setup.md](telegram-setup.md) | Telegram integration guide |
| [mode-selection.md](mode-selection.md) | Traditional vs Hat-based mode |

## The Sweet Spot: 2-3 Agents

> "You only have a finite amount of attention. If you are going to be actually putting in diligence into your code reviews, you are probably only going to be able to do a couple of things at the same time." — Addy Osmani

- **2 agents**: Frontend/backend splits or parallel features
- **3 agents**: Frontend, backend, infrastructure simultaneously
- **Beyond 3**: Requires sophisticated tooling and acceptance of reduced oversight

## The Broader Orchestration Landscape

Ralph-style orchestration (file-driven, stateless iterations) is not the only approach. For non-coding workflows or enterprise agent systems, consider:

| Framework | By | Core Concept | Best For |
|-----------|-----|--------------|----------|
| [LangGraph](https://langchain-ai.github.io/langgraph/) | LangChain | Stateful graphs with durable execution | Complex agent workflows with human-in-the-loop |
| [CrewAI](https://docs.crewai.com/) | CrewAI Inc | Role-playing crews orchestrated by flows | Business-process automation |
| [AutoGen](https://microsoft.github.io/autogen/) | Microsoft | Event-driven multi-runtime conversations | Enterprise distributed agents |
| [OpenAI Agents SDK](https://github.com/openai/openai-agents-python) | OpenAI | Lightweight handoffs (successor to Swarm) | Minimal-dependency agent chains |

**When to use what:**
- **Writing code in a repo?** → Ralph loop (with or without hats) is simpler and more robust
- **Data pipelines, content generation, customer support?** → Explore the frameworks above

## Hat-Based Orchestration

Each hat has:
- **Triggers** — which events activate this hat
- **Instructions** — the persona's behavior
- **Publishes** — which events this hat emits on completion

## Quick Start

```bash
# Initialize with TDD preset
ralph init --preset tdd-red-green --backend claude

# Or use spec-driven preset
ralph init --preset spec-driven --backend claude
```
