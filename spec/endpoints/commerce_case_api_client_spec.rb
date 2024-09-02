require 'spec_helper'
require 'net/http'
require 'json'
require_relative '../../lib/PCP-server-Ruby-SDK.rb'


RSpec.describe PCPServerSDK::Endpoints::CommerceCaseApiClient do
  let(:config) { double("PCPServerSDK::CommunicatorConfiguration", api_key: "", api_secret: "", host: 'https://api.example.com') }
  let(:client) { described_class.new(config) }
  let(:error_body) {
    PCPServerSDK::Models::ErrorResponse.new(
      errors: [PCPServerSDK::Models::APIError.new(error_code: '1', message: 'Error 1').to_body]
    ).to_body.to_json
  }

  describe '#create_commerce_case_request' do
    let(:payload) { double('PCPServerSDK::Models::CreateCommerceCaseRequest') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }
      let(:expected_response) { PCPServerSDK::Models::CreateCommerceCaseResponse.new }

      before do
        allow(client).to receive(:get_response).and_return(response)
        allow(PCPServerSDK::Models::CreateCommerceCaseResponse).to receive(:new).and_return(expected_response)
      end

      it 'returns a successful response' do
        result = client.create_commerce_case_request('1', payload)
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.create_commerce_case_request('1', payload) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: '{}', code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiResponseRetrievalException' do
        expect { client.create_commerce_case_request('1', payload) }.to raise_error(PCPServerSDK::Errors::ApiResponseRetrievalException)
      end
    end

    context 'when merchant_id is nil' do
      it 'raises a TypeError' do
        expect { client.create_commerce_case_request(nil, payload) }.to raise_error(TypeError, 'Merchant ID is required')
      end
    end
  end

  describe '#get_commerce_case_request' do
    let(:expected_response) { PCPServerSDK::Models::CommerceCaseResponse.new }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.get_commerce_case_request('1', '2')
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.get_commerce_case_request('1', '2') }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: '{}', code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiResponseRetrievalException' do
        expect { client.get_commerce_case_request('1', '2') }.to raise_error(PCPServerSDK::Errors::ApiResponseRetrievalException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.get_commerce_case_request(nil, '2') }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.get_commerce_case_request('1', nil) }.to raise_error(TypeError, 'Commerce Case ID is required')
      end
    end
  end

  describe '#get_commerce_cases_request' do
    let(:expected_response) { [PCPServerSDK::Models::CommerceCaseResponse.new] }

    context 'when request is successful' do
      let(:response) { double('Response', body: "[#{PCPServerSDK::Models::CommerceCaseResponse.new.to_body}]", code: '200') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'returns a successful response' do
        result = client.get_commerce_cases_request('1')
        expect(result).to eq(expected_response)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.get_commerce_cases_request('1') }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: '{}', code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiResponseRetrievalException' do
        expect { client.get_commerce_cases_request('1') }.to raise_error(PCPServerSDK::Errors::ApiResponseRetrievalException)
      end
    end

    context 'when merchant_id is nil' do
      it 'raises a TypeError' do
        expect { client.get_commerce_cases_request(nil) }.to raise_error(TypeError, 'Merchant ID is required')
      end
    end
  end

  describe '#update_commerce_case_request' do
    let(:customer) { double('PCPServerSDK::Models::Customer') }

    context 'when request is successful' do
      let(:response) { double('Response', body: '{}', code: '200') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'does not raise an error' do
        expect { client.update_commerce_case_request('1', '2', customer) }.not_to raise_error
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: '400') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.update_commerce_case_request('1', '2', customer) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: '{}', code: '500') }

      before do
        allow(client).to receive(:get_response).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiResponseRetrievalException' do
        expect { client.update_commerce_case_request('1', '2', customer) }.to raise_error(PCPServerSDK::Errors::ApiResponseRetrievalException)
      end
    end

    context 'when some params are nil' do
      it 'raises a TypeError' do
        expect { client.update_commerce_case_request(nil, '2', customer) }.to raise_error(TypeError, 'Merchant ID is required')
        expect { client.update_commerce_case_request('1', nil, customer) }.to raise_error(TypeError, 'Commerce Case ID is required')
      end
    end
  end
end
