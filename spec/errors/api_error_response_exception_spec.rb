require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK/errors/api_error_response_exception'

RSpec.describe PCPServerSDK::Errors::ApiErrorResponseException do
  let(:status_code) { 500 }
  let(:response_body) { "Internal Server Error" }
  let(:errors) { ["Error 1", "Error 2"] }

  describe "#initialize" do
    it "sets attributes" do
      exception = PCPServerSDK::Errors::ApiErrorResponseException.new(status_code, response_body, errors)
      expect(exception.status_code).to eq(status_code)
      expect(exception.response_body).to eq(response_body)
      expect(exception.errors).to eq(errors)
    end

    it "sets empty errors when not provided" do
      exception = PCPServerSDK::Errors::ApiErrorResponseException.new(status_code, response_body)
      expect(exception.errors).to eq([])
    end
  end

  describe "#get_errors" do
    it "returns errors" do
      exception = PCPServerSDK::Errors::ApiErrorResponseException.new(status_code, response_body, errors)
      expect(exception.get_errors).to eq(errors)
    end

    it "returns empty array when no errors" do
      exception = PCPServerSDK::Errors::ApiErrorResponseException.new(status_code, response_body)
      expect(exception.get_errors).to eq([])
    end
  end
end
