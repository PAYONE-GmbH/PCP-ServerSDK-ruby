# test/test_helper.rb

require 'simplecov'
SimpleCov.start do
  add_filter '/test/' # Ignore test files from coverage
  add_filter '/lib/PCP-server-Ruby-SDK/version.rb' 
  add_filter '/lib/PCP-server-Ruby-SDK/models' 
  add_filter '/example-app/'
end

require 'test_helper'
