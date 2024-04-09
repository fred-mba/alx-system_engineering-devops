# Puppet file to manage Nginx installation and configurations
# require => [Package['nginx'], File['/etc/nginx/sites-enabled/default']],

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
exec {'redirect_me':
  command  => 'sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider => 'shell'
}
# Ensure the system is enabled and running after configuration
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
  notify  => File['/etc/nginx/sites-enabled/default'],
}
