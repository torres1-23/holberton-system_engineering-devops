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

file { 'Configuration file conf':
  ensure  => present
  owner   => 'ubutnu',
  group   => 'ubuntu',
  mode    => '0744',
  path    => '/etc/nginx/sites-available/default',
  content => $string
}
