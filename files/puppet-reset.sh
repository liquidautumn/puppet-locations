#!/bin/bash

#Expect puppet master name as first parameter, agent name obtained from host name.

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' puppet|grep "install ok installed")
if [ "" != "$PKG_OK" ]; then
  sudo apt-get --force-yes --yes --purge remove puppet
fi

sudo apt-get --force-yes --yes install puppet

#for some reason config file never purged, so just backing it up and recreate
#Augeas should do the job better than shell script

sudo mv -bf /etc/puppet/puppet.conf /etc/puppet/puppet.conf.bak

sudo cat >> /etc/puppet/puppet.conf << EOF
[main]
    logdir=/var/log/puppet
    vardir=/var/lib/puppet
    ssldir=/var/lib/puppet/ssl
    rundir=/var/run/puppet
    factpath=$vardir/lib/facter
    templatedir=$confdir/templates

[agent]
    certname = `hostname --fqdn`
    server = ${1-puppet}
EOF
