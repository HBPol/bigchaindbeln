#!/bin/bash
MACHINE_NO="Http server"
echo "##################### --- Provisioning $MACHINE_NO... --- #####################"
echo "Updating $MACHINE_NO..."
sudo apt-get update
echo "Upgrading $MACHINE_NO..."
sudo apt-get upgrade -y

# echo "Installing NGINX ..."
# sudo apt-get install nginx -y

echo "Installing python virtual environment..."
apt-get install python3-venv -y 

echo "$MACHINE_NO provisioned!"
echo "SSH into $MACHINE_NO and follow instructions in 'config.sh' within the virtual machine shared folder."