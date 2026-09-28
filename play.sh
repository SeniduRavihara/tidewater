#!/bin/bash
# Launch Tidewater with WebGPU enabled on Linux / Intel UHD 620
cd "$(dirname "$0")"

# Ensure vite dev server is running
if ! curl -s -I http://127.0.0.1:5189 >/dev/null 2>&1; then
    echo "Starting Vite dev server..."
    npm run dev &
    sleep 2
fi

echo "Launching Tidewater game in dedicated Chrome window..."
google-chrome \
  --user-data-dir="$HOME/.config/tidewater-game" \
  --ozone-platform=x11 \
  --enable-unsafe-webgpu \
  --no-first-run \
  "http://127.0.0.1:5189/?scale=0.5&noCaustics&fast" &
