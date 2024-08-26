require 'test_helper'

require_relative '../../lib/PCP-server-Ruby-SDK/errors/api_error_response_exception'

class TestApiErrorResponseException < Minitest::Test
  def setup
    @status_code = 500
    @response_body = "Internal Server Error"
    @errors = ["Error 1", "Error 2"]
  end

  def test_initialize_sets_attributes
    exception = ApiErrorResponseException.new(@status_code, @response_body, @errors)
    assert_equal @status_code, exception.status_code
    assert_equal @response_body, exception.response_body
    assert_equal @errors, exception.errors
  end

  def test_initialize_with_empty_errors
    exception = ApiErrorResponseException.new(@status_code, @response_body)
    assert_equal [], exception.errors
  end

  def test_get_errors_returns_errors
    exception = ApiErrorResponseException.new(@status_code, @response_body, @errors)
    assert_equal @errors, exception.get_errors
  end

  def test_get_errors_returns_empty_array_when_no_errors
    exception = ApiErrorResponseException.new(@status_code, @response_body)
    assert_equal [], exception.get_errors
  end
end