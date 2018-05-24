# run a test task
require 'spec_helper_acceptance'

describe 'perforce service is started' do

  let(:pp) do
    <<-MANIFEST
        class { 'perforce': }
    MANIFEST
  end

  it_behaves_like 'an idempotent resource'

  describe service('p4d') do
      it { is_expected.to be_running }
      it { is_expected.to be_enabled }
    end
end