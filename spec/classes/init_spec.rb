require "#{File.join(File.dirname(__FILE__),'..','spec_helper')}"

describe 'perforce' do

  it { should contain_user('perforce') }

  it { should contain_yumrepo('perforce') }

end
