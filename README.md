# Puppet custom facts and configuration example for Location/Client/Environment based configuration.

Configuration done using Hiera with config/hiera.d files. Currently it support assigning location name by network in YAML file only. Hiera support multiple backends, so this might be good point for integration with some DB backend to obtain owners.
Configuration cascade in order: common.yaml, location-name.yaml, owner-name.yaml, environment.yaml and node-name yaml.
Back to the main use case: with such scheme we can set local master NTP server per location (or client) and reset with external one for master NTP server itself.
It seems overall flexible and should fit second resolv.conf case smoothly as well.

## Test

Start up testing VM's with Vagrant

```sh
vagrant up
```

It will execute puppet-reset.sh on started instances, configuring master server name.

## TODO:

+ Custom fact to map location names to network address.
+ Depend on puppetlabs/ntp module
- Owner support
