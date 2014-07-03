require 'spec_helper'

describe 'dovecot::file', :type => :define do
  let :title do
    'dovecot-sql.conf.ext'
  end

  it { should contain_dovecot__file('dovecot-sql.conf.ext') }

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
