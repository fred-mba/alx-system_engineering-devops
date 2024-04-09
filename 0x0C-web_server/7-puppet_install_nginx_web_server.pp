# Puppet file to manage Nginx installation and configurations

# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}

# Enabling firewall on nginx server
exec { 'enable_ufw':
  command => 'sudo ufw enable',
  path    => '/usr/bin:/usr/sbin:/bin',
}

exec { 'allow_nginx_http':
  command => 'sudo ufw allow "Nginx HTTP"',
  path    => '/usr/bin:/usr/sbin:/bin',
}

exec { 'allow_ssh':
  command => 'sudo ufw allow ssh',
  path    => '/usr/bin:/usr/sbin:/bin',
}

# After installation, add a query page that contains 'Hello World!'
file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Hello World!',
}

# Redirection 301 moved permanently
file { '/etc/nginx/sites-enabled/default':
  ensure  => present,
  content => "server {
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
}

# 404 query message
file { '/usr/share/nginx/html/error_404.html':
  ensure  => present,
  content => "Ceci n'est pas une page",
}

# Restart Nginx service
service { 'nginx':
  ensure    => running,
  enable    => true,
  require   => [Package['nginx'], File['/etc/nginx/sites-enabled/default']],
  subscribe => File['/etc/nginx/sites-enabled/default'],
}

# Execute the restart command
exec { 'service nginx restart':
  command     => 'service nginx restart',
  path        => '/usr/bin:/usr/sbin:/bin',
  refreshonly => true,
}
