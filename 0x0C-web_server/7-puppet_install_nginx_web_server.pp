# Using puppet to manage my nginx configurations

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure the Nginx Server
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "
    server {
	    listen 80;
		listen [::]:80;
		
		server_name 54.237.9.122;

		root /var/www/html;
		index index.html index.htm index.nginx-debian.html;

		location / {
			return 200 'Hello World!';
		}

		location /redirect_me {
			return 301 'https://www.youtube.com/watch?v=QH2-TGUlwu4';
		}
	}
  ",
    notify => Exec['nginx_restart'],
}

file { '/etc/nginx/sites-enabled/default':
  ensure  => link,
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

exec { 'nginx_restart':
  command     => 'service nginx restart',
  path        => '/usr/sbin:/usr/bin:/sbin:/bin',
  refreshonly => true,
}
