class dovecot::params {
    case $::osfamily {
        'RedHat': {
            $core_packages = 'dovecot'
            $plugins_before = 'dovecot'
        }
        'Debian': {
            $core_packages = ['dovecot-core', 'dovecot-imapd', 'dovecot-pop3d']
            $plugins_before = 'dovecot-core'
        }
        default: {
            $core_packages = 'dovecot'
            $plugins_before = 'dovecot'
        }
    }
}
