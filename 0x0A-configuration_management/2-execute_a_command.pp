# Manifest that kills a process named killmenow.

exec { 'kill procces':
    command => 'pkill -f killmenow',
    path    => '/usr/bin/:/usr/local/bin/:/bin/'
}
