# AxeBench v3.0.0 RC1e (beta) - Feature Overview

RC1e is delivered as a single binary per platform that runs the unified AxeBench stack.

## Unified launcher

When started, the launcher brings up:

- AxeBench (benchmark/device service)
- AxeShed (profile scheduler) mounted at `/shed`
- AxePool (pool scheduler) mounted at `/pool`

The web UI is served on `http://<host>:5000`.

## Core workflow

- Add one or more devices (by IP) and monitor key live stats.
- Run benchmark/tuning sessions and review historical results.
- Apply profiles to devices and schedule profiles/pools via the built-in schedulers.

## Licensing

If licensing is enabled for your build/environment, activation must be performed on the machine hosting AxeBench (the machine running the binary).

## Notes

- This repo is release-facing (docs + checksums). Source code is maintained elsewhere.
