# -*- mode: ruby -*-
# vi: set ft=ruby :
# run this to remove machines and rebuild:
  # vagrant status
  # vagrant destroy <machine name, e.g. SRV-http>
  # vagrant box remove <box name, e.g. ubuntu/bionic64>

# ---- Configuration variables ----
GUI               = false # Enable/Disable GUI
RAM               = 256   # Default memory size in MB
# Network configuration
DOMAIN            = ".lab.bceln.test"
NETWORK           = "192.168.10."
NETMASK           = "255.255.255.0"
# Default Virtualbox .box
BOX               = 'ubuntu/bionic64'
# Default shared folder in guest machine
SHARED            = "/home/vagrant/shared"
# Host list. Web server, MySQL plus 4 BigchainDB nodes
HOSTS = {
   "SRV-http" => [NETWORK+"10", RAM, GUI, "djangoproject/django-box-2.1", SHARED, "setup_SRV-http.sh"],
   "SRV-mysql" => [NETWORK+"20", RAM, GUI, "debian/contrib-stretch64", SHARED, "setup_SRV-mysql.sh"],
   "BC01" => [NETWORK+"41", RAM, GUI, BOX, SHARED, "setup_BC01.sh"],
   "BC02" => [NETWORK+"42", RAM, GUI, BOX, SHARED, "setup_BC01.sh"],
   "BC03" => [NETWORK+"43", RAM, GUI, BOX, SHARED, "setup_BC01.sh"],
   "BC04" => [NETWORK+"44", RAM, GUI, BOX, SHARED, "setup_BC01.sh"],
}

Vagrant.configure("2") do |config|
  HOSTS.each do | (name, cfg) |
    ipaddr, ram, gui, box, shared, conf_file = cfg
    
    config.vm.define name do |machine|
      machine.vm.box   = box
      machine.vm.guest = :debian
      # disable the default /vagrant share
      machine.vm.synced_folder ".", "/vagrant", disabled: true
      
      # Share an additional folder to the guest VM.
      # config.vm.synced_folder "../path-on-host", "/absolute-path-on-guest"
      machine.vm.synced_folder "./"+name, shared+"-"+name, create: true
      
      # Also share a common folder for all machines.
      machine.vm.synced_folder "./shared-all", "/home/vagrant/shared-all", create: true
      
      machine.vm.provider "virtualbox" do |vbox|
        vbox.gui    = gui
        vbox.memory = ram
        vbox.name = name
      end
      
      machine.vm.hostname = name + DOMAIN
      machine.vm.network 'private_network', ip: ipaddr, netmask: NETMASK
      machine.vm.provision "shell", keep_color: false, path: conf_file
    end
  end # HOSTS-each
end # Vagrant.configure
