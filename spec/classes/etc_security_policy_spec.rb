require 'spec_helper'
describe 'solaris_tidy::etc_security_policy' do
  context "catalog compiles" do
    it { should compile}
  end

  context 'with default values for all parameters' do
    it { should contain_class('solaris_tidy::etc_security_policy') }
  end
end
