# Manifest to configure an Ubuntu server with nginx.

string = '# Configuration file for nginx server.

server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    index index.html index.htm;
    server_name _;
    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=dQw4w9WgXcQ;
    }
}'

package { 'Install nginx':
  name     => 'nginx'
}

file { 'Create index.html':
  ensure  => present,
  path    => /var/www/html/index.html,
  content => 'Holberton School'
}

file { 'Create custom config file':
  ensure  => present,
  path    => /etc/nginx/sites-available/default,
  content => $string
}

exec { 'Restart nginx server':
    command => 'service nginx restart',
    path    => '/usr/bin/:/usr/local/bin/:/bin/'
}
