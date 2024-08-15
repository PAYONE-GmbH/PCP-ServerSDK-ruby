require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing information about the device of the end customer.
    class CustomerDevice < PCPServerSDK::ApiModel
      # The IP address of the customer client from the HTTP Headers.
      # @return [String, nil]
      attr_accessor :ip_address

      # Tokenized representation of the end customers device. For example used for PAYONE Buy Now, Pay Later (BNPL).
      # @return [String, nil]
      attr_accessor :device_token

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            ip_address == o.ip_address &&
            device_token == o.device_token
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [ip_address, device_token].hash
      end

      def to_hash
        hash = {}
        hash['ipAddress'] = @ip_address unless @ip_address.nil?
        hash['deviceToken'] = @device_token unless @device_token.nil?
        hash
      end

      def from_hash(hash)
        @ip_address = hash['ipAddress'] if hash.key? 'ipAddress'
        @device_token = hash['deviceToken'] if hash.key? 'deviceToken'
      end
    end
  end
end
