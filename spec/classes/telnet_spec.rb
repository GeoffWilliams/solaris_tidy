require 'spec_helper'
describe 'solaris_tidy::telnet' do
  let :facts do
    {
      :operatingsystem => "SunOS",
      :os => {
        :family => "Solaris"
      }
    }
  end
  context 'with default values for all parameters' do
    it { should contain_class('solaris_tidy::telnet') }
  end
end
