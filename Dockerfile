FROM alpine:latest

WORKDIR /app

COPY pocketbase /app/pocketbase
COPY pb_data /app/pb_data

RUN chmod +x /app/pocketbase

# ENTRYPOINT biar bisa jalankan perintah sebelum serve
ENTRYPOINT ["/bin/sh", "-c"]

# CMD gabungan: bikin superuser kalau belum ada, lalu serve
CMD "/app/pocketbase superuser create admin@domain.com passwordku || true && /app/pocketbase serve --http=0.0.0.0:${PORT}"
