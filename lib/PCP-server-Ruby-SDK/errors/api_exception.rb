class ApiException < StandardError
  attr_reader :status_code, :response_body

  def initialize(status_code, response_body, cause = nil)
    super(response_body)
    @status_code = status_code
    @response_body = response_body
    set_backtrace(cause.backtrace) if cause
  end
end
