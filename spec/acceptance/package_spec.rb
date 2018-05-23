# run a test task
require 'spec_helper_acceptance'

describe 'perforce' do

    pp = <<-MANIFEST
      class { 'perforce': }
    MANIFEST

    it 'apply manifest' do
      apply_manifest(pp,
                     catch_failures: true,
                     debug: true)
    end

    it 'should have package installed' do
        rpm_results = shell("rpm -qa | grep helix-p4d")
        expect(rpm_results.exit_code).to eq 0
    end
  end
