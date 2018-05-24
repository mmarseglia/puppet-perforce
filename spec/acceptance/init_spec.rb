# run a test task
require 'spec_helper_acceptance'

describe 'install and configure perforce' do

  let(:pp) do
    <<-MANIFEST
        class { 'perforce': }
    MANIFEST
  end

  it 'applies with no errors' do
    apply_manifest(pp, catch_failures: true, debug: true)
  end

  it 'should have packages installed' do
    rpm_results = shell("rpm -qa | grep helix-p4d")
    expect(rpm_results.exit_code).to eq 0
  end

  describe service('p4d') do
    it { should be_enabled }
    it { should be_running }
  end

  it 'applies a second time without changes'  do
    apply_manifest(pp, catch_changes: true)
  end

end
