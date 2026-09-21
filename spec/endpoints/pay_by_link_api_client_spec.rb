require 'spec_helper'
require 'net/http'
require 'json'
require_relative '../../lib/PCP-server-Ruby-SDK.rb'

RSpec.describe PCPServerSDK::Endpoints::PayByLinkApiClient do
  let(:config) { mock_communicator_config }
  let(:client) { described_class.new(config) }
  let(:payload) { double('PCPServerSDK::Models::CreatePayByLinkRequest') }
  let(:response) do
    double(
      'Response',
      body: '{"status":"ACTIVE","paymentLinkId":"707ef15b-7a0a-48f2-b7d8-c95103418a9c"}',
      code: 201
    )
  end

  before do
    allow(client).to receive(:get_response).and_return(response)
  end

  describe '#create_pay_by_link_request' do
    it 'posts to the pay-by-link endpoint and deserializes its response' do
      result = client.create_pay_by_link_request('1', '2', '3', payload)

      expect(result).to be_a(PCPServerSDK::Models::CreatePayByLinkResponse)
      expect(result.status).to eq('ACTIVE')
      expect(result.payment_link_id).to eq('707ef15b-7a0a-48f2-b7d8-c95103418a9c')
    end

    it 'requires all path parameters and the payload' do
      expect { client.create_pay_by_link_request(nil, '2', '3', payload) }.to raise_error(TypeError, 'Merchant ID is required')
      expect { client.create_pay_by_link_request('1', nil, '3', payload) }.to raise_error(TypeError, 'Commerce Case ID is required')
      expect { client.create_pay_by_link_request('1', '2', nil, payload) }.to raise_error(TypeError, 'Checkout ID is required')
      expect { client.create_pay_by_link_request('1', '2', '3', nil) }.to raise_error(TypeError, 'Payload is required')
    end
  end
end
