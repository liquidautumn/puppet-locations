Facter.add("location") do
  #TODO fetch location name from Hiera based on network address

  #setcode do
  #  Facter::Util::Resolution.exec('/bin/uname -i')
  #end
end
