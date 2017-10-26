# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "buildbox" do |buildbox|

    buildbox.vm.provider "virtualbox" do |v|
      v.memory = 4028
      v.cpus = 4
    end

    buildbox.vm.box = "ubuntu/trusty64"

    buildbox.vm.provision "shell", inline: <<-SHELL
      /vagrant/scripts/configure
    SHELL
  end
end