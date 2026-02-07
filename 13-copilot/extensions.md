# VS Code Extensions for Ralph Loops

## MWChapelCLA/Ralph-Wiggums-Copilot-Agent

### Installation
```bash
git clone https://github.com/MWChapelCLA/Ralph-Wiggums-Copilot-Agent.git
cd Ralph-Wiggums-Copilot-Agent
npm install
# Press F5 in VS Code, or:
npx vsce package
# Then: Extensions → ... → "Install from VSIX..."
```

### Usage
```
@ralph /loop Fix the token refresh logic in auth.ts.
Output <promise>FIXED</promise> when all tests pass.
--completion-promise "FIXED" --max-iterations 10
```

### Limitations
- Context accumulates across iterations (stop-hook pattern)
- Not recommended for production work

---

## hehamalainen/Ralph

### Installation
```bash
git clone https://github.com/hehamalainen/Ralph.git
cd Ralph
npm install && npm run compile
# Press F5, or:
npm run package
# Install via Extensions → ... → "Install from VSIX..."
```

### Usage
```
@ralph Create a utility function that validates email addresses
and add comprehensive unit tests
```

### Configuration

| Setting | Default | Description |
|---------|---------|-------------|
| `ralphLoop.maxIterations` | 20 | Max loop iterations |
| `ralphLoop.commandTimeoutSec` | 300 | Command timeout (seconds) |
| `ralphLoop.confirmEachCommand` | true | Require confirmation |
| `ralphLoop.allowlistRegex` | (safe) | Allowed command patterns |

### Security
- Shell injection protection (rejects `&&`, `||`, `;`, `|`, `>`, `<`)
- Allowlist-based command filtering
- Explicit user approval per command

---

## aymenfurter/ralph

### Installation
```bash
git clone https://github.com/aymenfurter/ralph.git
cd ralph
npm install && npm run compile
# Press F5, or:
npx vsce package
```

### PRD Format
```markdown
# My Project

## Overview
Brief description.

## Tasks
- [ ] Set up project structure
- [ ] Create core data models
- [ ] Implement main logic
- [ ] Add UI and styling
- [ ] Write tests and docs
```

### Handling Max Iterations
Set `chat.agent.maxRequests` to 100+ in VS Code Settings.

> ⚠️ This extension uses internal VS Code commands that are not part of the public API. Treat as experimental.
