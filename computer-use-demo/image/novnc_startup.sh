#!/bin/bash
echo "starting noVNC"

# Start noVNC with explicit websocket settings
/opt/noVNC/utils/novnc_proxy \
    --vnc 192.168.1.18:6004 \
    --listen 6003 \
    --web /opt/noVNC \
    > /tmp/novnc.log 2>&1 &

# Wait for noVNC to start
timeout=10
while [ $timeout -gt 0 ]; do
    if netstat -tuln | grep -q ":6003 "; then
        break
    fi
    sleep 1
    ((timeout--))
done

echo "noVNC started successfully"
