# syntax=docker/dockerfile:1
FROM alpine:3.20

# Pick the PB version that matches your local dev (change as needed)
ARG PB_VERSION=0.22.15

RUN apk add --no-cache curl unzip ca-certificates tzdata bash
WORKDIR /app

# Download Linux amd64 binary of PocketBase
RUN curl -L -o pb.zip https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
  && unzip pb.zip -d /app \
  && rm pb.zip \
  && chmod +x /app/pocketbase

# Bring in your migrations (and hooks if you have them)
COPY pb_migrations /app/pb_migrations
# COPY pb_hooks /app/pb_hooks  # uncomment if you use hooks

# Data dir lives on a mounted volume in Railway
RUN mkdir -p /data
ENV PB_DATA_DIR=/data

# Entrypoint runs migrations then starts the server
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Railway provides $PORT; default to 8080 locally
ENV PORT=8080
EXPOSE 8080

CMD ["/entrypoint.sh"]
