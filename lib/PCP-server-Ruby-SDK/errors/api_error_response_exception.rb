require_relative '../models/api_error'
require_relative 'api_exception'

class ApiErrorResponseException < ApiException
  attr_reader :errors

  def initialize(status_code, response_body, errors = [])
    super(status_code, response_body)
    @errors = errors.any? ? errors : []
  end

  def get_errors
    @errors
  end
end
