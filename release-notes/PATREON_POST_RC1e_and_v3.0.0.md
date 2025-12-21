# AxeBench v3.0.0 (testing) + RC1e (stable) + Android Client v1.2

## Disclaimer (Please Read Before Blaming Anyone Else)

AxeBench is a tool. It does not possess sentience, free will, or the ability to physically damage your hardware. That part is on you.

If you choose to overclock, tune, stress, or otherwise attempt to achieve interplanetary performance levels from your miners, you are knowingly operating outside manufacturer specifications. This can void warranties, shorten component lifespan, and occasionally release the magic smoke. None of this is surprising.

The developer of AxeBench is not responsible if your device, power supply, fan, ASIC, breaker, extension lead, or confidence collapses as a result of settings you personally applied. AxeBench does not sneak unsafe values in while you aren’t looking, does not override hardware protections, and does not whisper “send it” into your ear.

Presets, hints, warnings, and safety indicators are provided as guidance, not permission slips. You remain fully responsible for understanding your hardware, your PSU, your cooling, and your own limits.

Do not let the cheese slide off your cracker. If you are not sure what you are doing, this is not a learning simulator. Turning every knob to the right and then acting shocked when something cooks is not a software bug.

If you ignore all of the above and something melts anyway, that outcome belongs entirely to you.

Tune responsibly. Or don’t. But own it.

---

## Downloads (GitHub Releases)

Release repo (docs + checksums): `https://github.com/WillItMod/AxeBench-Release`

- RC1e (stable): `https://github.com/WillItMod/AxeBench-Release/releases/tag/v3.0.0-rc1e`
- v3.0.0 (testing build): `https://github.com/WillItMod/AxeBench-Release/releases/tag/v3.0.0`

Artifacts:

- Windows: `AxeBench_v3.0_RC1e.exe` / `AxeBench_v3.0.0.exe`
- Linux: `AxeBench_v3.0_RC1e_linux.bin` / `AxeBench_v3.0.0_linux.bin`
- Android client: `axebench_client_v1.2.apk`

Checksums:

- RC1e: `checksums/RC1e.sha256`
- v3.0.0 testing: `checksums/v3.0.0-DRAFT.sha256`

---

## Current known issues

- Selecting “skip” on NANO tunes from Autopilot does not skip NANO tunes.
- All 4 profiles get created regardless of the selected profiles.

Both are backend handler issues; fix is in progress.

---

## What’s in RC1 (rollup)

### Unified launcher

One launcher starts Bench, Shed, and Pool together and serves the UI at `http://<PC_IP>:5000`.

### Matrix UI refresh

Animated grid + digital rain, cleaner spacing, wider popups, and better mobile polish.

### Benchmark and tuning engine v3.0

- AutoPilot Mode 2.0: faster runs, smarter steps, improved edge detection, smoother warmup/cooldown, and better thermal prediction.
- Nano Tune: precision sweeps around a baseline “anchor” profile to avoid drift; safer voltage handling; auto-save results.
- Presets: fast / optimum / precision.
- Boost tiers: baseline / sporty / overclock / moon.

### Safety and PSU awareness

AxeBench now treats your PSU as a real constraint (capacity/headroom) and adjusts/alerts accordingly. You still need to enter your PSU voltage + amps correctly and respect cooling limits.

### Dashboard, monitoring, sessions

Fleet overview, improved live visuals, full session history with export/plots, and richer logs.

### Pool manager + scheduler

Pool presets/custom pools, bulk apply, and time-based automation via AxeShed.

---

## Android client app changelog

### v1b → v1.1

- Removes the spinning refresh logo.
- Fixes “unable to connect – check IP and port” message after sleep/resume.

### v1.1 → v1.2

- Further silences sleep/resume reconnect error noise for a smoother experience.
