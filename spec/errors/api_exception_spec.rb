require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK/errors/api_exception'

RSpec.describe PCPServerSDK::Errors::ApiException do
  let(:status_code) { 404 }
  let(:response_body) { "Not Found" }
  let(:cause) { StandardError.new("Original error") }

  describe '#initialize' do
    it 'sets attributes' do
      exception = PCPServerSDK::Errors::ApiException.new(status_code, response_body)
      expect(exception.status_code).to eq(status_code)
      expect(exception.response_body).to eq(response_body)
    end

    it 'sets backtrace when initialized with cause' do
      cause.set_backtrace(["line 1", "line 2"])
      exception = PCPServerSDK::Errors::ApiException.new(status_code, response_body, cause)
      expect(exception.backtrace).to eq(cause.backtrace)
    end
  end

  describe '#to_s' do
    it 'returns the error message' do
      exception = PCPServerSDK::Errors::ApiException.new(status_code, response_body)
      expected_message = "Error message: the server returns an error\nHTTP status code: #{status_code}\nResponse body: #{response_body}"
      expect(exception.to_s).to eq(expected_message)
    end

    it 'returns default message when response body is nil' do
      exception = PCPServerSDK::Errors::ApiException.new(status_code, nil)
      expected_message = "Error message: the server returns an error\nHTTP status code: #{status_code}"
      expect(exception.message).to eq(expected_message)
    end
  end
end
