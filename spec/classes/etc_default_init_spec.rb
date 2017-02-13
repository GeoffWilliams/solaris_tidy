require 'spec_helper'
describe 'solaris_tidy::etc_default_init' do
  context 'with default values for all parameters' do
    it { should contain_class('solaris_tidy::etc_default_init') }
  end
end
