# Set up client SSH configuration file so that you can connect to a server without typing a password.

file_line { 'Add required congig ops':
  path => '/etc/ssh/ssh_config',
  line => '    PasswordAuthentication no
    IdentityFile ~/.ssh/holberton'
}
