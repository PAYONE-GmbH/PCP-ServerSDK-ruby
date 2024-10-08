require 'rbconfig'
require 'json'


module PCPServerSDK
  module Utils
    class ServerMetaInfo
      attr_accessor :platform_identifier, :sdk_identifier, :sdk_creator, :integrator
    
      def initialize(integrator = '')
        @platform_identifier = "#{RbConfig::CONFIG['host_os']}, ruby version is: #{RUBY_VERSION}"
        @sdk_identifier = "RubyServerSDK/v#{PCPServerSDK::VERSION}" # Adjust version as needed
        @sdk_creator = 'PAYONE GmbH'
        @integrator = integrator
      end
    
      def to_json 
        JSON.pretty_generate({
          platform_identifier: @platform_identifier,
          sdk_identifier: @sdk_identifier,
          sdk_creator: @sdk_creator,
          integrator: @integrator
        })
      end
    end
    
  end
end
