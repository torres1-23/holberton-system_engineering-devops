# Set up client SSH configuration file so that you can connect to a server without typing a password.

file_line { 'Add required config ops':
  path => '/etc/ssh/ssh_config',
  line => '    IdentityFile ~/.ssh/holberton
    PasswordAuthentication no '
}
