# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    config.vm.network "forwarded_port", guest:5000, host:5000
  # config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.provision "puppet" do |puppet|
        puppet.module_path = "modules"
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "base.pp"
        puppet.options = "--hiera_config /vagrant/files/hiera.yaml"
    end
end
