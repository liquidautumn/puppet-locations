Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu1304"
  config.vm.provider :lxc do |p|
    p.customize 'cgroup.memory.limit_in_bytes', '256M'
  end

  config.vm.define :nw1_ntp_master do |h|
    h.vm.provider :lxc do |p|
      p.customize 'utsname', 'nw1_ntp_master'
      p.customize 'network.ipv4', '10.0.3.170'
    end
  end

  config.vm.define :nw1_ntp_slave do |h|
    h.vm.provider :lxc do |p|
      p.customize 'utsname', 'nw1_ntp_slave'
      p.customize 'network.ipv4', '10.0.3.171'
    end
  end

  #config.vm.define :nw2_ntp_master do |h|
  #  h.vm.provider :lxc do |p|
  #    p.customize 'network.ipv4', '192.168.1.100/24'
  #  end
  #end
  #
  #config.vm.define :nw2_ntp_slave do |web|
  #  web.vm.provider :lxc do |p|
  #    p.customize 'network.ipv4', '192.168.1.101/24'
  #  end
  #end
end
