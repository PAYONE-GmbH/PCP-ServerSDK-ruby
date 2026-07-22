require_relative 'model_base'

module PCPServerSDK
  module Models
    class CustomerDevice < ModelBase
      # The accept-header of the customer client from the HTTP Headers.
      # This field can be mandatory depending on the selected payment method and routing option.
      attribute :accept_header, :acceptHeader, :String
      # The IP address of the customer client from the HTTP Headers.
      attribute :ip_address, :ipAddress, :String
      # Tokenized representation of the end customers device. For example used for PAYONE Buy Now, Pay Later (BNPL).
      attribute :device_token, :deviceToken, :String
      # User-Agent of the client device/browser from the HTTP Headers.
      # This field can be mandatory depending on the selected payment method and routing option
      attribute :user_agent, :userAgent, :String
    end
  end
end
