FROM node:20-slim

RUN npm install -g mint

WORKDIR /app
COPY --chown=node:node . .
USER node
ENV HOME=/home/node

# Warm ~/.mintlify (~1.5 GB) at build time so startup doesn't download it.
RUN mint dev --no-open --port 8080 & \
    pid=$!; \
    for i in $(seq 1 120); do \
      node -e "fetch('http://localhost:8080').then(r=>process.exit(r.ok?0:1)).catch(()=>process.exit(1))" && break; \
      sleep 5; \
    done; \
    kill $pid || true

EXPOSE 8080
CMD ["mint", "dev", "--no-open", "--port", "8080"]
