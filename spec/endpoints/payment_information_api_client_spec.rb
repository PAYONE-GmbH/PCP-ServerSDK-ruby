require 'spec_helper'
require 'net/http'
require 'json'
require_relative '../../lib/PCP-server-Ruby-SDK/endpoints/payment_information_api_client'
require_relative '../../lib/PCP-server-Ruby-SDK/models/payment_information_response'
require_relative '../../lib/PCP-server-Ruby-SDK/models/error_response'
require_relative '../../lib/PCP-server-Ruby-SDK/models/api_error'

RSpec.describe PCPServerSDK::Endpoints::PaymentInformationApiClient do
  let(:config) { double("PCPServerSDK::CommunicatorConfiguration", api_key: "", api_secret: "", host: 'https://api.example.com') }
  let(:client) { described_class.new(config) }
  let(:error_body) {
    PCPServerSDK::Models::ErrorResponse.new(
      errors: [PCPServerSDK::Models::APIError.new(error_code: '1', message: 'Error 1').to_body]
    ).to_body
  }

  describe '#create_payment_information' do
    let(:payload) { double('PCPServerSDK::Models::PaymentInformationRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::PaymentInformationResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.create_payment_information('1', '2', '3', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.create_payment_information('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.create_payment_information('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.create_payment_information(nil, '2', '3', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.create_payment_information('1', nil, '3', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.create_payment_information('1', '2', nil, payload) }.to raise_error(TypeError, 'Checkout ID is required')
      end
    end
  end

  describe '#get_payment_information' do
    let(:expected_response) { PCPServerSDK::Models::PaymentInformationResponse.new }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.get_payment_information('1', '2', '3', '4')
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.get_payment_information('1', '2', '3', '4') }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.get_payment_information('1', '2', '3', '4') }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.get_payment_information(nil, '2', '3', '4') }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.get_payment_information('1', nil, '3', '4') }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.get_payment_information('1', '2', nil, '4') }.to raise_error(TypeError, 'Checkout ID is required')
        expect { client.get_payment_information('1', '2', '3', nil) }.to raise_error(TypeError, 'Payment Information ID is required')
      end
    end
  end
end
