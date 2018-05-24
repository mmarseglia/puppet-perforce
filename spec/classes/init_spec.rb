require "#{File.join(File.dirname(__FILE__),'..','spec_helper')}"

describe 'perforce' do
  it { should compile }

  it { should contain_class('perforce::install')}
  it { should contain_class('perforce::package')}
  it { should contain_class('perforce::repository')}
  it { should contain_class('perforce::service')}

  it { should contain_yumrepo('perforce') }

  it { should contain_package('helix-p4d') }
  it { should contain_package('helix-cli') }

  it { should contain_service('p4d') }

end
