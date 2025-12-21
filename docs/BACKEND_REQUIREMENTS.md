# Backend Requirements for AxeBench Matrix UI

This document lists the backend API changes needed for full frontend functionality.

## Device Status API

**Endpoint:** `GET /api/devices/{name}/status`

**Required Fields:**
```json
{
  "temp": 65.5,           // ASIC chip temperature (°C)
  "chipTemp": 65.5,       // Alternative field name for chip temp
  "vrTemp": 45.2,         // VR (voltage regulator) temperature (°C)
  "vr_temp": 45.2,        // Alternative field name for VR temp
  "asic_errors": 12,      // ASIC error count
  "errors": 12,           // Alternative field name for errors
  "voltage": 1150,        // Current voltage (mV)
  "frequency": 575,       // Current frequency (MHz)
  "hashrate": 1834.2,     // Current hashrate (GH/s)
  "power": 16.9           // Current power draw (W)
}
```

**Current Issue:** VR temp and ASIC errors showing 0 because fields are missing or named differently.

---

## Device Info API (Best Difficulty)

**Endpoint:** `GET /api/devices/{name}/info`

**Required Fields:**
```json
{
  "bestDiff": "4.29G",           // Best difficulty ever achieved
  "bestSessionDiff": "3.83M"     // Best difficulty this boot/session
}
```

**Current Issue:** Endpoint returns 404 or doesn't include these fields, causing Dashboard panels to show 0.

---

## Sessions API

**Endpoint:** `GET /api/sessions` and `GET /api/sessions/{id}`

**Required Fields:**
```json
{
  "id": "sess_123",
  "device": "Gamma 601",
  "status": "completed",
  "start_time": "2025-01-01T12:00:00Z",
  "end_time": "2025-01-01T14:30:00Z",
  "duration": 9000,              // Duration in seconds (REQUIRED)
  "tests_completed": 45,         // Number of tests completed (REQUIRED)
  "tests_total": 50,             // Total tests planned (REQUIRED)
  "tune_type": "benchmark",      // Type: "benchmark", "nanotune", "autotune" (REQUIRED)
  "mode": "benchmark",           // Alternative field name
  "custom_name": "High Efficiency Test",  // Optional user-provided name
  "config": {
    "voltage_start": 1100,
    "voltage_stop": 1200,
    "frequency_start": 500,
    "frequency_stop": 600
  }
}
```

**Current Issue:** Duration, tests_completed/tests_total, and tune_type fields are missing, showing "N/A" in UI.

---

## Session Logs API

**Endpoint:** `GET /api/sessions/{id}/logs`

**Required Response:**
```json
{
  "logs": [
    {
      "timestamp": "2025-01-01T12:05:30Z",
      "level": "info",
      "message": "Starting test 1/50: 1150mV @ 575MHz"
    },
    {
      "timestamp": "2025-01-01T12:06:00Z",
      "level": "info",
      "message": "Test 1 complete: 1834 GH/s, 16.9W"
    }
  ]
}
```

**Current Issue:** Logs showing "No logs available" because endpoint doesn't return console output.

---

## Profile Save Current API

**Endpoint:** `POST /api/profiles/{device}/custom`

**Expected Behavior:**
1. Fetch current device settings (voltage, frequency, fan) from device
2. Save as new profile with auto-generated name or user-provided name
3. Return success with profile details

**Current Issue:** Endpoint returns 405 Method Not Allowed. Frontend now uses this endpoint instead of `/update`.

---

## Pool Persistence

**Endpoint:** `POST /api/pools`

**Current Behavior:** Backend saves pool correctly (verified in axepool.py lines 376-392).

**Frontend Behavior:** Pool list reloads after 500ms delay. If pools still disappear, check:
1. `load_pools()` function reading from correct file
2. File permissions for pools.json
3. No race condition clearing pools on reload

---

## Implementation Priority

1. **HIGH:** Device status fields (vrTemp, asic_errors) - affects live monitoring
2. **HIGH:** Session metadata (duration, tests, tune_type) - affects session history
3. **MEDIUM:** Device info endpoint (bestDiff) - affects Dashboard panels
4. **MEDIUM:** Session logs endpoint - affects debugging capability
5. **LOW:** Profile save current - workaround exists using saveCustom

---

## Testing Checklist

- [ ] Device status returns all required temperature fields
- [ ] Device status returns ASIC error count
- [ ] Device info endpoint returns bestDiff and bestSessionDiff
- [ ] Sessions include duration, tests_completed, tests_total, tune_type
- [ ] Session logs endpoint returns console output
- [ ] Profile save current endpoint works
- [ ] Pool creation persists across page refreshes
