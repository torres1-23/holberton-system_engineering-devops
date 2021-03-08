# 0x09. Web infrastructure design

> Simple web infrstructur design whiteboards.
This repository contains handmdade whiteboard designs of three web infrastructures.

## Table of Content

* [Usage](#usage)
* [Designs](#designs)
* [Author](#author)

## Usage

Inside each file there is a link to the image stored in google drive.

## Designs

* **0. Inline styling**\
Simple one server web infrastructure that hosts the website that is reachable via www.foobar.com.
The server has the following:
  * 1 physical server.
  * 1 web server (Nginx).
  * 1 application server.
  * 1 application files (code base).
  * 1 database (MySQL).
  * 1 domain name foobar.com configured with a www record that points to your server IP 8.8.8.8.
    * Files:
      * **[0-simple_web_stack](./0-simple_web_stack)**

* **1. Distributed web infrastructure**\
three server web infrastructure that hosts the website www.foobar.com
The server has the following:
  * 3 physical servers.
  * 1 web server (Nginx), same for each server.
  * 1 application server, same for each server.
  * 1 application files (code base), same for each server.
  * 1 database (MySQL), master in server 0 and slave in other servers.
  * 1 domain name foobar.com configured with a www record that points to your server IP 8.8.8.8.
  * 1 load-balancer (HAproxy), Active/Passive configuration.
    * Files:
      * **[1-distributed_web_infrastructure](./1-distributed_web_infrastructure)**

* **2. Secured and monitored web infrastructure**\
three server web infrastructure that hosts the website www.foobar.com
The server has the following:
  * 3 physical servers.
  * 1 web server (Nginx), same for each server.
  * 1 application server, same for each server.
  * 1 application files (code base), same for each server.
  * 1 database (MySQL), master in server 0 and slave in other servers.
  * 1 domain name foobar.com configured with a www record that points to your server IP 8.8.8.8.
  * 1 load-balancer (HAproxy), Active/Passive configuration.
  * Each server monitored using Sumologic client.
  * Firewall for each server.
  * SSL certification.
    * Files:
      * **[2-secured_and_monitored_web_infrastructure](./2-secured_and_monitored_web_infrastructure)**

## Author

Alejandro Torres - [Github](https://github.com/torres1-23) / [Twitter](https://twitter.com/MA_Torres1)
