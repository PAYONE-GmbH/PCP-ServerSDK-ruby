require 'net/http'
require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../models/cancel_response'
require_relative '../models/deliver_response'
require_relative '../models/order_response'
require_relative '../models/return_response'
module PCPServerSDK
  module Endpoints
    
    class OrderManagementCheckoutActionsApiClient < BaseApiClient
      def initialize(config)
        super(config)
      end

      # Create an order
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payload [PCPServerSDK::Models::OrderRequest] The order request
      # @return [PCPServerSDK::Models::OrderResponse] The order response
      def create_order(merchant_id, commerce_case_id, checkout_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/order")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::OrderResponse)
      end

      # Deliver an order
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payload [PCPServerSDK::Models::DeliverRequest] The deliver request
      # @return [PCPServerSDK::Models::DeliverResponse] The deliver response
      def deliver_order(merchant_id, commerce_case_id, checkout_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/deliver")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::DeliverResponse)
      end

      # Return an order
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payload [PCPServerSDK::Models::ReturnRequest] The return request
      # @return [PCPServerSDK::Models::ReturnResponse] The return response
      def return_order(merchant_id, commerce_case_id, checkout_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/return")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::ReturnResponse)
      end

      # Cancel an order
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payload [PCPServerSDK::Models::CancelRequest] The cancel request
      # @return [PCPServerSDK::Models::CancelResponse] The cancel response
      def cancel_order(merchant_id, commerce_case_id, checkout_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/cancel")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::CancelResponse)
      end

    private

      def validate_ids(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
        raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?
        raise TypeError, CHECKOUT_ID_REQUIRED_ERROR if checkout_id.nil? || checkout_id.empty?
      end
    end
  end
end
