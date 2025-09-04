require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK.rb'

RSpec.describe PCPServerSDK::Endpoints::BaseApiClient do
  let(:api_key) { 'test_api_key' }
  let(:api_secret) { 'test_api_secret' }
  let(:host) { 'https://api.example.com' }
  let(:config) { PCPServerSDK::CommunicatorConfiguration.new(api_key, api_secret, host) }
  let(:client) { PCPServerSDK::Endpoints::BaseApiClient.new(config) }

  describe '#initialize' do
    it 'sets the config' do
      expect(client.send(:get_config)).to eq(config)
    end

    it 'sets http_client to nil by default' do
      expect(client.http_client).to be_nil
    end

    context 'with custom http_client' do
      let(:custom_http_client) { Net::HTTP.new('example.com', 80) }
      let(:client_with_custom) { PCPServerSDK::Endpoints::BaseApiClient.new(config, custom_http_client) }

      it 'sets the custom http_client' do
        expect(client_with_custom.http_client).to eq(custom_http_client)
      end
    end
  end

  describe '#http_client=' do
    it 'allows setting http_client after initialization' do
      custom_client = Net::HTTP.new('example.com', 80)
      client.http_client = custom_client
      expect(client.http_client).to eq(custom_client)
    end
  end

  describe '#get_http_client (private method)' do
    let(:uri) { URI.parse('https://api.example.com/test') }

    context 'with client-specific http_client' do
      let(:client_specific_http) { Net::HTTP.new('client.example.com', 443) }

      before do
        client.http_client = client_specific_http
      end

      it 'returns the client-specific http client' do
        result = client.send(:get_http_client, uri)
        expect(result).to eq(client_specific_http)
      end

      it 'prioritizes client-specific over global configuration' do
        global_http = Net::HTTP.new('global.example.com', 443)
        config.http_client = global_http
        
        result = client.send(:get_http_client, uri)
        expect(result).to eq(client_specific_http)
      end
    end

    context 'with global http_client in configuration' do
      let(:global_http) { Net::HTTP.new('global.example.com', 443) }

      before do
        config.http_client = global_http
      end

      it 'returns the global http client when no client-specific client is set' do
        result = client.send(:get_http_client, uri)
        expect(result).to eq(global_http)
      end
    end

    context 'with proc-based http_client factory' do
      let(:http_factory) do
        proc do |uri|
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = uri.scheme == 'https'
          http.read_timeout = 30
          http
        end
      end

      before do
        client.http_client = http_factory
      end

      it 'calls the proc with the URI and returns the result' do
        result = client.send(:get_http_client, uri)
        expect(result).to be_a(Net::HTTP)
        expect(result.address).to eq('api.example.com')
        expect(result.port).to eq(443)
        expect(result.use_ssl?).to be true
        expect(result.read_timeout).to eq(30)
      end
    end

    context 'with callable object as http_client factory' do
      let(:http_factory) do
        Class.new do
          def call(uri)
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = uri.scheme == 'https'
            http.open_timeout = 10
            http
          end
        end.new
      end

      before do
        config.http_client = http_factory
      end

      it 'calls the callable object with the URI and returns the result' do
        result = client.send(:get_http_client, uri)
        expect(result).to be_a(Net::HTTP)
        expect(result.address).to eq('api.example.com')
        expect(result.port).to eq(443)
        expect(result.use_ssl?).to be true
        expect(result.open_timeout).to eq(10)
      end
    end

    context 'with default http_client (no customization)' do
      it 'creates a default Net::HTTP client' do
        result = client.send(:get_http_client, uri)
        expect(result).to be_a(Net::HTTP)
        expect(result.address).to eq('api.example.com')
        expect(result.port).to eq(443)
        expect(result.use_ssl?).to be true
      end
    end

    context 'with invalid http_client' do
      before do
        client.http_client = "invalid_client"
      end

      it 'raises an ArgumentError' do
        expect {
          client.send(:get_http_client, uri)
        }.to raise_error(ArgumentError, /HTTP client must be a Net::HTTP instance, Proc, or respond to :call/)
      end
    end
  end

  describe '#resolve_http_client (private method)' do
    let(:uri) { URI.parse('https://api.example.com/test') }

    context 'with Net::HTTP instance' do
      let(:http_instance) { Net::HTTP.new('example.com', 80) }

      it 'returns the instance directly' do
        result = client.send(:resolve_http_client, http_instance, uri)
        expect(result).to eq(http_instance)
      end
    end

    context 'with Proc' do
      let(:http_proc) { proc { |uri| Net::HTTP.new(uri.host, uri.port) } }

      it 'calls the proc with the URI' do
        result = client.send(:resolve_http_client, http_proc, uri)
        expect(result).to be_a(Net::HTTP)
        expect(result.address).to eq('api.example.com')
        expect(result.port).to eq(443)
      end
    end

    context 'with callable object' do
      let(:callable) do
        Class.new do
          def call(uri)
            Net::HTTP.new(uri.host, uri.port)
          end
        end.new
      end

      it 'calls the object with the URI' do
        result = client.send(:resolve_http_client, callable, uri)
        expect(result).to be_a(Net::HTTP)
        expect(result.address).to eq('api.example.com')
        expect(result.port).to eq(443)
      end
    end

    context 'with invalid object' do
      it 'raises an ArgumentError' do
        expect {
          client.send(:resolve_http_client, "invalid", uri)
        }.to raise_error(ArgumentError, /HTTP client must be a Net::HTTP instance, Proc, or respond to :call/)
      end
    end
  end

  describe '#create_default_http_client (private method)' do
    context 'with HTTPS URI' do
      let(:uri) { URI.parse('https://api.example.com/test') }

      it 'creates an HTTPS-enabled client' do
        result = client.send(:create_default_http_client, uri)
        expect(result).to be_a(Net::HTTP)
        expect(result.address).to eq('api.example.com')
        expect(result.port).to eq(443)
        expect(result.use_ssl?).to be true
      end
    end

    context 'with HTTP URI' do
      let(:uri) { URI.parse('http://api.example.com/test') }

      it 'creates an HTTP client' do
        result = client.send(:create_default_http_client, uri)
        expect(result).to be_a(Net::HTTP)
        expect(result.address).to eq('api.example.com')
        expect(result.port).to eq(80)
        expect(result.use_ssl?).to be false
      end
    end
  end
end
