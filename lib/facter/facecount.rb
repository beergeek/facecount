Facter.add(:node_count) do
  # determine if we are a PE master by looking for the CA files...
  
  if File.exists?(Puppet.settings[:cadir] + File::SEPARATOR + 'ca_crt.pem')
    count = Facter::Core::Execution.exec('/opt/puppetlabs/puppet/bin/puppet node count')
  else
    count = 'Available on Puppet Master/MoM only'
  end
  setcode do
    count
  end
end
