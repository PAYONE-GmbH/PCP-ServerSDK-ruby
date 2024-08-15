require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object that holds all reference properties that are linked to this transaction.
    class PaymentReferences < PCPServerSDK::ApiModel
      # Unique reference of the Commerce Case that is also returned for reporting and reconciliation purposes.
      # @return [String, nil]
      attr_accessor :merchant_reference

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            merchant_reference == o.merchant_reference
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [merchant_reference].hash
      end

      def to_hash
        hash = {}
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash
      end

      def from_hash(hash)
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
      end
    end
  end
end
