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
pip install --upgrade bigchaindb-driver
# BigchainDB Python Driver needs these dependencies (but should install automatically with the driver):
	# pip install --upgrade setuptools
	# pip install cryptography
	# pip install cryptoconditions
	# sudo apt-get install python3-dev libssl-dev libffi-dev
