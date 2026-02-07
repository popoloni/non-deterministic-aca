#!/bin/bash
# Install ralph-orchestrator - advanced multi-agent Ralph

set -e

echo "=== Installing ralph-orchestrator ==="

# Method selection
METHOD="${1:-cargo}"

case "$METHOD" in
    cargo)
        echo "Installing via Cargo..."
        cargo install ralph-cli
        ;;
    npm)
        echo "Installing via npm..."
        npm install -g @ralph-orchestrator/ralph-cli
        ;;
    shell)
        echo "Installing via shell script..."
        curl --proto '=https' --tlsv1.2 -LsSf \
            https://github.com/mikeyobrien/ralph-orchestrator/releases/download/v2.2.2/ralph-cli-installer.sh | sh
        ;;
    source)
        echo "Building from source..."
        git clone https://github.com/mikeyobrien/ralph-orchestrator.git /tmp/ralph-orchestrator
        cd /tmp/ralph-orchestrator
        cargo build --release
        sudo ln -s "$(pwd)/target/release/ralph" /usr/local/bin/ralph
        ;;
    *)
        echo "Usage: $0 [cargo|npm|shell|source]"
        exit 1
        ;;
esac

echo ""
echo "Usage:"
echo "  ralph init --backend claude"
echo "  ralph run"
