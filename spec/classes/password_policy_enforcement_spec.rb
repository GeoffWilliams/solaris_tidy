require 'spec_helper'
describe 'solaris_tidy::password_policy_enforcement' do
  context "catalog compiles" do
    it { should compile}
  end
  context 'with default values for all parameters' do
    it { should contain_class('solaris_tidy::password_policy_enforcement') }
  end
end
