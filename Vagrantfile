# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_version ">= 2.0.0"
### configuration parameters
BOX_BASE = "bento/ubuntu-20.04"
BOX_VERSION = "202005.21.0"
BOX_CPU_COUNT = 2
BOX_RAM_MB = "4096"

### master node configuration(s)
BOX_IP = "192.168.2.200"
BOX_HOSTNAME = "box1"

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = BOX_CPU_COUNT
    vb.memory = BOX_RAM_MB
  end

  config.vm.define "#{BOX_HOSTNAME}" do |node|
    node.vm.box = BOX_BASE
    node.vm.box_version = BOX_VERSION
    node.vm.box_check_update = false
    node.vm.hostname = "#{BOX_HOSTNAME}"
    node.vm.network "private_network", ip: BOX_IP

    node.vm.provision "shell", inline: "echo 'cd /vagrant' >> ~/.bashrc && exit", privileged: false
    node.vm.provision "shell" do |s|
      s.path = "setup.sh"
      s.args = "vagrant"
      s.privileged = false
    end
  end
end
