require 'spec_helper'
require 'net/http'
require 'json'
require_relative '../../lib/PCP-server-Ruby-SDK/endpoints/order_management_checkout_actions_api_client'
require_relative '../../lib/PCP-server-Ruby-SDK/models/cancel_response'
require_relative '../../lib/PCP-server-Ruby-SDK/models/deliver_response'
require_relative '../../lib/PCP-server-Ruby-SDK/models/order_response'
require_relative '../../lib/PCP-server-Ruby-SDK/models/return_response'
require_relative '../../lib/PCP-server-Ruby-SDK/models/error_response'
require_relative '../../lib/PCP-server-Ruby-SDK/models/api_error'

RSpec.describe PCPServerSDK::Endpoints::OrderManagementCheckoutActionsApiClient do
  let(:config) { double("PCPServerSDK::CommunicatorConfiguration", api_key: "", api_secret: "", host: 'https://api.example.com') }
  let(:client) { described_class.new(config) }
  let(:error_body) {
    PCPServerSDK::Models::ErrorResponse.new(
      errors: [PCPServerSDK::Models::APIError.new(error_code: '1', message: 'Error 1').to_body]
    ).to_body
  }

  describe '#create_order' do
    let(:payload) { double('PCPServerSDK::Models::OrderRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::OrderResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.create_order('1', '2', '3', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.create_order('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.create_order('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.create_order(nil, '2', '3', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.create_order('1', nil, '3', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.create_order('1', '2', nil, payload) }.to raise_error(TypeError, 'Checkout ID is required')
      end
    end
  end

  describe '#deliver_order' do
    let(:payload) { double('PCPServerSDK::Models::DeliverRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::DeliverResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.deliver_order('1', '2', '3', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.deliver_order('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.deliver_order('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.deliver_order(nil, '2', '3', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.deliver_order('1', nil, '3', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.deliver_order('1', '2', nil, payload) }.to raise_error(TypeError, 'Checkout ID is required')
      end
    end
  end

  describe '#return_order' do
    let(:payload) { double('PCPServerSDK::Models::ReturnRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::ReturnResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.return_order('1', '2', '3', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.return_order('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.return_order('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.return_order(nil, '2', '3', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.return_order('1', nil, '3', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.return_order('1', '2', nil, payload) }.to raise_error(TypeError, 'Checkout ID is required')
      end
    end
  end

  describe '#cancel_order' do
    let(:payload) { double('PCPServerSDK::Models::CancelRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::CancelResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.cancel_order('1', '2', '3', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.cancel_order('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.cancel_order('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.cancel_order(nil, '2', '3', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.cancel_order('1', nil, '3', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.cancel_order('1', '2', nil, payload) }.to raise_error(TypeError, 'Checkout ID is required')
      end
    end
  end
end
