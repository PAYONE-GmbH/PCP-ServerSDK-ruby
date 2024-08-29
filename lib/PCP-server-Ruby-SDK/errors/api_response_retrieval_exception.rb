require_relative 'api_exception'

module PCPServerSDK
  module Errors
    class ApiResponseRetrievalException < ApiException
      def initialize(status_code, response_body, cause = nil)
        super(status_code, response_body, cause)
      end
    end
    
  end
end
