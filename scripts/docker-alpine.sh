#!/bin/sh

# ========================================
# How to apply this script ...
# ----------------------------------------
#
# 	wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/docker-alpine.sh" | $SHELL
#
# ========================================

echo ">>> Running Alpine initialize ..."
wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/init-alpine.sh" | $SHELL

echo ">>> Installing Docker Engine and Compose ..."
apk add docker docker-compose

echo ">>> Starting and enabling Docker Service ..."
rc-update add docker boot && service docker start