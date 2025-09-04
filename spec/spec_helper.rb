require 'simplecov'
require "simplecov-html"
require "simplecov_json_formatter"

SimpleCov.start do
  add_filter '/lib/PCP-server-Ruby-SDK/models' 
  add_filter '/spec/'
  
  add_group 'Errors', '/lib/PCP-server-Ruby-SDK/errors'
  add_group 'ENDPOINTS', 'lib/PCP-server-Ruby-SDK/endpoints'
  add_group 'Utils', 'lib/PCP-server-Ruby-SDK/utils'
  add_group 'Queries', 'lib/PCP-server-Ruby-SDK/queries'
    
  track_files = '{app,lib}/**/*.rb'

  SimpleCov.formatters = [
    SimpleCov::Formatter::JSONFormatter,
    SimpleCov::Formatter::HTMLFormatter,
  ]
end

RSpec.configure do |config|
  config.before(:each) do
    $stdout = STDOUT
  end
end

# Helper method to create properly mocked CommunicatorConfiguration
def mock_communicator_config(api_key: '', api_secret: '', host: 'https://api.example.com', http_client: nil)
  double('PCPServerSDK::CommunicatorConfiguration',
         api_key: api_key,
         api_secret: api_secret,
         host: host,
         http_client: http_client)
end

require 'rspec'
