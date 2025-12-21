# AxeBench v3.0.0 (Stable) + Android Client v1.2

Hey legends — **AxeBench v3.0.0 is now STABLE** and the Android client is updated to v1.2. Thank you for all the testing, bugs, and feedback through the beta/RC cycle.

## Disclaimer (Please Read Before Blaming Anyone Else)

AxeBench is a tool. It does not possess sentience, free will, or the ability to physically damage your hardware. That part is on you.

If you choose to overclock, tune, stress, or otherwise attempt to achieve interplanetary performance levels from your miners, you are knowingly operating outside manufacturer specifications. This can void warranties, shorten component lifespan, and occasionally release the magic smoke. None of this is surprising.

The developer of AxeBench is not responsible if your device, power supply, fan, ASIC, breaker, extension lead, or confidence collapses as a result of settings you personally applied. AxeBench does not sneak unsafe values in while you aren't looking, does not override hardware protections, and does not whisper "send it" into your ear.

Presets, hints, warnings, and safety indicators are provided as guidance, not permission slips. You remain fully responsible for understanding your hardware, your PSU, your cooling, and your own limits.

Do not let the cheese slide off your cracker. If you are not sure what you are doing, this is not a learning simulator. Turning every knob to the right and then acting shocked when something cooks is not a software bug.

If you ignore all of the above and something melts anyway, that outcome belongs entirely to you.

Tune responsibly. Or don't. But own it.

## Downloads (GitHub Releases)

Release repo (docs + checksums): <https://github.com/WillItMod/AxeBench-Release>

- v3.0.0 (stable): <https://github.com/WillItMod/AxeBench-Release/releases/tag/v3.0.0>
- RC1e (legacy RC): <https://github.com/WillItMod/AxeBench-Release/releases/tag/v3.0.0-rc1e>

Artifacts:

- Windows: `AxeBench_v3.0.0.exe`
- Linux: `AxeBench_v3.0.0_linux.bin`
- Android client: `axebench_client_v1.2.apk`

Checksums:

- v3.0.0 stable: [`checksums/v3.0.0.sha256`](../checksums/v3.0.0.sha256)
- RC1e: [`checksums/RC1e.sha256`](../checksums/RC1e.sha256)

## Current known issues

- Autopilot: selecting "skip" on NANO tunes does not currently skip NANO.
- Profiles: all 4 profiles get created regardless of the selected profiles.

Both are backend handler issues; fix is in progress.

## Highlights in RC1 (rollup)

- Unified launcher: one start brings up Bench + Shed + Pool and serves the UI at `http://<PC_IP>:5000`.
- Matrix UI refresh: calmer layout, better spacing, wider dialogs, mobile polish, and smoother visuals.
- AutoPilot Mode 2.0: faster runs, smarter stepping, improved edge detection, and better warmup/cooldown handling.
- Nano Tune rebuild: precision sweeps around an "anchor" baseline to avoid drift; safer voltage handling; auto-save results.
- Boost tiers + presets: baseline / sporty / overclock / moon; fast / optimum / precision strategies.
- Safety + PSU awareness: PSU capacity/headroom is treated as a real constraint; shared PSUs handled; two-stage warnings.
- Sessions: richer history, plots/exports, and clearer logs.
- Pools + scheduling: pool presets/custom pools, bulk apply, and time-based automation via AxeShed.
- Settings + theming: more control over limits, alerts, polling, and the overall look/feel.

## Android client changelog

### v1b → v1.1

- Removes the spinning refresh logo.
- Fixes the "unable to connect – check IP and port" message after sleep/resume.

### v1.1 → v1.2

- Further silences reconnect noise after sleep/resume for a smoother experience.

## How to run

- Windows: run the EXE, then open `http://localhost:5000` (or `http://<PC_IP>:5000` on your LAN).
- Linux: `chmod +x ./AxeBench_*.bin && ./AxeBench_*.bin`, then open `http://localhost:5000`.
- Android: install `axebench_client_v1.2.apk`, enter your server IP + port, tap Connect.

Data is stored in your user profile (typically `%USERPROFILE%\\.bitaxe-benchmark` on Windows, `~/.bitaxe-benchmark` on Linux). Back it up before wiping anything.
