# AxeBench v3.0.0 RC1e (beta) - Setup Guide

This guide covers running the RC1e release binaries (not building from source).

## Downloads

Download the correct file for your platform and verify it with `checksums/RC1e.sha256`.

- Windows: `AxeBench_v3.0_RC1e.exe`
- Linux: `AxeBench_v3.0_RC1e_linux.bin`

## What starts when you run it

The RC1e binary starts the unified app and serves the UI on:

- `http://127.0.0.1:5000` (local machine)
- `http://<your-ip>:5000` (LAN access from other devices)

## Windows

1. Run `AxeBench_v3.0_RC1e.exe`.
2. Allow Windows Firewall access if prompted (Private network/LAN if you want remote access).
3. Open `http://127.0.0.1:5000` in your browser.

## Linux

1. Make it executable and run it:

```bash
chmod +x ./AxeBench_v3.0_RC1e_linux.bin
./AxeBench_v3.0_RC1e_linux.bin
```

2. Open `http://127.0.0.1:5000` locally, or `http://<your-ip>:5000` from another machine.

### Optional: run as a service (systemd)

Create a unit like:

```ini
[Unit]
Description=AxeBench (RC1e)
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
WorkingDirectory=/opt/axebench
ExecStart=/opt/axebench/AxeBench_v3.0_RC1e_linux.bin
Restart=on-failure
User=axebench

[Install]
WantedBy=multi-user.target
```

Then:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now axebench.service
sudo journalctl -u axebench -f
```

## Safety note

Changing device values away from factory defaults can void warranties and can cause damage. Use at your own risk.
