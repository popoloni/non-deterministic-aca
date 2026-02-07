FROM node:20-slim

# Create non-root user for agent
RUN useradd -m -s /bin/bash agent

# Switch to non-root user
USER agent
WORKDIR /workspace

# Install only necessary tools
RUN npm install -g @anthropic-ai/claude-code
