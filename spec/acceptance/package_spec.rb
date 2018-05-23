# run a test task
require 'spec_helper_acceptance'

describe 'perforce' do

    pp = <<-MANIFEST
      class { 'perforce': }
    MANIFEST

    it 'should apply manifest without failures' do
      apply_manifest(pp,
                     catch_failures: true,
                     debug: true)
    end

    it 'should have package installed' do
        rpm_results = shell("rpm -qa | grep helix-p4d")
        expect(rpm_results.exit_code).to eq 0
    end

    it 'should be idempotent' do
      apply_manifest(pp,
                     catch_changes: true,
                     debug: true)
    end
  end
