

require 'spec_helper'
require 'net/http'
require 'json'
require_relative '../../lib/PCP-server-Ruby-SDK.rb'


RSpec.describe PCPServerSDK::Endpoints::AuthenticationApiClient do
  let(:config) { double('PCPServerSDK::CommunicatorConfiguration', api_key: '', api_secret: '', host: 'https://api.example.com') }
  let(:client) { PCPServerSDK::Endpoints::AuthenticationApiClient.new(config) }

  describe '#get_authentication_tokens' do
    let(:merchant_id) { 'merchant123' }
    let(:request_id) { 'req-456' }
    let(:success_response_body) {
      {
        token: 'jwt-token',
        id: 'uuid-123',
        creationDate: '2025-07-10T12:00:00Z',
        expirationDate: '2025-07-10T12:10:00Z'
      }.to_json
    }
    let(:error_body) {
      PCPServerSDK::Models::ErrorResponse.new(
        error_id: '1',
        errors: [PCPServerSDK::Models::APIError.new(error_code: '1', message: 'Error 1')]
      ).to_body.to_json
    }

    context 'when request is successful' do
      let(:response) { double('Response', body: success_response_body, code: 200) }

      before do
        allow(client).to receive(:post).and_return(response)
      end

      it 'returns an AuthenticationToken' do
        token = client.get_authentication_tokens(merchant_id, request_id)
        expect(token).to be_a(PCPServerSDK::Models::AuthenticationToken)
        expect(token.token).to eq('jwt-token')
        expect(token.id).to eq('uuid-123')
        expect(token.creation_date).to be_a(Time)
        expect(token.expiration_date).to be_a(Time)
      end
    end

    context 'when request is unsuccessful (400)' do
      let(:response) { double('Response', body: error_body, code: 400) }

      before do
        allow(client).to receive(:post).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiErrorResponseException' do
        expect { client.get_authentication_tokens(merchant_id, request_id) }.to raise_error(PCPServerSDK::Errors::ApiErrorResponseException)
      end
    end

    context 'when request is unsuccessful (500)' do
      let(:response) { double('Response', body: '{}', code: 500) }

      before do
        allow(client).to receive(:post).and_return(response)
      end

      it 'raises an PCPServerSDK::Errors::ApiResponseRetrievalException' do
        expect { client.get_authentication_tokens(merchant_id, request_id) }.to raise_error(PCPServerSDK::Errors::ApiResponseRetrievalException)
      end
    end

    context 'when merchant_id is nil' do
      it 'raises an ArgumentError' do
        expect { client.get_authentication_tokens(nil) }.to raise_error(ArgumentError)
      end
    end
  end
end
