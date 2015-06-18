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
  autosign          => '/usr/local/bin/puppet_autosign.rb',
  environmentpath   => '/etc/puppet/environments'
}
class { 'puppet::hiera':
  hiera_data_dir   => '/etc/puppet/environments2',
  hiera_hierarchy => [
    '%{::environment}/hiera/role_%{::role}/tier_%{::tier}',
    '%{::environment}/hiera/role_%{::role}',
    '%{::environment}/hiera/osfamily/%{::os_family}',
    '%{::environment}/hiera/virtual/%{::virtual}',
    '%{::environment}/hiera/common'
  ],
}

