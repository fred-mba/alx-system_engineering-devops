# Client configuration with Puppet

ssh::client::config { 'PasswordAuthentication':
  path  => '/etc/ssh/ssh_config',
  value => 'no',
}
