# run a test task
require 'spec_helper_acceptance'

describe 'perforce installs packages' do

    let(:pp) do
      <<-MANIFEST
        class { 'perforce': }
      MANIFEST
    end

  it_behaves_like 'an idempotent resource'

  it 'should have packages installed' do
        rpm_results = shell("rpm -qa | grep helix-p4d")
        expect(rpm_results.exit_code).to eq 0
    end
 end
