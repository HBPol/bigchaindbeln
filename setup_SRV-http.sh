#!/bin/bash
MACHINE_NO="Http server"
tput setaf 5 ; echo "Provisioning $MACHINE_NO..." ; tput sgr0
tput setaf 5 ; echo "Updating $MACHINE_NO..." ; tput sgr0
sudo apt-get update
tput setaf 5 ; echo "Upgrading $MACHINE_NO..." ; tput sgr0
sudo apt-get upgrade -y
tput setaf 5 ; echo "Installing NGINX ..." ; tput sgr0
sudo apt-get install nginx -y
tput setaf 5 ; echo "$MACHINE_NO provisioned!" ; tput sgr0