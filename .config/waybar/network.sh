#!/bin/sh

# Function to escape JSON strings
json_escape() {
    printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g; s/\t/\\t/g; s/\r/\\r/g; s/\n/\\n/g'
}

# Get the default interface
IFACE=$(ip route | grep '^default' | awk '{print $5}')
if [ -z "$IFACE" ]; then
    echo '{"text": "⚠ Disconnected", "tooltip": "No network connection"}'
    exit 0
fi

# --- Network Speed ---
# Get initial byte counts
RX_BEFORE=$(cat /sys/class/net/$IFACE/statistics/rx_bytes 2>/dev/null || echo 0)
TX_BEFORE=$(cat /sys/class/net/$IFACE/statistics/tx_bytes 2>/dev/null || echo 0)

# Wait a second
sleep 1

# Get new byte counts
RX_AFTER=$(cat /sys/class/net/$IFACE/statistics/rx_bytes 2>/dev/null || echo 0)
TX_AFTER=$(cat /sys/class/net/$IFACE/statistics/tx_bytes 2>/dev/null || echo 0)

# Calculate speed in bytes per second
RX_SPEED=$((RX_AFTER - RX_BEFORE))
TX_SPEED=$((TX_AFTER - TX_BEFORE))

# Function to format bytes into KB/s or MB/s
format_speed() {
    SPEED_BPS=$1
    # Use awk for floating point division
    SPEED_KBPS=$(awk -v bps="$SPEED_BPS" 'BEGIN { printf "%.2f", bps / 1024 }')
    
    # Check if speed is greater than 1024 KB/s to convert to MB/s
    IS_GT_1024=$(awk -v kbps="$SPEED_KBPS" 'BEGIN { print (kbps > 1024) }')
    if [ "$IS_GT_1024" -eq 1 ]; then
        # Use awk for floating point division
        SPEED_MBPS=$(awk -v kbps="$SPEED_KBPS" 'BEGIN { printf "%.2f", kbps / 1024 }')
        echo "$SPEED_MBPS MB/s"
    else
        echo "${SPEED_KBPS} KB/s"
    fi
}

# Format the speeds
DOWNLOAD_SPEED=$(format_speed $RX_SPEED)
UPLOAD_SPEED=$(format_speed $TX_SPEED)

# --- End Network Speed ---

# Determine the icon
if ip link show wg0 up > /dev/null 2>&1; then
    ICON="󰞀" # Shield icon for VPN (nerd font)
elif iwgetid -r "$IFACE" > /dev/null 2>&1; then
    ICON="󰤨" # Wifi icon (nerd font)
else
    ICON="󰈀" # Ethernet icon (nerd font)
fi

# Check if it's a Wi-Fi interface for formatting the text
if iwgetid -r "$IFACE" > /dev/null 2>&1; then
    ESSID=$(iwgetid -r "$IFACE" 2>/dev/null || echo "Unknown")
    IP_ADDR=$(ip -4 addr show "$IFACE" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
    FORMAT="$ICON  $ESSID"
    TOOLTIP="Download: $DOWNLOAD_SPEED\nUpload: $UPLOAD_SPEED\nInterface: $IFACE\nIP: $IP_ADDR"
else
    IP_ADDR=$(ip -4 addr show "$IFACE" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
    CIDR=$(ip -4 addr show "$IFACE" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}/\d+' | cut -d'/' -f2 | head -1)
    FORMAT="$ICON  $IFACE: $IP_ADDR/$CIDR"
    TOOLTIP="Download: $DOWNLOAD_SPEED\nUpload: $UPLOAD_SPEED\nInterface: $IFACE\nIP: $IP_ADDR"
fi

# Get public IP with better error handling
PUBLIC_IP=$(timeout 3 curl -s --connect-timeout 2 ifconfig.co 2>/dev/null | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$')
if [ -n "$PUBLIC_IP" ]; then
    TOOLTIP="$TOOLTIP\nPublic IP: $PUBLIC_IP"
fi

# Escape the strings for JSON
FORMAT_ESCAPED=$(json_escape "$FORMAT")

# For tooltip, we need to manually escape quotes and backslashes, but keep \n as literal \n for JSON
TOOLTIP_ESCAPED=$(printf '%s' "$TOOLTIP" | sed 's/\\/\\\\/g; s/"/\\"/g')

echo "{\"text\": \"$FORMAT_ESCAPED\", \"tooltip\": \"$TOOLTIP_ESCAPED\"}"
