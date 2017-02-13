require 'spec_helper'
describe 'solaris_tidy::logging' do
  let :facts do
    {
      :operatingsystem => 'SunOS',
    }
  end
  context 'with default values for all parameters' do
    it { should contain_class('solaris_tidy::logging') }
  end
end
