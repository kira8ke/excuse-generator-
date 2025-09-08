FROM n8nio/n8n:latest

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Copy workflows
COPY ./workflows /home/node/.n8n/workflows/

EXPOSE 5678

CMD ["/usr/local/bin/node", "/usr/local/bin/n8n"]