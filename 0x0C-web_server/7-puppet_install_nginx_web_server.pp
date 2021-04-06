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
  provider => 'apt',
}

file { '/var/www/html/index.html':
  content => 'Holberton School',
}

file { '/etc/nginx/sites-available/default':
  content => $string,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
  subscribe  => File['/etc/nginx/sites-available/default'],
}
