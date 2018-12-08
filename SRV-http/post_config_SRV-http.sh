#!/bin/bash
# run this inside the vagrant machine once started
# create venv virtual environment in folder ~/venv
python3 -m venv ~/venv
# activate the virtual environment
source ~/venv/bin/activate
# install django
pip install django
pip install --upgrade pip
pip install django mysqlclient

# install BigchainDB Python Driver
	# ... may need these dependencies:
	# pip install --upgrade setuptools
	# pip install cryptography
	# pip install cryptoconditions
	# sudo apt-get install python3-dev libssl-dev libffi-dev
pip install -U bigchaindb-driver