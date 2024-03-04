#!/bin/sh

# ========================================
# How to apply this script ...
# ----------------------------------------
#
# 	wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/init-alpine.sh" | $SHELL
#
# ========================================

echo ">>> Running Alpine update ..."
apk update && apk upgrade

echo ">>> Installing bash ..."
apk add bash