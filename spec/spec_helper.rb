# test/test_helper.rb

require 'simplecov'
require "simplecov-html"
require 'fileutils'
require 'json'
require 'time'


class SimpleCov::Formatter::SonarCloudFormatter
  def format(result)
    # Extract the coverage data
    coverage_data = result.original_result

    # Remove the "Minitest" key, if it exists
    coverage_data = coverage_data["Minitest"] if coverage_data.key?("Minitest")

    meta_data = {
      "simplecov_version" => SimpleCov::VERSION
    }

    # Write the result to a JSON file in the correct format
    File.open(File.join(SimpleCov.coverage_path, '.resultset.json'), 'w') do |file|
      file.puts JSON.pretty_generate({ 
        "meta" => meta_data,
        "coverage" => coverage_data 
      })
    end

    puts "Coverage report generated for SonarCloud: #{SimpleCov.coverage_path}/.resultset.json"
  end
end

# FileUtils.rm_rf(SimpleCov.coverage_path) if File.directory?(SimpleCov.coverage_path)

SimpleCov.start do
  add_filter '/test/' # Ignore test files from coverage
  add_filter '/lib/PCP-server-Ruby-SDK/version.rb' 
  add_filter '/lib/PCP-server-Ruby-SDK/models' 
  add_filter '/example-app/'
  add_filter '/spec/'

  # SimpleCov.formatters = [
  #   SimpleCov::Formatter::SonarCloudFormatter,
  #   SimpleCov::Formatter::HTMLFormatter,
  # ]

  use_merging false
end

require 'rspec'
