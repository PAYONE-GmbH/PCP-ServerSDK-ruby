require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing the details of the created payment.
    class PaymentCreationOutput < PCPServerSDK::ApiModel
      # The external reference is an identifier for this transaction and can be used for reconciliation purposes.
      # @return [String, nil]
      attr_accessor :external_reference

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            external_reference == o.external_reference
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [external_reference].hash
      end

      def to_hash
        hash = {}
        hash['externalReference'] = @external_reference unless @external_reference.nil?
        hash
      end

      def from_hash(hash)
        @external_reference = hash['externalReference'] if hash.key? 'externalReference'
      end
    end
  end
end
