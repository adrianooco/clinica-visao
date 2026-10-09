FROM node:20-slim
WORKDIR /app
COPY app.tar.gz .
RUN tar xzf app.tar.gz && rm app.tar.gz && cd backend && npm install --omit=dev
ENV NODE_ENV=production
CMD ["node", "backend/server.js"]
