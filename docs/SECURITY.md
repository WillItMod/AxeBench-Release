# Security and IP protection (RC1e)

## Is the RC1e binary “secure”?

RC1e is distributed as compiled binaries (Windows `.exe`, Linux `.bin`) and does not ship the original source tree. This is a useful *speed bump*, but it is not absolute protection: a determined attacker can still reverse engineer binaries.

## Recommended “speed bumps”

- Keep sensitive keys/logic server-side (your license server / cloud).
- Avoid bundling private keys, API secrets, or credentials into the client binary.
- Code-sign Windows builds (reduces tampering warnings and helps provenance).
- Publish SHA256 checksums (this repo) and only distribute via official releases.
- Disable/debug-gate any developer-only endpoints and verbose logs in release builds.

## Runtime hardening (operational)

- Run AxeBench under an unprivileged user account.
- Expose only what you need (default UI is on port `5000`; firewall accordingly).
- Treat devices and LAN access as trusted; do not expose the UI directly to the public internet without a reverse proxy + auth.
