require 'spec_helper'

describe 'dovecot::file', :type => :define do
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

    let :title do
      'dovecot-sql.conf.ext'
    end

    it { should contain_dovecot__file('dovecot-sql.conf.ext') }

    it { should contain_class('dovecot::params') }

    it {
      should contain_file('/etc/dovecot/dovecot-sql.conf.ext').with(
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'content' => nil,
        'source' => nil,
        'require' => 'Package[dovecot]',
        'notify'  => 'Service[dovecot]'
      )
    }
  end
end
