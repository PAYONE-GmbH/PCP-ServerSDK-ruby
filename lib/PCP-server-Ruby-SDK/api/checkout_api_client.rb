require 'net/http'
require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../queries/get_checkouts_query'
require_relative '../models/checkout_response'
require_relative '../models/checkouts_response'
require_relative '../models/create_checkout_request'
require_relative '../models/create_checkout_response'
require_relative '../models/patch_checkout_request'

class CheckoutApiClient < BaseApiClient
  def initialize(config)
    super(config)
  end

  def create_checkout_request(merchant_id, commerce_case_id, payload)
    raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
    raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts")
    
    request_init = {
      method: 'POST',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init)
  end

  def get_checkout_request(merchant_id, commerce_case_id, checkout_id)
    raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
    raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?
    raise TypeError, CHECKOUT_ID_REQUIRED_ERROR if checkout_id.nil? || checkout_id.empty?

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}")
    
    request_init = {
      method: 'GET',
      headers: {}
    }

    make_api_call(url.to_s, request_init)
  end

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

    make_api_call(url.to_s, request_init)
  end

  def update_checkout_request(merchant_id, commerce_case_id, checkout_id, payload)
    raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
    raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?
    raise TypeError, CHECKOUT_ID_REQUIRED_ERROR if checkout_id.nil? || checkout_id.empty?

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}")
    
    request_init = {
      method: 'PATCH',
      headers: { 'Content-Type' => 'application/json' },
      body: JSON.generate(payload)
    }

    make_api_call(url.to_s, request_init) { nil }
  end

  def remove_checkout_request(merchant_id, commerce_case_id, checkout_id)
    raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
    raise TypeError, COMMERCE_CASE_ID_REQUIRED_ERROR if commerce_case_id.nil? || commerce_case_id.empty?
    raise TypeError, CHECKOUT_ID_REQUIRED_ERROR if checkout_id.nil? || checkout_id.empty?

    url = URI.join(get_config.host, "/v1/#{merchant_id}/commerce-cases/#{commerce_case_id}/checkouts/#{checkout_id}")
    
    request_init = {
      method: 'DELETE',
      headers: {}
    }

    make_api_call(url.to_s, request_init) { nil }
  end
end
