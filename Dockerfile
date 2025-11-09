FROM oven/bun:1 AS builder

WORKDIR /app

COPY . .

RUN bun install
RUN bun run build

FROM nginx:1.27-alpine

COPY --from=builder /app/dist/. /usr/share/nginx/html/
