#!/bin/sh

# Get the default interface
IFACE=$(ip route | grep '^default' | awk '{print $5}')

if [ -z "$IFACE" ]; then
    echo "{\"text\": \"⚠ Disconnected\", \"tooltip\": \"No network connection\"}"
    exit 0
fi

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
    TOOLTIP="Interface: $IFACE\nIP: $IP_ADDR"
else
    IP_ADDR=$(ip -4 addr show "$IFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    CIDR=$(ip -4 addr show "$IFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}/\d+' | cut -d'/' -f2)
    FORMAT="$ICON  $IFACE: $IP_ADDR/$CIDR"
    TOOLTIP="Interface: $IFACE\nIP: $IP_ADDR"
fi

# Get public IP
PUBLIC_IP=$(curl -s --connect-timeout 5 ifconfig.co)
if [ -n "$PUBLIC_IP" ]; then
    TOOLTIP="$TOOLTIP\nPublic IP: $PUBLIC_IP"
fi

echo "{\"text\": \"$FORMAT\", \"tooltip\": \"$TOOLTIP\"}"
