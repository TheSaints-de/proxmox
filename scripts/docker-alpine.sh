#!/bin/sh

# ========================================
# How to apply this script ...
# ----------------------------------------
#
# 	wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/docker-alpine.sh" | $SHELL
#
# ========================================

wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/init-alpine.sh" | $SHELL

# Install Docker Engine and Compose
apk add docker docker-compose

# Start and enable Docker Service
rc-update add docker boot
service docker start