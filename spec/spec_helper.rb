RSpec.configure do |c|
  c.mock_with :rspec
end

require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|

  c.hiera_config = File.expand_path(File.join(__FILE__, '../../hiera.yaml'))

  c.default_facts = {
    :os => {
        :release => {
            :major => '7'
        },
        :name   => 'CentOS',
        :family => 'RedHat',
    },
    :kernel => 'Linux'
  }.merge({})
end

