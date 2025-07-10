# frozen_string_literal: true

require 'spec_helper'
require 'pcp-server-ruby-sdk/endpoints/authentication_api_client'
require 'pcp-server-ruby-sdk/models/authentication_token'

describe PCPServerSDK::Endpoints::AuthenticationApiClient do
  let(:config) { double('CommunicatorConfiguration') }
  let(:client) { described_class.new(config) }

  describe '#get_authentication_tokens' do
    let(:merchant_id) { 'merchant123' }
    let(:request_id) { 'req-456' }
    let(:response_body) {
      {
        token: 'jwt-token',
        id: 'uuid-123',
        creationDate: '2025-07-10T12:00:00Z',
        expirationDate: '2025-07-10T12:10:00Z'
      }.to_json
    }

    before do
      allow(client).to receive(:build_url).and_return('https://api.test/auth')
      allow(client).to receive(:post).and_return(double('Response', body: response_body))
    end

    it 'returns an AuthenticationToken' do
      token = client.get_authentication_tokens(merchant_id, request_id)
      expect(token).to be_a(PCPServerSDK::Models::AuthenticationToken)
      expect(token.token).to eq('jwt-token')
      expect(token.id).to eq('uuid-123')
      expect(token.creation_date).to be_a(Time)
      expect(token.expiration_date).to be_a(Time)
    end

    it 'raises error if merchant_id is nil' do
      expect { client.get_authentication_tokens(nil) }.to raise_error(ArgumentError)
    end
  end
end
