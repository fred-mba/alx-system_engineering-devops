#  kills a process named killmenow
exec { 'Kill the current process':
  command => 'pkill -x killmenow',
  path    => ['/usr/bin', '/usr/sbin'],
}
