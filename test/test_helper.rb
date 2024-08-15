# frozen_string_literal: true

require "bundler/setup"
require "simplecov"
require "simplecov-cobertura"

SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter

SimpleCov.start do
  add_filter '/test/' # Exclude test files from coverage
  track_files 'lib/**/*.rb'
end

# Load your application files after starting SimpleCov
$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))
require "PCP-ServerSDK-ruby"
require "minitest/autorun"
