# AxeBench Matrix UI - Troubleshooting Guide

## Current Issue: "Failed to load devices"

The Matrix UI is showing "Failed to load devices" error, which means the frontend cannot successfully communicate with the Flask backend.

## Diagnostic Steps

### 1. Check Flask Backend Status

**Verify Flask is running:**
```bash
# Check if Flask is running on port 5000
netstat -an | grep 5000
# or
lsof -i :5000
```

**Start Flask backend if not running:**
```bash
cd /mnt/c/AxeBench_Build/AxeBench_v2.11.0_BETA
python web_interface.py
```

**Expected output:**
```
 * Running on http://0.0.0.0:5000
 * Running on http://127.0.0.1:5000
```

### 2. Test Flask API Manually

**Using curl:**
```bash
# Test device list endpoint
curl http://localhost:5000/api/devices

# Expected: JSON array with device objects
# Example: [{"name": "Gamma 601", "ip": "192.168.1.100", "model": "gamma"}, ...]
```

**Using the diagnostic script:**
```bash
cd /mnt/c/AxeBench_Build/axebench-matrix-ui
node test-flask-connection.js
```

### 3. Check Browser Console Logs

1. Open Matrix UI in browser
2. Press **F12** to open DevTools
3. Go to **Console** tab
4. Look for logs starting with `[API]` and `[Dashboard]`

**What to look for:**
- `API Request: GET /api/devices` - Shows API call is being made
- `API Response success: GET /api/devices` - Shows data was received
- `Dashboard: Device list received` - Shows data reached the component
- Any error messages in red

### 4. Check Network Tab

1. Open DevTools (F12)
2. Go to **Network** tab
3. Refresh the page
4. Look for `/api/devices` request

**Check:**
- Status code (should be 200 OK)
- Response data (should be JSON array)
- Any CORS errors

### 5. Download Debug Logs

In browser console, run:
```javascript
window.axebenchLogger.downloadLogs()
```

This will download a complete log file with all API calls and state changes.

## Common Issues and Solutions

### Issue: "Failed to fetch" or "Network error"

**Cause:** Flask backend is not running or not accessible

**Solution:**
1. Start Flask: `python web_interface.py`
2. Verify it's listening on port 5000
3. Check firewall isn't blocking the connection

### Issue: CORS Error

**Cause:** Flask CORS configuration not allowing Matrix UI origin

**Solution:**
Check Flask has CORS enabled in `web_interface.py`:
```python
from flask_cors import CORS
app = Flask(__name__)
CORS(app)  # This should be present
```

### Issue: "Cannot read property 'length' of undefined"

**Cause:** API response format doesn't match expected structure

**Solution:**
1. Check Flask API returns an array: `[{...}, {...}]`
2. Not an object: `{"devices": [...]}`
3. Run diagnostic script to see actual response format

### Issue: Devices load but show as OFFLINE

**Cause:** Device status endpoint failing or returning wrong format

**Solution:**
1. Test status endpoint: `curl http://localhost:5000/api/devices/DEVICE_NAME/status`
2. Verify it returns JSON with: `hashrate`, `temperature`, `power`, etc.
3. Check device is actually reachable at its IP address

### Issue: "NO_DEVICES_DETECTED" despite API returning data

**Cause:** React state not updating or rendering condition bug

**Solution:**
1. Check console logs for "State updated with devices"
2. Check "Render cycle" logs show `devicesCount > 0`
3. This is the current bug we're investigating

## Environment Configuration

**Matrix UI expects Flask at:**
- URL: `http://localhost:5000`
- Configured in: `.env` file as `VITE_API_BASE_URL`

**To change Flask URL:**
1. Edit `/mnt/c/AxeBench_Build/axebench-matrix-ui/.env`
2. Set `VITE_API_BASE_URL=http://YOUR_FLASK_IP:PORT`
3. Restart dev server: `npm run dev`

## Getting Help

If issues persist:

1. **Collect logs:**
   - Browser console logs (F12 → Console)
   - Flask console output
   - Downloaded debug logs (`window.axebenchLogger.downloadLogs()`)
   - Diagnostic script output (`node test-flask-connection.js`)

2. **Share information:**
   - Flask version and startup messages
   - Browser and version
   - Network tab screenshot showing failed requests
   - Any error messages from console

3. **Test with curl:**
   - Verify Flask endpoints work outside the browser
   - Rules out CORS/browser-specific issues
