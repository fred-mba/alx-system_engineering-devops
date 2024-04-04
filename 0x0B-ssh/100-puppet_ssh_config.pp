# Client configuration with Puppet

ssh::client::config { 'IdentityFile':
  path  => '/etc/ssh/ssh_config',
  value => '~/.ssh/school',
}

ssh::client::config { 'PasswordAuthentication':
  path  => '/etc/ssh/ssh_config',
  value => 'no',
}
