#!/bin/bash

#Expect puppet master name as first parameter, agent name obtained from host name.

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' puppet|grep "install ok installed")

echo Checking for puppet: $PKG_OK

if [ "" == "$PKG_OK" ]; then
  echo "No puppet installed, no removal required."
else
  sudo apt-get --force-yes --yes --purge remove puppet
  sudo rm /etc/puppet/puppet.conf
fi

sudo apt-get --force-yes --yes install puppet

sudo chmod a+w /etc/puppet/puppet.conf

sudo cat >> /etc/puppet/puppet.conf << EOF
[agent]
    certname = `hostname --fqdn`
    server = ${1-puppet}
EOF

sudo chmod a-w /etc/puppet/puppet.conf
