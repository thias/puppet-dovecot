require 'spec_helper'

describe 'dovecot::plugin', :type => :define do
  let :title do
    'mysql'
  end

  it { should contain_dovecot__plugin('mysql') }

  it {
    should contain_package('dovecot-mysql').with(
      'ensure' => 'installed'
    )
  }
end
