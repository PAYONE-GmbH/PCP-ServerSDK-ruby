require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../models/create_pay_by_link_response'

module PCPServerSDK
  module Endpoints
    class PayByLinkApiClient < BaseApiClient
      # Create a pay-by-link for a checkout.
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payload [PCPServerSDK::Models::CreatePayByLinkRequest] The pay-by-link request
      # @return [PCPServerSDK::Models::CreatePayByLinkResponse] The created pay-by-link
      def create_pay_by_link_request(merchant_id, commerce_case_id, checkout_id, payload)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
        raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?
        raise TypeError, CHECKOUT_ID_REQUIRED_ERROR if checkout_id.nil? || checkout_id.empty?
        raise TypeError, PAYLOAD_REQUIRED_ERROR if payload.nil?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/pay-by-link")
        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::CreatePayByLinkResponse)
      end
    end
  end
end
