require 'spec_helper'
require_relative '../lib/PCP-server-Ruby-SDK/request_header_generator'

RSpec.describe RequestHeaderGenerator do
  before(:each) do
    @TEST_API_KEY = 'KEY'
    @TEST_API_SECRET = 'Super duper Ethan Hunt level secret'
    @TEST_URL = 'awesome-api.com'

    @config = CommunicatorConfiguration.new(@TEST_API_KEY, @TEST_API_SECRET, @TEST_URL)
    @generator = RequestHeaderGenerator.new(@config)
  end

  describe '#initialize' do
    it 'sets the config' do
      expect(@generator.instance_variable_get(:@config)).to eq(@config)
    end
  end

  describe '#generate_additional_request_headers' do
    it 'generates signature for GET' do
      headers = {
        RequestHeaderGenerator::DATE_HEADER_NAME => Time.at(1720520499000 / 1000).httpdate,
        RequestHeaderGenerator::SERVER_META_INFO_HEADER_NAME => 'server fixed',
        RequestHeaderGenerator::CLIENT_META_INFO_HEADER_NAME => 'client fixed'
      }

      updated_request = @generator.generate_additional_request_headers('http://awesome-api.com/v1/commerce_cases', { method: :get, headers: headers })

      updated_headers = updated_request[:headers]
      auth_header = updated_headers[RequestHeaderGenerator::AUTHORIZATION_HEADER_NAME]

      expect(auth_header).to eq('GCS v1HMAC:KEY:ZSq7H19dyhyNGSPY5UgyPwITc5n4QG+zHnNDExIa6A8=')
    end

    it 'generates signature with content type' do
      headers = {
        RequestHeaderGenerator::CONTENT_TYPE_HEADER_NAME => 'application/json; charset=utf-8',
        RequestHeaderGenerator::DATE_HEADER_NAME => Time.at(1720520499000 / 1000).httpdate,
        RequestHeaderGenerator::SERVER_META_INFO_HEADER_NAME => 'server fixed',
        RequestHeaderGenerator::CLIENT_META_INFO_HEADER_NAME => 'client fixed',
      }

      updated_request = @generator.generate_additional_request_headers('http://awesome-api.com/v1/commerce_cases', { method: :post, headers: headers })

      updated_headers = updated_request[:headers]
      auth_header = updated_headers[RequestHeaderGenerator::AUTHORIZATION_HEADER_NAME]

      expect(auth_header).to eq('GCS v1HMAC:KEY:c5aNDw4AUxRChugRyN0OmTCs38YLA9E/tR+k0bOQzyk=')
    end

    it 'adds date header if missing' do
      headers = {}

      updated_request = @generator.generate_additional_request_headers('http://awesome-api.com/v1/commerce_cases', { method: :post, headers: headers })

      updated_headers = updated_request[:headers]
      date_header = updated_headers[RequestHeaderGenerator::DATE_HEADER_NAME]

      expect(date_header).not_to be_nil
      expect(date_header).not_to be_empty
    end

    it 'adds server meta info header if missing' do
      headers = {}

      updated_request = @generator.generate_additional_request_headers('http://awesome-api.com/v1/commerce_cases', { method: :post, headers: headers })

      updated_headers = updated_request[:headers]
      server_meta_info_header = updated_headers[RequestHeaderGenerator::SERVER_META_INFO_HEADER_NAME]

      expect(server_meta_info_header).not_to be_nil
      expect(server_meta_info_header).not_to be_empty

      json_string = ServerMetaInfo.new.to_json
      base64 = Base64.strict_encode64(json_string)

      expect(server_meta_info_header).to eq(base64)
    end

    it 'adds client meta info header if missing' do
      headers = {}

      updated_request = @generator.generate_additional_request_headers('http://awesome-api.com/v1/commerce_cases', { method: :post, headers: headers })

      updated_headers = updated_request[:headers]
      client_meta_info_header = updated_headers[RequestHeaderGenerator::CLIENT_META_INFO_HEADER_NAME]

      expect(client_meta_info_header).not_to be_nil
      expect(client_meta_info_header).not_to be_empty

      json_string = JSON.pretty_generate('[]')
      base64 = Base64.strict_encode64(json_string)

      expect(client_meta_info_header).to eq(base64)
    end
  end
end
