#!/bin/bash

tput setaf 5 ; echo "BCELN: the blockchain-based electronic laboratory notebook..." ; tput sgr0
tput setaf 5 ; echo "Launching virtual machines... " ; tput sgr0
# This script automates ssh access to all BC nodes and Http/MySQL servers.
# It should run in the same directory where the Vagrantfile is located.

# Machines names (these must be as named in the Vagrantfile):
#	"SRV-http"
#	"SRV-mysql"
#	"BC01"
#	"BC02"
#	"BC03"
#	"BC04"

# Launch all machines as defined in the Vagrantfile
vagrant up --provision
# Uncomment lines below to Launch a new SSH terminal for each machine
# DIMENSIONS="-p TerminalColumns=90 -p TerminalRows=20"
# konsole $DIMENSIONS --noclose -e "sh -c 'vagrant ssh  SRV-http; $SHELL'" & disown
# konsole $DIMENSIONS --noclose -e "sh -c 'vagrant ssh  SRV-mysql; $SHELL'" & disown
# konsole $DIMENSIONS --noclose -e "sh -c 'vagrant ssh  BC01; $SHELL'" & disown
# konsole $DIMENSIONS --noclose -e "sh -c 'vagrant ssh  BC02; $SHELL'" & disown
# konsole $DIMENSIONS --noclose -e "sh -c 'vagrant ssh  BC03; $SHELL'" & disown
# konsole $DIMENSIONS --noclose -e "sh -c 'vagrant ssh  BC04; $SHELL'" & disown