#!/bin/sh

# Get the default interface
IFACE=$(ip route | grep '^default' | awk '{print $5}')

if [ -z "$IFACE" ]; then
    echo "{\"text\": \"⚠ Disconnected\", \"tooltip\": \"No network connection\"}"
    exit 0
fi

# --- Network Speed ---
# Get initial byte counts
RX_BEFORE=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX_BEFORE=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)
# Wait a second
sleep 1
# Get new byte counts
RX_AFTER=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX_AFTER=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

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
    ICON="" # Lock icon for VPN
elif iwgetid -r "$IFACE" > /dev/null 2>&1; then
    ICON="" # Wifi icon
else
    ICON="" # Ethernet icon
fi

# Check if it's a Wi-Fi interface for formatting the text
if iwgetid -r "$IFACE" > /dev/null 2>&1; then
    ESSID=$(iwgetid -r "$IFACE")
    IP_ADDR=$(ip -4 addr show "$IFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    FORMAT="$ICON  $ESSID"
    TOOLTIP="Download: $DOWNLOAD_SPEED\nUpload: $UPLOAD_SPEED\nInterface: $IFACE\nIP: $IP_ADDR"
else
    IP_ADDR=$(ip -4 addr show "$IFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    CIDR=$(ip -4 addr show "$IFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}/\d+' | cut -d'/' -f2)
    FORMAT="$ICON  $IFACE: $IP_ADDR/$CIDR"
    TOOLTIP="Download: $DOWNLOAD_SPEED\nUpload: $UPLOAD_SPEED\nInterface: $IFACE\nIP: $IP_ADDR"
fi

# Get public IP
PUBLIC_IP=$(curl -s --connect-timeout 5 ifconfig.co)
if [ -n "$PUBLIC_IP" ]; then
    TOOLTIP="$TOOLTIP\nPublic IP: $PUBLIC_IP"
fi

echo "{\"text\": \"$FORMAT\", \"tooltip\": \"$TOOLTIP\"}"