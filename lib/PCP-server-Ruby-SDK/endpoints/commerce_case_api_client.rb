require 'net/http'
require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../models/commerce_case_response'
require_relative '../models/create_commerce_case_response'
require_relative '../models/customer'

module PCPServerSDK
  module Endpoints
    
    class CommerceCaseApiClient < BaseApiClient
      def initialize(config)
        super(config)
      end

      # Create a commerce case
      # @param merchant_id [String] The merchant identifier
      # @param payload [CreateCommerceCaseRequest] The commerce case request
      # @return [CreateCommerceCaseResponse] The commerce case response
      def create_commerce_case_request(merchant_id, payload)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases")
        
        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json; charset=utf-8' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, CreateCommerceCaseResponse)
      end

      # Get a commerce case
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @return [CommerceCaseResponse] The commerce case response
      def get_commerce_case_request(merchant_id, commerce_case_id)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
        raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}")
        
        request_init = {
          method: 'GET',
          headers: {}
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, CommerceCaseResponse)
      end

      # Get commerce cases
      # @param merchant_id [String] The merchant identifier
      # @param query_params [GetCommerceCasesQuery] The query parameters
      # @return [Array<CommerceCaseResponse>] The commerce cases
      def get_commerce_cases_request(merchant_id, query_params = nil)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases")
        
        if query_params
          url.query = URI.encode_www_form(query_params.to_query_map)
        end

        request_init = {
          method: 'GET',
          headers: {}
        }

        request = make_api_call(url.to_s, request_init)
        request.map { |r| deserialize_json(r, CommerceCaseResponse) }
      end

      # Update a commerce case
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param customer [Customer] The customer
      # @return [nil]
      def update_commerce_case_request(merchant_id, commerce_case_id, customer)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
        raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}")
        
        request_init = {
          method: 'PATCH',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate({ customer: customer })
        }

        make_api_call(url.to_s, request_init)
        nil
      end
    end
  end
end
