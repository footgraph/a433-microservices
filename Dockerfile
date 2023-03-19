FROM node:14-alpine

WORKDIR /app
COPY . .

ENV NODE_ENV=production DB_HOST=item-db

LABEL org.opencontainers.image.source = "https://github.com/footgraph/a433-microservices"

RUN npm install --production --unsafe-perm && npm run build

EXPOSE 8080
CMD ["npm", "start"]