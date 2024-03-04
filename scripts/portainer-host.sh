#!/bin/sh

# ========================================
# How to apply this script ...
# ----------------------------------------
#
# 
#
# ========================================

OS_ID=$($(awk -F= '/^ID=/{print $2}' /etc/os-release))

wget -qO - "http://example.com/script.sh | bash

# Run Alpine update
apk update
apk upgrade

# Install Docker Engine and Compose
apk add docker docker-compose

# Start and enable Docker Service
rc-update add docker boot
service docker start

# Install Portainer
docker run --restart always -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce