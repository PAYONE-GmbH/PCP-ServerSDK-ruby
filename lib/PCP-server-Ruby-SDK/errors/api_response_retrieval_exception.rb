require_relative 'api_exception'

class ApiResponseRetrievalException < ApiException
  def initialize(status_code, response_body, cause = nil)
    super(status_code, response_body, cause)
  end
end
