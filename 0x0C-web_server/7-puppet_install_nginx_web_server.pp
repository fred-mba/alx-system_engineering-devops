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
exec {'redirect_me':
  command  => 'sed -i "24i\    rewrite ^/redirect_me https://www.youtube.com/watch?vQH2-TGUlwu4/ permanent;" /etc/nginx/sites-available/default',
  provider => 'shell'
}

# Restart the Nginx after configurations
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
