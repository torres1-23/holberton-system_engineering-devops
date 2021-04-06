# Manifest to configure an Ubuntu server with nginx.

package { 'nginx':
  ensure   => present,
  provider => 'apt'
}

file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Holberton School'
}

file_line { '/etc/nginx/sites-available/default':
  ensure  => present,
  after  => 'listen 80 default_server;',
  line   => '    return 301 https://www.youtube.com/watch?v=dQw4w9WgXcQ;'
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
  subscribe  => File_line['/etc/nginx/sites-available/default']
}
