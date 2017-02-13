require 'spec_helper'
describe 'solaris_tidy::disable_serial_login' do
  context "catalog compiles" do
    it { should compile}
  end
  
  context 'with default values for all parameters' do
    it { should contain_class('solaris_tidy::disable_serial_login') }
  end
end
