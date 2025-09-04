
module PCPServerSDK
  class CommunicatorConfiguration
    attr_reader :api_key, :api_secret, :host
    attr_accessor :http_client

    # The constructor
    # @param [String] api_key
    # @param [String] api_secret
    # @param [String] host
    # @param [Net::HTTP, Proc, nil] http_client Optional HTTP client instance or factory proc
    def initialize(api_key, api_secret, host, http_client = nil)
      @api_key = api_key
      @api_secret = api_secret
      @host = host
      @http_client = http_client
    end
  end
end
