# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "vagrant_bootstrap.sh"
  config.vm.provision "shell", inline: <<-SHELL
      echo "sudo su -" >> .bashrc
  SHELL

  # Master Server
  config.vm.define "master" do |master|
    master.vm.box = "hashicorp/bionic64"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "172.42.42.100"
    master.vm.provider "virtualbox" do |v|
      v.name = "master"
      v.memory = 1024
      v.cpus = 1
    end
  end

  NodeCount = 3

  # Postgres Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "pgnode0#{i}" do |workernode|
      workernode.vm.box = "hashicorp/bionic64"
      workernode.vm.hostname = "pgnode0#{i}"
      workernode.vm.network "private_network", ip: "172.42.42.10#{i}"
      workernode.vm.provider "virtualbox" do |v|
        v.name = "pgnode0#{i}"
        v.memory = 1024
        v.cpus = 1 
      end
    end
  end

end