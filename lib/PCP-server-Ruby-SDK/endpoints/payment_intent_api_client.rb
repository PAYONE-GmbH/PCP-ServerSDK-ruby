require 'json'
require 'uri'
require_relative 'base_api_client'
require_relative '../models/create_payment_intent_response'
require_relative '../models/payment_intent_output'
require_relative '../models/payment_intent_response'
require_relative '../models/payment_product840_specific_output_for_intent'
require_relative '../models/redirect_payment_method_specific_output_for_create_intent'
require_relative '../models/redirect_payment_method_specific_output_for_intent'
require_relative '../models/redirect_payment_product840_specific_input_data'
require_relative '../models/shopping_cart_data'

module PCPServerSDK
  module Endpoints
    class PaymentIntentApiClient < BaseApiClient
      PAYMENT_INTENT_ID_REQUIRED_ERROR = 'Payment Intent ID is required'

      def create_payment_intent(merchant_id, payload)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
        raise TypeError, PAYLOAD_REQUIRED_ERROR if payload.nil?

        response = make_api_call(URI.join(get_config.host, "/v1/#{merchant_id}/payment-intents").to_s,
                                 method: 'POST', headers: { 'Content-Type' => 'application/json' }, body: JSON.generate(payload))
        deserialize_json(response, PCPServerSDK::Models::CreatePaymentIntentResponse)
      end

      def get_payment_intent(merchant_id, payment_intent_id)
        raise TypeError, MERCHANT_ID_REQUIRED_ERROR if merchant_id.nil? || merchant_id.empty?
        raise TypeError, PAYMENT_INTENT_ID_REQUIRED_ERROR if payment_intent_id.nil? || payment_intent_id.empty?

        response = make_api_call(URI.join(get_config.host, "/v1/#{merchant_id}/payment-intents/#{payment_intent_id}").to_s,
                                 method: 'GET', headers: {})
        deserialize_json(response, PCPServerSDK::Models::PaymentIntentResponse)
      end
    end
  end
end
