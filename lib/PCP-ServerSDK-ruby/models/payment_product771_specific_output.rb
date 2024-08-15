require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Output that is SEPA Direct Debit specific (i.e. the used mandate).
    class PaymentProduct771SpecificOutput < PCPServerSDK::ApiModel
      # Unique reference fo a SEPA Mandate
      attr_accessor :mandate_reference

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            mandate_reference == o.mandate_reference
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [mandate_reference].hash
      end

      def to_hash
        hash = {}
        hash['mandateReference'] = @mandate_reference unless @mandate_reference.nil?
        hash
      end

      def from_hash(hash)
        @mandate_reference = hash['mandateReference'] if hash.key? 'mandateReference'
      end
    end
  end
end
