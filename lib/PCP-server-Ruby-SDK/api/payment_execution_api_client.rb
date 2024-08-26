require 'net/http'
require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../models/cancel_payment_request'
require_relative '../models/cancel_payment_response'
require_relative '../models/capture_payment_request'
require_relative '../models/capture_payment_response'
require_relative '../models/complete_payment_request'
require_relative '../models/complete_payment_response'
require_relative '../models/create_payment_response'
require_relative '../models/payment_execution_request'
require_relative '../models/refund_payment_response'
require_relative '../models/refund_request'

class PaymentExecutionApiClient < BaseApiClient
  PAYMENT_EXECUTION_ID_REQUIRED_ERROR = 'Payment Execution ID is required'

  def initialize(config)
    super(config)
  end

  def create_payment(merchant_id, commerce_case_id, checkout_id, payload)
    validate_ids(merchant_id, commerce_case_id, checkout_id)

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions")

    request_init = {
      method: 'POST',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init)
  end

  def capture_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, payload)
    validate_ids(merchant_id, commerce_case_id, checkout_id)
    raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/capture")

    request_init = {
      method: 'POST',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init)
  end

  def cancel_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, payload)
    validate_ids(merchant_id, commerce_case_id, checkout_id)
    raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/cancel")

    request_init = {
      method: 'POST',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init)
  end

  def refund_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, payload)
    validate_ids(merchant_id, commerce_case_id, checkout_id)
    raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/refund")

    request_init = {
      method: 'POST',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init)
  end

  def complete_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, payload)
    validate_ids(merchant_id, commerce_case_id, checkout_id)
    raise TypeError, PAYMENT_EXECUTION_ID_REQUIRED_ERROR if payment_execution_id.nil? || payment_execution_id.empty?

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-executions/#{payment_execution_id}/complete")

    request_init = {
      method: 'POST',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init)
  end

  private

  def validate_ids(merchant_id, commerce_case_id, checkout_id)
    raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
    raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?
    raise TypeError, CHECKOUT_ID_REQUIRED_ERROR if checkout_id.nil? || checkout_id.empty?
  end
end
