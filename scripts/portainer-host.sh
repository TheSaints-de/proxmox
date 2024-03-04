#!/bin/sh

# ========================================
# How to apply this script ...
# ----------------------------------------
#
# 	wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/portainer-host.sh" | $SHELL
#
# ========================================

OS_ID=$(cat /etc/os-release | grep ^ID= | cut -d'=' -f2 | tr -d '"')

echo ">>> Installing Docker Engine and Compose ..."
wget -O - "https://raw.githubusercontent.com/TheSaints-de/proxmox/main/scripts/docker-$OS_ID.sh" | $SHELL

echo ">>> Deleting all containers ..."
docker rm -vf $(docker ps -q)

echo ">>> Removing all containers ..."
docker container prune -f

echo ">>> Installing Portainer ..."
docker run \
	--restart always \
	--detach \
	--publish 80:9000 \
	--volumne /var/run/docker.sock:/var/run/docker.sock \
	--volumne portainer_data:/data \
	portainer/portainer-ce