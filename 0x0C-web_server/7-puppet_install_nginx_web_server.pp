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

package { 'nginx':
  ensure   => present,
  provider => 'apt'
}

file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Holberton School'
}

file { '/etc/nginx/sites-available/default':
  ensure  => present,
  owner   => 'nginx',
  group   => 'nginx',
  mode    => '0600',
  content => $string
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
  subscribe  => File['/etc/nginx/sites-available/default']
}
