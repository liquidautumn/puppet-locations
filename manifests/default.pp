#this manifest is for Vagrant. Adding master name to hosts config and update puppet to latest version

file_line { 'hosts_puppet_master_nw1':
  path => '/etc/hosts',
  line => '10.0.3.1 puppet-master',
}

package { "puppetlabs-release-unstable":
  provider => dpkg,
  ensure   => latest,
  source   => "/vagrant/files/puppetlabs-release-unstable.deb",
}

exec { "apt-update":
  command => "/usr/bin/apt-get update",
  require => Package['puppetlabs-release-unstable'],
}

package { "puppet":
  ensure   => latest,
  require  => Exec['apt-update'],
}
