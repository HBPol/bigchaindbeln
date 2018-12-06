#!/bin/bash
MACHINE_NO="BigchainDB Node 1"
tput setaf 5 ; echo "Provisioning $MACHINE_NO..." ; tput sgr0
tput setaf 5 ; echo "Updating $MACHINE_NO..." ; tput sgr0
sudo apt-get update
tput setaf 5 ; echo "Upgrading $MACHINE_NO..." ; tput sgr0
sudo apt-get upgrade -y
tput setaf 5 ; echo "Installing more stuff..." ; tput sgr0

tput setaf 5 ; echo "$MACHINE_NO provisioned!" ; tput sgr0

#echo "Installing NGINX ..."
#sudo apt-get install nginx -y
#echo "Installing python3 and required packages ..."
#sudo apt-get install python3-pip libssl-dev -y
#echo "Installing BigchainBD ..."
#sudo pip3 install bigchaindb==2.0.0b9
#echo "BigchainBD configuration ..."
#sudo bigchaindb configure
#echo "$MACHINE_NO partially provisioned!"
#echo "Need to configure BigchainDB, NGINX SSL certificates, install MongoDB and Tendermint."
#Creating self-signed ssl certificate
#sudo openssl req -x509 -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/lab.bceln.test.key -out /etc/ssl/certs/lab.bceln.test.pem
#Creating Diffie-Hellman group
#sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
#Copy the new key and pem file into the ngix directory as shown below
#sudo cp /etc/ssl/private/lab.bceln.test.key /etc/nginx/ssl/cert.key
#sudo cp /etc/ssl/certs/lab.bceln.test.pem /etc/nginx/ssl/cert.pe
#In the bigchaindb/bigchaindb repository on GitHub, get the file nginx/nginx.conf and copy its contents to /etc/nginx/nginx.conf
#edit nginx.conf file replacing 'example.testnet2.com' with this system's domain name, i.e. 'lab.bceln.test'
#
#
#
#
