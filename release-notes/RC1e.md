# AxeBench v3.0.0 RC1e (beta) - Release Notes

## Downloads

Artifacts are published on the GitHub Release for this repo.

- Windows: `AxeBench_v3.0_RC1e.exe`
- Linux: `AxeBench_v3.0_RC1e_linux.bin`

Verify downloads with:

- `checksums/RC1e.sha256`

## Notes

- The Linux artifact is a single-file binary; ensure it is executable (`chmod +x`).
- If a Linux build ever shows Python extension casing issues (e.g. `pandas/_libs/interval.so`), it typically indicates a build produced on a case-insensitive filesystem. Re-download and verify the checksum; if it persists, report the error output.

## Security

RC1e is compiled and does not ship the original source tree, but binaries can still be reverse engineered. See `docs/SECURITY.md` for recommended “speed bumps”.
