require 'spec_helper'
require 'json'
require_relative '../../lib/PCP-server-Ruby-SDK'

RSpec.describe PCPServerSDK::Endpoints::PaymentIntentApiClient do
  let(:config) { mock_communicator_config }
  let(:client) { described_class.new(config) }

  describe '#create_payment_intent' do
    it 'posts the payload and deserializes the response' do
      payload = PCPServerSDK::Models::CreatePaymentIntentRequest.new(
        references: PCPServerSDK::Models::PaymentReferencesForPaymentIntent.new(merchant_reference: 'order-123')
      )
      response = double('Response', body: '{"paymentIntentOutput":{"paymentIntentId":"intent-1"}}', code: '201')
      allow(client).to receive(:get_response) do |_http, request|
        expect(request).to be_a(Net::HTTP::Post)
        expect(JSON.parse(request.body)).to eq('references' => { 'merchantReference' => 'order-123' })
        response
      end

      result = client.create_payment_intent('merchant-1', payload)

      expect(result).to be_a(PCPServerSDK::Models::CreatePaymentIntentResponse)
      expect(result.payment_intent_output.payment_intent_id).to eq('intent-1')
    end

    it 'validates the merchant ID and payload' do
      expect { client.create_payment_intent(nil, {}) }.to raise_error(TypeError, 'Merchant ID is required')
      expect { client.create_payment_intent('merchant-1', nil) }.to raise_error(TypeError, 'Payload is required')
    end
  end

  describe '#get_payment_intent' do
    it 'deserializes the response' do
      response = double('Response', body: '{"paymentIntentId":"intent-1"}', code: '200')
      allow(client).to receive(:get_response).and_return(response)

      result = client.get_payment_intent('merchant-1', 'intent-1')

      expect(result).to be_a(PCPServerSDK::Models::PaymentIntentResponse)
      expect(result.payment_intent_id).to eq('intent-1')
    end

    it 'validates the merchant ID and payment intent ID' do
      expect { client.get_payment_intent(nil, 'intent-1') }.to raise_error(TypeError, 'Merchant ID is required')
      expect { client.get_payment_intent('merchant-1', nil) }.to raise_error(TypeError, 'Payment Intent ID is required')
    end
  end

  describe '#patch_payment_intent' do
    it 'patches the payment intent with a JSON body and deserializes the response' do
      payload = PCPServerSDK::Models::PatchPaymentIntentRequest.new(
        amount_of_money: PCPServerSDK::Models::AmountOfMoney.new(amount: 1500, currency_code: 'EUR')
      )
      response = double('Response', body: '{"paymentIntentOutput":{"paymentIntentId":"intent-1"}}', code: '200')
      allow(client).to receive(:get_response) do |_http, request|
        expect(request).to be_a(Net::HTTP::Patch)
        expect(request.path).to eq('/v1/merchant-1/payment-intents/intent-1')
        expect(request['Content-Type']).to eq('application/json')
        expect(JSON.parse(request.body)).to eq('amountOfMoney' => { 'amount' => 1500, 'currencyCode' => 'EUR' })
        response
      end

      result = client.patch_payment_intent('merchant-1', 'intent-1', payload)

      expect(result).to be_a(PCPServerSDK::Models::PatchPaymentIntentResponse)
      expect(result.payment_intent_output.payment_intent_id).to eq('intent-1')
    end

    it 'validates merchant ID, payment intent ID, and payload' do
      expect { client.patch_payment_intent(nil, 'intent-1', {}) }.to raise_error(TypeError, 'Merchant ID is required')
      expect { client.patch_payment_intent('merchant-1', nil, {}) }.to raise_error(TypeError, 'Payment Intent ID is required')
      expect { client.patch_payment_intent('merchant-1', 'intent-1', nil) }.to raise_error(TypeError, 'Payload is required')
    end
  end
end
