# Client configuration with Puppet

file_line {'Client configuration':
  path  => '/etc/ssh/ssh_config',
  line  => 'IdentifyFile ~/.ssh/school',
  match => '^#?(\s*IdentifyFile\s+~/.ssh/school)',
}

file_line {'Configure SSH Client':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
  match => '^#?(\s*PasswordAuthentication\s+yes)',
}
