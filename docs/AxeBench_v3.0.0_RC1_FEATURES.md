# AxeBench v3.0.0_RC1 – Release Candidate Feature Rollup

## New additions since BETA_5
- Patreon sign-in flow (BETA_5b) now in the mainline build for easier mobile/remote logins.
- License activation clarified: must be completed on the machine hosting the AxeBench backend.
- Internal dev logging stays disabled and polling/refresh got another pass of tuning for a snappier UI.
- Packaging/builds refreshed for RC1 (Windows EXE + Linux tarball) alongside the Android client app.

## Full feature set in RC1
- Native suite + launcher  
  - Packaged Windows EXE and Linux/WSL build; unified launcher brings up Bench + Shed + Pool and serves the React UI on one port (`http://[PC_IP]:5000`). Optional systemd unit for headless/auto-start.
- Matrix UI v2.0  
  - Gridrunner/matrix theme (animated grid, digital rain, scanline overlay), modern cards, tighter spacing, mobile polish, widened popups, de-noised chrome, profile cards redesign, and DEVICE_SELECT read-only hint.
- Android AxeBench client app  
  - Branded adaptive launcher icon, black/matrix-green theme, tinted progress/loading bar, white input text/hints, and aligned status/navigation bars.
- Benchmark engine & tuning  
  - Auto Mode 2.0 with faster, smarter edge detection; advanced thermal prediction (~65.9°C envelope); better PSU handling; voltage/frequency auto stepping; warmup/cooldown and cycles-per-test.  
  - Presets: Fast / Balanced / Nerd (fine) plus boost presets (Baseline/Sporty/Overclock/Moon) replacing topless, with baked per-model boost data.  
  - Autopilot picker (Quiet/Efficient/Balanced/Max) with Nano toggle; backend honors generate/nano/apply selections; choose which profiles to create.  
  - Nano Tune rebuilt for precision sweeps, safer voltage handling, and auto-save back to profiles; better alignment with profile requirements.  
  - Live monitoring/benchmark toggles for metrics; ASIC voltage overlay and supply voltage stat/toggle.  
  - Boost overrides screen to edit STOCK/SPORTY/OVERCLOCK/MOON per model; reset per/all to stock; “Customize in Settings” link; overrides drive temps/power/freq/voltage; boost warnings re-prompt after override changes.  
  - Engine panel hides when idle; compact layout when not running; “TUNE MODE” chip for strategy/stage/goal; sweep progress kept in the progress card; Balance/Risk uses PSU-aware ratios. One-run guard remains (one benchmark/autotune at a time).
- Safety, power, and PSU awareness  
  - PSU-aware safety: per-device PSU caps surfaced; power stress uses PSU headroom; PSU metadata in status endpoints; PSU/model-aware power ceilings derived on start unless topless/unlock_power.  
  - Two-tier warnings (caution vs critical) with manual override; model-aware limits; PSU-aware headroom slider; temp/power alert thresholds configurable in Settings.
- Device profiles & model support  
  - Refined Bitaxe/NerdQAxe profiles (Supra, Ultra, Max, Hex, Gamma 601/602, Base/+ /++, Gamma Turbo BM1370, SupraHex BM1368 x6) with safer defaults, tighter ranges, seeded presets/profiles, and auto-detect labels for six-chip/turbo models.  
  - Default Benchmark Profiles section removed (boost stock is baseline); Profiles page spacing/labels fixed; best-profile indicators; apply/edit/delete/save; Nano Tune per profile; “request a profile” guidance for unsupported devices.
- Monitoring & dashboard  
  - Combined live chart (hashrate + ASIC error spikes + unified timeline); real-time metric pods; proper ASIC tuning cockpit; fleet overview grid with quick actions (benchmark/config/fan/restart), model badges, best share, PSU cards with shared capacity/safe/warning bands, and network scan to auto-add devices.
- Sessions  
  - Full history with duration/tests/tune type, status badges, detailed logs modal, plot links (hashrate/efficiency/temp/power), CSV export, generate profiles from runs, “delete in days” tidy function.
- Pool manager (AxePool)  
  - Stratum pool presets (Braiins, CKPool Solo, Ocean, etc.), custom pools, password support, bulk apply to devices, scheduler status + start/stop controls, pool data persisted under `~/.bitaxe-benchmark/pools`, fallback awareness for fleet pushes.
- Operations scheduler (AxeShed)  
  - Time-based automation hub for profiles and pools with default + per-device blocks (start-only or start/end), day-of-week targeting, fallback pool support, multi-device selection with availability checks, warns on offline Shed/Pool services.
- Settings, theming, and UX polish  
  - Patreon/licensing status, device limits, quick logout/login; safety caps (chip/VR temp, power); alert thresholds; polling intervals for dashboard/monitoring; unit/time format toggles; Matrix effects pause; theme/font lab (palettes, scale, code color/brightness, motion controls).  
  - Faster polling/refresh, UI de-noised, popups widened, compact engine layout.  
  - Internal dev logging off to remove overhead.
- Getting started  
  - Windows: run the EXE → UI at `http://localhost:5000` (or `http://[PC_IP]:5000`).  
  - Linux: `tar -xzf axebench-linux-v3.0.tar.gz && cd axebench && ./axebench`; optional systemd unit; logs via `journalctl -u axebench -f`.
- Notes & guardrails  
  - If you see garbled text or slow loading, delete `%USERPROFILE%\.bitaxe-benchmark` and re-add devices (back up profiles/sessions first).  
  - License activation must be done on the backend host.  
  - Linux build ships alongside Windows; mobile app supported via the new Patreon login flow.  
  - One benchmark/autotune at a time; request a profile if your model is missing.
