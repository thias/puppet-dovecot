require 'spec_helper'

describe 'dovecot', :type => :class do
  context 'on a RedHat OS' do
    let :facts do
      {
        :id => 'root',
        :kernel => 'Linux',
        :osfamily => 'RedHat',
        :operatingsystem => 'RedHat',
        :operatingsystemrelease => '5',
        :concat_basedir => '/dne',
        :path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      }
    end

    it { should contain_class('dovecot::params') }

    it { should contain_dovecot }

    it {
      should contain_package('dovecot').with(
        'ensure' => 'installed'
      )
    }
    it {
      should contain_service('dovecot').with(
        'ensure'    => 'running',
        'enable'    => 'true',
        'hasstatus' => 'true',
        'require'   => 'File[/etc/dovecot/dovecot.conf]'
      )
    }

    it { should contain_file('/etc/dovecot/dovecot.conf') }

    [
      '10-auth.conf',
      '10-logging.conf',
      '10-mail.conf',
      '10-master.conf',
      '10-ssl.conf',
      '15-lda.conf',
      '90-sieve.conf',
      'auth-sql.conf.ext',
    ].each do |conffile|
      it { should contain_file("/etc/dovecot/conf.d/#{conffile}") }
    end
  end

  context 'on a Debian OS' do
    let :facts do
      {
        :id => 'root',
        :kernel => 'Linux',
        :lsbdistcodename => 'squeeze',
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :operatingsystemrelease => '6',
        :path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        :concat_basedir => '/dne',
      }
    end

    it { should contain_class('dovecot::params') }

    it { should contain_dovecot }

    it {
      should contain_package('dovecot-core').with(
        'ensure' => 'installed'
      )
    }
    it {
      should contain_service('dovecot').with(
        'ensure'    => 'running',
        'enable'    => 'true',
        'hasstatus' => 'true',
        'require'   => 'File[/etc/dovecot/dovecot.conf]'
      )
    }

    it { should contain_file('/etc/dovecot/dovecot.conf') }

    [
      '10-auth.conf',
      '10-logging.conf',
      '10-mail.conf',
      '10-master.conf',
      '10-ssl.conf',
      '15-lda.conf',
      '90-sieve.conf',
      'auth-sql.conf.ext',
    ].each do |conffile|
      it { should contain_file("/etc/dovecot/conf.d/#{conffile}") }
    end
  end
end
