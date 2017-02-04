require 'spec_helper'
describe 'solaris_tidy::gnome' do
  context 'with default values for all parameters' do
    it { should contain_class('solaris_tidy::gnome') }
  end
end
