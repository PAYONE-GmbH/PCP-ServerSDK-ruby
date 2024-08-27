# test/test_helper.rb

require 'simplecov'
require "simplecov-html"
require "simplecov_json_formatter"

SimpleCov.start do
  add_filter '/lib/PCP-server-Ruby-SDK/version.rb' 
  add_filter '/lib/PCP-server-Ruby-SDK/models' 
  add_filter '/example-app/'
  add_filter '/spec/'

  SimpleCov.formatters = [
    SimpleCov::Formatter::JSONFormatter,
    SimpleCov::Formatter::HTMLFormatter,
  ]

  use_merging false
end

require 'rspec'
