FROM n8nio/n8n:latest

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https

COPY ./workflows /home/node/.n8n/workflows/

EXPOSE 5678

# Use the exact same entrypoint as the official image
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["n8n", "start"]