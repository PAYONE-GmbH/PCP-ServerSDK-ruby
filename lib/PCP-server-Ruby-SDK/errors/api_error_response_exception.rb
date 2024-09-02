require_relative '../models/api_error'
require_relative 'api_exception'

module PCPServerSDK
  module Errors
    
    class ApiErrorResponseException < ApiException
      # The errors
      # @return [Array<PCPServerSDK::Models::APIError>]
      attr_reader :errors

      # The constructor
      # @param [Integer] status_code
      # @param [String] response_body
      # @param [Array<PCPServerSDK::Models::APIError>] errors
      def initialize(status_code, response_body, errors = [])
        super(status_code, response_body)
        @errors = errors.any? ? errors : []
      end

      def get_errors
        @errors
      end
    end
  end
end
