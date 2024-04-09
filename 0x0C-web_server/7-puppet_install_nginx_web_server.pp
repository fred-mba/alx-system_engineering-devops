# Puppet file to manage Nginx installation and configurations

# Update system
exec { 'update_system':
  command => '/usr/bin/apt-get update',
}

# Install Nginx
package { 'nginx':
  ensure  => 'installed',
  require => Exec['update_system'],
}

# After installation, add a query page that contains 'Hello World!'
file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Hello World!',
}

# Configure Nginx to return "301 Moved Permanently"
file_line { '/etc/nginx/sites-available/default':
  ensure => present,
  after  => 'listen 80 default_server;',
  line   => '\tlocation /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?vQH2-TGUlwu4;\n\t}',
}

# Restart the Nginx after configarations
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
