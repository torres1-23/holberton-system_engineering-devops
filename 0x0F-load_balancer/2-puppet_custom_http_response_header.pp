#!/usr/bin/env bash
#task advance with pupppet
exec { 'nginx install':
  command  => 'sudo apt-get update -y;
	sudo apt-get install nginx -y;
	sudo sed -i "19a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default
	sudo service nginx restart',
  provider => shell,
}
