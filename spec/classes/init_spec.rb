require File.join(File.dirname(__FILE__),'..','spec_helper').to_s

describe 'perforce' do

  context 'default parameters' do
    it { should compile }

    it { should contain_class('perforce::install')}
    it { should contain_class('perforce::configure')}
    it { should contain_class('perforce::package')}
    it { should contain_class('perforce::repository')}
    it { should contain_class('perforce::license')}
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

  context 'with ssl' do
    let (:params) {{
        'service_ssldir'   => '/opt/perforce/p4ssldir',
    }}

    # perforce ssl directory environment variable is set
    it { is_expected.to contain_file('/opt/perforce/.p4config').with_content(/^P4SSLDIR/) }

    # perforce daemon configured to run on ssl
    it { is_expected.to contain_file('/opt/perforce/.p4config').with_content(/ssl:1666/) }
  end

  context 'with license' do
	  let (:params) {{
		  'license_content'	=> 'License:	1234567890ABCDEFGHIJK',
	  }}

	  # should create a license file in the perforce root directory
	  it { is_expected.to contain_file('/opt/perforce/p4root/license').with_content(/License:	1234567890ABCDEFGHIJK/) }
  end
end
