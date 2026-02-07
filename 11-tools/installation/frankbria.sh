#!/bin/bash
# Install frankbria/ralph-claude-code - production-grade Ralph

set -e

echo "=== Installing frankbria/ralph-claude-code ==="

# Clone and install globally
git clone https://github.com/frankbria/ralph-claude-code.git /tmp/frankbria-ralph
cd /tmp/frankbria-ralph
./install.sh

echo ""
echo "Global commands installed:"
echo "  ralph          - Main loop runner"
echo "  ralph-monitor  - Live monitoring dashboard"
echo "  ralph-setup    - Project setup wizard"
echo "  ralph-import   - Import existing PRDs"
echo "  ralph-enable   - Enable Ralph in a project"
echo "  ralph-enable-ci - CI/CD integration"
echo ""
echo "Usage:"
echo "  cd your-project && ralph-enable"

# Cleanup
rm -rf /tmp/frankbria-ralph
