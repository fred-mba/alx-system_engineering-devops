# Puppet file to manage Nginx installation and configuration

# Update system
exec { 'update system':
        command => '/usr/bin/apt-get update',
}

# Install nginx
package { 'nginx':
  ensure  => 'installed',
  require => Exec['update system']
}

# After installation, add a query page that contains 'Hello World!'
file {'/var/www/html/index.html':
  content => 'Hello World!'
}

# Configure Nginx to return "301 Moved Permanently" 
exec {'redirect_me':
  command  => 'sed -i "24i\	rewrite ^/redirect_me https://th3-gr00t.tk/ permanent;" /etc/nginx/sites-available/default',
  provider => 'shell'
}

# Add a custom HTTP header
exec {'HTTP header':
  command  => 'sed -i "25i\	add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
  provider => 'shell'
}

# Restart Nginx server
service {'nginx':
  ensure  => running,
  require => Package['nginx']
}
