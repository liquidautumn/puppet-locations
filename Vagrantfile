Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu1304"

  config.vm.provider :lxc do |p|
    p.customize 'cgroup.memory.limit_in_bytes', '256M'
  end

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
  end

  config.vm.provision :shell, :path => "files/puppet-reset.sh", :args => 'puppet-master'

  config.vm.define :nw1_ntp_master do |h|
    h.vm.hostname = "master.nw1"
    h.vm.provider :lxc do |p|
      p.customize 'network.ipv4', '10.0.3.170'
    end
  end

  config.vm.define :nw1_ntp_slave do |h|
    h.vm.hostname = "slave.nw1"
    h.vm.provider :lxc do |p|
      p.customize 'network.ipv4', '10.0.3.171'
    end
  end

  config.vm.define :nw1_ntp_slave2 do |h|
    h.vm.hostname = "slave2.nw1"
    h.vm.provider :lxc do |p|
      p.customize 'network.ipv4', '10.0.3.172'
    end
  end
end
