#!/bin/bash
# specfetch - simple system info fetcher (like neofetch but lightweight)

# User and host
USER_NAME=$(whoami)
HOST_NAME=$(hostname)

# OS
OS=$(lsb_release -d 2>/dev/null | cut -f2-)
if [ -z "$OS" ]; then
    OS=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d= -f2- | tr -d '"')
fi

# Kernel
KERNEL=$(uname -r)

# Uptime
UPTIME=$(uptime -p)

# Shell
SHELL=$(basename "$SHELL")

# Resolution (X11 only)
RES=$(xdpyinfo 2>/dev/null | awk '/dimensions/{print $2}' | head -n1)

# CPU
CPU=$(grep -m1 "model name" /proc/cpuinfo | cut -d: -f2- | sed 's/^ //')

# Memory
MEM_USED=$(free -h | awk '/Mem:/ {print $3}')
MEM_TOTAL=$(free -h | awk '/Mem:/ {print $2}')

echo -e "\n$USER_NAME@$HOST_NAME"
echo "------------------------"
echo "OS:        $OS"
echo "Kernel:    $KERNEL"
echo "Uptime:    $UPTIME"
echo "Shell:     $SHELL"
echo "Resolution:$RES"
echo "CPU:       $CPU"
echo "Memory:    $MEM_USED / $MEM_TOTAL"
echo
