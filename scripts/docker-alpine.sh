#!/bin/ash

# ========================================
# How to apply this script ...
# ----------------------------------------
#
# 	wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/docker-$OS_ID.sh" | $(echo $SHELL)
#
# ========================================

# Run Alpine update
apk update
apk upgrade

# Install Docker Engine and Compose
apk add docker docker-compose

# Start and enable Docker Service
rc-update add docker boot
service docker start