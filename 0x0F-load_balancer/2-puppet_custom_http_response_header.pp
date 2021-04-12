# Manifest to configure an Ubuntu server with nginx

package { 'nginx':
  ensure   => present,
  provider => 'apt'
}

file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Holberton School'
}

file_line { 'Redirection':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => '\trewrite ^/redirect_me https://www.youtube.com/watch?v=dQw4w9WgXcQ permanent;'
}

file_line { 'Custom Header Variable':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  after  => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=dQw4w9WgXcQ permanent;'
  line   => '\tadd_header X-Served-By $HOSTNAME;'
}

file_line { 'Error page':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  after  => 'add_header X-Served-By $HOSTNAME;'
  line   => '\terror_page 404 /404.html;'
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
  subscribe  => File_line['Redirection']
}
