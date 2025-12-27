FROM debian:trixie-slim

ENV AXE_HOST=0.0.0.0 \
    AXE_PORT=5000 \
    HOME=/data

RUN useradd -m -u 1000 appuser && mkdir -p /data && chown -R 1000:1000 /data

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
ARG BIN_PATH=artifacts/v3.0.2/AxeBench_v3.0.2_linux.bin
COPY ${BIN_PATH} /app/axebench.bin
RUN chmod +x /app/axebench.bin && chown -R 1000:1000 /app

EXPOSE 5000
USER 1000:1000
CMD ["/app/axebench.bin","--replace-instance"]
