require 'test_helper'

require_relative '../../lib/PCP-server-Ruby-SDK/errors/api_exception'

class TestApiException < Minitest::Test
  def setup
    @status_code = 404
    @response_body = "Not Found"
    @cause = StandardError.new("Original error")
    @cause.set_backtrace(["line 1", "line 2"])
  end

  def test_initialize_sets_attributes
    exception = ApiException.new(@status_code, @response_body)
    assert_equal @status_code, exception.status_code
    assert_equal @response_body, exception.response_body
  end

  def test_initialize_with_cause_sets_backtrace
    exception = ApiException.new(@status_code, @response_body, @cause)
    assert_equal @cause.backtrace, exception.backtrace
  end

  def test_to_s_returns_message
    exception = ApiException.new(@status_code, @response_body)
    expected_message = "Error message: the server returns an error\nHTTP status code: #{@status_code}\nResponse body: #{@response_body}"
    assert_equal expected_message, exception.to_s
  end

  def test_message_returns_default_message_when_nil
    exception = ApiException.new(@status_code, nil)
    expected_message = "Error message: the server returns an error\nHTTP status code: #{@status_code}"
    assert_equal expected_message, exception.message
  end
end
