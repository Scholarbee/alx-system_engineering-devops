#!/usr/bin/pup
# Install an especific version of flask (2.1.0)
'''package {'flask':
  ensure   => '2.1.0',
  provider => 'pip3'
}'''

class flask_installation {

  # Package resource to install pip3
  package { 'python3-pip':
    ensure => installed,
  }

  # Exec resource to install Flask version 2.1.0 using pip3
  exec { 'install_flask':
    command => '/usr/bin/pip3 install flask==2.1.0',
    path    => ['/usr/bin', '/usr/local/bin'],
    unless  => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
  }
}
