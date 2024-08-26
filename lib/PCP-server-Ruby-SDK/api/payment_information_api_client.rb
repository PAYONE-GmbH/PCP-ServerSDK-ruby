require 'net/http'
require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../models/payment_information_request'
require_relative '../models/payment_information_response'

class PaymentInformationApiClient < BaseApiClient
  PAYMENT_INFORMATION_ID_REQUIRED_ERROR = 'Payment Information ID is required'

  def initialize(config)
    super(config)
  end

  def create_payment_information(merchant_id, commerce_case_id, checkout_id, payload)
    validate_ids(merchant_id, commerce_case_id, checkout_id)

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-informations")

    request_init = {
      method: 'POST',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init)
  end

  def get_payment_information(merchant_id, commerce_case_id, checkout_id, payment_information_id)
    validate_ids(merchant_id, commerce_case_id, checkout_id)
    raise TypeError, PAYMENT_INFORMATION_ID_REQUIRED_ERROR if payment_information_id.nil? || payment_information_id.empty?

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/payment-informations/#{payment_information_id}")

    request_init = {
      method: 'GET',
      headers: {}
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
