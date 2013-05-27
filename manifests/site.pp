#this one is for vagrant master

package { 'ntp':
  ensure => installed,
}

file { '/etc/ntp.conf':
  ensure  => file,
  owner   => 0,
  group   => 0,
  mode    => '0644',
  content => template("${module_name}/ntp.erb"),
  require => Package['ntp'],
}
