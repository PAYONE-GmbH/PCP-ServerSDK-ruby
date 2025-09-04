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
PAYLOAD_REQUIRED_ERROR = 'Payload is required'


module PCPServerSDK
  module Endpoints
    class BaseApiClient
      attr_accessor :http_client

      def initialize(config, http_client = nil)
        @config = config
        @request_header_generator = RequestHeaderGenerator.new(config)
        @http_client = http_client
      end

    protected

      def get_config
        @config
      end

      # Make an API call
      # @param [String] url
      # @param [Hash] request_init
      def make_api_call(url, request_init)
        uri = URI.parse(url)
        http = get_http_client(uri)

        modified_request = @request_header_generator.generate_additional_request_headers(url, request_init || {})

        request = build_http_request(uri, modified_request)
        response = get_response(http, request)
        handle_error(response)

        JSON.parse(response.body)
      end

      def deserialize_json(json, klass)
        klass.build_from_hash((json))
      end

    private

      # Get the HTTP client with priority logic:
      # 1. Client-specific http_client (instance variable)
      # 2. Global http_client from configuration
      # 3. Default Net::HTTP client
      # @param [URI] uri
      # @return [Net::HTTP]
      def get_http_client(uri)
        # Priority 1: Client-specific HTTP client
        if @http_client
          return resolve_http_client(@http_client, uri)
        end

        # Priority 2: Global HTTP client from configuration
        if @config.http_client
          return resolve_http_client(@config.http_client, uri)
        end

        # Priority 3: Default HTTP client
        create_default_http_client(uri)
      end

      # Resolve HTTP client from various input types
      # @param [Net::HTTP, Proc, Object] client_or_factory
      # @param [URI] uri
      # @return [Net::HTTP]
      def resolve_http_client(client_or_factory, uri)
        case client_or_factory
        when Net::HTTP
          client_or_factory
        when Proc
          client_or_factory.call(uri)
        else
          # If it responds to call, treat it as a factory
          if client_or_factory.respond_to?(:call)
            client_or_factory.call(uri)
          else
            raise ArgumentError, "HTTP client must be a Net::HTTP instance, Proc, or respond to :call"
          end
        end
      end

      # Create default HTTP client
      # @param [URI] uri
      # @return [Net::HTTP]
      def create_default_http_client(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http
      end

      # Get the response
      # @param [Net::HTTP] http
      # @param [Net::HTTP::Request] request
      # @return [Net::HTTP::Response]
      def get_response(http, request)
        http.request(request)
      end

      def handle_error(response)
        if response.code.to_i.between?(200, 299)
          return
        end

        response_body = JSON.parse(response.body)
       
        if response_body.empty?
          raise PCPServerSDK::Errors::ApiResponseRetrievalException.new(response.code, response_body)
        end
    
        begin  
          error = deserialize_json(response_body, PCPServerSDK::Models::ErrorResponse)
          raise PCPServerSDK::Errors::ApiErrorResponseException.new(response.code, response_body, error.errors)
        rescue JSON::ParserError => e
          raise PCPServerSDK::Errors::ApiResponseRetrievalException.new(response.code, response_body, e)
        end
      end

      # Build an HTTP request
      # @param [URI] uri
      # @param [Hash] request_init
      # @return [Net::HTTP::Request]
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
    end
  end
end
