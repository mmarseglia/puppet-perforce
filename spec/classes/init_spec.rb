require "#{File.join(File.dirname(__FILE__),'..','spec_helper')}"

describe 'perforce' do
  it { should compile }

  it { should contain_user('perforce') }

  it { should contain_yumrepo('perforce') }

  it { should contain_package('helix-p4d') }
  it { should contain_package('helix-cli') }
end
