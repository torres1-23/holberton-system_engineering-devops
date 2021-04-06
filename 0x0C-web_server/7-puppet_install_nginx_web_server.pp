# Manifest to configure an Ubuntu server with nginx.

$string = "# Configuration file for nginx server.\
\
server {\
    listen 80 default_server;\
    listen [::]:80 default_server;\
    root /var/www/html;\
    index index.html index.htm;\
    server_name _;\
    location /redirect_me {\
        return 301 https://www.youtube.com/watch?v=dQw4w9WgXcQ;\
    }\
}"

package { 'Install nginx':
  ensure   => present,
  name     => 'nginx',
  provider => 'apt'
}

file { 'Create index.html':
  ensure  => present,
  path    => '/var/www/html/index.html',
  content => 'Holberton School'
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx']
}

file { 'Create config file':
  ensure  => present,
  path    => '/etc/nginx/sites-available/default',
  content => $string
}

service { 'nginx':
  ensure  => stopped,
  enable  => true,
  require => Package['nginx']
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
}
