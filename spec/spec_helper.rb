require 'simplecov'
require "simplecov-html"
require "simplecov_json_formatter"

SimpleCov.start do
  add_filter '/lib/PCP-server-Ruby-SDK/models' 
  add_filter '/spec/'
  
  add_group 'Errors', '/lib/PCP-server-Ruby-SDK/errors'
  add_group 'API' , 'lib/PCP-server-Ruby-SDK/api'
  add_group 'Utils', 'lib/PCP-server-Ruby-SDK/utils'
  add_group 'Queries', 'lib/PCP-server-Ruby-SDK/queries'
    
  track_files = '{app,lib}/**/*.rb'

  SimpleCov.formatters = [
    SimpleCov::Formatter::JSONFormatter,
    SimpleCov::Formatter::HTMLFormatter,
  ]
end

require 'rspec'
