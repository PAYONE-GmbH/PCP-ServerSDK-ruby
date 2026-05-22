require 'net/http'
require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../models/cancel_payment_response'
require_relative '../models/capture_payment_response'
require_relative '../models/complete_payment_response'
require_relative '../models/create_payment_response'
require_relative '../models/fund_split_response'
require_relative '../models/refund_payment_response'
module PCPServerSDK
  module Endpoints
    
    class PaymentExecutionApiClient < BaseApiClient
      PAYMENT_EXECUTION_ID_REQUIRED_ERROR = 'Payment Execution ID is required'

      def initialize(config, http_client = nil)
        super(config, http_client)
      end

      # Create a payment
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payload [PCPServerSDK::Models::PaymentExecutionRequest] The payment execution request
      # @return [PCPServerSDK::Models::CreatePaymentResponse] The create payment response
      def create_payment(merchant_id, commerce_case_id, checkout_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::CreatePaymentResponse)
      end

      # Capture a payment
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payment_execution_id [String] The payment execution identifier
      # @param payload [PCPServerSDK::Models::CapturePaymentRequest] The capture payment request
      # @return [PCPServerSDK::Models::CapturePaymentResponse] The capture payment response
      def capture_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/capture")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::CapturePaymentResponse)
      end

      # Cancel a payment
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payment_execution_id [String] The payment execution identifier
      # @param payload [PCPServerSDK::Models::CancelPaymentRequest] The cancel payment request
      # @return [PCPServerSDK::Models::CancelPaymentResponse] The cancel payment response
      def cancel_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/cancel")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::CancelPaymentResponse)
      end

      # Refund a payment
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payment_execution_id [String] The payment execution identifier
      # @param payload [PCPServerSDK::Models::RefundRequest] The refund request
      # @return [PCPServerSDK::Models::RefundPaymentResponse] The refund payment response
      def refund_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/refund")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }
      
        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::RefundPaymentResponse)
      end

      # Complete a payment
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payment_execution_id [String] The payment execution identifier
      # @param payload [PCPServerSDK::Models::CompletePaymentRequest] The complete payment request
      # @return [PCPServerSDK::Models::CompletePaymentResponse] The complete payment response
      def complete_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/complete")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::CompletePaymentResponse)
      end

      # Pause a payment
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payment_execution_id [String] The payment execution identifier
      # @param payload [PCPServerSDK::Models::PausePaymentRequest] The pause payment request
      # @return [PCPServerSDK::Models::PausePaymentResponse] The pause payment response
      def pause_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/pause")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::PausePaymentResponse)
      end

      # Refresh a payment
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payment_execution_id [String] The payment execution identifier
      # @param payload [PCPServerSDK::Models::RefreshPaymentRequest] The refresh payment request
      # @return [PCPServerSDK::Models::PaymentExecution] The refreshed payment execution
      def refresh_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/refresh")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::PaymentExecution)
      end

      # Create a fund split for a payment event
      # @param merchant_id [String] The merchant identifier
      # @param commerce_case_id [String] The commerce case identifier
      # @param checkout_id [String] The checkout identifier
      # @param payment_execution_id [String] The payment execution identifier
      # @param event_id [String] The payment event identifier
      # @param payload [PCPServerSDK::Models::FundSplitRequest] The fund split request
      # @return [PCPServerSDK::Models::FundSplitResponse] The fund split response
      def create_fund_split(merchant_id, commerce_case_id, checkout_id, payment_execution_id, event_id, payload)
        validate_ids(merchant_id, commerce_case_id, checkout_id)
        raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?
        raise TypeError, 'Event ID is required' if event_id.nil? || event_id.empty?

        url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/events/#{event_id}/fund-splits")

        request_init = {
          method: 'POST',
          headers: { 'Content-Type' => 'application/json' },
          body: JSON.generate(payload)
        }

        response = make_api_call(url.to_s, request_init)
        deserialize_json(response, PCPServerSDK::Models::FundSplitResponse)
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
