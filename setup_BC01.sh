#!/bin/bash
MACHINE_NO="BigchainDB Node 1 (coordinator node)"
echo "##################### --- Provisioning $MACHINE_NO... --- #####################"
echo "Updating $MACHINE_NO..."
sudo apt-get update
echo "Upgrading $MACHINE_NO..."
sudo apt-get upgrade -y
echo "$MACHINE_NO provisioned!"