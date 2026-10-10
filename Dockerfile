FROM node:20-slim
WORKDIR /app
# Pega sozinho o pacote de maior versão (app-v1.4.tar.gz, app-v1.5.tar.gz, ...). Se não houver, usa app.tar.gz.
COPY app*.tar.gz /pacotes/
RUN f=$(ls /pacotes/app-v*.tar.gz 2>/dev/null | sort -V | tail -n 1); \
    if [ -z "$f" ]; then f=/pacotes/app.tar.gz; fi; \
    echo "Instalando o pacote $f"; \
    tar xzf "$f" && cd backend && npm install --omit=dev
ENV NODE_ENV=production
CMD ["node", "backend/server.js"]
