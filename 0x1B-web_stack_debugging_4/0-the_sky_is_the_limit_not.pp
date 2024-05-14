# Fix high concurrent requests in nginx

exec {'replace':
  provider => shell,
  command  => 'sed -i "s/15/4096/" /etc/default/nginx',
  before   => Exec['restart'],
}

exec {'restart':
  provider => shell,
  command  => 'service nginx restart',
}
