require 'test_helper'
require_relative '../lib/PCP-server-Ruby-SDK/communicator_configuration'

class TestCommunicatorConfiguration < Minitest::Test
  def setup
    @api_key = 'test_api_key'
    @api_secret = 'test_api_secret'
    @host = 'test_host'
    @config = CommunicatorConfiguration.new(@api_key, @api_secret, @host)
  end

  def test_initialize_sets_api_key
    assert_equal @api_key, @config.api_key
  end

  def test_initialize_sets_api_secret
    assert_equal @api_secret, @config.api_secret
  end

  def test_initialize_sets_host
    assert_equal @host, @config.host
  end
end