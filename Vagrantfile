# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # If your host is in a proxy environment, run
  # 'vagrant plugin install vagrant-proxyconf'
  # and uncomment the below directives.
  # config.proxy.http     = "proxy.server:port"
  # config.proxy.https    = "proxy.server:port"
  # config.proxy.no_proxy = "localhost, 127.0.0.1"

  # Vagrant development environment box.
  config.vm.box = "ubuntu/vivid64"

  # Enable/Disable automatic box update checking.
  # config.vm.box_check_update = false

  # Path to the private key used for SSH Authentication.
  # If the value is 'nil', then the default insecure 
  # private key that ships with Vagrant will be used.
  config.ssh.private_key_path = nil
  
  # Create a forwarded port mapping.
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network.
  # Allows host-only access to the machine using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM.
  config.vm.synced_folder ".", "/vagrant_data"

  # Provider-specific configuration.
  config.vm.provider "virtualbox" do |vb|
    # Amount of memory on the VM.
    vb.memory = "1024"
  end

  # Install required software, dependencies and configurations on the VM.
  config.vm.provision "shell", path: "vagrant_provision.sh"
  
end
