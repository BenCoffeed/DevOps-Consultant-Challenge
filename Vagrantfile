# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu14-cloudimage"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Your implementation goes here

  #Modify VM configuration
  config.vm.define :lempServ do |lempServ|
    #Define hostname of instance
    lempServ.vm.hostname = "lempServ.local"

    #Set the instance IP address
    lempServ.vm.network :private_network, ip: "172.17.2.18"
    lempServ.vm.network "forwarded_port", guest: 80, host:80
    lempServ.vm.provider "virtualbox" do |v|
      #Configure guest to use host's DNS resolvers.
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

      #Set vm name, memory, and # of cpu's
      v.name = "lempServ"
      v.memory = 512
      v.cpus = 2
    end
  end

#Ansible provisioning
  config.ssh.insert_key = false
  config.vm.provision :ansible do |ansible|
    ansible.verbose = "vvvv"
    ansible.playbook = "lempServ.yml"
    ansible.inventory_path = "hosts"
    ansible.sudo = true
  end
end



