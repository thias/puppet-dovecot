# == Class dovecot::params
#
# This class is meant to be called from dovecot
# It sets variables according to platform
class dovecot::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'dovecot-core'
    }
    'RedHat', 'Amazon': {
      $package_name = 'dovecot'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
