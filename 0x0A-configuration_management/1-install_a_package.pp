# Installs puppet-lint.

package { 'puppet-lint':
  name     => 'puppet-lint',
  provider => gem,
  ensure   => '2.1.1'
}
