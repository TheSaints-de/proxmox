#!/bin/sh

# ========================================
# How to apply this script ...
# ----------------------------------------
#
# 	wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/init-alpine.sh" | $(echo $SHELL)
#
# ========================================

# Run Alpine update
apk update
apk upgrade
apk add bash