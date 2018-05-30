require "#{File.join(File.dirname(__FILE__),'..','spec_helper')}"

describe 'perforce' do
  it { should compile }

  it { should contain_class('perforce::install')}
  it { should contain_class('perforce::configure')}
  it { should contain_class('perforce::package')}
  it { should contain_class('perforce::repository')}
  it { should contain_class('perforce::service')}

  # perforce's main yum repository
  it { should contain_yumrepo('perforce') }

  # package installation
  it { should contain_package('helix-p4d') }
  it { should contain_package('helix-cli') }

  # perforce p4d service
  it { should contain_service('p4d') }

  # perforce p4d environment variables, configuration
  it { should contain_file('/opt/perforce/.p4config') }
end
