# Client configuration with Puppet

exec {'Client configuration':
  path    => '/usr/bin',
  command => 'echo -e "Host 100.25.160.40\n	IdentifyFile ~/.ssh/school\n	PasswordAuthentication no" >> /etc/ssh/ssh_config',
}
