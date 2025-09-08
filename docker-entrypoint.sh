#!/usr/bin/env bash
set -e

# Run migrations every boot (idempotent)
./pocketbase migrate up --dir "${PB_DATA_DIR}"

# Start server on Railway-assigned port and persist data to /data
exec ./pocketbase serve --http 0.0.0.0:${PORT} --dir "${PB_DATA_DIR}"
