# Non-Deterministic Autonomous Coding Agents: Companion Repository

> 📚 **Companion materials for ["Non-Deterministic Autonomous Coding Agents: Building Self-Improving Systems That Ship While You Sleep"](https://www.amazon.com/dp/B0DXXXXXX)** by Enrico Papalini

<p align="center">
  <a href="https://www.amazon.com/dp/B0DXXXXXX">
    <img src="https://via.placeholder.com/300x450?text=ACA+Book+Cover" alt="Non-Deterministic Autonomous Coding Agents Book Cover" width="300">
  </a>
</p>

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/popoloni/non-deterministic-aca?style=social)](https://github.com/popoloni/non-deterministic-aca)

---

## 📖 About This Repository

This repository contains **working code examples, scripts, templates, and practical materials** from Book 3 of the Non-Deterministic series. These materials cover autonomous coding agents — from simple Ralph Loops to multi-agent orchestration systems that ship code while you sleep.

- ✅ **Complete** — Ready to use, not just illustrative fragments
- ✅ **Tested** — Validated with current tool versions
- ✅ **Documented** — Each example links back to the relevant book chapter

---

## 📘 Book Structure

The book is organized into **11 Chapters** plus **4 Appendices**:

| Part | Focus | Chapters |
|------|-------|----------|
| **Part I** | Foundations | Ch. 1–3 (Revolution, Philosophy, Evolution) |
| **Part II** | The Ralph Loop | Ch. 4–6 (Ralph Pattern, Decomposition, Memory) |
| **Part III** | Quality & Prompting | Ch. 7–8 (Quality Gates, Prompting Techniques) |
| **Part IV** | Scaling & Safety | Ch. 9–11 (Patterns, Scheduling, Orchestration, Safety) |
| **Appendices** | Reference | A–D (Implementation, Tools, Troubleshooting, Copilot) |

### Chapter Overview

| Chapter | Title | Focus |
|---------|-------|-------|
| 1 | The Autonomous Revolution | The shift to autonomous coding agents |
| 2 | The Philosophy of Autonomous Systems | Backpressure, LLM-as-Judge |
| 3 | The Evolution of Developer Roles | Developer Evolution Model |
| 4 | The Ralph Loop Pattern | Core autonomous loop anatomy |
| 5 | Task Decomposition for Machines | Plan files, PRDs, atomic tasks |
| 6 | Memory and Context Engineering | Progress logs, AGENTS.md, context channels |
| 7 | Quality Gates and Backpressure | TDD, verification loops, stuck detection |
| 8 | Prompting for Autonomous Systems | Reverse prompting, constraint cascades, role stacking |
| 9 | Patterns for Autonomous Development | Orchestration & control patterns |
| 9b | Scheduling and Overnight Execution | Cron, launchd, cloud execution |
| 10 | Multi-Agent Orchestration | Hat-based, planner-worker, Gas Town |
| 11 | Safety, Security, and Risk Management | Sandboxing, blast radius, overbaking |

---

## 🗂️ Repository Structure

| Folder | Description | Book Reference |
|--------|-------------|----------------|
| [01-fundamentals](./01-fundamentals/) | Conceptual overview and key diagrams | Ch. 1–3 |
| [02-ralph-loop](./02-ralph-loop/) | Core Ralph Loop scripts and prompts | Ch. 4 |
| [03-decomposition](./03-decomposition/) | Plan file templates and task breakdown | Ch. 5 |
| [04-memory](./04-memory/) | Memory channels and context management | Ch. 6 |
| [05-quality](./05-quality/) | Quality gates, TDD, verification loops | Ch. 7 |
| [06-prompting](./06-prompting/) | Prompt templates and advanced techniques | Ch. 8 |
| [07-patterns](./07-patterns/) | Orchestration and control patterns | Ch. 9 |
| [08-scheduling](./08-scheduling/) | Overnight execution and scheduling | Ch. 9b |
| [09-orchestration](./09-orchestration/) | Multi-agent orchestration patterns | Ch. 10 |
| [10-safety](./10-safety/) | Safety, sandboxing, and risk management | Ch. 11 |
| [11-tools](./11-tools/) | Tool reference and configuration | Appendix B |
| [12-troubleshooting](./12-troubleshooting/) | Debugging and recovery scripts | Appendix C |
| [13-copilot](./13-copilot/) | GitHub Copilot Ralph integrations | Appendix D |
| [templates](./templates/) | Ready-to-use project templates | Appendix A |

---

## 🚀 Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/popoloni/non-deterministic-aca.git
cd non-deterministic-aca

# 2. Verify prerequisites
./templates/scripts/verify-ralph-prereqs.sh

# 3. Set up your first Ralph Loop
cp -r templates/scripts/ralph/ your-project/scripts/ralph/
cp templates/plan-files/fix_plan.md your-project/
cp templates/agents-md/AGENTS.md your-project/

# 4. Run Ralph
cd your-project
./scripts/ralph/ralph.sh 10
```

---

## 📚 Series

This is **Book 3** of the Non-Deterministic series:

| # | Title | Repository |
|---|-------|------------|
| 1 | [Non-Deterministic Software Engineering](https://www.amazon.com/dp/B0G7LPR4KB) | [non_deterministic_sw_eng](https://github.com/popoloni/non_deterministic_sw_eng) |
| 2 | [Non-Deterministic Spec-Driven Development](https://www.amazon.com/dp/B0GGZ44RNX) | [non-deterministic-sdd](https://github.com/popoloni/non-deterministic-sdd) |
| 3 | **Non-Deterministic Autonomous Coding Agents** | **This repository** |

---

## Contributing

Contributions are welcome! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting issues or pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

These companion materials are provided for educational purposes alongside the book "Non-Deterministic Autonomous Coding Agents".

---

**Author**: [Enrico Papalini](https://github.com/popoloni)

*Last updated: February 2026*
