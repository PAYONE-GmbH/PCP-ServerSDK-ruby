require 'net/http'
require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../models/checkout_response'
require_relative '../models/checkouts_response'
require_relative '../models/create_checkout_response'


module PCPServerSDK
  module Endpoints
    
    class CheckoutApiClient < BaseApiClient
      def initialize(config)
        super(config)
      end

      # Create a checkout
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param payload [PCPServerSDK::Models::CreateCheckoutRequest] The checkout request
      # @return [PCPServerSDK::Models::CreateCheckoutResponse] The checkout response
      def create_checkout_request(merchant_id, commerce_case_id, payload)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
        raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?
        raise TypeError, PAYLOAD_REQUIRED_ERROR if payload.nil?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts")
        
        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::CreateCheckoutResponse)
      end

      # Get a checkout
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @return [PCPServerSDK::Models::CheckoutResponse] The checkout response
      def get_checkout_request(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
        raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?
        raise TypeError, CHECKOUT_ID_REQUIRED_ERROR if checkout_id.nil? || checkout_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}")
        
        request_init = {
          method: 'GET',
          headers: {}
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::CheckoutResponse)
      end

      # Get checkouts
      # @param merchant_id [String] The merchant identifier
      # @param query_params [PCPServerSDK::Models::GetCheckoutsQuery] The query parameters
      # @return [PCPServerSDK::Models::CheckoutsResponse] The checkouts response
      def get_checkouts_request(merchant_id, query_params = nil)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/checkouts")
        
        if query_params
          url.query = URI.encode_www_form(query_params.to_query_map)
        end

        request_init = {
          method: 'GET',
          headers: {}
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::CheckoutsResponse)
      end

      # Update a checkout
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payload [PCPServerSDK::Models::PatchCheckoutRequest] The checkout request
      # @return [nil]
      def update_checkout_request(merchant_id, commerce_case_id, checkout_id, payload)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
        raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?
        raise TypeError, CHECKOUT_ID_REQUIRED_ERROR if checkout_id.nil? || checkout_id.empty?
        raise TypeError, PAYLOAD_REQUIRED_ERROR if payload.nil?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}")
        
        request_init = {
          method: 'PATCH',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        make_api_call(url.to_s, request_init)
        nil
      end

      # Remove a checkout
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @return [nil]
      def remove_checkout_request(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
        raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?
        raise TypeError, CHECKOUT_ID_REQUIRED_ERROR if checkout_id.nil? || checkout_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}")
        
        request_init = {
          method: 'DELETE',
          headers: {}
        }

        make_api_call(url.to_s, request_init)
        nil
      end
    end
  end
end
