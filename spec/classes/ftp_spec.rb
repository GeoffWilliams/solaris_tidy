require 'spec_helper'
describe 'solaris_tidy::ftp' do
  context 'with default values for all parameters' do
    it { should contain_class('solaris_tidy::ftp') }
  end
end
