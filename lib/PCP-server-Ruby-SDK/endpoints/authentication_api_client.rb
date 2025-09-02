# frozen_string_literal: true

require_relative '../errors/api_error_response_exception'
require_relative '../errors/api_response_retrieval_exception'
require_relative '../models/authentication_token'
require_relative 'base_api_client'

module PCPServerSDK
  module Endpoints
    # Client for authentication token operations
    class AuthenticationApiClient < BaseApiClient
      def initialize(config, http_client = nil)
        super(config, http_client)
      end

      def get_authentication_tokens(merchant_id, request_id = nil)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/authentication-tokens")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: ''
        }
        request_init[:headers]['X-Request-ID'] = request_id unless request_id.nil?

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::AuthenticationToken)
      end
    end
  end
end
