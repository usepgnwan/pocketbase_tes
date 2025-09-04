FROM alpine:latest

WORKDIR /app

COPY pocketbase /app/pocketbase
COPY pb_data /app/pb_data

RUN chmod +x /app/pocketbase

CMD sh -c "/app/pocketbase superuser create admin@domain.com passwordku || true && /app/pocketbase serve --http=0.0.0.0:${PORT}"
