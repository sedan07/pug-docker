class { 'puppet':
  dns_alt_names => ['puppet'],
}
# Ensure apache is installed for Puppet-master
# and don't enable it on boot as we want to run
# it in the foreground
class { 'apache':
  service_ensure => false,
  service_enable => false,
}
class { 'puppet::master':
  trusted_node_data => true,
  autosign => '/usr/local/bin/puppet_autosign.rb',
}

