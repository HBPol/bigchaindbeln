#!/bin/bash
MACHINE_NO="ALL MACHINES"
echo "Provisioning $MACHINE_NO..."
sudo apt-get update
sudo apt-get upgrade -y
echo "$MACHINE_NO provisioned!"
