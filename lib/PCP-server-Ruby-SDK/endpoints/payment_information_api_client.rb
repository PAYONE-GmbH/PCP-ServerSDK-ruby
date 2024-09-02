require 'net/http'
require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../models/payment_information_response'

module PCPServerSDK
  module Endpoints
    

    class PaymentInformationApiClient < BaseApiClient
      PAYMENT_INFORMATION_ID_REQUIRED_ERROR = 'Payment Information ID is required'

      def initialize(config)
        super(config)
      end

      # Create a payment information
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payload [PCPServerSDK::Models::PaymentInformationRequest] The payment information request
      # @return [PCPServerSDK::Models::PaymentInformationResponse] The payment information response
      def create_payment_information(merchant_id, commerce_case_id, checkout_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-informations")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::PaymentInformationResponse)
      end

      # Get a payment information
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payment_information_id [String] The payment information identifier
      # @return [PCPServerSDK::Models::PaymentInformationResponse] The payment information response
      def get_payment_information(merchant_id, commerce_case_id, checkout_id, payment_information_id)
        validate_ids(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, PAYMENT_INFORMATION_ID_REQUIRED_ERROR if payment_information_id.nil? || payment_information_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-informations/#{payment_information_id}")

        request_init = {
          method: 'GET',
          headers: {}
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::PaymentInformationResponse)
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
