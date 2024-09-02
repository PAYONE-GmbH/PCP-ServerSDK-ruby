
module PCPServerSDK
  class CommunicatorConfiguration
    attr_reader :api_key, :api_secret, :host
  
    # The constructor
    # @param [String] api_key
    # @param [String] api_secret
    # @param [String] host
    def initialize(api_key, api_secret, host)
      @api_key = api_key
      @api_secret = api_secret
      @host = host
    end
  end  
end
