require 'test_helper'
require_relative '../lib/PCP-server-Ruby-SDK/request_header_generator'

class TestRequestHeaderGenerator < Minitest::Test
  def setup 
    @TEST_API_KEY = 'KEY'
    @TEST_API_SECRET = 'Super duper Ethan Hunt level secret'
    @TEST_URL = 'awesome-api.com'

    @config = CommunicatorConfiguration.new(@TEST_API_KEY, @TEST_API_SECRET, @TEST_URL)
    @generator = RequestHeaderGenerator.new(@config)
  end

  def test_initialize_sets_config
    assert_equal @config, @generator.instance_variable_get(:@config)
  end

  def test_signature_generation_for_get 
    request_header_generator = RequestHeaderGenerator.new(@config)

    headers = {
      RequestHeaderGenerator::DATE_HEADER_NAME => Time.at(1720520499000 / 1000).httpdate,
      RequestHeaderGenerator::SERVER_META_INFO_HEADER_NAME => 'server fixed',
      RequestHeaderGenerator::CLIENT_META_INFO_HEADER_NAME => 'client fixed'
    }

    updated_request = request_header_generator.generate_additional_request_headers('http://awesome-api.com/v1/commerce_cases', { method: :get, headers: headers })

    updated_headers = updated_request[:headers]
    auth_header = updated_headers[RequestHeaderGenerator::AUTHORIZATION_HEADER_NAME]

    assert_equal 'GCS v1HMAC:KEY:ZSq7H19dyhyNGSPY5UgyPwITc5n4QG+zHnNDExIa6A8=', auth_header
  end

  def test_signature_generation_with_content_type
    request_header_generator = RequestHeaderGenerator.new(@config)

    headers = {
      RequestHeaderGenerator::CONTENT_TYPE_HEADER_NAME => 'application/json; charset=utf-8',
      RequestHeaderGenerator::DATE_HEADER_NAME => Time.at(1720520499000 / 1000).httpdate,
      RequestHeaderGenerator::SERVER_META_INFO_HEADER_NAME => 'server fixed',
      RequestHeaderGenerator::CLIENT_META_INFO_HEADER_NAME => 'client fixed',
    }

    updated_request = request_header_generator.generate_additional_request_headers('http://awesome-api.com/v1/commerce_cases', { method: :post, headers: headers })

    updated_headers = updated_request[:headers]
    auth_header = updated_headers[RequestHeaderGenerator::AUTHORIZATION_HEADER_NAME]

    assert_equal 'GCS v1HMAC:KEY:c5aNDw4AUxRChugRyN0OmTCs38YLA9E/tR+k0bOQzyk=', auth_header
  end

  def test_add_date_header_if_missing
    request_header_generator = RequestHeaderGenerator.new(@config)

    headers = {}

    updated_request = request_header_generator.generate_additional_request_headers('http://awesome-api.com/v1/commerce_cases', { method: :post, headers: headers })

    updated_headers = updated_request[:headers]
    date_header = updated_headers[RequestHeaderGenerator::DATE_HEADER_NAME]

    refute_nil date_header
    refute_empty date_header
  end

  def test_add_server_meta_info_header_if_missing
    request_header_generator = RequestHeaderGenerator.new(@config)

    headers = {}

    updated_request = request_header_generator.generate_additional_request_headers('http://awesome-api.com/v1/commerce_cases', { method: :post, headers: headers })

    updated_headers = updated_request[:headers]
    server_meta_info_header = updated_headers[RequestHeaderGenerator::SERVER_META_INFO_HEADER_NAME]

    refute_nil server_meta_info_header
    refute_empty server_meta_info_header

    json_string = ServerMetaInfo.new.to_json
    base64 = Base64.strict_encode64(json_string)

    assert_equal base64, server_meta_info_header
  end

  def test_add_client_meta_info_header_if_missing
    request_header_generator = RequestHeaderGenerator.new(@config)

    headers = {}

    updated_request = request_header_generator.generate_additional_request_headers('http://awesome-api.com/v1/commerce_cases', { method: :post, headers: headers })

    updated_headers = updated_request[:headers]
    client_meta_info_header = updated_headers[RequestHeaderGenerator::CLIENT_META_INFO_HEADER_NAME]

    refute_nil client_meta_info_header
    refute_empty client_meta_info_header

    json_string = JSON.pretty_generate('[]')
    base64 = Base64.strict_encode64(json_string)

    assert_equal base64, client_meta_info_header
  end
end
