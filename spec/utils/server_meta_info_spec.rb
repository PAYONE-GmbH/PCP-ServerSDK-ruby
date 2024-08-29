require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK/utils/server_meta_info'

RSpec.describe PCPServerSDK::Utils::ServerMetaInfo do
  let(:integrator) { 'TestIntegrator' }
  let(:server_meta_info) { PCPServerSDK::Utils::ServerMetaInfo.new(integrator) }

  describe '#initialize' do
    it 'sets the platform identifier' do
      expected_platform_identifier = "#{RbConfig::CONFIG['host_os']}, ruby version is: #{RUBY_VERSION}"
      expect(server_meta_info.platform_identifier).to eq(expected_platform_identifier)
    end

    it 'sets the SDK identifier' do
      expect(server_meta_info.sdk_identifier).to eq('RubyServerSDK/v1.0.0')
    end

    it 'sets the SDK creator' do
      expect(server_meta_info.sdk_creator).to eq('PAYONE GmbH')
    end

    it 'sets the integrator' do
      expect(server_meta_info.integrator).to eq(integrator)
    end
  end

  describe '#to_json' do
    let(:json_output) { JSON.parse(server_meta_info.to_json) }

    it 'includes the platform identifier' do
      expected_platform_identifier = "#{RbConfig::CONFIG['host_os']}, ruby version is: #{RUBY_VERSION}"
      expect(json_output['platform_identifier']).to eq(expected_platform_identifier)
    end

    it 'includes the SDK identifier' do
      expect(json_output['sdk_identifier']).to eq('RubyServerSDK/v1.0.0')
    end

    it 'includes the SDK creator' do
      expect(json_output['sdk_creator']).to eq('PAYONE GmbH')
    end

    it 'includes the integrator' do
      expect(json_output['integrator']).to eq(integrator)
    end
  end
end
