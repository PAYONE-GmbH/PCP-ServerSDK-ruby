require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing browser specific redirection related data.
    class RedirectionData < PCPServerSDK::ApiModel
      # The URL that the customer is redirected to after the payment flow has finished. You can add any number of key value pairs in the query string that, for instance help you to identify the customer when they return to your site. Please note that we will also append some additional key value pairs that will also help you with this identification process. Note: The provided URL should be absolute and contain the protocol to use, e.g. http:// or https://. For use on mobile devices a custom protocol can be used in the form of protocol://. This protocol must be registered on the device first. URLs without a protocol will be rejected.
      # @return [String, nil]
      attr_accessor :return_url

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            return_url == o.return_url
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [return_url].hash
      end

      def to_hash
        hash = {}
        hash['returnUrl'] = @return_url unless  @return_url.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @return_url = hash['returnUrl'] if hash.key? 'returnUrl'
      end
    end
  end
end
