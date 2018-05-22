RSpec.configure do |c|
  c.mock_with :rspec
end

require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|

  c.hiera_config = File.expand_path(File.join(__FILE__, '../fixtures/hiera.yaml'))

  c.default_facts = {
    :operatingsystem => 'CentOS',
    :operatingsystemrelease => '7.2',
    :kernel => 'Linux',
    :osfamily => 'RedHat',
    :architecture => 'x86_64',
    :clientcert => 'puppet.acme.com'
  }.merge({})
end

shared_examples :compile, :compile => true do
  it { should compile.with_all_deps }
end

