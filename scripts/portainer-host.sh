#!/bin/sh

# ========================================
# How to apply this script ...
# ----------------------------------------
#
# 	wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/portainer-host.sh" | $SHELL
#
# ========================================

OS_ID=$(cat /etc/os-release | grep ^ID= | cut -d'=' -f2 | tr -d '"')

echo "========================================"
echo "Portainer Host"
echo "----------------------------------------"
echo "OS_ID: $OS_ID"
echo "========================================"

# Install Docker
wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/docker-$OS_ID.sh" | $SHELL

# Delete all containers (incl. anonymous volumes)
docker rm -vf $(docker ps -q)

# Remove all containers 
docker container prune -f

# Delete all images
docker rmi -f $(docker images -q)

# Remove all images
docker image prune -f

# Install Portainer
docker run --restart always -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce