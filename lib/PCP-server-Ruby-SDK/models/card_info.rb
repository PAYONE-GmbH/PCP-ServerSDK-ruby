require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing additional non PCI DSS relevant card information. used instead of card (missing fields: cardNumber, expiryDate, cvv)
    class CardInfo < PCPServerSDK::ApiModel
      # The card holder's name on the card.
      # @return [String, nil]
      attr_accessor :cardholder_name

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            cardholder_name == o.cardholder_name
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [cardholder_name].hash
      end

      def to_hash
        hash = {}
        hash['cardholderName'] = @cardholder_name unless @cardholder_name.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @cardholder_name = hash['cardholderName'] if hash.key? 'cardholderName'
      end
    end
  end
end
