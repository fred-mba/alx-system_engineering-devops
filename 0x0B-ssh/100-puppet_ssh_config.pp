# Client configuration with Puppet

exec {'Client configuration':
  path  => '/etc/ssh/ssh_config',
  line  => 'IdentifyFile ~/.ssh/school',
  match => '^#?(\s*IdentifyFile\s+~/.ssh/school)',
}

exec {'Configure SSH Client':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
  match => '^#?(\s*PasswordAuthentication\s+yes)',
}
