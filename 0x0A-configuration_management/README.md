# 0x0A Configuration management

> Simple tests of files as introduction to configuration mangement.
This repository contains puppet files that introduces a little about configuration management.

## Table of Content

* [Usage](#usage)
* [Tests](#tests)
* [Tasks](#tasks)
* [Author](#author)

## Usage

Run the file, puppet must be installed.

## Tests

Collection of files that are used to tests the right working of task files. Directory: **[tests](./tests)**

## Tasks

* **0. Create a file**\
Using Puppet, create a file in /tmp.
  * Files:
    * **[0-create_a_file.pp](./0-create_a_file.pp)**

* **1. Install a package**\
Using Puppet, install puppet-lint.
  * Files:
    * **[1-install_a_package.pp](./1-install_a_package.pp)**

* **2. Execute a command**\
Using Puppet, create a manifest that kills a process named killmenow.
  * Files:
    * **[2-execute_a_command.pp](./2-execute_a_command.pp)**

## Author

Alejandro Torres - [Github](https://github.com/torres1-23) / [Twitter](https://twitter.com/MA_Torres1)
