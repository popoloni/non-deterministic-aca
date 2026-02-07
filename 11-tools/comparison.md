# Ralph Implementation Comparison

## Feature Matrix

| Feature | snarktank/ralph | Anthropic Plugin | frankbria | ralph-orchestrator |
|---------|----------------|-----------------|-----------|-------------------|
| **Language** | Bash | JavaScript | Bash | Rust |
| **Fresh context** | Yes | No | Yes | Yes |
| **External deps** | Minimal | Claude Code | Minimal | Rust runtime |
| **Learning curve** | Low | Low | Low | Medium |
| **Circuit breaker** | No | No | Yes | Yes |
| **Rate limiting** | No | No | Yes | Yes |
| **Session continuity** | Via Git | Via state file | Yes | Yes |
| **Response analyzer** | No | No | Yes | Yes |
| **Multi-agent** | No | No | No | Yes (hats) |
| **Human interaction** | Manual | Manual | Manual | Telegram |
| **TUI monitoring** | No | No | No | Yes |
| **Presets/workflows** | No | No | No | Yes |
| **AI backends** | Claude, Amp | Claude only | Claude only | Claude, Gemini, Codex |
| **Production readiness** | Basic | Basic | Advanced | Advanced |

## Key Distinction

> The critical distinction is **fresh context**. The snarktank/ralph and frankbria implementations spawn a new AI instance each iteration, ensuring clean context. The Anthropic plugin uses a stop hook within a single session, which can lead to context accumulation.

## Version Compatibility

| Tool | Claude Code | Node.js | Other |
|------|------------|---------|-------|
| snarktank/ralph | 2.0.76+ | Not required | Bash 4+, jq |
| Anthropic plugin | 2.0.76+ | 18+ | jq (Windows) |
| frankbria | 2.0.76+ | Not required | Bash 4+, jq |
| ralph-orchestrator | 2.0.76+ | 18+ (npm) | Rust 1.70+ (source) |
