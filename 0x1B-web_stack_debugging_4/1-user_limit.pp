# Fix `Too many open files` when specific user opens a file

exec {'hard_nofile':
  provider => shell,
  command  => 'sudo sed -i "/holberton hard/s/5/50000/" /etc/security/limits.conf',
  before   => Exec['soft_nofile'],
}

exec {'soft_nofile':
  provider => shell,
  command  => 'sudo sed -i "/holberton soft/s/4/50000/" /etc/security/limits.conf',
}
