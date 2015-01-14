require 'spec_helper'

describe 'dovecot::params', :type => :class do
  context "On a RedHat OS" do
    let :facts do
      {
        :osfamily => 'RedHat',
        :operatingsystemrelease => '5',
      }
    end

    it { should contain_dovecot__params }
  end
end
