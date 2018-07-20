Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  config.vm.define "chef" do |chef|
#          chef.vm.box = "ubuntu/trusty64"
          chef.vm.box = "bento/ubuntu-14.04"
          chef.vm.hostname = "chef"
          chef.vm.network "forwarded_port", guest: 80, host: 80
          chef.vm.network "forwarded_port", guest: 8080, host: 8080
          chef.vm.provision "shell",
            path: "chef.provision.sh"
  end
end
