#!/bin/sh


# Run Alpine update
apk update
apk upgrade

# Install Docker Engine and Compose
apk add docker docker-compose

# Start and enable Docker Service
rc-update add docker boot
service docker start