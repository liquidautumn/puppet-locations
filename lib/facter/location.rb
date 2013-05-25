require 'ipaddr'

Facter.add("location") do
  setcode do
    hiera('locations').each { |name, net| return name if IPAddr.new(net) === Facter.value('ipaddress') }
    nil
  end
end
