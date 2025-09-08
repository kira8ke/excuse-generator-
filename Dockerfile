FROM n8nio/n8n:latest

USER root

COPY --chown=node:node ./workflows /home/node/.n8n/workflows/


USER node 

EXPOSE 5678

CMD ["n8n", "start"]
