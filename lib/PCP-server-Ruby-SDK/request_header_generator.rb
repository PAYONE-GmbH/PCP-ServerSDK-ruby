require 'openssl'
require 'time'
require 'uri'
require 'base64'
require 'json'
require_relative 'communicator_configuration'
require_relative 'utils/server_meta_info'
module PCPServerSDK
  
  class RequestHeaderGenerator
    SERVER_META_INFO_HEADER_NAME = 'X-GCS-ServerMetaInfo'
    CLIENT_META_INFO_HEADER_NAME = 'X-GCS-ClientMetaInfo'
    AUTHORIZATION_HEADER_NAME = 'Authorization'
    DATE_HEADER_NAME = 'Date'
    CONTENT_TYPE_HEADER_NAME = 'Content-Type'
    ALGORITHM = 'sha256'
    WHITESPACE_REGEX = /\r?\n[h]*/.freeze

    def initialize(config)
      @config = config
    end

    def generate_additional_request_headers(url, request)
      headers = request[:headers] || {}

      headers[DATE_HEADER_NAME] ||= Time.now.utc.httpdate
      headers[SERVER_META_INFO_HEADER_NAME] ||= get_server_meta_info
      headers[CLIENT_META_INFO_HEADER_NAME] ||= get_client_meta_info
      headers[AUTHORIZATION_HEADER_NAME] ||= get_auth_header(url, request, headers)

      request.merge(headers: headers)
    end

  private

    def get_auth_header(url, request, headers)
      # 1. method
      string_to_sign = "#{request[:method].to_s.upcase}\n"
      # 2. Content-Type
      string_to_sign += "#{headers[CONTENT_TYPE_HEADER_NAME]}" if headers[CONTENT_TYPE_HEADER_NAME]
      string_to_sign += "\n"
      # 3. Date
      string_to_sign += "#{headers[DATE_HEADER_NAME]}\n"
      # 4. Canonicalized Headers (starting with X-GCS, sorted by names)
      if headers[CLIENT_META_INFO_HEADER_NAME]
        string_to_sign += "#{CLIENT_META_INFO_HEADER_NAME.downcase}:#{headers[CLIENT_META_INFO_HEADER_NAME].gsub(WHITESPACE_REGEX, ' ').strip}\n"
      end
      if headers[SERVER_META_INFO_HEADER_NAME]
        string_to_sign += "#{SERVER_META_INFO_HEADER_NAME.downcase}:#{headers[SERVER_META_INFO_HEADER_NAME].gsub(WHITESPACE_REGEX, ' ').strip}\n"
      end
      # 5. Canonicalized Resource (has to include query parameters)
      uri = URI.parse(url)
      string_to_sign += uri.path
      string_to_sign += uri.query ? "?#{uri.query}" : ''
      string_to_sign += "\n"

      signature = sign(string_to_sign)
      "GCS v1HMAC:#{@config.api_key}:#{signature}"
    end

    def sign(target)
      hmac = OpenSSL::HMAC.digest(OpenSSL::Digest.new(ALGORITHM), @config.api_secret, target)
      Base64.strict_encode64(hmac)
    end

    def get_server_meta_info
      meta = PCPServerSDK::Utils::ServerMetaInfo.new
      json_string = meta.to_json
      Base64.strict_encode64(json_string)
    end

    def get_client_meta_info
      Base64.strict_encode64('"[]"')
    end
  end
end
