# run a test task
require 'spec_helper_acceptance'

describe 'perforce is idempotent' do

  let(:pp) do
    <<-MANIFEST
        class { 'perforce': }
    MANIFEST
  end

  it_behaves_like 'an idempotent resource'
end
