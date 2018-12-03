# -*- mode: ruby -*-
# vi: set ft=ruby :

# ---- Configuration variables ----
GUI               = false # Enable/Disable GUI
RAM               = 256   # Default memory size in MB
# Network configuration
DOMAIN            = ".lab.bceln.com"
NETWORK           = "192.168.10."
NETMASK           = "255.255.255.0"
# Default Virtualbox .box
BOX               = 'ubuntu/bionic64'
# Default shared folder in guest machine
SHARED            = "/home/vagrant/"
# Default configuration file post machine booting. This may need to chage for specific machines
CONF_FILE         = "setup.sh"
# Host list. Web server, MySQL plus 4 BigchainDB nodes
HOSTS = {
   "SRV-http" => [NETWORK+"10", RAM, GUI, BOX, SHARED, CONF_FILE],
   "SRV-mysql" => [NETWORK+"20", RAM, GUI, BOX, SHARED, CONF_FILE],
   "BC-01" => [NETWORK+"41", RAM, GUI, BOX, SHARED, CONF_FILE],
   "BC-02" => [NETWORK+"42", RAM, GUI, BOX, SHARED, CONF_FILE],
   "BC-03" => [NETWORK+"43", RAM, GUI, BOX, SHARED, CONF_FILE],
   "BC-04" => [NETWORK+"44", RAM, GUI, BOX, SHARED, CONF_FILE],
}

Vagrant.configure("2") do |config|
  HOSTS.each do | (name, cfg) |
    ipaddr, ram, gui, box, shared, conf_file = cfg
      
    config.vm.define name do |machine|
      machine.vm.box   = box
      # disable the default /vagrant share
      machine.vm.synced_folder ".", "/vagrant", disabled: true
      
      # Share an additional folder to the guest VM.
      # config.vm.synced_folder "../path-on-host", "/absolute-path-on-guest"
      machine.vm.synced_folder "./"+name, shared, create: true
      
      machine.vm.provider "virtualbox" do |vbox|
        vbox.gui    = gui
        vbox.memory = ram
        vbox.name = name
      end
      
      machine.vm.hostname = name + DOMAIN
      machine.vm.network 'private_network', ip: ipaddr, netmask: NETMASK
      machine.vm.provision "shell", path: conf_file
    end
  end # HOSTS-each
end # Vagrant.configure
