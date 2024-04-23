FROM node:16.20.0-alpine3.18 as builder
WORKDIR /app
ADD package.json package-lock.json ./
RUN npm install
ADD . .
RUN rm default.conf
RUN npm run build

FROM nginx:stable-alpine3.17-slim
WORKDIR /app
ADD default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/dist/ ./frontend
EXPOSE 80 