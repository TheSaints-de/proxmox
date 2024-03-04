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
[ -z "$(docker ps -q)" ] || docker rm -f $(docker ps -q)

echo ">>> Removing all containers ..."
docker container prune -f

echo ">>> Creating Portainler volume ..."
docker volume create portainer_data

echo ">>> Starting Portainer container..."
docker run \
	--restart always \
	-d \
	-p 80:9000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer_data:/data \
	portainer/portainer-ce
