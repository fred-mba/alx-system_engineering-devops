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
  content => 'Hello World!',
}

# Configure Nginx to return "301 Moved Permanently"
file { '/etc/nginx/sites-available/default':
  content => "
  server {
    listen 80;
    listen [::]:80;

    location /redirect_me {
      return 301 'https://www.youtube.com/watch?v=QH2-TGUlwu4';
    }
  }
  ",
}

# Link to the default NGINX site configuration file to ensure default site is enabled.
file { '/etc/nginx/sites-enabled/default':
  ensure  => link,
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
}

# Restart the Nginx after configarations
service { 'nginx':
  ensure    => running,
  enable    => true,
  require   => Package['nginx'],
  subscribe => [File['/etc/nginx/sites-available/default'], File['/etc/nginx/sites-enabled/default']],
}
