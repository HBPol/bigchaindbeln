#!/bin/bash
MACHINE_NO="MySQL server"
echo "Provisioning $MACHINE_NO..."
echo "Updating $MACHINE_NO..."
sudo apt-get update
echo "Upgrading $MACHINE_NO..."
sudo apt-get upgrade -y
echo "$MACHINE_NO provisioned!"
echo "SSH into $MACHINE_NO and follow instructions in 'config.sh' within the virtual machine shared folder."