# Client configuration with Puppet

include stdlib

file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^#?(\s*IdentityFile\s+~/.ssh/school)',
  after => '# This is the ssh client system-wide configuration file.  See',
}

file_line { 'Turn off password authentication':
  path  => '/etc/ssh/ssh_config',
  line  => '    PasswordAuthentication no',
  match => '^#?(\s*PasswordAuthentication\s+yes)',
  after => '# This is the ssh client system-wide configuration file.  See',
}
