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
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "
  server {
    listen 80 default_server;
    server_name _;

    location /redirect_me {
      return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }

  }
  ",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Restart the Nginx after configurations
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
