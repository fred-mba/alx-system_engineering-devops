# Puppet file to manage Nginx installation and configurations

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
file { '/etc/nginx/sites-available/default':
  ensure   => present,
  content  => "
    server {
		listen 80;
		listen [::]:80;
		
		location /redirect_me {
			return 301 'https://www.youtube.com/watch?v=QH2-TGUlwu4';
		}
	}
  ",
    notify => Exec['nginx_restart'],
}

# Ensure the system is enabled and running after configuration
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
  notify  => File['/etc/nginx/sites-enabled/default'],
}
