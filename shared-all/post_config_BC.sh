#!/bin/bash
# install BigchainDB server
sudo apt install -y python3-pip libssl-dev
sudo pip3 install bigchaindb==2.0.0b9

# configure BigchainDB
bigchaindb configure
# not using nginx, so API server bind set to 0.0.0.0:9984

# install MongoDB
sudo apt install mongodb

# instal tendermint
sudo apt install -y unzip
wget https://github.com/tendermint/tendermint/releases/download/v0.22.8/tendermint_0.22.8_linux_amd64.zip
unzip tendermint_0.22.8_linux_amd64.zip
rm tendermint_0.22.8_linux_amd64.zip
sudo mv tendermint /usr/local/bin

# start configuring tendermint
tendermint init
# to get the tendermint node id run:
tendermint show_node_id
# monit daemon to run Bigchaindb and tendermint processes and restart them in case they crash
sudo apt install monit
bigchaindb-monit-config
monit -d 1 # runs daemon and check on processes every second

# Configure MongoDB to allow remote access (i.e. from the web sever to be able to query the blockchain)
	# MongoDB configuration file is located in /etc/mongodb.conf
	# Edit the bind_ip parameter adding an an extra IP. This must be the IP of the server where mongo is running (not the IP of the web server).
	# If bind_ip is commented out the server will listen in all interfaces (not recommended).
	# bind_ip = 127.0.0.1,192.168.xxx.xxx

#Creation of self-signed ssl certificate with openssl (this is not necessary as I dont need to use the http API interface because want to):
	# sudo openssl req -x509 -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/lab.bceln.test.key -out /etc/ssl/certs/lab.bceln.test.pem
	# Creating Diffie-Hellman group
	# sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
	# Copy the new key and pem file into the ngix directory as shown below
	# sudo cp /etc/ssl/private/lab.bceln.test.key /etc/nginx/ssl/cert.key
	# sudo cp /etc/ssl/certs/lab.bceln.test.pem /etc/nginx/ssl/cert.pe
	# In the bigchaindb/bigchaindb repository on GitHub, get the file nginx/nginx.conf and copy its contents to /etc/nginx/nginx.conf
	# Edit nginx.conf file replacing 'example.testnet2.com' with this system's domain name, i.e. 'lab.bceln.test'
# 
