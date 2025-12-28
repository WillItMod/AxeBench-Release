FROM debian:trixie-slim

ENV AXE_HOST=0.0.0.0 \
    AXE_PORT=5000 \
    HOME=/data

RUN useradd -m -u 1000 appuser && mkdir -p /data && chown -R 1000:1000 /data

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
ARG AXEBENCH_TAG=3.0.2
ARG TARGETARCH
COPY artifacts/v${AXEBENCH_TAG}/ /tmp/artifacts/
RUN set -euo pipefail; \
  case "${TARGETARCH}" in \
    amd64) src="/tmp/artifacts/AxeBench_v${AXEBENCH_TAG}_linux.bin" ;; \
    arm64) src="/tmp/artifacts/AxeBench_v${AXEBENCH_TAG}_linux_arm64.bin" ;; \
    *) echo "Unsupported TARGETARCH: ${TARGETARCH}" >&2; exit 1 ;; \
  esac; \
  test -f "${src}"; \
  cp "${src}" /app/axebench.bin; \
  chmod +x /app/axebench.bin; \
  chown -R 1000:1000 /app

EXPOSE 5000
USER 1000:1000
CMD ["/app/axebench.bin","--replace-instance"]
