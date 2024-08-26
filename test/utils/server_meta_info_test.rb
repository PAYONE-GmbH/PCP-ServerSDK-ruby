require 'minitest/autorun'

require_relative '../../lib/PCP-server-Ruby-SDK/utils/server_meta_info'

class TestServerMetaInfo < Minitest::Test
  def setup
    @server_meta_info = ServerMetaInfo.new('TestIntegrator')
  end

  def test_initialize_sets_platform_identifier
    expected_platform_identifier = "#{RbConfig::CONFIG['host_os']}, ruby version is: #{RUBY_VERSION}"
    assert_equal expected_platform_identifier, @server_meta_info.platform_identifier
  end

  def test_initialize_sets_sdk_identifier
    assert_equal 'RubyServerSDK/v1.0.0', @server_meta_info.sdk_identifier
  end

  def test_initialize_sets_sdk_creator
    assert_equal 'PAYONE GmbH', @server_meta_info.sdk_creator
  end

  def test_initialize_sets_integrator
    assert_equal 'TestIntegrator', @server_meta_info.integrator
  end

  def test_to_json_includes_platform_identifier
    json_output = JSON.parse(@server_meta_info.to_json)
    expected_platform_identifier = "#{RbConfig::CONFIG['host_os']}, ruby version is: #{RUBY_VERSION}"
    assert_equal expected_platform_identifier, json_output['platform_identifier']
  end

  def test_to_json_includes_sdk_identifier
    json_output = JSON.parse(@server_meta_info.to_json)
    assert_equal 'RubyServerSDK/v1.0.0', json_output['sdk_identifier']
  end

  def test_to_json_includes_sdk_creator
    json_output = JSON.parse(@server_meta_info.to_json)
    assert_equal 'PAYONE GmbH', json_output['sdk_creator']
  end

  def test_to_json_includes_integrator
    json_output = JSON.parse(@server_meta_info.to_json)
    assert_equal 'TestIntegrator', json_output['integrator']
  end
end