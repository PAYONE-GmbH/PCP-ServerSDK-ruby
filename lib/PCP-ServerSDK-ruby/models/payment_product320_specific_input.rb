require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing additional Information needed for Apple Pay payment transactions.
    class PaymentProduct320SpecificInput < PCPServerSDK::ApiModel
      # Should be one of the string constants provided by {PCPServerSDK::Models::Network}
      # @return [String, nil]
      attr_accessor :network

      # @return [PCPServerSDK::Models::ApplePaymentDataTokenInformation, nil]
      attr_accessor :token

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            network == o.network &&
            token == o.token
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [network, token].hash
      end

      def to_hash
        hash = {}
        hash['network'] = @network unless @network.nil?
        hash['token'] = @token.to_hash unless @token.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'network'
          @network = Network.validate(hash['network'])
        end
        if hash.key? 'token'
          @token = ApplePaymentDataTokenInformation.new_from_hash(hash['token'])
        end
      end
    end
  end
end
