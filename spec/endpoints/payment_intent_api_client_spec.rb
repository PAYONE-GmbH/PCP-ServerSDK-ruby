require 'spec_helper'
require 'json'
require_relative '../../lib/PCP-server-Ruby-SDK'

RSpec.describe PCPServerSDK::Endpoints::PaymentIntentApiClient do
  let(:config) { mock_communicator_config }
  let(:client) { described_class.new(config) }

  describe '#create_payment_intent' do
    it 'posts the payload and deserializes the response' do
      payload = PCPServerSDK::Models::CreatePaymentIntentRequest.new
      response = double('Response', body: '{"paymentIntentOutput":{"paymentIntentId":"intent-1"}}', code: '201')
      allow(client).to receive(:get_response).and_return(response)

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
end
