require 'spec_helper'
describe 'solaris_tidy::cron' do
  let :facts do
    {
      :os => {
        :family => "Solaris"
      }
    }
  end

  context 'with default values for all parameters' do
    it { should contain_class('solaris_tidy::cron') }
  end
end
