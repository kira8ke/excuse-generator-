FROM n8nio/n8n:latest

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

USER root

# Copy workflows if they exist
COPY --chown=node:node ./workflows /home/node/.n8n/workflows/ 2>/dev/null || true

USER node

EXPOSE 5678

# Use the full path to n8n or use npm start
CMD ["npx", "n8n", "start"]