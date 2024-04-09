# Puppet file to manage Nginx installation and configurations
# require => [Package['nginx'], File['/etc/nginx/sites-enabled/default']],
# notify  => File['/etc/nginx/sites-enabled/default'],
# Install Nginx package

package {'nginx':
  ensure => 'installed',
}

# After installation, add a query page that contains 'Hello World!'
file {'/var/www/html/index.html':
  ensure  => present,
  content => 'Hello World!',
}

# Redirection 301 moved permanently
file {'/etc/nginx/sites-enabled/default':
  content => "
	server {
		listen 80 default_server;
		listen [::]:80 default_server;

		location /redirect_me {
			return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    		}
  	}
  ",
  notify  => Exec['nginx_restart'],
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Restart Nginx service
exec { 'nginx_restart':
  command     => 'service nginx restart',
  path        => '/usr/sbin:/usr/bin:/sbin:/bin',
  refreshonly => true,
}
