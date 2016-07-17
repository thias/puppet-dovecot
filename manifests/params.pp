class dovecot::params {
  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        /^(RedHat|CentOS|Scientific|OracleLinux)$/: {
          if versioncmp($::operatingsystemmajrelease, '7') >= 0 {
            $dir_10_mail = 'redhat-7/'
          } else {
            $dir_10_mail = ''
          }
        }
      }
    }
  }
}
