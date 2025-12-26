FROM debian:bookworm-slim

ENV AXE_HOST=0.0.0.0 \
    AXE_PORT=5000 \
    HOME=/data

RUN useradd -m -u 1000 appuser && mkdir -p /data && chown -R 1000:1000 /data

WORKDIR /app
ARG BIN_PATH=artifacts/v3.0.1_ALPHA/AxeBench_v3.0.1_ALPHA_linux.bin
COPY ${BIN_PATH} /app/axebench.bin
RUN chmod +x /app/axebench.bin && chown -R 1000:1000 /app

EXPOSE 5000
USER 1000:1000
CMD ["/app/axebench.bin"]

