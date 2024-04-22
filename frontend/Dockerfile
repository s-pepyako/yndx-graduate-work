FROM node:16.20.0-alpine3.18 as builder
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:stable-alpine3.17-slim
COPY nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /app
COPY --from=builder /usr/src/app/dist/ ./frontend
EXPOSE 80 