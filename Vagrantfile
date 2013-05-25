Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu1304"
  config.vm.network :private_network, ip: "10.0.3.1"
  config.vm.network :private_network, ip: "10.0.4.1"

  config.vm.provider :lxc do |p|
    p.customize 'cgroup.memory.limit_in_bytes', '256M'
  end

  config.vm.define :nw1_ntp_master do |h|
    h.vm.hostname = "ntp-master.nw1"
    h.vm.provider :lxc do |p|
      p.customize 'network.ipv4', '10.0.3.170'
    end
    h.vm.provision :shell, :path => "bash/puppet-reset.sh", :args => 'puppet-master'
  end

  config.vm.define :nw1_ntp_slave do |h|
    h.vm.hostname = "ntp-slave.nw1"
    h.vm.provider :lxc do |p|
      p.customize 'network.ipv4', '10.0.3.171'
    end
    h.vm.provision :shell, :path => "bash/puppet-reset.sh", :args => 'puppet-master'
  end

  config.vm.define :nw2_ntp_master do |h|
    h.vm.hostname = "ntp-master.nw2"
    h.vm.provider :lxc do |p|
      p.customize 'network.ipv4', '10.0.4.170'
    end
  end

  config.vm.define :nw2_ntp_slave do |h|
    h.vm.hostname = "ntp-slave.nw2"
    h.vm.provider :lxc do |p|
      p.customize 'network.ipv4', '10.0.4.170'
    end
  end
end
