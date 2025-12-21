# AxeBench Matrix UI v2.0 - Setup Guide

Quick start guide for connecting the Matrix UI to your AxeBench v3.0.0 backend.

## Prerequisites

✅ **AxeBench v3.0.0 Backend** running on `0.0.0.0:5000`  
✅ **Node.js 22+** (already installed in sandbox)  
✅ **pnpm** (already installed in sandbox)

## Quick Start

### 1. Start AxeBench Backend

First, make sure your AxeBench Flask server is running:

```bash
cd /path/to/axebench
python web_interface.py
```

You should see:
```
╔═══════════════════════════════════════════════════════════╗
║                    ⚡ AxeBench v3.0.0 ⚡                   ║
║          Professional Bitaxe Benchmark Tool               ║
╚═══════════════════════════════════════════════════════════╝

Web interface starting on http://0.0.0.0:5000
```

### 2. Configure Matrix UI

The Matrix UI is already configured to connect to `http://localhost:5000` by default.

If you need to change it, edit `client/src/lib/api.ts`:

```typescript
export const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://localhost:5000';
```

### 3. Start Matrix UI

```bash
cd /home/ubuntu/axebench-matrix-ui
pnpm dev
```

The Matrix UI will start on **http://localhost:3000**

### 4. Open in Browser

Navigate to: **http://localhost:3000**

You should see the Matrix-themed interface with:
- Animated grid background
- Digital rain effect
- Neon green/cyan UI elements
- Four main tabs: Dashboard, Benchmark, Profiles, Sessions

## Testing the Connection

### Test 1: Dashboard
1. Click **"ADD_DEVICE"** button
2. Enter a device IP address
3. Click **"DETECT"** - should auto-detect device info
4. Fill in name and click **"ADD_DEVICE"**
5. Device should appear in the grid

### Test 2: Benchmark
1. Go to **BENCHMARK** tab
2. Select a device from dropdown
3. Configure voltage/frequency ranges
4. Click **"START_BENCHMARK"**
5. Should see live progress and stats

### Test 3: Profiles
1. Go to **PROFILES** tab
2. Select a device
3. Should see saved profiles (if any exist)
4. Click **"APPLY"** to apply a profile
5. Click **"TUNE"** to start Nano Tune

### Test 4: Sessions
1. Go to **SESSIONS** tab
2. Should see list of past benchmark sessions
3. Click **"VIEW"** to see session details
4. Should see logs and results

## Troubleshooting

### ❌ "Failed to load devices" error

**Cause**: Cannot connect to Flask backend

**Solutions**:
1. Verify Flask is running: `curl http://localhost:5000/api/devices`
2. Check CORS is enabled in Flask (it should be by default)
3. Check firewall settings
4. Try `http://127.0.0.1:5000` instead of `localhost`

### ❌ CORS errors in browser console

**Cause**: Flask CORS not configured properly

**Solution**: Verify `flask_cors` is installed and enabled:
```python
from flask_cors import CORS
app = Flask(__name__)
CORS(app)  # This should already be in web_interface.py
```

### ❌ No devices showing after adding

**Cause**: Device might be offline or IP incorrect

**Solutions**:
1. Ping the device: `ping 192.168.1.XXX`
2. Check device is powered on
3. Verify IP address is correct
4. Try auto-detect feature

### ❌ Benchmark won't start

**Cause**: Invalid configuration or device offline

**Solutions**:
1. Verify device is selected
2. Check voltage/frequency ranges are valid for your device model
3. Ensure device is online (green indicator)
4. Check Flask backend logs for errors

## Network Configuration

### Same Machine (Default)
- **Flask Backend**: `http://localhost:5000`
- **Matrix UI**: `http://localhost:3000`
- **Configuration**: No changes needed

### Different Machines (LAN)
- **Flask Backend**: `http://192.168.1.100:5000` (example)
- **Matrix UI**: Any machine on network
- **Configuration**: Update `VITE_API_BASE_URL` in `.env` file

### Remote Server
- **Flask Backend**: `https://axebench.example.com`
- **Matrix UI**: Any machine with internet
- **Configuration**: Update `VITE_API_BASE_URL` and ensure HTTPS

## Production Deployment

### Build for Production

```bash
cd /home/ubuntu/axebench-matrix-ui
pnpm build
```

This creates optimized static files in `dist/public/`

### Serve Production Build

```bash
pnpm start
```

Or use any static file server:
```bash
npx serve dist/public
```

### Nginx Configuration (Optional)

If you want to serve both Flask and Matrix UI through Nginx:

```nginx
server {
    listen 80;
    server_name axebench.local;

    # Matrix UI (static files)
    location / {
        root /home/ubuntu/axebench-matrix-ui/dist/public;
        try_files $uri $uri/ /index.html;
    }

    # Flask API (proxy)
    location /api/ {
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

## API Endpoints Reference

All endpoints are prefixed with `/api`:

### Devices
- `GET /api/devices` - List devices
- `POST /api/devices` - Add device
- `POST /api/devices/detect` - Auto-detect

### Benchmark
- `POST /api/benchmark/start` - Start
- `GET /api/benchmark/status` - Status
- `POST /api/benchmark/stop` - Stop

### Profiles
- `GET /api/profiles/<device>` - List
- `POST /api/profiles/<device>/apply/<name>` - Apply
- `DELETE /api/profiles/<device>/delete/<name>` - Delete

### Sessions
- `GET /api/sessions` - List
- `GET /api/sessions/<id>` - Details
- `GET /api/sessions/<id>/logs` - Logs
- `DELETE /api/sessions/<id>` - Delete

## Support

For issues with:
- **Matrix UI**: Check browser console for errors
- **Flask Backend**: Check terminal output and logs
- **Connection**: Verify network and CORS settings
- **Features**: Refer to COMPLETE_FUNCTIONALITY.md

## Next Steps

1. ✅ Add your Bitaxe devices
2. ✅ Run your first benchmark
3. ✅ Apply optimized profiles
4. ✅ Monitor fleet performance
5. ✅ Review session history

Enjoy the Matrix! 🟢⚡
