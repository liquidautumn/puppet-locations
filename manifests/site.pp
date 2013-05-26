#this one is for vagrant master

package { 'ntp':
  ensure => installed,
}

file { '/etc/ntp.conf':
  ensure  => '/etc/ntp.conf',
  owner   => 0,
  group   => 0,
  mode    => '0644',
  content => template('puppet-locations/ntp.conf.erb'),
  require => Package['ntp'],
}
