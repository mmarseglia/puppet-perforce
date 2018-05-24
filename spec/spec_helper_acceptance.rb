#! /usr/bin/env ruby -S rspec
require 'puppet'
require 'beaker-rspec'
require 'beaker-puppet'

install_puppet_agent_on(hosts)
# Install module and dependencies
install_dev_puppet_module(:modulename => 'perforce')

RSpec.configure do |c|
  c.formatter = :documentation
end

shared_examples 'an idempotent resource' do
  it 'applies with no errors' do
    apply_manifest(pp, catch_failures: true)
  end

  it 'applies a second time without changes'  do
    apply_manifest(pp, catch_changes: true)
  end
end