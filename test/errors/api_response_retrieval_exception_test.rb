require 'test_helper'

require_relative '../../lib/PCP-server-Ruby-SDK/errors/api_response_retrieval_exception'

class TestApiResponseRetrievalException < Minitest::Test
  def setup
    @status_code = 500
    @response_body = "Internal Server Error"
    @cause = StandardError.new("Original error")
  end

  def test_initialize_sets_attributes
    exception = ApiResponseRetrievalException.new(@status_code, @response_body)
    assert_equal @status_code, exception.status_code
    assert_equal @response_body, exception.response_body
  end

  def test_initialize_with_cause_sets_backtrace
    @cause.set_backtrace(["line 1", "line 2"])
    exception = ApiResponseRetrievalException.new(@status_code, @response_body, @cause)
    assert_equal @cause.backtrace, exception.backtrace
  end

  def test_inherits_from_api_exception
    exception = ApiResponseRetrievalException.new(@status_code, @response_body)
    assert_kind_of ApiException, exception
  end
end