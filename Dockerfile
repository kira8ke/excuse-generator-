FROM node:18-alpine

# Install n8n globally
RUN npm install -g n8n

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Create n8n user and directories
RUN addgroup -g 1000 node && adduser -u 1000 -G node -s /bin/sh -D node
RUN mkdir -p /home/node/.n8n/workflows && chown -R node:node /home/node

USER node
WORKDIR /home/node

# Copy workflows
COPY --chown=node:node ./workflows /home/node/.n8n/workflows/

EXPOSE 5678

CMD ["n8n", "start"]