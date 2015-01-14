# Define: dovecot::file
#
# Manage dovecot configuration files under /etc/dovecot/.
#
# Example Usage:
#     dovecot::file { 'dovecot-sql.conf.ext':
#       source => 'puppet:///modules/mymodule/dovecot-sql.conf.ext',
#     }
#
define dovecot::file (
  $owner   = 'root',
  $group   = 'root',
  $mode    = '0644',
  $content = undef,
  $source  = undef
) {
  
  include ::dovecot::params

  file { "/etc/dovecot/${title}":
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => $content,
    source  => $source,
    require => Package[$::dovecot::params::plugins_before],
    notify  => Service['dovecot'],
  }
}

