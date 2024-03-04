#!/bin/sh

# ========================================
# How to apply this script ...
# ----------------------------------------
#
# 	wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/init-alpine.sh" | $SHELL
#
# ========================================

# Run Alpine update
apk update && apk upgrade

# Install bash
apk add bash