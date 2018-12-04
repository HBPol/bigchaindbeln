#!/bin/bash
MACHINE_NO="BigchainDB Node 1"
echo "Provisioning $MACHINE_NO ..."
sudo apt-get update
echo "Installing NGINX ..."
sudo apt-get install -y nginx
echo "Installing python3 and required packages ..."
sudo apt-get install -y python3-pip libssl-dev
echo "Installing BigchainBD ..."
sudo pip3 install bigchaindb==2.0.0b9
#echo "BigchainBD configuration ..."
#sudo bigchaindb configure
echo "$MACHINE_NO partially provisioned!"
echo "Need to configure BigchainDB, NGINX SSL certificate, install MongoDB and Tendermint."