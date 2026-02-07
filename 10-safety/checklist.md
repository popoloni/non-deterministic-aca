# Safety Checklist for Autonomous Operation

Before running Ralph in autonomous mode, verify:

- [ ] **Sandbox configured** — Docker container or cloud sandbox active
- [ ] **Feature branch created** — NEVER run on main/master
- [ ] **Branch protection rules** — main requires PR review
- [ ] **Minimal credentials** — scoped tokens, not admin access
- [ ] **Iteration limit set** — start with 10-15
- [ ] **Cost monitoring active** — watch API usage
- [ ] **Kill switch accessible** — know how to stop it
- [ ] **Network isolation** — restrict egress where possible
- [ ] **No production credentials** — use dev/sandbox keys only
- [ ] **Backup exists** — clean git state to restore to

## Credential Hygiene

| Credential Type | Best Practice |
|----------------|---------------|
| GitHub tokens | Fine-grained PAT scoped to specific repos |
| AWS credentials | IAM role with minimal permissions |
| API keys | Development/sandbox tier, not production |
| Database access | Read-only or test database |
| Deploy keys | Single-repository, not personal SSH key |

## Kill Switches

| Method | When to Use |
|--------|------------|
| `Ctrl+C` | Terminal is accessible |
| `Escape` key | Claude Code is running |
| `kill -9 <pid>` | Process not responding |
| `docker stop` | Containerized agent |
| Cloud termination | Cloud sandbox instance |

## Automatic Safeguards

- **Timeout**: Max wall-clock duration
- **Iteration limit**: Stop after N iterations
- **Cost threshold**: Shutdown at spending limit
- **Error threshold**: Stop after N consecutive failures
