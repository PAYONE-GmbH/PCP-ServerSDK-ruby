require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK/errors/api_response_retrieval_exception'

RSpec.describe PCPServerSDK::Errors::ApiResponseRetrievalException do
  before(:each) do
    @status_code = 500
    @response_body = "Internal Server Error"
    @cause = StandardError.new("Original error")
  end

  describe "#initialize" do
    it "sets attributes" do
      exception = PCPServerSDK::Errors::ApiResponseRetrievalException.new(@status_code, @response_body)
      expect(exception.status_code).to eq(@status_code)
      expect(exception.response_body).to eq(@response_body)
    end

    it "sets backtrace when initialized with cause" do
      @cause.set_backtrace(["line 1", "line 2"])
      exception = PCPServerSDK::Errors::ApiResponseRetrievalException.new(@status_code, @response_body, @cause)
      expect(exception.backtrace).to eq(@cause.backtrace)
    end
  end

  describe "inheritance" do
    it "inherits from ApiException" do
      exception = PCPServerSDK::Errors::ApiResponseRetrievalException.new(@status_code, @response_body)
      expect(exception).to be_kind_of(PCPServerSDK::Errors::ApiException)
    end
  end
end
