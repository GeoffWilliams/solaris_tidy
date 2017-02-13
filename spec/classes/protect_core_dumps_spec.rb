require 'spec_helper'
describe 'solaris_tidy::protect_core_dumps' do
  context "catalog compiles" do
    it { should compile}
  end
  
  context 'with default values for all parameters' do
    it { should contain_class('solaris_tidy::protect_core_dumps') }
  end
end
