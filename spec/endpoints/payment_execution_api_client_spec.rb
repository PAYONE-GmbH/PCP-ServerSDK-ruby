require 'spec_helper'
require 'net/http'
require 'json'
require_relative '../../lib/PCP-server-Ruby-SDK.rb'


RSpec.describe PCPServerSDK::Endpoints::PaymentExecutionApiClient do
  let(:config) { double("PCPServerSDK::CommunicatorConfiguration", api_key: "", api_secret: "", host: 'https://api.example.com') }
  let(:client) { described_class.new(config) }
  let(:error_body) {
    PCPServerSDK::Models::ErrorResponse.new(
      errors: [PCPServerSDK::Models::APIError.new(error_code: '1', message: 'Error 1')]
    ).to_body.to_json
  }

  describe '#create_payment' do
    let(:payload) { double('PCPServerSDK::Models::PaymentExecutionRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::CreatePaymentResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.create_payment('1', '2', '3', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.create_payment('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: '{}', code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiResponseRetrievalException' do
        expect { client.create_payment('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiResponseRetrievalException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.create_payment(nil, '2', '3', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.create_payment('1', nil, '3', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.create_payment('1', '2', nil, payload) }.to raise_error(TypeError, 'Checkout ID is required')
      end
    end
  end

  describe '#capture_payment' do
    let(:payload) { double('PCPServerSDK::Models::CapturePaymentRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::CapturePaymentResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.capture_payment('1', '2', '3', '4', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.capture_payment('1', '2', '3', '4', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: '{}', code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiResponseRetrievalException' do
        expect { client.capture_payment('1', '2', '3', '4', payload) }.to raise_error(PCPServerSDK::Errors::ApiResponseRetrievalException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.capture_payment(nil, '2', '3', '4', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.capture_payment('1', nil, '3', '4', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.capture_payment('1', '2', nil, '4', payload) }.to raise_error(TypeError, 'Checkout ID is required')
        expect { client.capture_payment('1', '2', '3', nil, payload) }.to raise_error(TypeError, 'Payment Execution ID is required')
      end
    end
  end

  describe '#cancel_payment' do
    let(:payload) { double('PCPServerSDK::Models::CancelPaymentRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::CancelPaymentResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.cancel_payment('1', '2', '3', '4', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.cancel_payment('1', '2', '3', '4', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: '{}', code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiResponseRetrievalException' do
        expect { client.cancel_payment('1', '2', '3', '4', payload) }.to raise_error(PCPServerSDK::Errors::ApiResponseRetrievalException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.cancel_payment(nil, '2', '3', '4', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.cancel_payment('1', nil, '3', '4', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.cancel_payment('1', '2', nil, '4', payload) }.to raise_error(TypeError, 'Checkout ID is required')
        expect { client.cancel_payment('1', '2', '3', nil, payload) }.to raise_error(TypeError, 'Payment Execution ID is required')
      end
    end
  end

  describe '#refund_payment' do
    let(:payload) { double('PCPServerSDK::Models::RefundRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::RefundPaymentResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.refund_payment('1', '2', '3', '4', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.refund_payment('1', '2', '3', '4', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: '{}', code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiResponseRetrievalException' do
        expect { client.refund_payment('1', '2', '3', '4', payload) }.to raise_error(PCPServerSDK::Errors::ApiResponseRetrievalException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.refund_payment(nil, '2', '3', '4', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.refund_payment('1', nil, '3', '4', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.refund_payment('1', '2', nil, '4', payload) }.to raise_error(TypeError, 'Checkout ID is required')
        expect { client.refund_payment('1', '2', '3', nil, payload) }.to raise_error(TypeError, 'Payment Execution ID is required')
      end
    end
  end

  describe '#complete_payment' do
    let(:payload) { double('PCPServerSDK::Models::CompletePaymentRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::CompletePaymentResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.complete_payment('1', '2', '3', '4', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.complete_payment('1', '2', '3', '4', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: '{}', code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiResponseRetrievalException' do
        expect { client.complete_payment('1', '2', '3', '4', payload) }.to raise_error(PCPServerSDK::Errors::ApiResponseRetrievalException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.complete_payment(nil, '2', '3', '4', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.complete_payment('1', nil, '3', '4', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.complete_payment('1', '2', nil, '4', payload) }.to raise_error(TypeError, 'Checkout ID is required')
        expect { client.complete_payment('1', '2', '3', nil, payload) }.to raise_error(TypeError, 'Payment Execution ID is required')
      end
    end
  end
end
