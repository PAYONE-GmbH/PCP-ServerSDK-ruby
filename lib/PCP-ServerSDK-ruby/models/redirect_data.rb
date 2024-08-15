require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing all data needed to redirect the customer.
    class RedirectData < PCPServerSDK::ApiModel
      # The URL that the customer should be redirected to. Be sure to redirect using the GET method
      # @return [String, nil]
      attr_accessor :redirect_url

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            redirect_url == o.redirect_url
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [redirect_url].hash
      end

      def to_hash
        hash = {}
        hash['redirectURL'] = @redirect_url unless @redirect_url.nil?
        hash
      end

      def from_hash(hash)
        @redirect_url = hash['redirectURL'] if hash.key? 'redirectURL'
      end
    end
  end
end
