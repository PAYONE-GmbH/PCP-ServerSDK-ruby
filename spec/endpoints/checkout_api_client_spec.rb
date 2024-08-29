require 'spec_helper'
require 'net/http'
require 'json'
require_relative '../../lib/PCP-server-Ruby-SDK/endpoints/checkout_api_client'
require_relative '../../lib/PCP-server-Ruby-SDK/models/checkout_response'
require_relative '../../lib/PCP-server-Ruby-SDK/models/checkouts_response'
require_relative '../../lib/PCP-server-Ruby-SDK/models/create_checkout_response'
require_relative '../../lib/PCP-server-Ruby-SDK/models/patch_checkout_request'

RSpec.describe PCPServerSDK::Endpoints::CheckoutApiClient do
  let(:config) { double("PCPServerSDK::CommunicatorConfiguration", api_key: "", api_secret: "", host: 'https://api.example.com') }
  let(:client) { described_class.new(config) }
  let(:error_body) { PCPServerSDK::Models::ErrorResponse.new(
    errors: [PCPServerSDK::Models::APIError.new(error_code: '1', message: 'Error 1').to_body]
  ).to_body}

  describe '#create_checkout_request' do
    let(:payload) { double('PCPServerSDK::Models::CreateCheckoutRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: 200) }
      let(:expected_response) { PCPServerSDK::Models::CreateCheckoutResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.create_checkout_request('1', '2', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: 400) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.create_checkout_request('1', '2', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: 500) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.create_checkout_request('1', '2', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.create_checkout_request(nil, '2', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.create_checkout_request('1', nil, payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
      end
    end
  end

  describe '#get_checkout_request' do
    let(:expected_response) { PCPServerSDK::Models::CheckoutResponse.new }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: 200) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.get_checkout_request('1', '2', '3')
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: 400) }

      before do
        allow(client).to receive(:get_response).and_return(response)
  
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.get_checkout_request('1', '2', '3') }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: 500) }

      before do
        allow(client).to receive(:get_response).and_return(response)

      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.get_checkout_request('1', '2', '3') }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.get_checkout_request(nil, '2', '3') }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.get_checkout_request('1', nil, '3') }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.get_checkout_request('1', '2', nil) }.to raise_error(TypeError, 'Checkout ID is required')
      end
    end
  end

  describe '#get_checkouts_request' do
    let(:expected_response) { PCPServerSDK::Models::CheckoutsResponse.new }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: 200) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.get_checkouts_request('1')
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: 400) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.get_checkouts_request('1') }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: 500) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.get_checkouts_request('1') }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when merchant_id is nil' do
      it 'raises a TypeError' do
        expect { client.get_checkouts_request(nil) }.to raise_error(TypeError, 'Merchant ID is required')
      end
    end
  end

  describe '#update_checkout_request' do
    let(:payload) { double('PCPServerSDK::Models::PatchCheckoutRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: 200) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'does not raise an error' do
        expect { client.update_checkout_request('1', '2', '3', payload) }.not_to raise_error
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: 400) }

      before do
        allow(client).to receive(:get_response).and_return(response)    
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.update_checkout_request('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: 500) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.update_checkout_request('1', '2', '3', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.update_checkout_request(nil, '2', '3', payload) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.update_checkout_request('1', nil, '3', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.update_checkout_request('1', '2', nil, payload) }.to raise_error(TypeError, 'Checkout ID is required')
        expect { client.update_checkout_request('1', '2', '3', nil) }.to raise_error(TypeError, 'Payload is required')
      end
    end
  end

  describe '#remove_checkout_request' do
    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: 200) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'does not raise an error' do
        expect { client.remove_checkout_request('1', '2', '3') }.not_to raise_error
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: 400) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.remove_checkout_request('1', '2', '3') }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: error_body, code: 500) }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.remove_checkout_request('1', '2', '3') }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.remove_checkout_request(nil, '2', '3') }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.remove_checkout_request('1', nil, '3') }.to raise_error(TypeError, 'Commerce Case ID is required')
        expect { client.remove_checkout_request('1', '2', nil) }.to raise_error(TypeError, 'Checkout ID is required')
      end
    end
  end
end
