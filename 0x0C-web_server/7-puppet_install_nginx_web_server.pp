# Puppet file to manage Nginx installation and configurations

# Install Nginx package
package { 'nginx':
  ensure   => 'installed',
  provider => 'apt', # Package provider
}

# Enabling firewall on nginx server
firewall { '100 allow http':
  port  => 80,
  proto => 'tcp',
  action > 'accept',
}

firewall { '100 allow ssh':
  port   => 22.
  proto  => 'tcp',
  action => enable
}

# After installation, add a query page that contains 'Hello World!'
file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Hello World!',
}

# Redirection 301 moved permanently
file { '/etc/nginx/sites-enabled/default':
  ensure  => present,
  content => "
  server {
    listen 80 default_server;
    listen [::]:80 default_server;

    location /redirect_me {
      return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }

    error_page 404 /error_404.html;
      location = /error_404.html {
          root /usr/share/nginx/html;
          internal;
    }
  }",
  notify  => Service['nginx']
}

# 404 query message
file { '/usr/share/nginx/html/error_404.html':
  ensure  => present,
  content => "Ceci n'est pas une page",
}

# Restart Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}
