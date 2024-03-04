#!/bin/sh

# ========================================
# How to apply this script ...
# ----------------------------------------
#
# 	wget -qO - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/portainer-host.sh" | $(echo $SHELL)
#
# ========================================

OS_ID=$($(awk -F= '/^ID=/{print $2}' /etc/os-release))

# Install Docker
wget -qO - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/docker-$OS_ID.sh" | $(echo $SHELL)

# Install Portainer
docker run --restart always -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce