#!/bin/bash
apt-get update
apt-get install python3-venv -y

# run this inside the vagrant machine once started
# create venv virtual environment in folder ~/venv
python3 -m venv ~/venv

# activate the virtual environment
source ~/venv/bin/activate

# install django
pip install django
pip install --upgrade pip
# python manage.py runserver 0:8080