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

# Kill running containers
docker kill $(docker ps -q)

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