require 'spec_helper'
require_relative '../lib/PCP-server-Ruby-SDK.rb'

RSpec.describe PCPServerSDK::CommunicatorConfiguration do
  let(:api_key) { 'test_api_key' }
  let(:api_secret) { 'test_api_secret' }
  let(:host) { 'test_host' }
  let(:config) { PCPServerSDK::CommunicatorConfiguration.new(api_key, api_secret, host) }

  describe '#initialize' do
    it 'sets api_key' do
      expect(config.api_key).to eq(api_key)
    end

    it 'sets api_secret' do
      expect(config.api_secret).to eq(api_secret)
    end

    it 'sets host' do
      expect(config.host).to eq(host)
    end

    it 'sets http_client to nil by default' do
      expect(config.http_client).to be_nil
    end

    context 'with custom http_client' do
      let(:custom_http_client) { Net::HTTP.new('example.com', 80) }
      let(:config_with_client) { PCPServerSDK::CommunicatorConfiguration.new(api_key, api_secret, host, custom_http_client) }

      it 'sets the custom http_client' do
        expect(config_with_client.http_client).to eq(custom_http_client)
      end
    end
  end

  describe '#http_client=' do
    it 'allows setting http_client after initialization' do
      custom_client = Net::HTTP.new('example.com', 80)
      config.http_client = custom_client
      expect(config.http_client).to eq(custom_client)
    end

    it 'allows setting http_client to a proc' do
      client_factory = proc { |uri| Net::HTTP.new(uri.host, uri.port) }
      config.http_client = client_factory
      expect(config.http_client).to eq(client_factory)
    end
  end
end
