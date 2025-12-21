# AxeBench v3.0.0 RC1e (beta) - Troubleshooting

## UI doesn’t load / “Unable to connect”

1. Make sure AxeBench is running.
   - Windows: run the EXE from a terminal to see logs.
   - Linux: run `./AxeBench_v3.0_RC1e_linux.bin` from a terminal to see logs.
2. Check you can reach `http://127.0.0.1:5000` locally.
3. If accessing from another device on your LAN, use `http://<your-ip>:5000` and allow inbound port `5000` in your firewall.

## Port 5000 already in use

Something else is already listening on `:5000`. Stop the conflicting service/process and try again.

- Windows: `netstat -ano | findstr :5000`
- Linux: `ss -lntp | grep :5000`

## Linux: “cannot open shared object file” (pandas / *.so)

If you see errors like:

`ImportError: ... pandas/_libs/... .so: cannot open shared object file: No such file or directory`

Try:

1. Re-download the binary.
2. Verify the SHA256 checksum (`checksums/RC1e.sha256`).
3. If it still fails, report the error output and your distro/version.

## Linux: “GLIBC_2.xx not found”

This means your Linux userland is too old for the binary build. Use a newer distro image (or request a build targeting your distro).

## Ctrl+C shows a Python traceback

If you stop AxeBench with Ctrl+C and see a traceback (especially around `webbrowser` or `subprocess`), that’s expected for an interrupted process. It does not imply corruption.

## Reset local data

If an upgrade behaves strangely, back up and then remove the local data folder so AxeBench can regenerate it:

- Windows (typical): `%USERPROFILE%\\.bitaxe-benchmark`
- Linux (typical): `~/.bitaxe-benchmark`
