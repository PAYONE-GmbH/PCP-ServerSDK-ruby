require 'net/http'
require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../models/cancel_request'
require_relative '../models/cancel_response'
require_relative '../models/deliver_request'
require_relative '../models/deliver_response'
require_relative '../models/order_request'
require_relative '../models/order_response'
require_relative '../models/return_request'
require_relative '../models/return_response'

class OrderManagementCheckoutActionsApiClient < BaseApiClient
  def initialize(config)
    super(config)
  end

  def create_order(merchant_id, commerce_case_id, checkout_id, payload)
    validate_ids(merchant_id, commerce_case_id, checkout_id)

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/order")

    request_init = {
      method: 'POST',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init)
  end

  def deliver_order(merchant_id, commerce_case_id, checkout_id, payload)
    validate_ids(merchant_id, commerce_case_id, checkout_id)

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/deliver")

    request_init = {
      method: 'POST',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init)
  end

  def return_order(merchant_id, commerce_case_id, checkout_id, payload)
    validate_ids(merchant_id, commerce_case_id, checkout_id)

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/return")

    request_init = {
      method: 'POST',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init)
  end

  def cancel_order(merchant_id, commerce_case_id, checkout_id, payload)
    validate_ids(merchant_id, commerce_case_id, checkout_id)

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}/cancel")

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
