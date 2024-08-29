require 'net/http'
require 'json'
require 'uri'

require_relative '../communicator_configuration'
require_relative '../request_header_generator'
require_relative '../errors/api_error_response_exception'
require_relative '../errors/api_response_retrieval_exception'

MERCHANT_ID_REQUIRED_ERROR = 'Merchant ID is required'
COMMERCE_CASE_ID_REQUIRED_ERROR = 'Commerce Case ID is required'
CHECKOUT_ID_REQUIRED_ERROR = 'Checkout ID is required'


module PCPServerSDK
  module Endpoints
    
    class BaseApiClient
      def initialize(config)
        @config = config
        @request_header_generator = RequestHeaderGenerator.new(config)
      end

    protected

      def get_request_header_generator
        @request_header_generator
      end

      def get_config
        @config
      end

      # Make an API call
      # @param [String] url
      # @param [Hash] request_init
      def make_api_call(url, request_init)
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        
        modified_request = @request_header_generator.generate_additional_request_headers(url, request_init || {})
        
        request = build_http_request(uri, modified_request)
        response = http.request(request)
        
        body = response.body

        begin
          parsed = JSON.parse(body)
        rescue StandardError => e
          raise PCPServerSDK::Errors::ApiResponseRetrievalException.new(response.code.to_i, parsed, e)
        end
        
        unless response.is_a?(Net::HTTPSuccess)
          if is_error_response(body)
            begin
              parsedError = deserialize_json(parsed, PCPServerSDK::Models::ErrorResponse)
              raise PCPServerSDK::Errors::ApiErrorResponseException.new(response.code.to_i, body, parsedError.errors)
            rescue StandardError => e
              raise PCPServerSDK::Errors::ApiResponseRetrievalException.new(response.code.to_i, parsed, e)
            end            
          else
            raise PCPServerSDK::Errors::ApiResponseRetrievalException.new(response.code.to_i, body)
          end
        end
        
        parsed
      end


      def deserialize_json(json, klass)
        klass.build_from_hash((json))
      end

    private

      def build_http_request(uri, request_init)
        method = request_init[:method].to_s.upcase

        case method
        when 'GET'
          req = Net::HTTP::Get.new(uri)
        when 'POST'
          req = Net::HTTP::Post.new(uri)
          req.body = request_init[:body] if request_init[:body]
        when 'PATCH'
          req = Net::HTTP::Patch.new(uri)
          req.body = request_init[:body] if request_init[:body]
        when 'DELETE'
          req = Net::HTTP::Delete.new(uri)
        else
          raise ArgumentError, "Unsupported HTTP method: #{method}"
        end

        request_init[:headers].each do |key, value|
          req[key] = value
        end

        req
      end

      def is_error_response(parsed)
        return false unless parsed.is_a?(Hash)
        
        if parsed.key?('errorId') && !parsed['errorId'].is_a?(String)
          return false
        end
        if parsed.key?('errors') && !parsed['errors'].is_a?(Array)
          return false
        end
        true
      end
    end
  end
end
